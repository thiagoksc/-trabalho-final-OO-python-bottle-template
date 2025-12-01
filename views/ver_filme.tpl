<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{filme.titulo}} - CineTrack</title>
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
            color: #333;
        }

        .container {
            max-width: 1000px;
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
            padding: 25px 40px;
        }

        .nav-links {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 10px;
        }

        .btn-back {
            background: transparent;
            color: white;
            border: 2px solid rgba(255,255,255,0.3);
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-back:hover {
            background: rgba(255,255,255,0.1);
            transform: translateY(-1px);
        }

        .btn-profile {
            background: rgba(255,255,255,0.1);
            color: white;
            border: 2px solid rgba(255,255,255,0.3);
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-profile:hover {
            background: rgba(255,255,255,0.2);
            transform: translateY(-1px);
        }

        /* Movie Details */
        .movie-details {
            display: flex;
            gap: 30px;
            padding: 40px;
            background: white;
        }

        .movie-poster {
            flex-shrink: 0;
            width: 280px;
        }

        .movie-poster img {
            width: 100%;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .movie-info {
            flex: 1;
        }

        .movie-title {
            font-size: 2.2rem;
            font-weight: 300;
            color: #2c3e50;
            margin-bottom: 5px;
            line-height: 1.2;
        }

        .movie-year {
            font-size: 1.4rem;
            color: #666;
            font-weight: 300;
            margin-bottom: 20px;
        }

        .movie-meta {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .meta-item {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .meta-label {
            font-size: 0.85rem;
            color: #666;
            font-weight: 600;
            text-transform: uppercase;
        }

        .meta-value {
            font-size: 1rem;
            color: #333;
            font-weight: 500;
        }

        .genre-tag {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 600;
        }

        .movie-synopsis {
            line-height: 1.6;
            color: #555;
            font-size: 1.05rem;
            margin-bottom: 25px;
        }

        .movie-author {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            border-left: 4px solid #667eea;
            font-size: 0.9rem;
        }

        .author-label {
            color: #666;
            margin-bottom: 5px;
        }

        .author-name {
            color: #667eea;
            font-weight: 600;
            text-decoration: none;
        }

        .author-name:hover {
            text-decoration: underline;
        }

        /* Admin Actions */
        .admin-actions {
            background: #fff8e1;
            border: 1px solid #ffeaa7;
            border-radius: 8px;
            padding: 20px;
            margin-top: 25px;
        }

        .admin-actions h4 {
            color: #e67e22;
            margin-bottom: 10px;
            font-size: 1rem;
        }

        .action-buttons {
            display: flex;
            gap: 15px;
        }

        .btn-edit {
            background: #f39c12;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }

        .btn-edit:hover {
            background: #e67e22;
            transform: translateY(-1px);
        }

        .btn-delete {
            background: #e74c3c;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }

        .btn-delete:hover {
            background: #c0392b;
            transform: translateY(-1px);
        }

        /* Reviews Section */
        .reviews-section {
            background: #f8f9fa;
            padding: 40px;
            border-top: 1px solid #e1e5e9;
        }

        .section-title {
            font-size: 1.5rem;
            color: #2c3e50;
            margin-bottom: 25px;
            font-weight: 600;
        }

        /* Reviews List */
        .reviews-list {
            margin-bottom: 40px;
        }

        .review-item {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            border-left: 4px solid #667eea;
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 10px;
        }

        .reviewer-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .reviewer-name {
            font-weight: 600;
            color: #2c3e50;
        }

        .review-rating {
            background: #ff9800;
            color: white;
            padding: 4px 8px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .review-comment {
            line-height: 1.5;
            color: #555;
            margin-bottom: 10px;
        }

        .review-actions {
            text-align: right;
        }

        .btn-delete-comment {
            color: #e74c3c;
            text-decoration: none;
            font-size: 0.8rem;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .btn-delete-comment:hover {
            color: #c0392b;
            text-decoration: underline;
        }

        .empty-reviews {
            text-align: center;
            padding: 40px;
            color: #666;
        }

        .empty-reviews h4 {
            font-size: 1.2rem;
            margin-bottom: 10px;
            color: #999;
        }

        /* Review Form */
        .review-form {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
        }

        .rating-input {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .rating-input input {
            padding: 10px;
            border: 2px solid #e1e5e9;
            border-radius: 6px;
            width: 80px;
            text-align: center;
            font-size: 1rem;
        }

        .rating-hint {
            color: #666;
            font-size: 0.9rem;
        }

        .comment-input {
            width: 100%;
            padding: 12px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 1rem;
            font-family: inherit;
            resize: vertical;
            min-height: 100px;
            transition: all 0.3s ease;
        }

        .comment-input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .btn-submit {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .movie-details {
                flex-direction: column;
                padding: 20px;
            }

            .movie-poster {
                width: 100%;
                max-width: 300px;
                margin: 0 auto;
            }

            .movie-title {
                font-size: 1.8rem;
            }

            .nav-links {
                flex-direction: column;
                align-items: flex-start;
            }

            .reviews-section {
                padding: 20px;
            }

            .review-header {
                flex-direction: column;
                gap: 10px;
            }

            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <div class="nav-links">
                <a href="/" class="btn-back">
                    <span>←</span> Voltar ao Catálogo
                </a>
                <a href="/perfil/{{filme.usuario_id}}" class="btn-profile">
                    Ver Perfil de {{filme.usuario_nome}}
                </a>
            </div>
        </div>

        <!-- Movie Details -->
        <div class="movie-details">
            <div class="movie-poster">
                <img src="{{filme.imagem}}" alt="{{filme.titulo}}">
            </div>
            
            <div class="movie-info">
                <h1 class="movie-title">{{filme.titulo}}</h1>
                <div class="movie-year">({{filme.ano}})</div>
                
                <div class="movie-meta">
                    <div class="meta-item">
                        <span class="meta-label">Gênero</span>
                        <span class="genre-tag">{{filme.genero}}</span>
                    </div>
                </div>

                <div class="movie-synopsis">
                    {{filme.sinopse}}
                </div>

                <div class="movie-author">
                    <div class="author-label">Enviado por</div>
                    <a href="/perfil/{{filme.usuario_id}}" class="author-name">
                        {{filme.usuario_nome}}
                    </a>
                </div>

                % if user and (user.id == filme.usuario_id or user.eh_admin()):
                <div class="admin-actions">
                    <h4>Gerenciar Filme</h4>
                    <div class="action-buttons">
                        <a href="/editar/{{filme.id}}" class="btn-edit">Editar Filme</a>
                        <a href="/deletar/{{filme.id}}" class="btn-delete" 
                           onclick="return confirm('Tem certeza que deseja excluir este filme?')">
                            Excluir Filme
                        </a>
                    </div>
                </div>
                % end
            </div>
        </div>

        <!-- Reviews Section -->
        <div class="reviews-section">
            <h2 class="section-title">Avaliações e Comentários</h2>
            
            <div class="reviews-list">
                % if not avaliacoes:
                <div class="empty-reviews">
                    <h4>Nenhuma avaliação ainda</h4>
                    <p>Seja o primeiro a avaliar este filme!</p>
                </div>
                % end
                
                % for av in avaliacoes:
                <div class="review-item">
                    <div class="review-header">
                        <div class="reviewer-info">
                            <span class="reviewer-name">{{av.usuario_nome}}</span>
                            <span class="review-rating">
                                ★ {{av.nota}}/5
                            </span>
                        </div>
                        % if user and (user.id == av.usuario_id or user.eh_admin()):
                        <div class="review-actions">
                            <a href="/deletar_avaliacao/{{av.id}}/{{filme.id}}" 
                               class="btn-delete-comment"
                               onclick="return confirm('Tem certeza que deseja excluir este comentário?')">
                                Excluir
                            </a>
                        </div>
                        % end
                    </div>
                    <div class="review-comment">
                        {{av.comentario}}
                    </div>
                </div>
                % end
            </div>

            <!-- Review Form -->
            <div class="review-form">
                <h3 style="margin-bottom: 20px; color: #2c3e50;">Deixe sua opinião</h3>
                <form action="/avaliar/{{filme.id}}" method="POST">
                    <div class="form-group">
                        <label for="nota">Sua Nota</label>
                        <div class="rating-input">
                            <input type="number" id="nota" name="nota" min="1" max="5" step="0.1" 
                                   placeholder="4.5" required>
                            <span class="rating-hint">(1 a 5)</span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="comentario">Seu Comentário</label>
                        <textarea id="comentario" name="comentario" class="comment-input" 
                                  placeholder="O que você achou do filme? Compartilhe sua opinião..." 
                                  required></textarea>
                    </div>
                    
                    <button type="submit" class="btn-submit">
                        Publicar Avaliação
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Validação da nota
            const notaInput = document.getElementById('nota');
            notaInput.addEventListener('change', function() {
                const nota = parseFloat(this.value);
                if (nota < 1 || nota > 5) {
                    this.style.borderColor = '#e74c3c';
                    this.style.boxShadow = '0 0 0 3px rgba(231, 76, 60, 0.1)';
                } else {
                    this.style.borderColor = '#28a745';
                    this.style.boxShadow = '0 0 0 3px rgba(40, 167, 69, 0.1)';
                }
            });

            // Confirmação para exclusões
            const deleteLinks = document.querySelectorAll('.btn-delete, .btn-delete-comment');
            deleteLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    if (!confirm('Tem certeza que deseja excluir?')) {
                        e.preventDefault();
                    }
                });
            });
        });
    </script>
</body>
</html>