<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Perfil de {{perfil.name}}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body { background-color: #f8f9fa; padding-top: 20px; }
        .card-img-top { height: 250px; object-fit: cover; }
    </style>
</head>
<body>
    <div class="container">
        
        <a href="/" class="btn btn-outline-secondary mb-3">← Voltar para a Home</a>

        <div class="card mb-4 shadow-sm border-0">
            <div class="card-body text-center p-5 bg-white rounded">
                <div style="font-size: 4rem; color: #0d6efd;">
                    <i class="bi bi-person-circle"></i>
                </div>
                <h1 class="display-5">{{perfil.name}}</h1>
                <p class="text-muted">{{perfil.email}}</p>
                <div class="badge bg-primary fs-6">
                    Contribuições: {{len(filmes)}} filmes enviados
                </div>
            </div>
        </div>

        <h3 class="mb-3">Filmes enviados por {{perfil.name}}:</h3>
        
        % if not filmes:
            <div class="alert alert-warning">Este usuário ainda não enviou nenhum filme.</div>
        % end

        <div class="row row-cols-1 row-cols-md-3 g-4">
            % for filme in filmes:
            <div class="col">
                <div class="card h-100 shadow-sm">
                    <img src="{{filme.imagem}}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">{{filme.titulo}}</h5>
                        <p class="card-text"><small class="text-muted">{{filme.ano}} | {{filme.genero}}</small></p>
                        <a href="/ver/{{filme.id}}" class="btn btn-sm btn-outline-primary w-100">Ver Detalhes</a>
                    </div>
                </div>
            </div>
            % end
        </div>
    </div>
</body>
</html>