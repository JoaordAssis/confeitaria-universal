package com.confeitaria.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.confeitaria.DAO.ProdutoDAO;
import com.confeitaria.model.Produto;

import java.io.IOException;

@WebServlet("/inativar-produto")
public class InativarProdutoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtém o ID do produto da requisição
        int id = Integer.parseInt(request.getParameter("id"));

        // Cria um objeto Produto com o ID
        Produto produto = new Produto();
        produto.setId(id);

        // Chama o método para alterar o status
        ProdutoDAO produtoDAO = new ProdutoDAO();
        produtoDAO.alteraStatus(produto);

        // Redireciona de volta para a lista de produtos
        request.getSession().setAttribute("mensagem", "Produto inativado com sucesso!");
        response.sendRedirect(request.getContextPath() + "/listar-produtos");
    }
}
