<%-- 
    Document   : vol-list
    Created on : 19 févr. 2025, 08:16:45
    Author     : mahan
--%>
<%@page import="java.util.List"%>
<%@page import="vol.Vol"%>
<%@page import="avion.Avion"%>
<%@page import="ville.Ville"%>
<%@page import="utilitaire.Utilitaires"%>
<%
    List<Vol> vols = (List<Vol>) request.getAttribute("liste");
    List<Avion> avions = (List<Avion>) request.getAttribute("avions");
    List<Ville> villes = (List<Ville>) request.getAttribute("villes");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Liste des vols</h3>
                <p class="text-subtitle text-muted"></p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="vol/list"></a>Accueil</li>
                        <li class="breadcrumb-item active" aria-current="page">Liste vol</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class="page-content">
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Recherche Multicritère</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form" method="post" action="find">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="avion">Avion</label>
                                            <select class="form-select" id="avion" name="idavion">
                                                <option value="0">Choisir un Avion</option>
                                                <% for(Avion avion : avions) { %>
                                                    <option value="<%= avion.getIdavion()%>"><%= avion.getNom()%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="ville">Ville</label>
                                            <select class="form-select" id="ville" name="idville">
                                                <option value="0">Choisir une Ville</option>
                                                <% for(Ville ville : villes) { %>
                                                    <option value="<%= ville.getIdville()%>"><%= ville.getNom()%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="depart-column">Départ</label>
                                            <input type="datetime-local" id="depart-column" class="form-control"
                                                name="depart">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label for="arrivee-column">Arrivée</label>
                                                <input type="datetime-local" id="arrivee-column" class="form-control"
                                                    name="arrivee">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="prix-min-column">Prix min</label>
                                            <input type="number" id="prix-min-column" class="form-control"
                                                name="min" placeholder="Prix minimum">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">   
                                        <div class="form-group">
                                            <label for="prix-max-column">Prix max</label>
                                            <input type="number" id="prix-max-column" class="form-control"
                                                name="max" placeholder="Prix maximum">
                                        </div>
                                    </div>
                                    <div class="col-12 d-flex justify-content-end">
                                        <button type="reset"
                                            class="btn btn-light-secondary me-1 mb-1">Réinitialiser</button>
                                        <button type="submit"
                                            class="btn btn-primary me-1 mb-1">Rechercher</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<section class="section">
    <div class="card">
        <div class="card-header">
            Liste des vols disponibles
        </div>
        <div class="card-body">
            <table class="table table-striped" id="table1">
                <thead>
                    <tr>
                        <th>Avion</th>
                        <th>Ville</th>
                        <th>Départ</th>
                        <th>Arrivée</th>
                        <th>Prix</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Vol vol : vols) { %>
                        <tr>
                            <td><%= Avion.getName(vol.getIdavion()) %></td>
                            <td><%= Ville.getName(vol.getIdville()) %></td>
                            <td><%= Utilitaires.convertDateTimeFormat(vol.getDepart())%></td>
                            <td><%= Utilitaires.convertDateTimeFormat(vol.getArrivee())%></td>
                            <td><%= Utilitaires.formatDouble(vol.getPrix()) %></td>
                            <td>
                                <div class="d-flex justify-content-start">
                                    <a href="maj?idvol=<%= vol.getIdvol()%>" class="btn btn-warning me-1 mb-1">
                                        <i class="bi bi-pencil-square"></i>
                                    </a> 
                                    <a href="delete?idvol=<%= vol.getIdvol()%>" class="btn btn-danger me-1 mb-1">
                                        <i class="bi bi-trash-fill  me-1 mb-1"></i>
                                    </a>
                                    <!--<a href="infos?idvol=<%= vol.getIdvol()%>" class="btn btn-info me-1 mb-1">
                                        <i class="bi bi-info-circle-fill"></i>
                                    </a> -->
                                </div>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

</section>
