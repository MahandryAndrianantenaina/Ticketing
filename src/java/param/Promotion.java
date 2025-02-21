/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package param;

import annotation.Identifiant;
import database.ClassMAPTable;
import mg.itu.annotation.Entier;
import mg.itu.annotation.FormParametre;
import mg.itu.annotation.Numeric;
import mg.itu.annotation.Required;

/**
 *
 * @author mahan
 */
public class Promotion extends ClassMAPTable {
    @Identifiant
    int idpromotion;
    
    @Required
    @FormParametre("idtype")
    int idtype;
    
    @Required
    @FormParametre("idvol")
    int idvol;
    
    @Required
    @FormParametre("place")
    @Entier(min=0)
    int place;
    
    @Required
    @FormParametre("promotion")
    @Numeric(min = 0, precision = 3)
    double promotion;

    public int getIdpromotion() {
        return idpromotion;
    }

    public void setIdpromotion(int idpromotion) {
        this.idpromotion = idpromotion;
    }

    public int getIdtype() {
        return idtype;
    }

    public void setIdtype(int idtype) {
        this.idtype = idtype;
    }

    public int getIdvol() {
        return idvol;
    }

    public void setIdvol(int idvol) {
        this.idvol = idvol;
    }

    public int getPlace() {
        return place;
    }

    public void setPlace(int place) {
        this.place = place;
    }

    public double getPromotion() {
        return promotion;
    }

    public void setPromotion(double promotion) {
        this.promotion = promotion;
    }
    
    
}
