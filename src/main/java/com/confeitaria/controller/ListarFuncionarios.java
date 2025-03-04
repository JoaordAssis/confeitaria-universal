package com.confeitaria.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.confeitaria.DAO.AdminDAO;
import com.confeitaria.DAO.ProdutoDAO;
import com.confeitaria.model.Admin;
import com.confeitaria.model.Produto;

/**
 * Servlet implementation class ListarFuncionarios
 */
@WebServlet("/listar-funcionarios")
public class ListarFuncionarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListarFuncionarios() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDAO adminDAO = new AdminDAO();
        List<Admin> admins = adminDAO.listarTodos(); // Busca todos os administradores
        
        request.setAttribute("admins", admins); // Adiciona a lista ao request
        request.getRequestDispatcher("views/admin/funcionarios.jsp").forward(request, response); // Encaminha para a JSP

        //request.getRequestDispatcher("funcionarios.jsp").forward(request, response); // Encaminha para a JSP correta
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
