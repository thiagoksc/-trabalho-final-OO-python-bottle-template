<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de {{perfil.name}} - CineTrack</title>
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
        }

        /* Header */
        .header {
            margin-bottom: 30px;
        }

        .btn-back {
            background: rgba(255, 255, 255, 0.9);
            color: #2c3e50;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-back:hover {
            background: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
        }

        /* Profile Card */
        .profile-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            margin-bottom: 40px;
        }

        .profile-header {
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            color: white;
            padding: 40px;
            text-align: center;
        }

        .profile-avatar {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            border: 4px solid rgba(255, 255, 255, 0.2);
        }

        .profile-name {
            font-size: 2.2rem;
            font-weight: 300;
            margin-bottom: 10px;
        }

        .profile-email {
            font-size: 1.1rem;
            opacity: 0.8;
            margin-bottom: 20px;
        }

        .profile-stats {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 15px;
            display: inline-block;
            backdrop-filter: blur(10px);
        }

        .stat-count {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 0.9rem;
            opacity: 0.8;
        }

        /* Movies Section */
        .movies-section {
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            padding: 40px;
        }

        .section-title {
            font-size: 1.8rem;
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .section-title::before {
            content: "🎬";
            font-size: 1.5rem;
        }

        /* Movies Grid */
        .movies-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
        }

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

        .movie-poster {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .movie-content {
            padding: 20px;
        }

        .movie-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 8px;
            line-height: 1.3;
        }

        .movie-meta {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 15px;
        }

        .movie-year {
            color: #667eea;
            font-weight: 600;
        }

        .movie-genre {
            background: #f8f9fa;
            color: #666;
            padding: 4px 8px;
            border-radius: 6px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .btn-details {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 0.9rem;
            display: block;
            text-align: center;
            transition: all 0.3s ease;
        }

        .btn-details:hover {
            transform: translateY(-1px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
            color: white;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }

        .empty-icon {
            font-size: 4rem;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        .empty-title {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #999;
        }

        .empty-description {
            font-size: 1.1rem;
            line-height: 1.5;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                padding: 0 10px;
            }

            .profile-header {
                padding: 30px 20px;
            }

            .profile-name {
                font-size: 1.8rem;
            }

            .movies-section {
                padding: 20px;
            }

            .movies-grid {
                grid-template-columns: 1fr;
            }

            .section-title {
                font-size: 1.5rem;
            }
        }

        @media (max-width: 480px) {
            .profile-name {
                font-size: 1.5rem;
            }

            .profile-avatar {
                width: 80px;
                height: 80px;
                font-size: 2rem;
            }

            .stat-count {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <a href="/" class="btn-back">
                <span>←</span> Voltar para o Catálogo
            </a>
        </div>

        <!-- Profile Card -->
        <div class="profile-card">
            <div class="profile-header">
                <div class="profile-avatar">
                    <span>👤</span>
                </div>
                <h1 class="profile-name">{{perfil.name}}</h1>
                <p class="profile-email">{{perfil.email}}</p>
                <div class="profile-stats">
                    <div class="stat-count">{{len(filmes)}}</div>
                    <div class="stat-label">filmes enviados</div>
                </div>
            </div>
        </div>

        <!-- Movies Section -->
        <div class="movies-section">
            <h2 class="section-title">
                Filmes enviados por {{perfil.name}}
            </h2>

            % if not filmes:
            <div class="empty-state">
                <div class="empty-icon">🎭</div>
                <h3 class="empty-title">Nenhum filme enviado</h3>
                <p class="empty-description">
                    Este usuário ainda não contribuiu com nenhum filme para o catálogo.
                </p>
            </div>
            % else:
            <div class="movies-grid">
                % for filme in filmes:
                <div class="movie-card">
                    <img src="{{filme.imagem}}" alt="{{filme.titulo}}" class="movie-poster">
                    <div class="movie-content">
                        <h3 class="movie-title">{{filme.titulo}}</h3>
                        <div class="movie-meta">
                            <span class="movie-year">{{filme.ano}}</span>
                            <span> • </span>
                            <span class="movie-genre">{{filme.genero}}</span>
                        </div>
                        <a href="/ver/{{filme.id}}" class="btn-details">
                            Ver Detalhes
                        </a>
                    </div>
                </div>
                % end
            </div>
            % end
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Adicionar efeito de carregamento suave
            const cards = document.querySelectorAll('.movie-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    card.style.transition = 'all 0.5s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
            });

            // Adicionar confirmação para ações (se houver)
            const actionLinks = document.querySelectorAll('a[onclick]');
            actionLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    if (!confirm('Tem certeza que deseja realizar esta ação?')) {
                        e.preventDefault();
                    }
                });
            });
        });
    </script>
</body>
</html>