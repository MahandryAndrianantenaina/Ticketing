/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package siege;

import annotation.Identifiant;
import annotation.Table;
import database.ClassMAPTable;

/**
 *
 * @author mahan
 */
@Table("typesiege")
public class TypeSiege extends ClassMAPTable {
    @Identifiant
    int idtype;
    
    String nom;

    public int getIdtype() {
        return idtype;
    }

    public void setIdtype(int idtype) {
        this.idtype = idtype;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
