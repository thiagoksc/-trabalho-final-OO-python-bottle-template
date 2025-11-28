from bottle import request
from models.user import UserModel, User
import hashlib

class UserService:
    def __init__(self):
        self.user_model = UserModel()

    def get_all(self):
        return self.user_model.get_all()

    def get_by_id(self, user_id):
        return self.user_model.get_by_id(user_id)

    def edit_user(self, user):
        name = request.forms.get('name')
        email = request.forms.get('email')
        birthdate = request.forms.get('birthdate')
        user.name = name
        user.email = email
        user.birthdate = birthdate

        self.user_model.update_user(user)

    def delete_user(self, user_id):
        self.user_model.delete_user(user_id)

    
    def _hash_senha(self, senha):
        return hashlib.sha256(senha.encode()).hexdigest()
    
    def save(self):
        todos_usuarios = self.user_model.get_all()
        if todos_usuarios:
            last_id = int(max(u.id for u in todos_usuarios))
        else:
            last_id = 0
            
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
            tipo='comum' #
        )
        
        self.user_model.add_user(user)
    
    def validar_login(self, email, password):
        users = self.get_all()
        senha_login_hash = self._hash_senha(password)
        for user in users:
            if user.email == email and user.password == senha_login_hash:
                return user
        return None
    