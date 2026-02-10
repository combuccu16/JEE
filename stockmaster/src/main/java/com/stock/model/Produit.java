package com.stock.model;

public class Produit {
    private int id;
    private String nom;
    private double prix;

    // Constructeur par défaut (obligatoire pour JavaBean)
    public Produit() {
    }

    // Constructeur avec paramètres
    public Produit(int id, String nom, double prix) {
        this.id = id;
        this.nom = nom;
        this.prix = prix;
    }

    // Getters et Setters (OBLIGATOIRES pour l'EL dans JSP)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }
}