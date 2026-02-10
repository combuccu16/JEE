package com.stock.dao;

import com.stock.model.Produit;
import java.util.List;

public interface ProduitDAO {
    List<Produit> findAll();
    Produit findById(int id);
    void save(Produit produit);
    void update(Produit produit);
    void delete(int id);
}