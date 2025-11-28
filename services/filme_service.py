import json
import os
from models.filme_model import Filme

class FilmeService:
    def __init__(self):
        self.caminho_arquivo = 'data/filmes.json'

    def listar_todos(self):
        if not os.path.exists(self.caminho_arquivo):
            return []
        
        with open(self.caminho_arquivo, 'r', encoding='utf-8') as f:
            dados = json.load(f)
        
        lista_filmes = []
        for item in dados:
            filme = Filme(
                id=item['id'],
                titulo=item['titulo'],
                genero=item['genero'],
                ano=item['ano'],
                imagem=item['imagem'],
                sinopse=item['sinopse']
            )
            lista_filmes.append(filme)
        return lista_filmes

    def adicionar(self, titulo, genero, ano, imagem, sinopse):
        filmes = self.listar_todos()
        
        # Gera um ID novo automaticamente
        novo_id = 1
        if filmes:
            novo_id = filmes[-1].id + 1
            
        # Cria o Objeto Filme
        novo_filme = Filme(novo_id, titulo, genero, ano, imagem, sinopse)
        filmes.append(novo_filme)
        
        # Converte para dicionário para salvar no JSON
        lista_dicts = [f.to_dict() for f in filmes]
        
        with open(self.caminho_arquivo, 'w', encoding='utf-8') as f:
            json.dump(lista_dicts, f, indent=4, ensure_ascii=False)

    def remover(self, id_filme):
        filmes = self.listar_todos()
        
        # Recria a lista mantendo APENAS os filmes que NÃO têm aquele ID
        # Isso é uma "List Comprehension" do Python, muito eficiente
        filmes_mantidos = [f for f in filmes if f.id != id_filme]
        
        # Salva a nova lista no JSON
        lista_dicts = [f.to_dict() for f in filmes_mantidos]
        with open(self.caminho_arquivo, 'w', encoding='utf-8') as f:
            json.dump(lista_dicts, f, indent=4, ensure_ascii=False)

    def buscar_por_id(self, id_filme):
        filmes = self.listar_todos()
        for filme in filmes:
            if filme.id == id_filme:
                return filme
        return None
    
    def atualizar(self, id_filme, titulo, genero, ano, imagem, sinopse):
        filmes = self.listar_todos()
        
        for filme in filmes:
            if filme.id == id_filme:
                filme.titulo = titulo
                filme.genero = genero
                filme.ano = ano
                filme.imagem = imagem
                filme.sinopse = sinopse
                break
        
        lista_dicts = [f.to_dict() for f in filmes]
        with open(self.caminho_arquivo, 'w', encoding='utf-8') as f:
            json.dump(lista_dicts, f, indent=4, ensure_ascii=False)