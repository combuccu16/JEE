package com.stock.service;

import com.stock.dao.ProduitDAO;
import com.stock.dao.ProduitDAOMock;
import com.stock.model.Produit;
import java.util.List;

public class ProduitServiceImpl implements ProduitService {
    
    // Injection manuelle du DAO (pour l'instant)
    private ProduitDAO produitDAO;
    
    public ProduitServiceImpl() {
        this.produitDAO = new ProduitDAOMock(); // Utilise le Mock
    }

    @Override
    public List<Produit> obtenirTousLesProduits() {
        // Logique métier (ici simple, mais pourrait inclure des règles)
        return produitDAO.findAll();
    }

    @Override
    public Produit obtenirProduitParId(int id) {
        return produitDAO.findById(id);
    }

    @Override
    public void ajouterProduit(Produit produit) {
        // On pourrait ajouter des validations ici
        if (produit.getPrix() < 0) {
            throw new IllegalArgumentException("Le prix ne peut pas être négatif");
        }
        produitDAO.save(produit);
    }

    @Override
    public void modifierProduit(Produit produit) {
        produitDAO.update(produit);
    }

    @Override
    public void supprimerProduit(int id) {
        produitDAO.delete(id);
    }
}