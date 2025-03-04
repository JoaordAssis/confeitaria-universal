package com.confeitaria.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.confeitaria.DAO.ProdutoDAO;
import com.confeitaria.model.Produto;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@WebServlet("/imagem-produto")
public class ImagemProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        ProdutoDAO produtoDAO = new ProdutoDAO();
        List<Produto> produtos = produtoDAO.listarTodos();

        for (Produto produto : produtos) {
            if (produto.getId() == id && produto.getImagem() != null) {
                response.setContentType("image/jpeg");
                try (OutputStream out = response.getOutputStream()) {
                    out.write(produto.getImagem());
                }
                return;
            }
        }

        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
}
