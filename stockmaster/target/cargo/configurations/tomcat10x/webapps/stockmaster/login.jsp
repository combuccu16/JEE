<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>StockMaster Pro — Connexion</title>
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet"/>
    <style>
        *, *::before, *::after {
            margin: 0; padding: 0; box-sizing: border-box;
        }

        :root {
            --bg:       #0a0e1a;
            --panel:    #111827;
            --border:   #1e2d45;
            --accent:   #00d4ff;
            --accent2:  #0066ff;
            --danger:   #ff4d6d;
            --text:     #e2e8f0;
            --muted:    #64748b;
            --input-bg: #0d1626;
        }

        body {
            background-color: var(--bg);
            font-family: 'DM Sans', sans-serif;
            color: var(--text);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                linear-gradient(var(--border) 1px, transparent 1px),
                linear-gradient(90deg, var(--border) 1px, transparent 1px);
            background-size: 50px 50px;
            opacity: 0.4;
            animation: gridMove 20s linear infinite;
        }

        @keyframes gridMove {
            0%   { background-position: 0 0; }
            100% { background-position: 50px 50px; }
        }

        .orb {
            position: fixed;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.15;
            pointer-events: none;
        }
        .orb-1 {
            width: 400px; height: 400px;
            background: var(--accent2);
            top: -100px; left: -100px;
            animation: float1 8s ease-in-out infinite;
        }
        .orb-2 {
            width: 300px; height: 300px;
            background: var(--accent);
            bottom: -80px; right: -80px;
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

        .card {
            position: relative;
            z-index: 10;
            background: var(--panel);
            border: 1px solid var(--border);
            border-radius: 20px;
            width: 420px;
            padding: 48px 40px;
            box-shadow:
                0 0 0 1px rgba(0,212,255,0.05),
                0 25px 60px rgba(0,0,0,0.5);
            animation: slideUp 0.6s cubic-bezier(0.16,1,0.3,1) both;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0; left: 40px; right: 40px;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--accent), var(--accent2), transparent);
            border-radius: 0 0 4px 4px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 36px;
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
            font-weight: 400;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-top: 2px;
        }

        h1 {
            font-family: 'Syne', sans-serif;
            font-size: 26px;
            font-weight: 700;
            color: var(--text);
            letter-spacing: -0.5px;
            margin-bottom: 6px;
        }

        .subtitle {
            font-size: 14px;
            color: var(--muted);
            margin-bottom: 32px;
        }

        .error-box {
            background: rgba(255,77,109,0.1);
            border: 1px solid rgba(255,77,109,0.3);
            border-radius: 10px;
            padding: 12px 16px;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 13px;
            color: var(--danger);
            animation: shake 0.4s ease;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25%       { transform: translateX(-6px); }
            75%       { transform: translateX(6px); }
        }

        .error-box::before {
            content: '⚠';
            font-size: 15px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 12px;
            font-weight: 500;
            color: var(--muted);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--muted);
            font-size: 16px;
            pointer-events: none;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            background: var(--input-bg);
            border: 1px solid var(--border);
            border-radius: 10px;
            padding: 13px 14px 13px 42px;
            font-family: 'DM Sans', sans-serif;
            font-size: 14px;
            color: var(--text);
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 3px rgba(0,212,255,0.1);
        }

        input::placeholder {
            color: var(--muted);
            opacity: 0.6;
        }

        .btn-login {
            width: 100%;
            padding: 14px;
            margin-top: 8px;
            background: linear-gradient(135deg, var(--accent2), var(--accent));
            border: none;
            border-radius: 10px;
            font-family: 'Syne', sans-serif;
            font-size: 15px;
            font-weight: 700;
            color: #fff;
            cursor: pointer;
            letter-spacing: 0.5px;
            position: relative;
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
            box-shadow: 0 4px 20px rgba(0,102,255,0.35);
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(0,102,255,0.5);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .hint {
            margin-top: 24px;
            text-align: center;
            font-size: 12px;
            color: var(--muted);
        }

        .hint span {
            color: var(--accent);
            font-weight: 500;
        }
    </style>
</head>
<body>

    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>

    <div class="card">

        <div class="brand">
            <div class="brand-icon">📦</div>
            <div class="brand-text">
                <div class="name">StockMaster Pro</div>
                <div class="sub">Gestion de stock</div>
            </div>
        </div>

        <h1>Connexion</h1>
        <p class="subtitle">Accédez à votre espace de gestion</p>

       <%-- Message d'erreur venant du filtre (paramètre URL) --%>
       <% if ("non_connecte".equals(request.getParameter("erreur"))) { %>
        <p style="color:red;">
            ⚠ Vous devez être connecté pour accéder à cette page !
        </p>
       <% } %>

        <% if (request.getAttribute("erreur") != null) { %>
        <div class="error-box">
            ${requestScope.erreur}
        </div>
        <% } %>

        <form action="connexion" method="post">

            <div class="form-group">
                <label for="login">Identifiant</label>
                <div class="input-wrapper">
                    <input type="text"
                           id="login"
                           name="login"
                           placeholder="Entrez votre identifiant"
                           required />
                    <span class="input-icon">👤</span>
                </div>
            </div>

            <div class="form-group">
                <label for="password">Mot de passe</label>
                <div class="input-wrapper">
                    <input type="password"
                           id="password"
                           name="password"
                           placeholder="Entrez votre mot de passe"
                           required />
                    <span class="input-icon">🔒</span>
                </div>
            </div>

            <button type="submit" class="btn-login">
                Se connecter →
            </button>

        </form>

        

    </div>

</body>
</html>

