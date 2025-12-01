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
            /* ESSENCIAL PARA O FOOTER FIXAR NO FUNDO */
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container-principal {
            flex-grow: 1; 
        }
    </style>
</head>
<body>

    <div class="container container-principal">
        {{!base}}
        
    </div> 
    <footer class="mt-auto pt-3 pb-3 bg-light border-top">
        <div class="container text-center">
            <p class="mb-0 text-muted small">
                &copy; 2025, CineTrack. Todos os direitos reservados.
            </p>
        </div>
    </footer>

    <script src="/static/js/bootstrap.bundle.min.js"></script>
    <script src="/static/js/main.js"></script>

</body>
</html>