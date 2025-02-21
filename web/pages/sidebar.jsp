<%-- 
    Document   : sidebar
    Created on : 19 févr. 2025, 08:17:43
    Author     : mahan
--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="mg.itu.error.ErrorHandler"%>
<%@page import="jakarta.servlet.RequestDispatcher"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String importation = (String) request.getAttribute("import");
%>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Traveler</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.css">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendors/sweetalert2/sweetalert2.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendors/simple-datatables/style.css">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/app.css">
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/images/favicon.svg" type="image/x-icon" sizes="48X48">
</head>

<body>
    <div id="app">
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="<%= request.getContextPath() %>/vol/list"><img src="<%= request.getContextPath() %>/assets/images/logo/logo.png" alt="Logo" srcset=""></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">Administrateur</li>

                        <li class="sidebar-item active ">
                            <a href="<%= request.getContextPath() %>/vol/list" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Accueil</span>
                            </a>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>Vol</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="<%= request.getContextPath() %>/vol/insertion">Insertion</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="<%= request.getContextPath() %>/vol/list">Liste</a>
                                </li>
                            </ul>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-collection-fill"></i>
                                <span>Paramètre</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="<%= request.getContextPath() %>/param/prom">Promotion</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="<%= request.getContextPath() %>/param/reserv">Réservation</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="<%= request.getContextPath() %>/param/cancel">Annulation</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <header class="mb-3">
                    <a href="#" class="burger-btn d-block d-xl-none">
                        <i class="bi bi-justify fs-3"></i>
                    </a>
                </header>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
        <div id="main">
            <% try { %>
                <jsp:include page="<%=importation %>" />
            <% } catch (Exception e) {
                    response.setContentType("text/html");
                    StringWriter sw = new StringWriter();
                    e.printStackTrace(new PrintWriter(sw));
                    String stackTrace = sw.toString();

                    PrintWriter sout = response.getWriter();
                    sout.println("<h2>Une erreur est survenue</h2>");
                    sout.println("<pre>" + stackTrace + "</pre>");
                    sout.println("</body></html>");
                } %>
            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-start">
                        <p>2025 &copy; Traveler</p>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="<%= request.getContextPath() %>/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>

    <script src="<%= request.getContextPath() %>/assets/js/extensions/sweetalert2.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendors/sweetalert2/sweetalert2.all.min.js"></script>

    <script src="<%= request.getContextPath() %>/assets/vendors/simple-datatables/simple-datatables.js"></script>
    <script>
        let table1 = document.querySelector('#table1');
        let dataTable = new simpleDatatables.DataTable(table1);
    </script>

    <script src="<%= request.getContextPath() %>/assets/js/main.js"></script>
</body>

</html>
