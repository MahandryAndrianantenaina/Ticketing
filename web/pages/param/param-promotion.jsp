<%-- 
    Document   : vol-form
    Created on : 19 févr. 2025, 09:31:37
    Author     : mahan
--%>
<%@page import="param.Promotion"%>
<%@page import="siege.TypeSiege"%>
<%@page import="vol.Vol"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="avion.Avion"%>
<%@page import="ville.Ville"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="utilitaire.Utilitaires"%>
<%
    List<Vol> vols = (List<Vol>) request.getAttribute("vols");
    List<TypeSiege> sieges = (List<TypeSiege>) request.getAttribute("sieges");
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
    Promotion objet = gson.fromJson(objetJson, Promotion.class);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Insertion de promotion de vol</h3>
                <p class="text-subtitle text-muted"></p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="vol/list"></a>Accueil</li>
                        <li class="breadcrumb-item active" aria-current="page">Insertion promotion vol</li>
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
                        <h4 class="card-title">Insertion de promotion de vol</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form form-vertical" method="post" action="prominsert">
                                <div class="form-body">
                                    <div class="row">
                                        <% if (error == null || error.isEmpty()) { %>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="vol">Vol</label>
                                                    <select class="form-select" id="vol" name="idvol">
                                                        <option value="">Choisir un Vol</option>
                                                        <% for(Vol vol : vols) { %>
                                                            <option value="<%= vol.getIdvol()%>"><%= "Vol n°"+vol.getIdvol()%></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="siege">Type de siège</label>
                                                    <select class="form-select" id="siege" name="idtype">
                                                        <option value="">Choisir une Type de siège</option>
                                                        <% for(TypeSiege siege : sieges) { %>
                                                            <option value="<%= siege.getIdtype()%>"><%= siege.getNom()%></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="place-column">Nombre de place</label>
                                                    <input type="number" id="place-column" class="form-control"
                                                        name="place">
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <label for="promotion-column">Promotion</label>
                                                        <input type="number" id="arrivee-column" step="0.01" class="form-control"
                                                            name="promotion">
                                                    </div>
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
                                                    <label for="vol">Vol</label>
                                                    <% if (!error.get("idvol").isEmpty()) { %>
                                                        <select class="form-select is-invalid" id="vol" name="idvol">
                                                            <option value="">Choisir un Vol</option>
                                                            <% for(Vol vol : vols) { %>
                                                            <% if (vol.getIdvol()== objet.getIdvol()) { %>
                                                                    <option value="<%= vol.getIdvol()%>" selected><%= "Vol n°"+vol.getIdvol()%></option>
                                                                <% } else { %>
                                                                    <option value="<%= vol.getIdvol()%>"><%= "Vol n°"+vol.getIdvol()%></option>
                                                                <% } %>
                                                            <% } %>
                                                        </select>
                                                            <div class="invalid-feedback">
                                                            <% for (String errorMessage : error.get("idvol")) { %>
                                                                <i class="bx bx-radio-circle"></i>
                                                                <%= errorMessage %>
                                                            <% } %>
                                                            </div>
                                                    <% } else { %>
                                                        <select class="form-select is-valid" id="vol" name="idvol">
                                                            <option value="">Choisir un Vol</option>
                                                            <% for(Vol vol : vols) { %>
                                                            <% if (vol.getIdvol()== objet.getIdvol()) { %>
                                                                    <option value="<%= vol.getIdvol()%>" selected><%= "Vol n°"+vol.getIdvol()%></option>
                                                                <% } else { %>
                                                                    <option value="<%= vol.getIdvol()%>"><%= "Vol n°"+vol.getIdvol()%></option>
                                                                <% } %>
                                                            <% } %>
                                                        </select>
                                                    <% } %>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="siege">Type de Siège</label>
                                                    <% if (!error.get("idtype").isEmpty()) { %>
                                                        <select class="form-select is-invalid" id="siege" name="idtype">
                                                            <option value="">Choisir un Type de Siège</option>
                                                            <% for(TypeSiege siege : sieges) { %>
                                                                <% if (siege.getIdtype()== objet.getIdtype()) { %>
                                                                    <option value="<%= siege.getIdtype()%>" selected><%= siege.getNom()%></option>
                                                                <% } else { %>
                                                                    <option value="<%= siege.getIdtype()%>"><%= siege.getNom()%></option>
                                                                <% } %>
                                                            <% } %>
                                                        </select>
                                                            <div class="invalid-feedback">
                                                            <% for (String errorMessage : error.get("idtype")) { %>
                                                                <i class="bx bx-radio-circle"></i>
                                                                <%= errorMessage %>
                                                            <% } %>
                                                            </div>
                                                    <% } else { %>
                                                        <select class="form-select is-valid" id="siege" name="idtype">
                                                            <option value="">Choisir une Ville</option>
                                                            <% for(TypeSiege siege : sieges) { %>
                                                                <% if (siege.getIdtype()== objet.getIdtype()) { %>
                                                                    <option value="<%= siege.getIdtype()%>" selected><%= siege.getNom()%></option>
                                                                <% } else { %>
                                                                    <option value="<%= siege.getIdtype()%>"><%= siege.getNom()%></option>
                                                                <% } %>
                                                            <% } %>
                                                        </select>
                                                    <% } %>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="place-column">Nombre de place</label>
                                                    <% if (!error.get("place").isEmpty()) { %>
                                                        <input type="number" id="place-column" class="form-control is-invalid"
                                                               name="place" value="<%= objet.getPlace()%>">
                                                            <div class="invalid-feedback">
                                                            <% for (String errorMessage : error.get("place")) { %>
                                                                <i class="bx bx-radio-circle"></i>
                                                                <%= errorMessage %>
                                                            <% } %>
                                                            </div>
                                                    <% } else { %>
                                                        <input type="number" id="place-column" class="form-control is-valid"
                                                               name="place" value="<%= objet.getPlace()%>">
                                                    <% } %>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <label for="promotion-column">Promotion</label>
                                                        <% if (!error.get("promotion").isEmpty()) { %>
                                                            <input type="number" step="0.01" id="promotion-column" class="form-control is-invalid"
                                                                   name="promotion" value="<%= objet.getPromotion()%>">
                                                                <div class="invalid-feedback">
                                                                <% for (String errorMessage : error.get("promotion")) { %>
                                                                    <i class="bx bx-radio-circle"></i>
                                                                    <%= errorMessage %>
                                                                <% } %>
                                                                </div>
                                                        <% } else { %>
                                                            <input type="number" step="0.01" id="promotion-column" class="form-control is-valid"
                                                                   name="promotion" value="<%= objet.getPromotion()%>">
                                                        <% } %>
                                                    </div>
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
