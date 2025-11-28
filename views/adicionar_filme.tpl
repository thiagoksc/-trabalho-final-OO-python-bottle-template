<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Adicionar Novo Filme</title>
    <style>
        body { font-family: sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; }
        label { display: block; margin-top: 10px; font-weight: bold; }
        input, textarea { width: 100%; padding: 8px; margin-top: 5px; }
        button { margin-top: 20px; padding: 10px 20px; background-color: #28a745; color: white; border: none; cursor: pointer; }
        button:hover { background-color: #218838; }
        .back-link { display: block; margin-bottom: 20px; color: #007bff; text-decoration: none; }
    </style>
</head>
<body>
    <a href="/" class="back-link">← Voltar para o Catálogo</a>
    
    <h1>Adicionar Novo Filme</h1>
    
    <form action="/adicionar" method="POST">
        <label for="titulo">Título do Filme:</label>
        <input type="text" name="titulo" required>
        
        <label for="genero">Gênero:</label>
        <input type="text" name="genero" placeholder="Ex: Ação, Drama" required>
        
        <label for="ano">Ano de Lançamento:</label>
        <input type="number" name="ano" required>
        
        <label for="imagem">URL da Imagem (Capa):</label>
        <input type="text" name="imagem" placeholder="https://..." required>
        
        <label for="sinopse">Sinopse:</label>
        <textarea name="sinopse" rows="4" required></textarea>
        
        <button type="submit">Salvar Filme</button>
    </form>
</body>
</html>