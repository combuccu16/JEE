<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>StockMaster Pro — Catalogue</title>
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet"/>
    <style>
        *, *::before, *::after {
            margin: 0; padding: 0; box-sizing: border-box;
        }

        :root {
            --bg:       #0a0e1a;
            --panel:    #111827;
            --panel2:   #0d1626;
            --border:   #1e2d45;
            --accent:   #00d4ff;
            --accent2:  #0066ff;
            --success:  #00e5a0;
            --text:     #e2e8f0;
            --muted:    #64748b;
        }

        body {
            background-color: var(--bg);
            font-family: 'DM Sans', sans-serif;
            color: var(--text);
            min-height: 100vh;
            padding: 40px 20px;
            overflow-x: hidden;
        }

        /* ── Animated background grid ── */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                linear-gradient(var(--border) 1px, transparent 1px),
                linear-gradient(90deg, var(--border) 1px, transparent 1px);
            background-size: 50px 50px;
            opacity: 0.3;
            animation: gridMove 20s linear infinite;
            z-index: 0;
        }

        @keyframes gridMove {
            0%   { background-position: 0 0; }
            100% { background-position: 50px 50px; }
        }

        /* ── Glow orbs ── */
        .orb {
            position: fixed;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.12;
            pointer-events: none;
            z-index: 0;
        }
        .orb-1 {
            width: 500px; height: 500px;
            background: var(--accent2);
            top: -150px; left: -150px;
            animation: float1 8s ease-in-out infinite;
        }
        .orb-2 {
            width: 400px; height: 400px;
            background: var(--accent);
            bottom: -100px; right: -100px;
            animation: float2 10s ease-in-out infinite;
        }

        @keyframes float1 {
            0%, 100% { transform: translate(0, 0); }
            50%       { transform: translate(40px, 30px); }
        }
        @keyframes float2 {
            0%, 100% { transform: translate(0, 0); }
            50%       { transform: translate(-30px, -40px); }
        }

        /* ── Main container ── */
        .container {
            position: relative;
            z-index: 10;
            max-width: 1100px;
            margin: 0 auto;
            animation: slideUp 0.6s cubic-bezier(0.16,1,0.3,1) both;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        /* ── Header ── */
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 32px;
            padding-bottom: 24px;
            border-bottom: 1px solid var(--border);
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .brand-icon {
            width: 44px; height: 44px;
            background: linear-gradient(135deg, var(--accent2), var(--accent));
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            box-shadow: 0 0 20px rgba(0,212,255,0.3);
        }

        .brand-text .name {
            font-family: 'Syne', sans-serif;
            font-size: 18px;
            font-weight: 800;
            color: var(--text);
            line-height: 1;
            letter-spacing: -0.5px;
        }

        .brand-text .sub {
            font-size: 11px;
            color: var(--muted);
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-top: 2px;
        }

        /* ── Info cards ── */
        .info-bar {
            display: flex;
            gap: 16px;
            margin-bottom: 32px;
            flex-wrap: wrap;
        }

        .info-card {
            background: var(--panel);
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 14px 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 13px;
            color: var(--muted);
            flex: 1;
            min-width: 200px;
        }

        .info-card .icon {
            font-size: 18px;
        }

        .info-card strong {
            color: var(--accent);
            font-weight: 600;
        }

        /* ── Table card ── */
        .table-card {
            background: var(--panel);
            border: 1px solid var(--border);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 25px 60px rgba(0,0,0,0.4);
        }

        /* Top accent line */
        .table-card::before {
            content: '';
            display: block;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--accent), var(--accent2), transparent);
        }

        .table-header {
            padding: 20px 24px;
            border-bottom: 1px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .table-header h1 {
            font-family: 'Syne', sans-serif;
            font-size: 18px;
            font-weight: 700;
            color: var(--text);
            letter-spacing: -0.3px;
        }

        .badge {
            background: rgba(0,212,255,0.1);
            border: 1px solid rgba(0,212,255,0.2);
            color: var(--accent);
            font-size: 12px;
            font-weight: 600;
            padding: 4px 12px;
            border-radius: 20px;
            font-family: 'Syne', sans-serif;
        }

        /* ── Table ── */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead tr {
            background: var(--panel2);
        }

        th {
            padding: 14px 24px;
            text-align: left;
            font-size: 11px;
            font-weight: 600;
            color: var(--muted);
            text-transform: uppercase;
            letter-spacing: 1.2px;
            font-family: 'Syne', sans-serif;
        }

        td {
            padding: 16px 24px;
            font-size: 14px;
            color: var(--text);
            border-bottom: 1px solid var(--border);
        }

        tbody tr {
            transition: background 0.15s;
        }

        tbody tr:hover {
            background: rgba(0,212,255,0.03);
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        /* ID column */
        td:first-child {
            font-family: 'Syne', sans-serif;
            font-size: 13px;
            color: var(--muted);
            font-weight: 600;
        }

        /* Prix column */
        .prix-badge {
            background: rgba(0,229,160,0.1);
            border: 1px solid rgba(0,229,160,0.2);
            color: var(--success);
            padding: 4px 10px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            font-family: 'Syne', sans-serif;
        }

        /* ── Footer ── */
        .table-footer {
            padding: 16px 24px;
            border-top: 1px solid var(--border);
            font-size: 12px;
            color: var(--muted);
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .table-footer span {
            color: var(--accent);
            font-weight: 600;
        }

        /* ── Logout button ── */
        .btn-logout {
            background: rgba(255,77,109,0.1);
            border: 1px solid rgba(255,77,109,0.3);
            color: #ff4d6d;
            padding: 8px 18px;
            border-radius: 8px;
            font-family: 'Syne', sans-serif;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.2s;
        }

        .btn-logout:hover {
            background: rgba(255,77,109,0.2);
        }
    </style>
</head>
<body>

    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>

    <div class="container">

        <!-- Header -->
        <div class="header">
            <div class="brand">
                <div class="brand-icon">📦</div>
                <div class="brand-text">
                    <div class="name">StockMaster Pro</div>
                    <div class="sub">Gestion de stock</div>
                </div>
            </div>
            <a href="login.jsp" class="btn-logout">⎋ Déconnexion</a>
        </div>

        <!-- Info bar -->
        <div class="info-bar">

            <!-- Utilisateur connecté -->
            <div class="info-card">
                <span class="icon">👤</span>
                Connecté en tant que : <strong>${sessionScope.user}</strong>
            </div>

            <!-- Dernière visite -->
            <div class="info-card">
                <span class="icon">🕐</span>
                <c:choose>
                    <c:when test="${derniereVisite != null}">
                        Dernière visite : <strong>${derniereVisite}</strong>
                    </c:when>
                    <c:otherwise>
                        <strong>Première visite !</strong>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>

        <!-- Table card -->
        <div class="table-card">

            <div class="table-header">
                <h1>Catalogue des Produits</h1>
                <span class="badge">${listeProduits.size()} produits</span>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom du Produit</th>
                        <th>Prix</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="produit" items="${listeProduits}">
                        <tr>
                            <td>#${produit.id}</td>
                            <td>${produit.nom}</td>
                            <td>
                                <span class="prix-badge">${produit.prix} €</span>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="table-footer">
                Total : <span>${listeProduits.size()}</span> produits en catalogue
            </div>

        </div>

    </div>

</body>
</html>