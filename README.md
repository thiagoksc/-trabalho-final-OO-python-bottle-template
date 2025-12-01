# Catálogo de Filmes com Avaliações (Python + Bottle + JSON)

Este projeto foi desenvolvido para atender aos requisitos de Programação Orientada a Objetos (POO) e simula um catálogo de filmes interativo com controle de acesso e sistema de avaliações.

## 💡 Objetivo

Fornecer uma base funcional e robusta para uma aplicação web, demonstrando a correta aplicação dos pilares da Orientação a Objetos (OO) e do padrão MVC.

---

## 🗂 Estrutura de Pastas

```bash
poo-python-bottle-template/
├── app.py # Ponto de entrada do sistema
├── config.py # Configurações e caminhos do projeto
├── main.py # Inicialização da aplicação
├── requirements.txt # Dependências do projeto
├── README.md # Este arquivo
├── controllers/ # Controladores e rotas
│   ├── filme_controller.py  # Rotas CRUD Filmes, Avaliações, Busca, Perfil
│   └── login_controller.py  # Rotas Login, Cadastro e Logout
├── models/ # Definição das entidades (ex: User)
│   ├── user.py              # Classes User, Admin, UserModel (DAO)
│   ├── filme_model.py       # Definição da Classe Filme
│   └── avaliacao_model.py   # Definição da Classe Avaliacao
├── services/ # Lógica de persistência (JSON)
│   ├── user_service.py      # Lógica de Login/Hashing
│   ├── filme_service.py     # Lógica CRUD Filmes
│   └── avaliacao_service.py # Lógica CRUD Avaliações, Cálculo de Média
├── views/ # Arquivos HTML (Bottle Templating)
│   ├── adicionar_filme.tpl  # Formulário de criação
│   ├── editar_filme.tpl     # Formulário de edição (com dados preenchidos)
│   ├── home.tpl             # Página inicial (Catálogo dinâmico)
│   ├── layout.tpl           # Base do layout (cabeçalho/rodapé)
│   ├── login.tpl            # Tela de Login
│   ├── perfil.tpl           # Perfil do usuário com seus filmes
│   ├── register.tpl         # Tela de Cadastro
│   └── ver_filme.tpl        # Detalhes do filme + Comentários
├── static/ # CSS, JS e imagens
├── data/ # Arquivos JSON de dados
│   ├── avaliacoes.json      # Armazena as notas e comentários
│   ├── filmes.json          # Armazena o catálogo de filmes
│   └── users.json           # Armazena usuários e admins  
└── .vscode/ # Configurações opcionais do VS Code
```


---

## 📁 Descrição das Pastas

### `controllers/`
Contém as classes responsáveis por lidar com as rotas (URLs) e a lógica de controle da aplicação.
- `filme_controller.py`: Gerencia a Home, busca, detalhes do filme, avaliações e perfil do usuário.
- `login_controller.py `: Gerencia o fluxo de autenticação (Login, Cadastro e Logout).
- `user_controller.py`: (Opcional/Legado) Gerenciamento básico de usuários.
- `base_controller.py`: classe base com utilitários comuns.

### `models/`
Define as classes que representam as entidades do sistema, aplicando os pilares da OO.
- `user.py`: Contém a classe base User e a classe filha Admin (Herança/Polimorfismo).
- `filme_model.py`: Define a estrutura do objeto Filme e seus atributos.
- `avaliacao_model.py`: Define a estrutura da Avaliacao (nota, comentário, autor).

### `services/`
Responsável por salvar, carregar e manipular dados usando arquivos JSON. Exemplo:
- `user_service.py`: Gerencia usuários e aplica hashing (SHA256) nas senhas.
- `filme_service.py`: Realiza o CRUD de filmes e filtros por usuário.
- `avaliacao_service.py`: Gerencia comentários e realiza o cálculo da média das notas.

### `views/`
Contém os arquivos `.tpl` utilizados pelo Bottle como páginas HTML:
- `home.tpl`: Página inicial com o catálogo dinâmico e barra de busca.
- `ver_filme.tpl`: Tela de detalhes do filme, exibição de comentários e formulário de avaliação.
- `perfil.tpl`: Página de perfil do usuário listando suas contribuições.
- `login.tpl`/`register.tpl`: telas de acesso e cadastro.
- `adicionar_filme.tpl`/`editar_filme.tpl`:Formulários de gerenciamento de conteúdo.

### `static/`
Arquivos estáticos como:
- `css/style.css`: estilos básicos.
- `js/main.js`: scripts JS opcionais.
- `img/BottleLogo.png`: exemplo de imagem.

### `data/`
Armazena os arquivos `.json` que simulam o banco de dados:
- `users.json`: Persistência de usuários comuns e administradores.
- `filmes.json`: Persistência do catálogo de filmes.
- `avaliacoes.json`: Persistência das notas e comentários vinculados.

---

## ▶️ Como Executar

Dependências
O projeto utiliza apenas o Bottle como framework externo, além do hashlib nativo do Python para segurança.

Instruções

1.Clonar o Repositório e navegar até a pasta.

2. Crie o ambiente virtual na pasta fora do seu projeto:
```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\\Scripts\\activate     # Windows
```

3. Entre dentro do seu projeto criado a partir do template e instale as dependências:
```bash
pip install -r requirements.txt
```

4. Rode a aplicação:
```bash
python main.py
```

5. Accese sua aplicação no navegador em: [http://localhost:8080](http://localhost:8080)


---

## 🧠 Autor e Licença
Projeto desenvolvido como template didático para disciplinas de Programação Orientada a Objetos, baseado no [BMVC](https://github.com/hgmachine/bmvc_start_from_this).
Você pode reutilizar, modificar e compartilhar livremente.
