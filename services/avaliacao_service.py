import json
import os
from models.avaliacao_model import Avaliacao

class AvaliacaoService:
    def __init__(self):
        self.caminho_arquivo = 'data/avaliacoes.json'

    def _listar_todas(self):
        if not os.path.exists(self.caminho_arquivo):
            return []
        with open(self.caminho_arquivo, 'r', encoding='utf-8') as f:
            dados = json.load(f)
        
        lista = []
        for item in dados:
            av = Avaliacao(
                id=item['id'],
                filme_id=item['filme_id'],
                usuario_id=item['usuario_id'],
                usuario_nome=item.get('usuario_nome', 'Anônimo'),
                nota=item['nota'],
                comentario=item['comentario']
            )
            lista.append(av)
        return lista

    def buscar_por_filme(self, filme_id):
        todas = self._listar_todas()
        return [av for av in todas if av.filme_id == filme_id]

    def adicionar(self, filme_id, usuario_id, usuario_nome, nota, comentario):
        todas = self._listar_todas()
        
        novo_id = 1
        if todas:
            novo_id = todas[-1].id + 1
            
        nova_av = Avaliacao(novo_id, filme_id, usuario_id, usuario_nome, nota, comentario)
        todas.append(nova_av)
        
        
        lista_dicts = [av.to_dict() for av in todas]
        with open(self.caminho_arquivo, 'w', encoding='utf-8') as f:
            json.dump(lista_dicts, f, indent=4, ensure_ascii=False)

    def remover(self, id_avaliacao):
        todas = self._listar_todas()
        
        todas = [av for av in todas if av.id != id_avaliacao]
        
        lista_dicts = [av.to_dict() for av in todas]
        with open(self.caminho_arquivo, 'w', encoding='utf-8') as f:
            json.dump(lista_dicts, f, indent=4, ensure_ascii=False)


    def buscar_por_id(self, id_avaliacao):
        todas = self._listar_todas()
        for av in todas:
            if av.id == id_avaliacao:
                return av
        return None
    
    def remover_por_filme(self, filme_id):
        todas = self._listar_todas()
        
        todas = [av for av in todas if av.filme_id != filme_id]
        
        lista_dicts = [av.to_dict() for av in todas]
        with open(self.caminho_arquivo, 'w', encoding='utf-8') as f:
            json.dump(lista_dicts, f, indent=4, ensure_ascii=False)

    def calcular_media_por_filme(self):
        todas_avaliacoes = self._listar_todas()
        contagem = {}
        for av in todas_avaliacoes:
            filme_id = av.filme_id
            try:
                nota = float(av.nota)
            except(ValueError, TypeError):
                continue
            if filme_id not in contagem:
                contagem[filme_id] = {'soma': 0.0, 'count': 0}
            
            contagem[filme_id]['soma'] += nota
            contagem[filme_id]['count'] += 1
        
        medias = {}
        for filme_id, data in contagem.items():
            if data['count'] > 0:
                medias[filme_id] = data['soma'] / data['count']
            else:
                medias[filme_id] = 0.0

        return medias