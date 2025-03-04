<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.confeitaria.model.Produto" %>

<%
    // Verifica se há um produto na requisição (edição)
    Produto produto = (Produto) request.getAttribute("produto");
    boolean isEdicao = produto != null;
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= isEdicao ? "Editar" : "Cadastrar" %> Produto</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Estilos CSS aqui */
    </style>
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
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/listar-produtos">
                            <i class="fas fa-box"></i>
                            <span>Produtos</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/funcionarios">
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
                <h1><%= isEdicao ? "Editar" : "Cadastrar" %> Produto</h1>
            </header>
            <section class="main-content">
                <form action="${pageContext.request.contextPath}/<%= isEdicao ? "atualizar-produto" : "cadastrar-produto" %>" method="POST" enctype="multipart/form-data" class="form-cadastro">
                    <% if (isEdicao) { %>
                        <input type="hidden" name="id" value="<%= produto.getId() %>">
                    <% } %>
                    <div class="form-group">
                        <label for="nome">Nome:</label>
                        <input type="text" id="nome" name="nome" value="<%= isEdicao ? produto.getNome() : "" %>" required>
                    </div>
                    <div class="form-group">
                        <label for="descricao">Descrição:</label>
                        <input type="text" id="descricao" name="descricao" value="<%= isEdicao ? produto.getDescricao() : "" %>" required>
                    </div>
                    <div class="form-group">
                        <label for="valor">Valor:</label>
                        <input type="number" id="valor" name="valor" step="0.01" value="<%= isEdicao ? produto.getValor() : "" %>" required>
                    </div>
                    <div class="form-group">
                        <label for="imagem">Imagem:</label>
                        <input type="file" id="imagem" name="imagem" accept="image/*" <%= isEdicao ? "" : "required" %>>
                    </div>
                    <button type="submit" class="btn-submit"><%= isEdicao ? "Atualizar" : "Cadastrar" %> Produto</button>
                </form>
            </section>
        </main>
    </div>

    <script src="javascript/script.js"></script>
</body>
</html>
