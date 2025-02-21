/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package avion;

import annotation.Identifiant;
import database.ClassMAPTable;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author mahan
 */
public class Avion extends ClassMAPTable {
    @Identifiant
    int idavion;
    
    int idmodele;
    String nom;
    Date fabrication;

    public int getIdavion() {
        return idavion;
    }

    public void setIdavion(int idavion) {
        this.idavion = idavion;
    }

    public int getIdmodele() {
        return idmodele;
    }

    public void setIdmodele(int idmodele) {
        this.idmodele = idmodele;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Date getFabrication() {
        return fabrication;
    }

    public void setFabrication(Date fabrication) {
        this.fabrication = fabrication;
    }
    
    public static String getName(int idobjet) throws Exception{
        Avion classe = new Avion();
        classe = classe.getById(idobjet);
        return classe.getNom();
    }
}
