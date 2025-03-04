package com.confeitaria.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.confeitaria.DAO.AdminDAO;
import com.confeitaria.model.Admin;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Captura os parâmetros do formulário
	    String email = request.getParameter("email");
	    String senha = request.getParameter("senha");

	    // Valida o login
	    AdminDAO adminDAO = new AdminDAO();
	    Admin admin = adminDAO.buscarPorEmail(email);

	    if (admin != null && admin.getSenha().equals(adminDAO.criptografarSenha(senha))) {
	        // Verifica o status do administrador
	        if (admin.getStatus() == 1) {
	            // Status ativo: cria a sessão e armazena o nome do admin
	            HttpSession session = request.getSession();
	            session.setAttribute("adminId", admin.getId());
	            session.setAttribute("adminNome", admin.getNome()); // Armazena o nome do admin
	            response.sendRedirect(request.getContextPath() + "/painel");
	        } else {
	            // Status inativo: redireciona para a tela de login com mensagem de erro
	            response.sendRedirect(request.getContextPath() + "/login.jsp?error=inativo");
	        }
	    } else {
	        // Login inválido: redireciona para a tela de login com mensagem de erro
	        response.sendRedirect(request.getContextPath() + "/login.jsp?error=invalido");
	    }
	}
}