<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Catálogo de Filmes</title>
    <style>
        body { font-family: sans-serif; background-color: #f4f4f4; padding: 20px; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h1 { text-align: center; color: #333; }
        
        /* Estilo do botão Adicionar */
        .btn-add { 
            display: inline-block; 
            background-color: #007bff; 
            color: white; 
            padding: 10px 20px; 
            text-decoration: none; 
            border-radius: 5px; 
            font-weight: bold;
            margin-bottom: 20px;
        }
        .btn-add:hover { background-color: #0056b3; }

        /* Estilo do Cartão do Filme */
        .filme-card { 
            border: 1px solid #ddd; 
            padding: 15px; 
            margin-bottom: 20px; 
            display: flex; 
            border-radius: 5px;
            background-color: #fff;
        }
        .filme-card img { 
            max-width: 120px; 
            height: auto; 
            margin-right: 20px; 
            object-fit: cover;
            border-radius: 4px;
        }
        .filme-info { flex: 1; }
        .filme-info h2 { margin-top: 0; font-size: 1.4em; }
        .btn-delete { color: #dc3545; text-decoration: none; font-size: 0.9em; font-weight: bold; margin-top: 10px; display: inline-block;}
        .btn-delete:hover { text-decoration: underline; }
    </style>
</head>
<body>

    <div class="container">
        <h1>Catálogo de Filmes</h1>
        
        <a href="/adicionar" class="btn-add">+ Adicionar Filme</a>
        
        <hr>

        % for filme in filmes:
            <div class="filme-card">
                <img src="{{filme.imagem}}" alt="Capa de {{filme.titulo}}">
                
                <div class="filme-info">
                    <h2>
                        <a href="/ver/{{filme.id}}" style="text-decoration: none; color: #333;">
                            {{filme.titulo}}
                        </a>
                        <small>({{filme.ano}})</small>
                    </h2>
                    <a href="/ver/{{filme.id}}">Ver detalhes e comentários...</a>
                    
                    <p><strong>Gênero:</strong> {{filme.genero}}</p>
                    <p>{{filme.sinopse}}</p>
                    % if user.eh_admin():

                        <div style="margin-top: 10px; border-top: 1px dashed #ccc; padding-top: 5px;">
                            <small>Painel Admin:</small><br>
                            <a href="/editar/{{filme.id}}" style="color: orange;">[Editar]</a>
                            <a href="/adicionar" class="btn-add">+ Adicionar Filme</a>
                            <a href="/deletar/{{filme.id}}" style="color: red;" onclick="return confirm('Excluir?')">[Excluir]</a>
                        </div>
                    % end
                    </a>
                    
                    <a href="/deletar/{{filme.id}}" class="btn-delete" onclick="return confirm('Tem certeza que deseja excluir este filme?')">
                        [Excluir Filme]
                    </a>
                </div>
            </div>
        % end
        
        % if not filmes:
            <p style="text-align: center; color: #666;">Nenhum filme cadastrado ainda.</p>
        % end

    </div>

</body>
</html>