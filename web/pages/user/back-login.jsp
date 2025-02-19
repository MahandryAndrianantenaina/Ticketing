<%-- 
    Document   : back-login
    Created on : 17 févr. 2025, 17:20:14
    Author     : mahan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/pages/auth.css">
</head>

<body>
    <div id="auth">

        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div class="card">
                    <div id="auth-left">
                        <div class="card-header">
                            
                            <div class="auth-logo">
                                <a href="index.html"><img src="assets/images/logo/logo.png" alt="Logo"></a>
                            </div>
                            <h1 class="auth-title">Login</h1>
                            <p class="auth-subtitle mb-5">Connectez-vous en tant qu'administrateur</p>
        
                        </div>
                        <form action="user/back/login">
                            <div class="form-group position-relative has-icon-left mb-4">
                                <input type="text" class="form-control form-control-xl" placeholder="Email" name="email">
                                <div class="form-control-icon">
                                    <i class="bi bi-person"></i>
                                </div>
                            </div>
                            <div class="form-group position-relative has-icon-left mb-4">
                                <input type="password" class="form-control form-control-xl" placeholder="Password" name="mdp">
                                <div class="form-control-icon">
                                    <i class="bi bi-shield-lock"></i>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Se connecter</button>
                        </form>
                        <!--<div class="text-center mt-5 text-lg fs-4">
                            <p class="text-gray-600">Pas encore de compte? <a href="auth-register.html"class="font-bold">S'inscrire</a>.</p>
                        </div>-->
                    </div>
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right">

                </div>
            </div>
        </div>

    </div>
</body>

</html>
