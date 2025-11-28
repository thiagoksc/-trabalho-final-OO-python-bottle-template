from bottle import Bottle, default_app
from .user_controller import user_routes

from . import filme_controller
from . import login_controller
# ---------------------------------------------------------------------

def init_controllers(app: Bottle):
    print("--- Carregando rotas de Usuário ---")
    app.merge(user_routes)
    
    print("--- Carregando rotas de Filme e Login (default_app) ---")
    # Esta linha pega as rotas com @route e joga no app principal
    app.merge(default_app())