class Filme:
    def __init__(self, id, titulo, genero, ano, imagem, sinopse, usuario_id=None, usuario_nome=None):
        self.id = id
        self.titulo = titulo
        self.genero = genero
        self.ano = ano
        self.imagem = imagem
        self.sinopse = sinopse
        self.usuario_id = usuario_id
        self.usuario_nome = usuario_nome

    def to_dict(self):
        return {
            "id": self.id,
            "titulo": self.titulo,
            "genero": self.genero,
            "ano": self.ano,
            "imagem": self.imagem,
            "sinopse": self.sinopse,
            "usuario_id": self.usuario_id,
            "usuario_nome": self.usuario_nome

        }