<%-- 
    Document   : vol-form
    Created on : 19 févr. 2025, 09:31:37
    Author     : mahan
--%>
<%@page import="vol.Vol"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="avion.Avion"%>
<%@page import="ville.Ville"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="utilitaire.Utilitaires"%>
<%
    List<Avion> avions = (List<Avion>) request.getAttribute("avions");
    List<Ville> villes = (List<Ville>) request.getAttribute("villes");
    Cookie[] cookies = request.getCookies();
    String errorJson = null;
    String objetJson = null;
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("errorData".equals(c.getName())) {
                errorJson = URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if ("objetData".equals(c.getName())) {
                objetJson = URLDecoder.decode(c.getValue(), "UTF-8");
            }
        }
    }

    Gson gson = new Gson();
    HashMap<String, List<String>> error = gson.fromJson(errorJson, HashMap.class);
    Vol objet = gson.fromJson(objetJson, Vol.class);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Insertion des vols</h3>
                <p class="text-subtitle text-muted"></p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="vol/list"></a>Accueil</li>
                        <li class="breadcrumb-item active" aria-current="page">Insertion vol</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class="page-content">
    <section id="basic-vertical-layouts">
        <div class="row match-height">
            <div class="col-md-6 col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Insertion de vol</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form form-vertical" method="post" action="insert">
                                <div class="form-body">
                                    <div class="row">
                                        <% if (error == null || error.isEmpty()) { %>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="avion">Avion</label>
                                                    <select class="form-select" id="avion" name="idavion">
                                                        <option value="">Choisir un Avion</option>
                                                        <% for(Avion avion : avions) { %>
                                                            <option value="<%= avion.getIdavion()%>"><%= avion.getNom()%></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="avion">Ville</label>
                                                    <select class="form-select" id="ville" name="idville">
                                                        <option value="">Choisir une Ville</option>
                                                        <% for(Ville ville : villes) { %>
                                                            <option value="<%= ville.getIdville()%>"><%= ville.getNom()%></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="depart-column">Départ</label>
                                                    <input type="datetime-local" id="depart-column" class="form-control"
                                                        name="depart">
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <label for="arrivee-column">Arrivée</label>
                                                        <input type="datetime-local" id="arrivee-column" class="form-control"
                                                            name="arrivee">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="prix">Prix</label>
                                                    <input type="number" id="prix" class="form-control"
                                                        name="prix" placeholder="Prix">
                                                </div>
                                            </div>
                                            <p></p>
                                            <div class="col-12 d-flex justify-content-end">
                                                <button type="reset"
                                                    class="btn btn-light-secondary me-1 mb-1">Réinitialiser</button>
                                                <button type="submit"
                                                    class="btn btn-primary me-1 mb-1">Insérer</button>

                                            </div>
                                        <% } else { %>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="avion">Avion</label>
                                                    <% if (!error.get("idavion").isEmpty()) { %>
                                                        <select class="form-select is-invalid" id="avion" name="idavion">
                                                            <option value="">Choisir un Avion</option>
                                                            <% for(Avion avion : avions) { %>
                                                                <% if (avion.getIdavion() == objet.getIdavion()) { %>
                                                                    <option value="<%= avion.getIdavion()%>" selected><%= avion.getNom()%></option>
                                                                <% } else { %>
                                                                    <option value="<%= avion.getIdavion()%>"><%= avion.getNom()%></option>
                                                                <% } %>
                                                            <% } %>
                                                        </select>
                                                            <div class="invalid-feedback">
                                                            <% for (String errorMessage : error.get("idavion")) { %>
                                                                <i class="bx bx-radio-circle"></i>
                                                                <%= errorMessage %>
                                                            <% } %>
                                                            </div>
                                                    <% } else { %>
                                                        <select class="form-select is-valid" id="avion" name="idavion">
                                                            <option value="">Choisir un Avion</option>
                                                            <% for(Avion avion : avions) { %>
                                                                <% if (avion.getIdavion() == objet.getIdavion()) { %>
                                                                    <option value="<%= avion.getIdavion()%>" selected><%= avion.getNom()%></option>
                                                                <% } else { %>
                                                                    <option value="<%= avion.getIdavion()%>"><%= avion.getNom()%></option>
                                                                <% } %>
                                                            <% } %>
                                                        </select>
                                                    <% } %>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="avion">Ville</label>
                                                    <% if (!error.get("idville").isEmpty()) { %>
                                                        <select class="form-select is-invalid" id="ville" name="idville">
                                                            <option value="">Choisir une Ville</option>
                                                            <% for(Ville ville : villes) { %>
                                                                <% if (ville.getIdville()== objet.getIdville()) { %>
                                                                    <option value="<%= ville.getIdville()%>" selected><%= ville.getNom()%></option>
                                                                <% } else { %>
                                                                    <option value="<%= ville.getIdville()%>"><%= ville.getNom()%></option>
                                                                <% } %>
                                                            <% } %>
                                                        </select>
                                                            <div class="invalid-feedback">
                                                            <% for (String errorMessage : error.get("idville")) { %>
                                                                <i class="bx bx-radio-circle"></i>
                                                                <%= errorMessage %>
                                                            <% } %>
                                                            </div>
                                                    <% } else { %>
                                                        <select class="form-select is-valid" id="avion" name="idavion">
                                                            <option value="">Choisir une Ville</option>
                                                            <% for(Ville ville : villes) { %>
                                                                <% if (ville.getIdville()== objet.getIdville()) { %>
                                                                    <option value="<%= ville.getIdville()%>" selected><%= ville.getNom()%></option>
                                                                <% } else { %>
                                                                    <option value="<%= ville.getIdville()%>"><%= ville.getNom()%></option>
                                                                <% } %>
                                                            <% } %>
                                                        </select>
                                                    <% } %>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="depart-column">Départ</label>
                                                    <% if (!error.get("depart").isEmpty()) { %>
                                                        <input type="datetime-local" id="depart-column" class="form-control is-invalid"
                                                               name="depart" value="<%= objet.getDepart() %>">
                                                            <div class="invalid-feedback">
                                                            <% for (String errorMessage : error.get("depart")) { %>
                                                                <i class="bx bx-radio-circle"></i>
                                                                <%= errorMessage %>
                                                            <% } %>
                                                            </div>
                                                    <% } else { %>
                                                        <input type="datetime-local" id="depart-column" class="form-control is-valid"
                                                               name="depart" value="<%= objet.getDepart() %>">
                                                    <% } %>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <label for="arrivee-column">Arrivée</label>
                                                        <% if (!error.get("arrivee").isEmpty()) { %>
                                                            <input type="datetime-local" id="depart-column" class="form-control is-invalid"
                                                                   name="arrivee" value="<%= objet.getArrivee()%>">
                                                                <div class="invalid-feedback">
                                                                <% for (String errorMessage : error.get("arrivee")) { %>
                                                                    <i class="bx bx-radio-circle"></i>
                                                                    <%= errorMessage %>
                                                                <% } %>
                                                                </div>
                                                        <% } else { %>
                                                            <input type="datetime-local" id="depart-column" class="form-control is-valid"
                                                                   name="arrivee" value="<%= objet.getArrivee() %>">
                                                        <% } %>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="prix">Prix</label>
                                                        <% if (!error.get("prix").isEmpty()) { %>
                                                            <input type="number" id="prix" class="form-control is-invalid"
                                                                   name="prix" placeholder="Prix" value="<%= objet.getPrix() %>">
                                                            <% for (String errorMessage : error.get("prix")) { %>
                                                                <div class="invalid-feedback">
                                                                    <i class="bx bx-radio-circle"></i>
                                                                    <%= errorMessage %>
                                                                </div>
                                                            <% } %>
                                                        <% } else { %>
                                                            <input type="number" id="prix" class="form-control is-valid"
                                                                   name="prix" placeholder="Prix" value="<%= objet.getPrix() %>">
                                                        <% } %>
                                                </div>
                                            </div>
                                            <p></p>
                                            <div class="col-12 d-flex justify-content-end">
                                                <button type="reset"
                                                    class="btn btn-light-secondary me-1 mb-1">Réinitialiser</button>
                                                <button type="submit"
                                                    class="btn btn-primary me-1 mb-1">Insérer</button>

                                            </div>
                                        <% } %>
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
