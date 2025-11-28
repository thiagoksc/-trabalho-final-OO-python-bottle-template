<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Catálogo de Filmes</title>
    <style>
        body { font-family: sans-serif; background-color: #f4f4f4; padding: 20px; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        
        /* Cabeçalho com Flexbox para alinhar itens */
        .header-top { display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #eee; padding-bottom: 15px; margin-bottom: 20px; }
        .user-info { font-size: 0.9em; color: #555; }
        .btn-logout { color: red; text-decoration: none; font-weight: bold; margin-left: 10px; border: 1px solid red; padding: 5px 10px; border-radius: 4px; }
        .btn-logout:hover { background-color: red; color: white; }

        h1 { margin: 0; color: #333; }
        
        /* Botão Adicionar */
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

        /* Cartão do Filme */
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
        
        /* Painel Admin */
        .admin-panel {
            margin-top: 10px; 
            border-top: 1px dashed #ccc; 
            padding-top: 10px;
            font-size: 0.9em;
            background-color: #fff8e1;
            padding: 10px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    
    <div class="container">
        <div class="header-top">
            <h1>Catálogo de Filmes</h1>
            <div class="user-info">
                Olá, <strong>{{user.name}}</strong>!
                <a href="/logout" class="btn-logout">Sair</a>
            </div>
        </div>
        
        <div style="text-align: center; margin-bottom: 20px;">
            <a href="/adicionar" class="btn-add">+ Adicionar Filme</a>
        </div>
        
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

                    <p style="font-size: 0.8em; color: #666; margin-top: 5px;">
                        Enviado por: <strong>{{filme.usuario_nome}}</strong>
                    </p>

                    <p>{{filme.sinopse}}</p>
                    
                    % if user and (user.id == filme.usuario_id or user.eh_admin()):
                        <div class="admin-panel">
                            <strong>Gerenciar:</strong>
                            <a href="/editar/{{filme.id}}" style="color: #d39e00; font-weight: bold; margin-left: 10px;">[Editar]</a>
                            <a href="/deletar/{{filme.id}}" style="color: red; font-weight: bold; margin-left: 10px;" onclick="return confirm('Tem certeza que deseja excluir este filme?')">[Excluir]</a>
                        </div>
                    % end
                </div>
            </div>
        % end
        
        % if not filmes:
            <p style="text-align: center; color: #666;">Nenhum filme cadastrado ainda.</p>
        % end

    </div>

</body>
</html>