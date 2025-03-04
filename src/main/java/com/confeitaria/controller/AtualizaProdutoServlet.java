package com.confeitaria.controller;

import com.confeitaria.DAO.ProdutoDAO;
import com.confeitaria.model.Produto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/atualizar-produto")
public class AtualizaProdutoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Captura os parâmetros do formulário
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        double valor = Double.parseDouble(request.getParameter("valor"));

        // Captura a imagem enviada no formulário (se existir)
        Part filePart = request.getPart("imagem");
        byte[] imagemBytes = null;

        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                imagemBytes = inputStream.readAllBytes(); // Converte a imagem em bytes
            }
        }

        // Busca o produto existente no banco de dados
        ProdutoDAO produtoDAO = new ProdutoDAO();
        Produto produtoExistente = produtoDAO.buscarPorId(id);

        // Mantém a imagem existente se nenhuma nova imagem for enviada
        if (imagemBytes == null && produtoExistente != null) {
            imagemBytes = produtoExistente.getImagem();
        }

        // Cria um objeto Produto com os dados atualizados
        Produto produto = new Produto(id, nome, descricao, valor, 1, imagemBytes);

        // Atualiza o produto no banco de dados
        produtoDAO.atualizar(produto);

        // Redireciona para a página de listagem de produtos
        response.sendRedirect(request.getContextPath() + "/listar-produtos");
    }
}
