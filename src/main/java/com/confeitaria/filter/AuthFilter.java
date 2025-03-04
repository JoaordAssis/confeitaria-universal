package com.confeitaria.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*") // Aplica o filtro a todas as URLs
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // URLs que não precisam de autenticação
        String[] publicURLs = {"/login.jsp", "/login", "/logout", "/static/", "/views/index.jsp"};

        // Verifica se a URL atual é pública
        String requestURI = httpRequest.getRequestURI();
        for (String publicURL : publicURLs) {
            if (requestURI.startsWith(httpRequest.getContextPath() + publicURL)) {
                // URL pública: permite o acesso sem autenticação
                chain.doFilter(request, response);
                return;
            }
        }

        // Verifica se a sessão existe e se o admin está logado
        HttpSession session = httpRequest.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
            // Sessão inválida: redireciona para a tela de login
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
        } else {
            // Sessão válida: permite o acesso à página solicitada
            chain.doFilter(request, response);
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inicialização do filtro (opcional)
    }

    @Override
    public void destroy() {
        // Destruição do filtro (opcional)
    }
}