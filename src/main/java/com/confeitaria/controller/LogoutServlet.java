package com.confeitaria.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalida a sessão
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Destrói a sessão
        }

        // Redireciona para a tela de login
        response.sendRedirect(request.getContextPath() + "/views/admin/login.jsp");
    }
}