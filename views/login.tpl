<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Login - Catálogo de Filmes</title>
    <style>
        body { font-family: sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; background-color: #f0f2f5; }
        .login-box { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); width: 300px; text-align: center; }
        input { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; }
        button:hover { background-color: #0056b3; }
        .error { color: red; font-size: 0.9em; margin-bottom: 10px; }
        a { color: #007bff; text-decoration: none; font-size: 0.9em; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Entrar</h2>
        
        % if erro:
            <div class="error">{{erro}}</div>
        % end

        <form action="/login" method="POST">
            <input type="email" name="email" placeholder="Seu E-mail" required>
            <input type="password" name="password" placeholder="Sua Senha" required>
            <button type="submit">Acessar</button>
        </form>
        
        <br>
        <p>Novo por aqui? <a href="/register">Crie sua conta</a></p>
    </div>
</body>
</html>