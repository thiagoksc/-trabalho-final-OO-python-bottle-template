<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>{{filme.titulo}}</title>
    <style>
        body { font-family: sans-serif; max-width: 800px; margin: 0 auto; padding: 20px; }
        .header { display: flex; border-bottom: 1px solid #ccc; padding-bottom: 20px; margin-bottom: 20px; }
        .header img { max-width: 200px; margin-right: 20px; border-radius: 5px; }
        .comentarios { background-color: #f9f9f9; padding: 20px; border-radius: 8px; }
        .comentario-item { border-bottom: 1px solid #ddd; padding: 10px 0; }
        .nota { font-weight: bold; color: #ff9800; }
        .back-link { display: block; margin-bottom: 20px; color: #007bff; text-decoration: none; }
    </style>
</head>
<body>
    <div style="margin-bottom: 20px;">
        <a href="/" class="btn btn-outline-secondary btn-sm" style="text-decoration: none; padding: 5px 10px; border: 1px solid #ccc; border-radius: 5px; color: #333;">
            ← Voltar ao Catálogo
        </a>
        
        <a href="/perfil/{{filme.usuario_id}}" class="btn btn-outline-primary btn-sm" style="text-decoration: none; padding: 5px 10px; border: 1px solid #007bff; border-radius: 5px; color: #007bff; margin-left: 10px;">
            Ver Perfil de {{filme.usuario_nome}}
        </a>
    </div>
    <div class="header">
        <img src="{{filme.imagem}}" alt="{{filme.titulo}}">
        <div>
            <h1>{{filme.titulo}} <small>({{filme.ano}})</small></h1>
            <p><strong>Gênero:</strong> {{filme.genero}}</p>
            <p style="font-size: 0.8em; color: #666;">
                Enviado por: 
                <a href="/perfil/{{filme.usuario_id}}" style="text-decoration: none; font-weight: bold; color: #007bff;">
                    {{filme.usuario_nome}}
                </a>
            </p>
            <p>{{filme.sinopse}}</p>
            
            <br>
            % if user and (user.id == filme.usuario_id or user.eh_admin()):
                <div style="margin-top: 10px; border-top: 1px dashed #ccc; padding-top: 5px;">
                    <a href="/editar/{{filme.id}}" style="color: orange; font-weight: bold;">[Editar Filme]</a>
                    
                    <a href="/deletar/{{filme.id}}" style="color: red; margin-left: 10px;" onclick="return confirm('Excluir?')">[Excluir Filme]</a>
                </div>
            % end
    </div>

    <div class="comentarios">
        <h3>Avaliações e Comentários</h3>
        
        % if not avaliacoes:
            <p><i>Seja o primeiro a avaliar este filme!</i></p>
        % end
        
        % for av in avaliacoes:
            <div class="comentario-item">
                <span class="nota">★ {{av.nota}}/5</span> 
                <strong>{{av.usuario_nome}}</strong> disse:
                <p>
                    {{av.comentario}}
                    
                    % if user and (user.id == av.usuario_id or user.eh_admin()):
                        <a href="/deletar_avaliacao/{{av.id}}/{{filme.id}}" 
                        style="color: red; font-size: 0.8em; margin-left: 10px; text-decoration: none;"
                        onclick="return confirm('Apagar este comentário?')">
                        [Excluir]
                        </a>
                    % end
                </p>
            </div>
        % end

        <hr>

        <h4>Deixe sua opinião:</h4>
        <form action="/avaliar/{{filme.id}}" method="POST">
            <label>Nota (1 a 5):</label>
            <input type="number" name="nota" min="1" max="5" required style="width: 50px;">
            <br><br>
            <textarea name="comentario" rows="3" style="width: 100%;" placeholder="O que você achou do filme?" required></textarea>
            <br><br>
            <button type="submit" style="background: blue; color: white; padding: 10px; border:none; cursor: pointer;">Publicar Avaliação</button>
        </form>
    </div>
</body>
</html>