package com.confeitaria.controller;

import com.confeitaria.DAO.ProdutoDAO;
import com.confeitaria.model.Produto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editar-produto")
public class EditarProdutoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pega o ID do produto da requisição
        String idParam = request.getParameter("id");

        // Se o ID não estiver presente, retorna erro (ou outra lógica de sua escolha)
        if (idParam == null || idParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID do produto não informado.");
            return;
        }

        int id = Integer.parseInt(idParam);

        // Busca o produto pelo ID
        ProdutoDAO produtoDAO = new ProdutoDAO();
        Produto produto = produtoDAO.buscarPorId(id);

        // Se não encontrar o produto, retorna erro (ou outra lógica de sua escolha)
        if (produto == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Produto não encontrado.");
            return;
        }

        // Passa o produto para a JSP
        request.setAttribute("produto", produto);
        
        // Redireciona para a página de edição
        request.getRequestDispatcher("cadastroProd.jsp").forward(request, response);
    }
}
