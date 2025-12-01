<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Catálogo de Filmes</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 20px;
        }

        .register-container {
            display: flex;
            max-width: 900px;
            width: 100%;
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .register-left {
            flex: 1;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .register-left h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            font-weight: 300;
        }

        .register-left p {
            font-size: 1.1rem;
            opacity: 0.9;
            line-height: 1.6;
        }

        .register-right {
            flex: 1;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .register-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .register-header h2 {
            font-size: 2rem;
            color: #333;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .register-header p {
            color: #666;
            font-size: 0.95rem;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
            font-size: 0.9rem;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
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

        .form-row {
            display: flex;
            gap: 15px;
        }

        .form-row .form-group {
            flex: 1;
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        .login-link {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e1e5e9;
        }

        .login-link p {
            color: #666;
            margin-bottom: 10px;
        }

        .btn-secondary {
            display: inline-block;
            padding: 10px 25px;
            background: transparent;
            color: #667eea;
            border: 2px solid #667eea;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            background: #667eea;
            color: white;
            transform: translateY(-1px);
        }

        .password-requirements {
            font-size: 0.8rem;
            color: #666;
            margin-top: 5px;
        }

        /* Responsividade */
        @media (max-width: 768px) {
            .register-container {
                flex-direction: column;
                max-width: 400px;
            }
            
            .register-left {
                padding: 30px;
            }
            
            .register-left h1 {
                font-size: 2rem;
            }
            
            .register-right {
                padding: 30px;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <!-- Lado esquerdo com branding -->
        <div class="register-left">
            <h1>Catálogo de Filmes</h1>
            <p>Junte-se à nossa comunidade e comece a construir sua coleção de filmes personalizada.</p>
        </div>

        <!-- Lado direito com formulário -->
        <div class="register-right">
            <div class="register-header">
                <h2>Criar Conta</h2>
                <p>Preencha seus dados para começar</p>
            </div>

            <form action="/register" method="POST">
                <div class="form-group">
                    <label for="name">Nome Completo</label>
                    <input type="text" id="name" name="name" class="form-control" placeholder="Seu nome completo" required>
                </div>
                
                <div class="form-group">
                    <label for="email">E-mail</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="seu@email.com" required>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="birthdate">Data de Nascimento</label>
                        <input type="date" id="birthdate" name="birthdate" class="form-control" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Senha</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Mínimo 6 caracteres" required>
                        <div class="password-requirements">Mínimo 6 caracteres</div>
                    </div>
                </div>
                
                <button type="submit" class="btn-primary">Criar Conta</button>
            </form>
            
            <div class="login-link">
                <p>Já tem uma conta?</p>
                <a href="/login" class="btn-secondary">Fazer Login</a>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Configurar data máxima (hoje) para data de nascimento
            const birthdateInput = document.getElementById('birthdate');
            const today = new Date().toISOString().split('T')[0];
            birthdateInput.max = today;
            
            // Validação de senha em tempo real
            const passwordInput = document.getElementById('password');
            passwordInput.addEventListener('input', function() {
                if (this.value.length < 6 && this.value.length > 0) {
                    this.style.borderColor = '#dc3545';
                } else {
                    this.style.borderColor = '#28a745';
                }
            });

            // Validação do formulário antes de enviar
            const form = document.querySelector('form');
            form.addEventListener('submit', function(e) {
                const password = document.getElementById('password').value;
                const birthdate = document.getElementById('birthdate').value;
                
                if (password.length < 6) {
                    e.preventDefault();
                    alert('A senha deve ter pelo menos 6 caracteres.');
                    return false;
                }
                
                if (!birthdate) {
                    e.preventDefault();
                    alert('Por favor, selecione sua data de nascimento.');
                    return false;
                }
                
                return true;
            });
        });
    </script>
</body>
</html>