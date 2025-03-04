<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.confeitaria.model.Admin" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Configurações do Negócio</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Estilos anteriores mantidos */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7f6;
            color: #333;
        }

        .dashboard {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: #fff;
            padding: 20px;
            display: flex;
            flex-direction: column;
            transition: transform 0.3s ease;
        }

        .logo {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }

        .logo i {
            font-size: 24px;
            margin-right: 10px;
        }

        .logo span {
            font-size: 20px;
            font-weight: 500;
        }

        .menu ul {
            list-style: none;
        }

        .menu li {
            margin-bottom: 15px;
        }

        .menu a {
            color: #fff;
            text-decoration: none;
            display: flex;
            align-items: center;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .menu a:hover {
            background-color: #34495e;
        }

        .menu a i {
            font-size: 18px;
            margin-right: 10px;
        }

        .menu a span {
            font-size: 16px;
        }

        .menu .active a {
            background-color: #34495e;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        .header {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .header h1 {
            font-size: 28px;
            font-weight: 500;
            color: #2c3e50;
            margin-left: 20px;
        }

        .btn-salvar {
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .btn-salvar:hover {
            background-color: #218838;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .form-group input[type="text"],
        .form-group input[type="file"],
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 100px;
        }

        .form-group .color-picker {
            display: flex;
            gap: 10px;
        }

        .form-group .color-picker input[type="color"] {
            width: 50px;
            height: 50px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .config-section {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .config-section h2 {
            font-size: 22px;
            margin-bottom: 15px;
            color: #2c3e50;
        }

        @media (max-width: 768px) {
            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                height: 100vh;
                transform: translateX(-100%);
                z-index: 1000;
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .menu-toggle {
                display: block;
            }

            .header h1 {
                margin-left: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <!-- Menu Lateral -->
        <aside class="sidebar" id="sidebar">
            <div class="logo">
                <i class="fas fa-user-shield"></i>
                <span>Admin</span>
            </div>
            <nav class="menu">
                <ul>
                    <li>
                        <a href="views/admin/index.jsp">
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
                    <li>
                        <a href="${pageContext.request.contextPath}/listar-funcionarios">
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
                <h1>Configurações do Negócio</h1>
            </header>
            <section class="main-content">
                <!-- Seção: Nome do Negócio -->
                <div class="config-section">
                    <h2>Nome do Negócio</h2>
                    <form action="${pageContext.request.contextPath}/salvar-nome-negocio" method="post">
                        <div class="form-group">
                            <label for="nomeNegocio">Nome</label>
                            <input type="text" id="nomeNegocio" name="nomeNegocio" placeholder="Digite o nome do seu negócio" required>
                        </div>
                        <button type="submit" class="btn-salvar">Salvar Nome</button>
                    </form>
                </div>

                <!-- Seção: Logo do Negócio -->
                <div class="config-section">
                    <h2>Logo do Negócio</h2>
                    <form action="${pageContext.request.contextPath}/salvar-logo" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="logo">Escolha uma imagem</label>
                            <input type="file" id="logo" name="logo" accept="image/*" required>
                        </div>
                        <button type="submit" class="btn-salvar">Salvar Logo</button>
                    </form>
                </div>

                <!-- Seção: Banner Principal -->
                <div class="config-section">
                    <h2>Banner Principal</h2>
                    <form action="${pageContext.request.contextPath}/salvar-banner" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="banner">Escolha uma imagem</label>
                            <input type="file" id="banner" name="banner" accept="image/*" required>
                        </div>
                        <button type="submit" class="btn-salvar">Salvar Banner</button>
                    </form>
                </div>

                <!-- Seção: Categorias de Produtos -->
                <div class="config-section">
                    <h2>Categorias de Produtos</h2>
                    <form action="${pageContext.request.contextPath}/salvar-categorias" method="post">
                        <div class="form-group">
                            <label for="categorias">Categorias</label>
                            <textarea id="categorias" name="categorias" placeholder="Digite as categorias, separadas por vírgula"></textarea>
                        </div>
                        <button type="submit" class="btn-salvar">Salvar Categorias</button>
                    </form>
                </div>

                <!-- Seção: Cores Personalizadas -->
                <div class="config-section">
                    <h2>Cores do Tema</h2>
                    <form action="${pageContext.request.contextPath}/salvar-cores" method="post">
                        <div class="form-group">
                            <label>Cores</label>
                            <div class="color-picker">
                                <input type="color" id="corPrimaria" name="corPrimaria" value="#2c3e50">
                                <input type="color" id="corSecundaria" name="corSecundaria" value="#28a745">
                            </div>
                        </div>
                        <button type="submit" class="btn-salvar">Salvar Cores</button>
                    </form>
                </div>

                <!-- Seção: Descrição do Negócio -->
                <div class="config-section">
                    <h2>Descrição do Negócio</h2>
                    <form action="${pageContext.request.contextPath}/salvar-descricao" method="post">
                        <div class="form-group">
                            <label for="descricao">Descrição</label>
                            <textarea id="descricao" name="descricao" placeholder="Descreva seu negócio"></textarea>
                        </div>
                        <button type="submit" class="btn-salvar">Salvar Descrição</button>
                    </form>
                </div>
            </section>
        </main>
    </div>

    <script>
        // Script para alternar o menu lateral em dispositivos móveis
        document.getElementById('menu-toggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('active');
        });
    </script>
</body>
</html>