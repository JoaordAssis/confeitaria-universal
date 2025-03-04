package com.confeitaria.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.confeitaria.DAO.AdminDAO;
import com.confeitaria.model.Admin;

/**
 * Servlet implementation class CadastroAdmServlet
 */
@WebServlet("/cadastrar-adm")
public class CadastroAdmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastroAdmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDAO admindao = new AdminDAO();
        List<Admin> admins = admindao.listarTodos();
        request.setAttribute("admins", admins);
        request.getRequestDispatcher("/funcionarios.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    AdminDAO admindao = new AdminDAO();
	    
	    String nome = request.getParameter("nome");
	    String email = request.getParameter("email");
	    String cargo = request.getParameter("cargo");
	    String senha = request.getParameter("senha");
	    
	    String senhaCriptografada = admindao.criptografarSenha(senha);
	    
	    int status = 1;
	    
	    Admin admin = new Admin(nome, email, cargo, senhaCriptografada, status);
	    
	    if (!admindao.verificaAdmin(admin)) { // Se o email não existe, insere o admin
	        admindao.insereAdmin(admin);
	        response.sendRedirect(request.getContextPath() + "/listar-funcionarios");
	    } else {
	        System.out.println("Email já cadastrado.");
	        // Aqui você pode redirecionar para uma página de erro ou mostrar uma mensagem
	        response.sendRedirect(request.getContextPath() + "/cadastroAdm.jsp?error=Email já cadastrado");
	    }
	}

}
