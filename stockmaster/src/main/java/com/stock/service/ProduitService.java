package com.stock.service;

import com.stock.model.Produit;
import java.util.List;

public interface ProduitService {
    List<Produit> obtenirTousLesProduits();
    Produit obtenirProduitParId(int id);
    void ajouterProduit(Produit produit);
    void modifierProduit(Produit produit);
    void supprimerProduit(int id);
}