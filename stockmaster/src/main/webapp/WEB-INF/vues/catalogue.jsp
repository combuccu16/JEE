<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Catalogue - StockMaster Pro</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <h1>📦 Catalogue des Produits - StockMaster Pro</h1>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom du Produit</th>
                <th>Prix (€)</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="produit" items="${listeProduits}">
                <tr>
                    <td>${produit.id}</td>
                    <td>${produit.nom}</td>
                    <td>${produit.prix} €</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <p><em>Nombre de produits : ${listeProduits.size()}</em></p>
</body>
</html>