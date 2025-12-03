<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CineTrack</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        /* Header */
        .header {
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            color: white;
            padding: 30px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 2.5rem;
            font-weight: 300;
            margin: 0;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
            font-size: 1rem;
        }

        .btn-logout {
            background: transparent;
            color: white;
            border: 2px solid #e74c3c;
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-logout:hover {
            background: #e74c3c;
            transform: translateY(-2px);
        }

        /* Main Content */
        .main-content {
            padding: 40px;
        }

        /* Action Bar */
        .action-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            flex-wrap: wrap;
            gap: 20px;
        }

        .btn-add {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        /* Search Form */
        .search-form {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .search-input {
            padding: 12px 15px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 1rem;
            width: 300px;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }

        .search-input:focus {
            outline: none;
            border-color: #667eea;
            background-color: white;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .btn-search {
            background: #2c3e50;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-search:hover {
            background: #34495e;
            transform: translateY(-1px);
        }

        .btn-clear {
            color: #666;
            text-decoration: none;
            font-size: 0.9rem;
            margin-left: 10px;
            transition: color 0.3s ease;
        }

        .btn-clear:hover {
            color: #333;
        }

        /* Movies Grid */
        .movies-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }

        /* Movie Card */
        .movie-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: all 0.3s ease;
            border: 1px solid #e1e5e9;
        }

        .movie-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .movie-header {
            padding: 20px 20px 15px;
            border-bottom: 1px solid #e1e5e9;
        }

        .movie-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 5px;
            line-height: 1.3;
        }

        .movie-title a {
            color: inherit;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .movie-title a:hover {
            color: #667eea;
        }

        .movie-year {
            color: #666;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .movie-body {
            padding: 20px;
        }

        .movie-genre {
            display: inline-block;
            background: #e3f2fd;
            color: #1976d2;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .movie-synopsis {
            color: #555;
            line-height: 1.5;
            margin-bottom: 15px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .movie-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
            padding-top: 15px;
            border-top: 1px solid #f0f0f0;
        }

        .movie-author {
            font-size: 0.85rem;
            color: #666;
        }

        .author-link {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }

        .author-link:hover {
            text-decoration: underline;
        }

        .movie-link {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .movie-link:hover {
            color: #764ba2;
        }

        /* Admin Panel */
        .admin-panel {
            background: #fff8e1;
            border: 1px solid #ffeaa7;
            border-radius: 8px;
            padding: 15px;
            margin-top: 15px;
        }

        .admin-panel strong {
            color: #e67e22;
            font-size: 0.9rem;
        }

        .admin-actions {
            margin-top: 8px;
            display: flex;
            gap: 15px;
        }

        .btn-edit {
            color: #d39e00;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.85rem;
            transition: color 0.3s ease;
        }

        .btn-edit:hover {
            color: #f39c12;
        }

        .btn-delete {
            color: #e74c3c;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.85rem;
            transition: color 0.3s ease;
        }

        .btn-delete:hover {
            color: #c0392b;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }

        .empty-state h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #999;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }

            .action-bar {
                flex-direction: column;
                align-items: stretch;
            }

            .search-form {
                justify-content: center;
            }

            .search-input {
                width: 100%;
            }

            .movies-grid {
                grid-template-columns: 1fr;
            }

            .main-content {
                padding: 20px;
            }
             .teste-footer {
        background: red !important;
        color: white !important;
        padding: 20px !important;
        text-align: center !important;
        position: fixed !important;
        bottom: 0 !important;
        left: 0 !important;
        width: 100% !important;
        z-index: 1000 !important;
    }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1>CineTrack</h1>
            <div class="user-info">
                <span>Olá, <strong>{{user.name}}</strong>!</span>
                <a href="/logout" class="btn-logout">Sair</a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Action Bar -->
            <div class="action-bar">
                <a href="/adicionar" class="btn-add">
                    <span>+</span> Adicionar Filme
                </a>

                <form action="/" method="GET" class="search-form">
                    <input type="text" name="busca" placeholder="Pesquisar filme por título..." 
                           class="search-input">
                    <button type="submit" class="btn-search">Buscar</button>
                    <a href="/" class="btn-clear">Limpar</a>
                </form>
            </div>

            <!-- Movies Grid -->
            <div class="movies-grid">
                % for filme in filmes:
                <div class="movie-card">
                    <div class="movie-header">
                        <h2 class="movie-title">
                            <a href="/ver/{{filme.id}}">{{filme.titulo}}</a>
                        </h2>
                        <div class="movie-year">({{filme.ano}})</div>
                        <div>
                         <img src="{{filme.imagem}}" alt="Capa de {{filme.titulo}}" 
                              style="width:100%; height:auto; border-radius:8px; margin-top:10px;">
                        </div>
                    </div>

                    <div class="movie-body">
                        <div class="movie-genre">{{filme.genero}}</div>
                        
                        <p class="movie-synopsis">{{filme.sinopse}}</p>

                        <div class="movie-meta">
                            <div class="movie-author">
                                Enviado por: 
                                <a href="/perfil/{{filme.usuario_id}}" class="author-link">
                                    {{filme.usuario_nome}}
                                </a>
                            </div>
                            <a href="/ver/{{filme.id}}" class="movie-link">
                                Ver detalhes ›
                            </a>
                        </div>

                        % if user and (user.id == filme.usuario_id or user.eh_admin()):
                        <div class="admin-panel">
                            <strong>Gerenciar filme:</strong>
                            <div class="admin-actions">
                                <a href="/editar/{{filme.id}}" class="btn-edit">Editar</a>
                                <a href="/deletar/{{filme.id}}" class="btn-delete" 
                                   onclick="return confirm('Tem certeza que deseja excluir este filme?')">
                                    Excluir
                                </a>
                            </div>
                        </div>
                        % end
                    </div>
                </div>
                % end
            </div>

            % if not filmes:
            <div class="empty-state">
                <h3>Nenhum filme encontrado</h3>
                <p>Que tal adicionar o primeiro filme ao catálogo?</p>
                <a href="/adicionar" class="btn-add" style="margin-top: 20px;">
                    <span>+</span> Adicionar Primeiro Filme
                </a>
            </div>
            % end
        </div>
    </div>

    <script>
        // Adicionar confirmação para exclusão
        document.addEventListener('DOMContentLoaded', function() {
            const deleteLinks = document.querySelectorAll('.btn-delete');
            deleteLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    if (!confirm('Tem certeza que deseja excluir este filme?')) {
                        e.preventDefault();
                    }
                });
            });
        });
    </script>
</body>
</html>