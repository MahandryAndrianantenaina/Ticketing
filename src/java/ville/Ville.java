/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ville;

import annotation.Identifiant;
import database.ClassMAPTable;

/**
 *
 * @author mahan
 */
public class Ville extends ClassMAPTable{
    @Identifiant
    int idville;
    
    int idpays;
    String nom, photos;

    public int getIdville() {
        return idville;
    }

    public void setIdville(int idville) {
        this.idville = idville;
    }

    public int getIdpays() {
        return idpays;
    }

    public void setIdpays(int idpays) {
        this.idpays = idpays;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPhotos() {
        return photos;
    }

    public void setPhotos(String photos) {
        this.photos = photos;
    }
    
    public static String getName(int idobjet) throws Exception{
        Ville classe = new Ville();
        classe = (Ville) classe.getById(idobjet);
        return classe.getNom();
    }
}
