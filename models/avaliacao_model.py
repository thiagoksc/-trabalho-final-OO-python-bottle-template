class Avaliacao:
    def __init__(self, id, filme_id, usuario_id, usuario_nome, nota, comentario):
        self.id = id
        self.filme_id = filme_id
        self.usuario_id = usuario_id
        self.usuario_nome = usuario_nome 
        self.nota = nota
        self.comentario = comentario

    def to_dict(self):
        return {
            "id": self.id,
            "filme_id": self.filme_id,
            "usuario_id": self.usuario_id,
            "usuario_nome": self.usuario_nome,
            "nota": self.nota,
            "comentario": self.comentario
        }