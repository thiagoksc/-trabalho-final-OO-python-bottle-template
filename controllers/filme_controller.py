from bottle import route, view, template, request, redirect
from services.filme_service import FilmeService
from services.avaliacao_service import AvaliacaoService
from services.user_service import UserService


def limpar_texto(texto):
    if not texto:
        return ""
    try:
        return texto.encode('latin-1').decode('utf-8')
    except:
        
        return texto


avaliacao_service = AvaliacaoService()
user_service = UserService()
filme_service = FilmeService()

def get_usuario_logado():
    usuario_id = request.get_cookie("usuario_logado", secret='chave_secreta_grupo')
    if usuario_id:
        return user_service.get_by_id(int(usuario_id))
    return None

@route('/')
@view('home')
@route('/')
@view('home')
def home():
    usuario = get_usuario_logado()
    if not usuario:
        redirect('/login')

    busca = request.query.get('busca')
    
    todos_filmes = filme_service.listar_todos()
    medias_por_filme = avaliacao_service.calcular_media_por_filme()
    
    filmes_com_score = []
    for filme in todos_filmes:
        score = medias_por_filme.get(filme.id, 0.0)
        filme.score = score
        if not busca or busca.lower() in filme.titulo.lower():
            filmes_com_score.append(filme)

    filmes_ordenados = sorted(filmes_com_score, key=lambda f: f.score, reverse=True)
    return dict(filmes=filmes_ordenados, user=usuario)

    
# Rota para MOSTRAR o formulário
@route('/adicionar', method='GET')
@view('adicionar_filme')
def form_adicionar():
    return dict()

# Rota para PROCESSAR o formulário
@route('/adicionar', method='POST')
def acao_adicionar():
    
    #pega o usuario logado
    usuario = get_usuario_logado()
    if not usuario:
        redirect('/login')

    titulo = limpar_texto(request.forms.get('titulo'))
    genero = limpar_texto(request.forms.get('genero'))
    ano = request.forms.get('ano')
    imagem = request.forms.get('imagem')
    sinopse = limpar_texto(request.forms.get('sinopse'))
    
    #passa o id e nome do usuario para o serviço
    filme_service.adicionar(titulo, genero, ano, imagem, sinopse, usuario.id, usuario.name)
    
    redirect('/')

#Rota para deletar filme(com proteção)
@route('/deletar/<id:int>') 
def acao_deletar(id):
    usuario = get_usuario_logado()
    if not usuario: redirect('/login')

    filme = filme_service.buscar_por_id(id)

    #so apaga se for dono ou admin
    if filme and (filme.usuario_id == usuario.id or usuario.eh_admin()):
        avaliacao_service.remover_por_filme(id)
        filme_service.remover(id)
    redirect('/')



@route('/editar/<id:int>', method='GET')
@view('editar_filme')
def form_editar(id):
    usuario = get_usuario_logado()
    if not usuario: 
        redirect('/login')

    filme = filme_service.buscar_por_id(id)
    if filme and (filme.usuario_id == usuario.id or usuario.eh_admin()):
        return dict(filme=filme)
    else:
        redirect('/')

#Rpta de editar post(com proteção)
@route('/editar/<id:int>', method='POST')
def acao_editar(id):
    usuario = get_usuario_logado()
    if not usuario: redirect('/login')

    filme = filme_service.buscar_por_id(id)
    
    #so edita se for dono  do post ou admin
    if filme and (filme.usuario_id == usuario.id or usuario.eh_admin()):
        titulo = limpar_texto(request.forms.get('titulo'))
        genero = limpar_texto(request.forms.get('genero'))
        ano = request.forms.get('ano')
        imagem = request.forms.get('imagem')
        sinopse = limpar_texto(request.forms.get('sinopse'))
    
        filme_service.atualizar(id, titulo, genero, ano, imagem, sinopse)
    
    redirect('/')

@route('/ver/<id:int>', method='GET')
@view('ver_filme')
def ver_filme(id):

    filme = filme_service.buscar_por_id(id)
    avaliacoes = avaliacao_service.buscar_por_filme(id)
 
    usuario_id = request.get_cookie("usuario_logado", secret='chave_secreta_grupo')
    user = None
    if usuario_id:
        user = user_service.get_by_id(int(usuario_id))
    
    return dict(filme=filme, avaliacoes=avaliacoes, user=user)


@route('/avaliar/<filme_id:int>', method='POST')
def salvar_avaliacao(filme_id):
    
    usuario_id = request.get_cookie("usuario_logado", secret='chave_secreta_grupo')
    if not usuario_id:
        redirect('/login')
    
    usuario = user_service.get_by_id(int(usuario_id))
    
    try:
        nota = float(request.forms.get('nota'))
        if nota < 0.0 or nota > 5.0:
            raise ValueError("Nota inválida")
    except:
        redirect(f'/ver/{filme_id}')

    comentario = request.forms.get('comentario')
    comentario = limpar_texto(comentario)

    if comentario and comentario.strip():
        avaliacao_service.adicionar(filme_id, int(usuario_id), usuario.name, nota, comentario)
    
    redirect(f'/ver/{filme_id}')


@route('/deletar_avaliacao/<id_avaliacao:int>/<id_filme:int>')
def deletar_avaliacao_action(id_avaliacao, id_filme):
    usuario_id_cookie = request.get_cookie("usuario_logado", secret='chave_secreta_grupo')
    if not usuario_id_cookie:
        redirect('/login')
        
    usuario_logado = user_service.get_by_id(int(usuario_id_cookie))
    
    avaliacao = avaliacao_service.buscar_por_id(id_avaliacao)
    
    if avaliacao and (avaliacao.usuario_id == usuario_logado.id or usuario_logado.eh_admin()):
        avaliacao_service.remover(id_avaliacao)
    
    redirect(f'/ver/{id_filme}')

@route('/perfil/<id:int>')
@view('perfil')
def ver_perfil(id):
    usuario_logado = get_usuario_logado()

    dono_perfil = user_service.get_by_id(id)

    filmes_do_usuario = filme_service.buscar_por_usuario(id)

    filmes_do_usuario = filme_service.buscar_por_usuario(id)

    if not dono_perfil:
        redirect('/')

    return dict(user=usuario_logado, perfil=dono_perfil, filmes=filmes_do_usuario)