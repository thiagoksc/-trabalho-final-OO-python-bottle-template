<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Editar Filme</title>
    <style>
        body { font-family: sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; }
        label { display: block; margin-top: 10px; font-weight: bold; }
        input, textarea { width: 100%; padding: 8px; margin-top: 5px; }
        button { margin-top: 20px; padding: 10px 20px; background-color: #ffc107; color: black; border: none; cursor: pointer; }
        button:hover { background-color: #e0a800; }
        .back-link { display: block; margin-bottom: 20px; color: #007bff; text-decoration: none; }
    </style>
</head>
<body>
    <a href="/" class="back-link">← Cancelar e Voltar</a>
    
    <h1>Editar Filme: {{filme.titulo}}</h1>
    
    <form action="/editar/{{filme.id}}" method="POST">
        <label for="titulo">Título do Filme:</label>
        <input type="text" name="titulo" value="{{filme.titulo}}" required>
        
        <label for="genero">Gênero:</label>
        <input type="text" name="genero" value="{{filme.genero}}" required>
        
        <label for="ano">Ano de Lançamento:</label>
        <input type="number" name="ano" value="{{filme.ano}}" required>
        
        <label for="imagem">URL da Imagem (Capa):</label>
        <input type="text" name="imagem" value="{{filme.imagem}}" required>
        
        <label for="sinopse">Sinopse:</label>
        <textarea name="sinopse" rows="4" required>{{filme.sinopse}}</textarea>
        
        <button type="submit">Salvar Alterações</button>
    </form>
</body>
</html>