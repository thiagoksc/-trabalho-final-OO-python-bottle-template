<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Bottle - {{title or 'CineTrack'}}</title>
    <link rel="stylesheet" href="/static/css/style.css" />
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Garante que o body ocupe a altura mínima da tela */
        }
        .container {
            flex-grow: 1; /* Permite que o container principal ocupe o espaço restante */
        }
    </style>
</head>
<body>

    <div class="container">
        {{!base}}
        
    </div> <footer class="mt-auto pt-3 pb-3 bg-light border-top">
    <div class="container text-center">
        <p class="mb-0 text-muted small">
            &copy; 2025, CineTrack. Todos os direitos reservados.
        </p>
        <p class="mb-0 text-muted small">
            Desenvolvido para Orientação a Objetos (OO) UnB.
        </p>
    </div>
</footer>

<script src="/static/js/bootstrap.bundle.min.js"></script>
<script src="/static/js/main.js"></script>

</body>
</html>