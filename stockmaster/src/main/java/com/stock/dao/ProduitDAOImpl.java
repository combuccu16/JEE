package com.stock.dao;

import com.stock.model.Produit;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProduitDAOImpl implements ProduitDAO {

    private static final String URL      = "jdbc:mysql://localhost:3306/stockmaster";
    private static final String USER     = "root";
    private static final String PASSWORD = "123456";

    // Connexion privée réutilisable
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // ── 1. Lire tous les produits ──────────────────────────
    @Override
    public List<Produit> findAll() {
        List<Produit> liste = new ArrayList<>();
        String sql = "SELECT id, nom, prix FROM produits";

        try (Connection con       = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs         = ps.executeQuery()) {

            while (rs.next()) {
                liste.add(new Produit(
                    rs.getInt("id"),
                    rs.getString("nom"),
                    rs.getDouble("prix")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return liste;
    }

    // ── 2. Lire un seul produit par ID ────────────────────
    @Override
    public Produit findById(int id) {
        Produit produit = null;
        String sql = "SELECT id, nom, prix FROM produits WHERE id = ?";

        try (Connection con       = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);  // remplace le ? par l'id

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    produit = new Produit(
                        rs.getInt("id"),
                        rs.getString("nom"),
                        rs.getDouble("prix")
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produit;
    }

    // ── 3. Ajouter un produit ─────────────────────────────
    @Override
    public void save(Produit produit) {
        String sql = "INSERT INTO produits (nom, prix) VALUES (?, ?)";

        try (Connection con       = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, produit.getNom());
            ps.setDouble(2, produit.getPrix());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ── 4. Modifier un produit ────────────────────────────
    @Override
    public void update(Produit produit) {
        String sql = "UPDATE produits SET nom = ?, prix = ? WHERE id = ?";

        try (Connection con       = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, produit.getNom());
            ps.setDouble(2, produit.getPrix());
            ps.setInt(3,    produit.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ── 5. Supprimer un produit ───────────────────────────
    @Override
    public void delete(int id) {
        String sql = "DELETE FROM produits WHERE id = ?";

        try (Connection con       = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}