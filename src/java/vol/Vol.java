/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vol;

import annotation.Decimal;
import annotation.Identifiant;
import annotation.Requis;
import annotation.Table;
import database.ClassMAPTable;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;
import mg.itu.annotation.*;

/**
 *
 * @author mahan
 */
@Table("vol")
public class Vol extends ClassMAPTable {
    @Identifiant
    int idvol;
    
    @Required
    @Requis
    @FormParametre("idavion")
    int idavion;
    
    @Required
    @Requis
    @FormParametre("idville")
    int idville;
    
    @Required
    @Requis
    @FormParametre("depart")        
    Timestamp depart;
    
    @Required
    @Requis
    @FormParametre("arrivee")
    Timestamp arrivee;
    
    @Required
    @Requis
    @FormParametre("prix")
    @Numeric(min = 0)
    double prix;
    
    public int getIdvol() {
        return idvol;
    }

    public void setIdvol(int idvol) {
        this.idvol = idvol;
    }

    public int getIdavion() {
        return idavion;
    }

    public void setIdavion(int idavion) {
        this.idavion = idavion;
    }

    public int getIdville() {
        return idville;
    }

    public void setIdville(int idville) {
        this.idville = idville;
    }

    public Timestamp getDepart() {
        return depart;
    }

    public void setDepart(Timestamp depart) {
        this.depart = depart;
    }

    public Timestamp getArrivee() {
        return arrivee;
    }

    public void setArrivee(Timestamp arrivee) {
        this.arrivee = arrivee;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }
    
    public static List<Vol> getAllEnCours() throws Exception {
        LocalDate today = LocalDate.now();
        String query = String.format("select * from Vol where depart >= '%s' ", today);
        List<ClassMAPTable> results = new Vol().getByRequest(query);
        List<Vol> vols = results.stream()
        .map(obj -> (Vol) obj) 
        .toList();
        return vols;
    }
}
