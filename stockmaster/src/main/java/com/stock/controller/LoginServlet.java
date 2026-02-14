package com.stock.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/connexion")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Récupérer les données du formulaire
        String login    = request.getParameter("login");
        String password = request.getParameter("password");

        // 2. Vérifier les credentials
        if ("admin".equals(login) && "123".equals(password)) {

            // 3. Créer la session et stocker l'utilisateur
            HttpSession session = request.getSession();
            session.setAttribute("user", "admin");

            // 4. Rediriger vers le catalogue
            response.sendRedirect(request.getContextPath() + "/catalogue");

        } else {

            // 5. Echec : renvoyer vers login avec message d'erreur
            request.setAttribute("erreur", "Login ou mot de passe incorrect !");
            request.getRequestDispatcher("/login.jsp")
                   .forward(request, response);
        }
    }
}