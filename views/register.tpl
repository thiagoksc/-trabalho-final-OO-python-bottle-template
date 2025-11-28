<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro - Catálogo de Filmes</title>
    <style>
        body { font-family: sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; background-color: #f0f2f5; }
        .register-box { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); width: 300px; }
        h2 { text-align: center; }
        input { width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background-color: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; margin-top: 10px; }
        button:hover { background-color: #218838; }
        .back-link { display: block; text-align: center; margin-top: 15px; color: #666; text-decoration: none; font-size: 0.9em; }
    </style>
</head>
<body>
    <div class="register-box">
        <h2>Criar Conta</h2>
        <form action="/register" method="POST">
            <label>Nome:</label>
            <input type="text" name="name" required>
            
            <label>E-mail:</label>
            <input type="email" name="email" required>
            
            <label>Data de Nascimento:</label>
            <input type="date" name="birthdate" required>

            <label>Senha:</label>
            <input type="password" name="password" required>
            
            <button type="submit">Cadastrar</button>
        </form>
        
        <a href="/login" class="back-link">Já tenho conta (Login)</a>
    </div>
</body>
</html>