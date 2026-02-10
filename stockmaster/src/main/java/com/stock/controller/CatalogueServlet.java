package com.stock.controller;

import com.stock.model.Produit;
import com.stock.service.ProduitService;
import com.stock.service.ProduitServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
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
        
        // 1. Récupérer les données via le Service
        List<Produit> listeProduits = produitService.obtenirTousLesProduits();
        
        // 2. Transmettre les données à la vue
        request.setAttribute("listeProduits", listeProduits);
        
        // 3. Rediriger vers la JSP
        request.getRequestDispatcher("/WEB-INF/vues/catalogue.jsp").forward(request, response);
    }
}