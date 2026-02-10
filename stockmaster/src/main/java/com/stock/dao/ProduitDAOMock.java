package com.stock.dao;

import com.stock.model.Produit;
import java.util.ArrayList;
import java.util.List;

public class ProduitDAOMock implements ProduitDAO {
    
    // Simule une "base de données" en mémoire
    private static List<Produit> produits = new ArrayList<>();
    
    static {
        // Initialisation des données "en dur"
        produits.add(new Produit(1, "Clavier Mécanique", 85.99));
        produits.add(new Produit(2, "Souris Gaming", 45.50));
        produits.add(new Produit(3, "Écran 27 pouces", 299.00));
        produits.add(new Produit(4, "Webcam HD", 65.00));
    }

    @Override
    public List<Produit> findAll() {
        return new ArrayList<>(produits); // Retourne une copie
    }

    @Override
    public Produit findById(int id) {
        return produits.stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .orElse(null);
    }

    @Override
    public void save(Produit produit) {
        produits.add(produit);
    }

    @Override
    public void update(Produit produit) {
        for (int i = 0; i < produits.size(); i++) {
            if (produits.get(i).getId() == produit.getId()) {
                produits.set(i, produit);
                break;
            }
        }
    }

    @Override
    public void delete(int id) {
        produits.removeIf(p -> p.getId() == id);
    }
}