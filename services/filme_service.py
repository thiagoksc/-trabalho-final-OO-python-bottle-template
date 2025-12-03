import json
import os
import requests
import config
from models.filme_model import Filme


class FilmeService:
    def __init__(self):
        self.caminho_arquivo = 'data/filmes.json'
        self.omdb_key = config.Config.OMDB_KEY  # chave definida no config.py

    # ======================================================================
    # Helper: consulta notas na API OMDb (IMDb + Rotten Tomatoes)
    # ======================================================================
    def _consultar_notas(self, titulo, ano=None):
        """
        Consulta a OMDb API pelo título (e opcionalmente ano) e retorna:
        (imdb_rating, rotten_tomatoes_rating)
        Ex.: ("9.2", "98")
        """
        if not self.omdb_key:
            return None, None

        try:
            params = {
                "apikey": self.omdb_key,
                "t": titulo.strip()
            }
            if ano:
                params["y"] = str(ano).strip()

            resp = requests.get("https://www.omdbapi.com/", params=params, timeout=5)
            dados = resp.json()

            if dados.get("Response") != "True":
                return None, None

            imdb_rating = dados.get("imdbRating")  # string, ex: "8.7"
            if imdb_rating in (None, "", "N/A"):
                imdb_rating = None

            rotten_rating = None
            for r in dados.get("Ratings", []):
                if r.get("Source") == "Rotten Tomatoes":
                    val = r.get("Value", "")
                    if val and val != "N/A":
                        rotten_rating = val.replace("%", "")
                    break

            return imdb_rating, rotten_rating

        except Exception:
            # Aqui você poderia logar o erro se quiser
            return None, None

    # ======================================================================
    # Lista todos os filmes
    # - Carrega notas já salvas
    # - Só consulta OMDb se NÃO existir nota (imdb/rotten None ou vazia)
    # ======================================================================
    def listar_todos(self):
        if not os.path.exists(self.caminho_arquivo):
            return []

        with open(self.caminho_arquivo, 'r', encoding='utf-8') as f:
            dados = json.load(f)

        lista_filmes = []
        alterou = False  # se criarmos campos ou preencher notas, salvamos no final

        for item in dados:
            # Garante que as chaves existam no dicionário
            if "imdb" not in item:
                item["imdb"] = None
                alterou = True
            if "rotten" not in item:
                item["rotten"] = None
                alterou = True

            imdb_atual = item.get("imdb")
            rotten_atual = item.get("rotten")

            # Normaliza valores vazios / "N/A"
            if imdb_atual in ("", "N/A"):
                imdb_atual = None
                item["imdb"] = None
                alterou = True

            if rotten_atual in ("", "N/A"):
                rotten_atual = None
                item["rotten"] = None
                alterou = True

            # Só consulta OMDb se faltar alguma das notas
            if imdb_atual is None or rotten_atual is None:
                novo_imdb, novo_rotten = self._consultar_notas(
                    titulo=item.get("titulo", ""),
                    ano=item.get("ano")
                )

                # Só sobrescreve se ainda estiver None
                if imdb_atual is None and novo_imdb is not None:
                    item["imdb"] = novo_imdb
                    imdb_atual = novo_imdb
                    alterou = True

                if rotten_atual is None and novo_rotten is not None:
                    item["rotten"] = novo_rotten
                    rotten_atual = novo_rotten
                    alterou = True

            # Monta o objeto Filme com as notas (sejam antigas ou novas)
            filme = Filme(
                id=item['id'],
                titulo=item['titulo'],
                titulo_original=item.get('titulo_original', item['titulo']),
                genero=item['genero'],
                ano=item['ano'],
                imagem=item['imagem'],
                sinopse=item['sinopse'],
                usuario_id=item.get('usuario_id'),
                usuario_nome=item.get('usuario_nome', 'Anônimo'),
                imdb=item.get("imdb"),
                rotten=item.get("rotten")
            )
            lista_filmes.append(filme)

        # Se houve qualquer alteração (novos campos ou notas preenchidas), persiste no JSON
        if alterou:
            with open(self.caminho_arquivo, 'w', encoding='utf-8') as f:
                json.dump(dados, f, indent=4, ensure_ascii=False)

        return lista_filmes

    # ======================================================================
    # CRUD "normal"
    # ======================================================================
    def adicionar(self, titulo, genero, ano, imagem, sinopse, usuario_id, usuario_nome):
        filmes = self.listar_todos()  # já vem com notas, mas novo filme começa sem

        # Gera um ID novo automaticamente
        novo_id = 1
        if filmes:
            novo_id = filmes[-1].id + 1

        # Cria o Objeto Filme (sem notas, serão preenchidas futuramente se quiser)
        novo_filme = Filme(
            novo_id,
            titulo,
            genero,
            ano,
            imagem,
            sinopse,
            usuario_id,
            usuario_nome,
            imdb=None,
            rotten=None
        )
        filmes.append(novo_filme)

        # Converte para dicionário para salvar no JSON
        lista_dicts = [f.to_dict() for f in filmes]

        with open(self.caminho_arquivo, 'w', encoding='utf-8') as f:
            json.dump(lista_dicts, f, indent=4, ensure_ascii=False)

    def remover(self, id_filme):
        filmes = self.listar_todos()

        # Mantém apenas os filmes com ID diferente
        filmes_mantidos = [f for f in filmes if f.id != id_filme]

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
                # Notas permanecem as mesmas (já carregadas)
                break

        lista_dicts = [f.to_dict() for f in filmes]
        with open(self.caminho_arquivo, 'w', encoding='utf-8') as f:
            json.dump(lista_dicts, f, indent=4, ensure_ascii=False)

    def buscar_por_usuario(self, user_id):
        todos = self.listar_todos()
        return [f for f in todos if f.usuario_id == user_id]