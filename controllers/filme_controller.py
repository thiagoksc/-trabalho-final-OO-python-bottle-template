from bottle import route, view, template, request, redirect
from services.filme_service import FilmeService

filme_service = FilmeService()

@route('/')
@view('home')
def home():
    
    if not request.get_cookie("usuario_logado", secret='chave_secreta_grupo'):
        redirect('/login')
    # -------------------------------------------------------

    filmes = filme_service.listar_todos()
    return dict(filmes=filmes)

# Rota para MOSTRAR o formulário
@route('/adicionar', method='GET')
@view('adicionar_filme')
def form_adicionar():
    return dict()

# Rota para PROCESSAR o formulário
@route('/adicionar', method='POST')
def acao_adicionar():
    titulo = request.forms.get('titulo')
    genero = request.forms.get('genero')
    ano = request.forms.get('ano')
    imagem = request.forms.get('imagem')
    sinopse = request.forms.get('sinopse')
    
    filme_service.adicionar(titulo, genero, ano, imagem, sinopse)
    
    redirect('/')

#Rota para deletar filme
@route('/deletar/<id:int>') 
def acao_deletar(id):
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
    titulo = request.forms.get('titulo')
    genero = request.forms.get('genero')
    ano = request.forms.get('ano')
    imagem = request.forms.get('imagem')
    sinopse = request.forms.get('sinopse')
    
    filme_service.atualizar(id, titulo, genero, ano, imagem, sinopse)
    
    redirect('/')