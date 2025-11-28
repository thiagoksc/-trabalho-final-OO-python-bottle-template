from bottle import request
from models.user import UserModel, User
import hashlib

class UserService:
    def __init__(self):
        self.user_model = UserModel()

    def get_all(self):
        return self.user_model.get_all()

    def save(self):
        last_id = max([u.id for u in self.user_model.get_all()], default=0)
        new_id = last_id + 1
        
        name = request.forms.get('name')
        email = request.forms.get('email')
        birthdate = request.forms.get('birthdate')
        password = request.forms.get('password') # ADICIONADO: Pega a senha do form

        # Cria o usuário com a senha
        user = User(id=new_id, name=name, email=email, birthdate=birthdate, password=password)
        self.user_model.add_user(user)

    # --- NOVA FUNÇÃO PARA LOGIN ---
    def validar_login(self, email, password):
        users = self.get_all()
        for user in users:
            # Verifica se email e senha batem
            if user.email == email and user.password == password:
                return user
        return None
    # ------------------------------

    def get_by_id(self, user_id):
        return self.user_model.get_by_id(user_id)

    def edit_user(self, user):
        name = request.forms.get('name')
        email = request.forms.get('email')
        birthdate = request.forms.get('birthdate')
        # Opcional: permitir alterar senha aqui também se quiser

        user.name = name
        user.email = email
        user.birthdate = birthdate

        self.user_model.update_user(user)

    def delete_user(self, user_id):
        self.user_model.delete_user(user_id)

    
    def _hash_senha(self, senha):
        return hashlib.sha256(senha.encode()).hexdigest()
    
    def save(self):
        last_id = max([u.id for u in self.user_model.get_all()], default=0)
        new_id = last_id + 1
        
        name = request.forms.get('name')
        email = request.forms.get('email')
        birthdate = request.forms.get('birthdate')
        password = request.forms.get('password')

        senha_final = self._hash_senha(password) 

        user = User(
            id=new_id, 
            name=name, 
            email=email, 
            birthdate=birthdate, 
            password=senha_final,
            tipo='comum' # Define como comum por padrão
        )
        
        self.user_model.add_user(user)
    
    def validar_login(self, email, password):
        users = self.get_all()
        senha_login_hash = self._hash_senha(password)
        for user in users:
            if user.email == email and user.password == senha_login_hash:
                return user
        return None
    