class Filme:
    def __init__(self, id, titulo, genero, ano, imagem, sinopse):
        self.id = id
        self.titulo = titulo
        self.genero = genero
        self.ano = ano
        self.imagem = imagem
        self.sinopse = sinopse

    def to_dict(self):
        return {
            "id": self.id,
            "titulo": self.titulo,
            "genero": self.genero,
            "ano": self.ano,
            "imagem": self.imagem,
            "sinopse": self.sinopse
        }