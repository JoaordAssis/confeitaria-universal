package com.confeitaria.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.confeitaria.DAO.ProdutoDAO;
import com.confeitaria.model.Produto;

import java.io.IOException;
import java.io.InputStream;

@WebServlet("/cadastrar-produto")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // Limite de 5MB para upload
public class ProdutoServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        double valor = Double.parseDouble(request.getParameter("valor"));

        Part filePart = request.getPart("imagem"); // Captura o arquivo
        byte[] imagem = null;
        
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                imagem = inputStream.readAllBytes();
            }
        }
        Produto produto = new Produto(nome, valor, descricao, imagem);
        ProdutoDAO produtoDAO = new ProdutoDAO();
        produtoDAO.inserir(produto);

        response.sendRedirect(request.getContextPath() + "/listar-produtos");
    }
}
