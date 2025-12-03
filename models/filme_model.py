class Filme:
    def __init__(self, id, titulo, titulo_original, genero, ano, imagem, sinopse, usuario_id=None, usuario_nome="Anônimo", imdb=None, rotten=None):
        self.id = id
        self.titulo = titulo
        self.titulo_original = titulo_original
        self.genero = genero
        self.ano = ano
        self.imagem = imagem
        self.sinopse = sinopse
        self.usuario_id = usuario_id
        self.usuario_nome = usuario_nome
        
        self.imdb = imdb
        self.rotten = rotten

    def to_dict(self):
        return {
            "id": self.id,
            "titulo": self.titulo,
            "titulo_original": self.titulo_original,
            "genero": self.genero,
            "ano": self.ano,
            "imagem": self.imagem,
            "sinopse": self.sinopse,
            "usuario_id": self.usuario_id,
            "usuario_nome": self.usuario_nome,
            "imdb": self.imdb,
            "rotten": self.rotten
        }
