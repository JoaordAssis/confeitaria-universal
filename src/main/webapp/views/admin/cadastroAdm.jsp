<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Usuário</title>
    <link rel="stylesheet" href="style/styles.css">

    <link rel="stylesheet" href="style/stylescad.css">
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="dashboard">
        <!-- Menu Lateral -->
        <aside class="sidebar" id="sidebar">
            <div class="logo">
                <i class="fas fa-user-cog"></i>
                <span>Admin</span>
            </div>
            <nav class="menu">
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/home">
                            <i class="fas fa-home"></i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/listar-produtos">
                            <i class="fas fa-box"></i>
                            <span>Produtos</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/cadastrar-adm">
                            <i class="fas fa-users"></i>
                            <span>Funcionários</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/logout">
                            <i class="fas fa-sign-out-alt"></i>
                            <span>Sair</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </aside>

        <!-- Conteúdo Principal -->
        <main class="content">
            <header class="header">
                <button class="menu-toggle" id="menu-toggle">
                    <i class="fas fa-bars"></i>
                </button>
                <h1>Cadastro de Usuário</h1>
            </header>
            <section class="main-content">
                <div class="container">
                    <form action="${pageContext.request.contextPath}/cadastrar-adm" method="POST">
                        <div class="form-group">
                            <label for="nome">Nome:</label>
                            <input type="text" id="nome" name="nome" required placeholder="Digite seu nome">
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" required placeholder="Digite seu email">
                        </div>
                        <div class="form-group">
                            <label for="cargo">Cargo:</label>
                            <input type="text" id="cargo" name="cargo" required placeholder="Digite o cargo do funcionário">
                        </div>
                        <div class="form-group">
                            <label for="senha">Senha:</label>
                            <input type="password" id="senha" name="senha" required placeholder="Digite sua senha">
                        </div>
                        <button type="submit" class="btn-submit">Cadastrar</button>
                    </form>
                </div>
            </section>
        </main>
    </div>

    <script src="javascript/script.js"></script>
</body>
</html>