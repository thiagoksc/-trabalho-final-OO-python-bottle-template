import json
import os

DATA_DIR = os.path.join(os.path.dirname(__file__), '..', 'data')

class User:
    
    def __init__(self, id, name, email, birthdate, password=None, tipo='comum'):
        self.id = id
        self.name = name
        self.email = email
        self.birthdate = birthdate
        self.password = password
        self.tipo = tipo

    def eh_admin(self):
        return False

    def __repr__(self):
        return (f"User(id={self.id}, name='{self.name}', email='{self.email}', "
                f"birthdate='{self.birthdate}')")

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'email': self.email,
            'birthdate': self.birthdate,
            'password': self.password, 
            'tipo': self.tipo
        }

    @classmethod
    def from_dict(cls, data):
        return cls(
            id=data['id'],
            name=data['name'],
            email=data['email'],
            birthdate=data['birthdate'],
            password=data.get('password') 
        )

class Admin(User):
    def __init__(self, id, name, email, birthdate, password=None, tipo=None): 
        super().__init__(id, name, email, birthdate, password, tipo='admin')
    
    def eh_admin(self):
        return True


class UserModel:
    FILE_PATH = os.path.join(DATA_DIR, 'users.json')

    def __init__(self):
        self.users = [] 

    def _load(self):
        if not os.path.exists(self.FILE_PATH):
            return []
        with open(self.FILE_PATH, 'r', encoding='utf-8') as f:
            data = json.load(f)
            lista_usuarios = []
            for item in data:
                if item.get('tipo') == 'admin':
                    user = Admin(**item) 
                else:
                    user = User(**item) 
                lista_usuarios.append(user)
            return lista_usuarios

    def _save(self, lista_para_salvar):
        with open(self.FILE_PATH, 'w', encoding='utf-8') as f:
            # O argumento 'lista_para_salvar' agora é usado corretamente
            json.dump([u.to_dict() for u in lista_para_salvar], f, indent=4, ensure_ascii=False)

    def get_all(self):
        return self._load()

    def get_by_id(self, user_id: int):
        usuarios = self._load()
        return next((u for u in usuarios if u.id == user_id), None)

    def add_user(self, user: User):
        usuarios_atuais = self._load()
        usuarios_atuais.append(user)
        self._save(usuarios_atuais) 

    def update_user(self, updated_user: User):
        usuarios = self._load()
        for i, user in enumerate(usuarios):
            if user.id == updated_user.id:
                usuarios[i] = updated_user
                self._save(usuarios)
                break

    def delete_user(self, user_id):
        usuarios = self._load()
        usuarios_mantidos = [u for u in usuarios if u.id != user_id]
        self._save(usuarios_mantidos)