/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package user;

import annotation.*;
import database.ClassMAPTable;
import java.util.List;

/**
 *
 * @author mahan
 */
@Table("Utilisateur")
public class Utilisateur extends ClassMAPTable{
   @Identifiant
   int idutilisateur;
   String nom, prenom, email, mdp, telephone;
   int idtype;

    public int getIdutilisateur() {
        return idutilisateur;
    }

    public void setIdutilisateur(int idutilisateur) {
        this.idutilisateur = idutilisateur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public int getIdtype() {
        return idtype;
    }

    public void setIdtype(int idtype) {
        this.idtype = idtype;
    }

    public Utilisateur() {
    }

    public Utilisateur(String email, String mdp) {
        this.email = email;
        this.mdp = mdp;
    }
   
    public Utilisateur checkLogin() throws Exception {
        StringBuilder query = new StringBuilder(String.format("select * from Utilisateur where email = '%s' ", getEmail()));
        List<ClassMAPTable> results = this.getByRequest(query.toString());
        List<Utilisateur> utilisateurs = results.stream()
        .map(obj -> (Utilisateur) obj) 
        .toList();
        if (utilisateurs.isEmpty()) {
            throw new Exception("Email incorrect.");
        }
        query.append(String.format(" and mdp = '%s'", getMdp()));
        results = this.getByRequest(query.toString());
        utilisateurs = results.stream()
        .map(obj -> (Utilisateur) obj) 
        .toList();
        if (utilisateurs.isEmpty()) {
            throw new Exception("Mot de passe incorrect.");
        }
        return utilisateurs.get(0);
    }
   
}
