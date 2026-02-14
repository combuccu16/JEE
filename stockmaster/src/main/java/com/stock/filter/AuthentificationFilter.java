package com.stock.filter;

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

@WebFilter("/catalogue")
public class AuthentificationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Rien à initialiser
    }

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        // 1. Conversion en objets HTTP
        HttpServletRequest  httpRequest  = (HttpServletRequest)  request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // 2. Récupérer la session SANS en créer une nouvelle
        HttpSession session = httpRequest.getSession(false);

        // 3. Vérifier si l'utilisateur est connecté
        boolean connecte = (session != null)
                        && (session.getAttribute("user") != null);

        // 4. Décision
        if (connecte) {
            // ✅ Connecté → laisser passer vers la Servlet
            chain.doFilter(request, response);
        } else {
            // ❌ Non connecté → bloquer et rediriger
            httpResponse.sendRedirect(
                httpRequest.getContextPath() + "/login.jsp?erreur=non_connecte"
            );
        }
    }

    @Override
    public void destroy() {
        // Rien à nettoyer
    }
}