<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.confeitaria.model.Produto"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista de Produtos</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
/* Reset básico */
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

.main-content {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.main-content table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.main-content table th, .main-content table td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.main-content table th {
	background-color: #2c3e50;
	color: #fff;
	font-weight: 500;
}

.main-content table tr:hover {
	background-color: #f5f5f5;
}

.main-content table img {
	max-width: 100px;
	height: auto;
	border-radius: 5px;
}

/* Botões de ação */
.btn-adicionar, .btn-editar, .btn-inativar {
	display: inline-flex;
	align-items: center;
	padding: 8px 12px;
	border-radius: 5px;
	text-decoration: none;
	color: #fff;
	font-size: 14px;
	transition: background-color 0.3s;
}

.btn-adicionar {
	background-color: #28a745;
	margin-left: auto; /* Alinha o botão à direita */
}

.btn-adicionar:hover {
	background-color: #218838;
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
@media ( max-width : 768px) {
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
	.main-content table {
		display: block;
		overflow-x: auto;
	}
}

.mensagem-sucesso {
	background-color: #28a745;
	color: #fff;
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 20px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="dashboard">
		<!-- Menu Lateral -->
		<aside class="sidebar" id="sidebar">
			<div class="logo">
				<i class="fas fa-user-cog"></i> <span>Admin</span>
			</div>
			<nav class="menu">
				<ul>
					<li><a href="views/admin/index.jsp"> <i
							class="fas fa-home"></i> <span>Home</span>
					</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/listar-produtos"> <i
							class="fas fa-box"></i> <span>Produtos</span>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/listar-funcionarios">
							<i class="fas fa-users"></i> <span>Funcionários</span>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/logout"> <i
							class="fas fa-sign-out-alt"></i> <span>Sair</span>
					</a></li>
				</ul>
			</nav>
		</aside>

		<!-- Conteúdo Principal -->
		<main class="content">
			<header class="header">
				<button class="menu-toggle" id="menu-toggle">
					<i class="fas fa-bars"></i>
				</button>
				<h1>Lista de Produtos</h1>
				<a href="views/admin/cadastroProd.jsp" class="btn-adicionar"> <i
					class="fas fa-plus"></i> Adicionar Produto
				</a>
			</header>
			<section class="main-content">
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome</th>
							<th>Descrição</th>
							<th>Valor</th>
							<th>Imagem</th>
							<th>Status</th>
							<th>Editar</th>
							<th>Inativar</th>
							<th>Inativar</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
						if (produtos != null && !produtos.isEmpty()) {
							for (Produto produto : produtos) {
						%>
						<tr>
							<td><%=produto.getId()%></td>
							<td><%=produto.getNome()%></td>
							<td><%=produto.getDescricao()%></td>
							<td>R$ <%=String.format("%.2f", produto.getValor())%></td>
							<td><img
								src="${pageContext.request.contextPath}/imagem-produto?id=<%= produto.getId() %>"
								width="100"></td>

							<td><%=produto.getStatus() == 1 ? "Ativo" : "Inativo"%></td>
							<td><a
								href="${pageContext.request.contextPath}/editar-produto?id=<%= produto.getId() %>"
								class="btn-editar"> <i class="fas fa-edit"></i> Editar
							</a></td>

							<td><a
								href="${pageContext.request.contextPath}/inativar-produto?id=<%= produto.getId() %>"
								class="btn-inativar"> <i class="fas fa-ban"></i> <%=produto.getStatus() == 1 ? "Inativar" : "Reativar"%>
							</a></td>
							<td><a
								href="${pageContext.request.contextPath}/deletar-produto?id=<%= produto.getId() %>"
								class="btn-inativar" id="delete-<%= produto.getId() %>"> <i
									class="fas fa-trash"></i> Excluir
							</a></td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="7">Nenhum produto cadastrado.</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</section>
		</main>
	</div>

	<script>
    // Função para confirmar a exclusão
    function confirmarExclusao(event, nomeProduto) {
        // Previne o comportamento padrão do link (não seguir o href)
        event.preventDefault();

        // Cria a mensagem de confirmação
        const mensagem = `⚠️ Tem certeza que deseja excluir o produto "${nomeProduto}"?\n\n` +
                         `Ao excluir um produto, o mesmo, caso volte ao catálogo, deverá ser recadastrado.\n` +
                         `Utilize a função "Inativar" para que o produto pare de ser exibido no catálogo.`;

        // Exibe o alerta e redireciona apenas se o usuário confirmar
        if (confirm(mensagem)) {
            window.location.href = event.target.href; // Segue o link de exclusão
        }
    }

    // Adiciona o evento de clique a todos os botões de excluir
    document.querySelectorAll('a[id^="delete-"]').forEach(link => {
        link.addEventListener('click', (event) => {
            // Captura o nome do produto da mesma linha do botão clicado
            const nomeProduto = link.closest('tr').querySelector('td:nth-child(2)').textContent.trim();
            if (nomeProduto) {
                confirmarExclusao(event, nomeProduto);
            } else {
                alert("Erro: Nome do produto não encontrado.");
            }
        });
    });
</script>


	<script src="javascrit/list/script.js"></script>
</body>
</html>