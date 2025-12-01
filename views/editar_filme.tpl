<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar {{filme.titulo}} - Catálogo de Filmes</title>
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
            max-width: 800px;
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
            position: relative;
        }

        .back-link {
            color: white;
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 15px;
            transition: opacity 0.3s ease;
        }

        .back-link:hover {
            opacity: 0.8;
        }

        .header h1 {
            font-size: 2rem;
            font-weight: 300;
            margin: 0;
            line-height: 1.3;
        }

        .movie-year {
            font-size: 1.2rem;
            opacity: 0.8;
            margin-top: 5px;
            font-weight: 300;
        }

        /* Form Content */
        .form-content {
            padding: 40px;
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 1rem;
        }

        .form-control {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
            font-family: inherit;
        }

        .form-control:focus {
            outline: none;
            border-color: #667eea;
            background-color: white;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        textarea.form-control {
            resize: vertical;
            min-height: 120px;
            line-height: 1.5;
        }

        .form-hint {
            font-size: 0.85rem;
            color: #666;
            margin-top: 5px;
            font-style: italic;
        }

        /* Button Styles */
        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e1e5e9;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 14px 30px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            flex: 1;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: transparent;
            color: #666;
            border: 2px solid #e1e5e9;
            padding: 14px 30px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            transition: all 0.3s ease;
            flex: 1;
        }

        .btn-secondary:hover {
            background: #f8f9fa;
            border-color: #667eea;
            color: #667eea;
            transform: translateY(-1px);
        }

        /* Form Row for responsive layout */
        .form-row {
            display: flex;
            gap: 20px;
        }

        .form-row .form-group {
            flex: 1;
        }

        /* Preview Section */
        .preview-section {
            background: #f8f9fa;
            border: 2px dashed #e1e5e9;
            border-radius: 8px;
            padding: 20px;
            margin-top: 30px;
        }

        .preview-section h3 {
            color: #333;
            margin-bottom: 15px;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .preview-section h3::before {
            content: "👁️";
            font-size: 1rem;
        }

        .preview-card {
            background: white;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .preview-title {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 5px;
            font-size: 1.1rem;
        }

        .preview-meta {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }

        .preview-synopsis {
            color: #555;
            line-height: 1.4;
            font-size: 0.9rem;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .preview-image {
            width: 100%;
            max-width: 150px;
            border-radius: 6px;
            margin-bottom: 10px;
        }

        /* Current Image Preview */
        .current-image {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            border-left: 4px solid #667eea;
        }

        .current-image h4 {
            color: #333;
            margin-bottom: 10px;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .image-preview {
            display: flex;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .image-preview img {
            width: 100px;
            height: 150px;
            object-fit: cover;
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        }

        .image-info {
            flex: 1;
            font-size: 0.9rem;
            color: #666;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .form-content {
                padding: 20px;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }

            .form-actions {
                flex-direction: column;
            }

            .header {
                padding: 20px;
            }

            .header h1 {
                font-size: 1.6rem;
            }

            .image-preview {
                flex-direction: column;
                align-items: flex-start;
            }
        }

        /* Loading state */
        .loading {
            opacity: 0.7;
            pointer-events: none;
        }

        /* Success/Error messages */
        .alert {
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border-left-color: #28a745;
        }

        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border-left-color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <a href="/" class="back-link">
                <span>←</span> Cancelar e Voltar
            </a>
            <h1>Editar Filme</h1>
            <div class="movie-year">{{filme.titulo}} ({{filme.ano}})</div>
        </div>

        <!-- Form Content -->
        <div class="form-content">
            <form id="editForm" action="/editar/{{filme.id}}" method="POST">
                <!-- Current Image Preview -->
                <div class="current-image">
                    <h4>Imagem Atual</h4>
                    <div class="image-preview">
                        <img src="{{filme.imagem}}" alt="{{filme.titulo}}" 
                             onerror="this.src='data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjE1MCIgdmlld0JveD0iMCAwIDEwMCAxNTAiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxyZWN0IHdpZHRoPSIxMDAiIGhlaWdodD0iMTUwIiBmaWxsPSIjRjBGMEYwIi8+CjxwYXRoIGQ9Ik0zNSA1MEg2NVY3MEgzNVY1MFpNNTAgMzBDNTYuNjIgMzAgNjIgMzUuMzggNjIgNDJDNjIgNDguNjIgNTYuNjIgNTQgNTAgNTRDNDMuMzggNTQgMzggNDguNjIgMzggNDJDMzggMzUuMzggNDMuMzggMzAgNTAgMzBaIiBmaWxsPSIjQ0RDRENEIi8+Cjwvc3ZnPgo='">
                        <div class="image-info">
                            <strong>Imagem atual do filme</strong><br>
                            <small>Para alterar, insira uma nova URL abaixo</small>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="titulo">Título do Filme</label>
                        <input type="text" id="titulo" name="titulo" class="form-control" 
                               value="{{filme.titulo}}" placeholder="Ex: O Poderoso Chefão" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="ano">Ano de Lançamento</label>
                        <input type="number" id="ano" name="ano" class="form-control" 
                               value="{{filme.ano}}" placeholder="2024" min="1888" max="2030" required>
                        <div class="form-hint">Primeiro filme foi em 1888!</div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="genero">Gênero</label>
                    <input type="text" id="genero" name="genero" class="form-control" 
                           value="{{filme.genero}}" placeholder="Ex: Ação, Drama, Comédia, Ficção Científica" required>
                    <div class="form-hint">Separe múltiplos gêneros com vírgula</div>
                </div>

                <div class="form-group">
                    <label for="imagem">URL da Imagem (Capa)</label>
                    <input type="url" id="imagem" name="imagem" class="form-control" 
                           value="{{filme.imagem}}" placeholder="https://exemplo.com/imagem.jpg" required>
                    <div class="form-hint">Use uma imagem de boa qualidade para melhor visualização</div>
                </div>

                <div class="form-group">
                    <label for="sinopse">Sinopse</label>
                    <textarea id="sinopse" name="sinopse" class="form-control" 
                              placeholder="Descreva a história do filme..." required>{{filme.sinopse}}</textarea>
                    <div class="form-hint">Escreva uma sinopse atraente para outros usuários</div>
                </div>

                <!-- Preview Section -->
                <div class="preview-section">
                    <h3>Pré-visualização das Alterações</h3>
                    <div class="preview-card">
                        <img id="previewImage" src="{{filme.imagem}}" class="preview-image" 
                             onerror="this.style.display='none'">
                        <div class="preview-title" id="previewTitulo">{{filme.titulo}}</div>
                        <div class="preview-meta">
                            <span id="previewAno">({{filme.ano}})</span> • 
                            <span id="previewGenero">{{filme.genero}}</span>
                        </div>
                        <div class="preview-synopsis" id="previewSinopse">
                            {{filme.sinopse}}
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-primary">
                        <span>💾</span> Salvar Alterações
                    </button>
                    <a href="/" class="btn-secondary">Cancelar</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('editForm');
            const inputs = {
                titulo: document.getElementById('titulo'),
                ano: document.getElementById('ano'),
                genero: document.getElementById('genero'),
                sinopse: document.getElementById('sinopse'),
                imagem: document.getElementById('imagem')
            };

            const preview = {
                image: document.getElementById('previewImage'),
                titulo: document.getElementById('previewTitulo'),
                ano: document.getElementById('previewAno'),
                genero: document.getElementById('previewGenero'),
                sinopse: document.getElementById('previewSinopse')
            };

            // Atualizar preview em tempo real
            function updatePreview() {
                preview.titulo.textContent = inputs.titulo.value || 'Título do filme';
                preview.ano.textContent = inputs.ano.value ? `(${inputs.ano.value})` : '(Ano)';
                preview.genero.textContent = inputs.genero.value || 'Gênero';
                preview.sinopse.textContent = inputs.sinopse.value || 'Sinopse do filme...';
                
                // Atualizar imagem se for uma URL válida
                if (inputs.imagem.value && inputs.imagem.value !== '{{filme.imagem}}') {
                    preview.image.src = inputs.imagem.value;
                    preview.image.style.display = 'block';
                }
            }

            // Adicionar event listeners para todos os inputs
            Object.values(inputs).forEach(input => {
                input.addEventListener('input', updatePreview);
            });

            // Validação do formulário
            form.addEventListener('submit', function(e) {
                const ano = parseInt(inputs.ano.value);
                const currentYear = new Date().getFullYear();
                
                if (ano < 1888 || ano > currentYear + 2) {
                    e.preventDefault();
                    alert(`Por favor, insira um ano válido entre 1888 e ${currentYear + 2}`);
                    inputs.ano.focus();
                    return false;
                }

                // Validação básica de URL de imagem
                if (inputs.imagem.value && !inputs.imagem.value.startsWith('http')) {
                    e.preventDefault();
                    alert('Por favor, insira uma URL válida para a imagem (deve começar com http ou https)');
                    inputs.imagem.focus();
                    return false;
                }

                // Mostrar estado de loading
                this.classList.add('loading');
                
                return true;
            });

            // Validação de URL de imagem em tempo real
            inputs.imagem.addEventListener('blur', function() {
                if (this.value && !this.value.match(/\.(jpg|jpeg|png|webp|gif)$/i)) {
                    this.style.borderColor = '#e74c3c';
                    this.style.boxShadow = '0 0 0 3px rgba(231, 76, 60, 0.1)';
                } else {
                    this.style.borderColor = '#e1e5e9';
                    this.style.boxShadow = 'none';
                }
            });

            // Inicializar preview
            updatePreview();
        });
    </script>
</body>
</html>