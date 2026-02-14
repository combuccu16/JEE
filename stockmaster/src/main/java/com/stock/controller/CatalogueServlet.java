package com.stock.controller;

import com.stock.model.Produit;
import com.stock.service.ProduitService;
import com.stock.service.ProduitServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "CatalogueServlet", value = "/catalogue")
public class CatalogueServlet extends HttpServlet {
    
    private ProduitService produitService;
    
    @Override
    public void init() throws ServletException {
        // Initialisation du service au démarrage de la servlet
        produitService = new ProduitServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String derniereVisite = null;
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("lastVisit".equals(cookie.getName())) {
                    // ✅ Décoder la valeur à la lecture
                    derniereVisite = URLDecoder.decode(
                        cookie.getValue(),
                        StandardCharsets.UTF_8
                    );
                }
            }
        }

        // 2. Créer le cookie avec la date actuelle ENCODÉE
        String maintenant = LocalDateTime.now()
                .format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss"));

        // ✅ Encoder avant de mettre dans le cookie
        String maintenant_encode = URLEncoder.encode(
            maintenant,
            StandardCharsets.UTF_8
        );

        Cookie lastVisit = new Cookie("lastVisit", maintenant_encode);
        lastVisit.setMaxAge(86400); // 24 heures
        response.addCookie(lastVisit);

        //  Envoyer la dernière visite à la vue
        request.setAttribute("derniereVisite", derniereVisite);

        //  Récupérer les données via le Service
        List<Produit> listeProduits = produitService.obtenirTousLesProduits();
        
        // Transmettre les données à la vue
        request.setAttribute("listeProduits", listeProduits);
        
        // Rediriger vers la JSP
        request.getRequestDispatcher("/WEB-INF/vues/catalogue.jsp").forward(request, response);
    }
}