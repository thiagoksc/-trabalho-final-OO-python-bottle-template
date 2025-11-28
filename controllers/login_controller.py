from bottle import route, view, request, redirect, response, template
from services.user_service import UserService

user_service = UserService()

# --- LOGIN ---
@route('/login', method='GET')
@view('login')
def login_view():
    cookie_id = request.get_cookie("usuario_logado", secret='chave_secreta_grupo')
    
    if cookie_id:
        try:
            usuario = user_service.get_by_id(int(cookie_id))
            
            if usuario:
                redirect('/')
            else:
                response.delete_cookie("usuario_logado")
        except ValueError:
            response.delete_cookie("usuario_logado")
            
    return dict(erro=None)

@route('/login', method='POST')
def login_action():
    email = request.forms.get('email')
    password = request.forms.get('password')
    
    user = user_service.validar_login(email, password)
    
    if user:
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
    try:
        user_service.save()
        
    except Exception as e:
        return f"Erro ao cadastrar: {str(e)}"
    
    redirect('/login')
# --- LOGOUT ---
@route('/logout')
def logout_action():
    response.delete_cookie("usuario_logado")
    redirect('/login')