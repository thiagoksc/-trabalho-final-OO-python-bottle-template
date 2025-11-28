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
def home():
    usuario = get_usuario_logado()
    if not usuario:
        redirect('/login')

    filmes = filme_service.listar_todos()
    
    return dict(filmes=filmes, user=usuario)

# Rota para MOSTRAR o formulário
@route('/adicionar', method='GET')
@view('adicionar_filme')
def form_adicionar():
    return dict()

# Rota para PROCESSAR o formulário
@route('/adicionar', method='POST')
def acao_adicionar():
    titulo = limpar_texto(request.forms.get('titulo'))
    genero = limpar_texto(request.forms.get('genero'))
    ano = request.forms.get('ano')
    imagem = request.forms.get('imagem')
    sinopse = limpar_texto(request.forms.get('sinopse'))
    
    filme_service.adicionar(titulo, genero, ano, imagem, sinopse)
    
    redirect('/')

#Rota para deletar filme
@route('/deletar/<id:int>') 
def acao_deletar(id):
    avaliacao_service.remover_por_filme(id)
    filme_service.remover(id)
    redirect('/')


@route('/editar/<id:int>', method='GET')
@view('editar_filme')
def form_editar(id):
    # Busca o filme para preencher os campos
    filme = filme_service.buscar_por_id(id)
    return dict(filme=filme)

@route('/editar/<id:int>', method='POST')
def acao_editar(id):
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
        nota = int(request.forms.get('nota'))
        if nota < 1 or nota > 5:
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