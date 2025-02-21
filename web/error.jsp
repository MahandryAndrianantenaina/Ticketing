<%-- 
    Document   : error.jsp
    Created on : 19 févr. 2025, 06:24:21
    Author     : mahan
--%>
<%@page import="mg.itu.error.ErrorHandler"%>
<%
    ErrorHandler ex = (ErrorHandler) request.getAttribute("exception");
    String previous = request.getAttribute("previous") != null ? (String) request.getAttribute("previous") : "/Ticketing";
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= ex.getCode()%> Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/app.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/pages/error.css">
</head>

<body>
    <div id="error">
        <div class="error-page container">
            <div class="col-md-8 col-12 offset-md-2">
                <div class="text-center">
                    <h1 class="error-title"><%= ex.getTitre()%></h1>
                    <p class="fs-5 text-black-600"><%= ex.getException().getMessage()%></p>
                    <p>
                        <pre><% ex.getException().printStackTrace(new java.io.PrintWriter(out));%></pre>
                    </p>
                    <a href="<%= previous%>" class="btn btn-lg btn-outline-primary mt-3">Retour</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>