from bottle import route, view, request, redirect, response, template
from services.user_service import UserService

user_service = UserService()

# --- LOGIN ---
@route('/login', method='GET')
@view('login')
def login_view():
    # Se já estiver logado, manda direto pra home
    if request.get_cookie("usuario_logado", secret='chave_secreta_grupo'):
        redirect('/')
    return dict(erro=None)

@route('/login', method='POST')
def login_action():
    email = request.forms.get('email')
    password = request.forms.get('password')
    
    # Usa a função nova que criamos no passo anterior
    user = user_service.validar_login(email, password)
    
    if user:
        # Cria o cookie de sessão
        response.set_cookie("usuario_logado", str(user.id), secret='chave_secreta_grupo')
        redirect('/')
    else:
        return template('login', erro="Email ou senha incorretos!")

# --- CADASTRO (REGISTER) ---
@route('/register', method='GET')
@view('register')
def register_view():
    return dict()

@route('/register', method='POST')
def register_action():
    # O método save() do seu service já pega os dados do request.forms
    user_service.save()
    # Depois de cadastrar, manda fazer login
    redirect('/login')

# --- LOGOUT ---
@route('/logout')
def logout_action():
    response.delete_cookie("usuario_logado")
    redirect('/login')