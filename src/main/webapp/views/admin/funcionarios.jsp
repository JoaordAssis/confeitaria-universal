<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.confeitaria.model.Admin" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Administradores</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    
    <style>
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

/* Menu Lateral */
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

/* Conteúdo Principal */
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

.btn-adicionar {
    background-color: #28a745;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    font-size: 16px;
    margin-left: auto;
    display: inline-flex;
    align-items: center;
    transition: background-color 0.3s;
}

.btn-adicionar i {
    margin-right: 10px;
}

.btn-adicionar:hover {
    background-color: #218838;
}

.main-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Tabela de Administradores */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table th,
table td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

table th {
    background-color: #2c3e50;
    color: #fff;
    font-weight: 500;
}

table tr:hover {
    background-color: #f5f5f5;
}

/* Status */
.status {
    padding: 5px 10px;
    border-radius: 5px;
    font-weight: bold;
    color: #fff;
}

.status.ativo {
    background-color: #28a745;
}

.status.inativo {
    background-color: #dc3545;
}

/* Botões de Ação */
.btn-editar,
.btn-inativar {
    display: inline-flex;
    align-items: center;
    padding: 8px 12px;
    border-radius: 5px;
    text-decoration: none;
    color: #fff;
    font-size: 14px;
    transition: background-color 0.3s;
}

.btn-editar {
    background-color: #ffc107;
}

.btn-editar:hover {
    background-color: #e0a800;
}

.btn-inativar {
    background-color: #dc3545;
}

.btn-inativar:hover {
    background-color: #c82333;
}

/* Botão de Toggle do Menu (Mobile) */
.menu-toggle {
    display: none;
    background: none;
    border: none;
    color: #2c3e50;
    font-size: 24px;
    cursor: pointer;
}

/* Responsividade */
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

    .btn-adicionar {
        margin-left: 10px;
    }

    table {
        display: block;
        overflow-x: auto;
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
                <h1>Lista de Administradores</h1>
                <a href="views/admin/cadastroAdm.jsp" class="btn-adicionar">
                    <i class="fas fa-plus"></i> Cadastrar Administrador
                </a>
            </header>
            <section class="main-content">
                <table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Cargo</th>
            <th>Status</th>
            <th>Editar</th>
            <th>Inativar</th>
        </tr>
    </thead>
    <tbody>
        <%
            List<Admin> admins = (List<Admin>) request.getAttribute("admins");
            if (admins != null && !admins.isEmpty()) {
                for (Admin admin : admins) {
        %>
        <tr>
            <td><%= admin.getId() %></td>
            <td><%= admin.getNome() %></td>
            <td><%= admin.getEmail() %></td> 
            <td><%= admin.getCargo() %></td>
            <td>
                <span class="status <%= admin.getStatus() == 1 ? "ativo" : "inativo" %>">
                    <%= admin.getStatus() == 1 ? "Ativo" : "Inativo" %>
                </span>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/editar-admin?id=<%= admin.getId() %>" class="btn-editar">
                    <i class="fas fa-edit"></i> Editar
                </a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/inativar-admin?id=<%= admin.getId() %>" class="btn-inativar">
                    <i class="fas fa-ban"></i> Inativar
                </a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7">Nenhum administrador cadastrado.</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
            </section>
        </main>
    </div>

    <script src="script.js"></script>
</body>
</html>
