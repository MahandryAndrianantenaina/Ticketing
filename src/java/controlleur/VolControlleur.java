package controlleur;

import avion.Avion;
import com.google.gson.Gson;
import java.util.List;
import mg.itu.annotation.*;
import mg.itu.annotation.Error;
import mg.itu.prom16.ModelAndView;
import ville.Ville;
import vol.Vol;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author mahan
 */
@AnnotationController
public class VolControlleur {    
    private Vol volModel = new Vol();
    
    @Get
    @Url("/vol/list")
    @Authenticated(roles = {1})
    public ModelAndView getListVol() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Ville> result1 = new Ville().getAll();
        List<Avion> result2 = new Avion().getAll();
        mv.addObject("villes", result1);
        mv.addObject("avions", result2);
        mv.addObject("liste", Vol.getAllEnCours());
        mv.addObject("import", "vol/vol-list.jsp");
        mv.setUrl("../pages/sidebar.jsp");
        return mv;
    }
    
    @Post
    @Url("/vol/list")
    @Authenticated(roles = {1})
    public ModelAndView getVol() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Ville> result1 = new Ville().getAll();
        List<Avion> result2 = new Avion().getAll();
        mv.addObject("villes", result1);
        mv.addObject("avions", result2);
        mv.addObject("liste", Vol.getAllEnCours());
        mv.addObject("import", "vol/vol-list.jsp");
        mv.setUrl("../pages/sidebar.jsp");
        return mv;
    }
    
    @Get
    @Url("/vol/insertion")
    @Authenticated(roles = {1})
    public ModelAndView getFormVol() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Ville> result1 = new Ville().getAll();
        List<Avion> result2 = new Avion().getAll();
        mv.addObject("villes", result1);
        mv.addObject("avions", result2);
        mv.addObject("import", "vol/vol-form.jsp");
        mv.setUrl("../pages/sidebar.jsp");
        return mv;
    }
    
    @Post
    @Url("/vol/insert")
    @Error("/vol/insertion")
    @Authenticated(roles = {1})
    public String insertVol(@RequestBody Vol vol) throws Exception {
        vol.insertToTable();
        return "redirect:/vol/list";
    }
    
    @Post
    @Url("/vol/find")
    @Error("/vol/list")
    @Authenticated(roles = {1})
    public ModelAndView findVol(@RequestParam Vol vol, @Parametre(name="min") double min, @Parametre(name="max") double max) throws Exception {
        String[] columns = {"idavion", "idville", "depart", "arrivee", "prix"};
        Object[][] values = new Object[columns.length][2];
        Gson gson = new Gson();
        values[0][0] = vol.getIdavion();
        values[0][1] = vol.getIdavion();
        values[1][0] = vol.getIdville();
        values[1][1] = vol.getIdville();
        values[2][0] = vol.getDepart();
        values[2][1] = vol.getDepart();
        values[3][0] = vol.getArrivee();
        values[3][1] = vol.getArrivee();
        values[4][0] = min;
        values[4][1] = max;
        List<Vol> vols = vol.getAllBetweenValues(columns, values);
        ModelAndView mv = new ModelAndView();
        List<Ville> result1 = new Ville().getAll();
        List<Avion> result2 = new Avion().getAll();
        mv.addObject("villes", result1);
        mv.addObject("avions", result2);
        mv.addObject("liste", vols);
        mv.addObject("import", "vol/vol-list.jsp");
        mv.setUrl("../pages/sidebar.jsp");
        return mv;
    }
    
    @Get
    @Url("/vol/delete")
    @Authenticated(roles = {1})
    public String deleteVol(@Parametre(name="idvol") int idvol) throws Exception {
        Vol vol = volModel.getById(idvol);
        vol.deleteToTable();
        return "redirect:/vol/list";
    }
    
    @Get
    @Url("/vol/maj")
    @Authenticated(roles = {1})
    public ModelAndView updateFormVol(@Parametre(name="idvol") int idvol) throws Exception {
        Vol vol = volModel.getById(idvol);
        ModelAndView mv = new ModelAndView();
        List<Ville> result1 = new Ville().getAll();
        List<Avion> result2 = new Avion().getAll();
        mv.addObject("villes", result1);
        mv.addObject("avions", result2);
        mv.addObject("vol", vol);
        mv.addObject("import", "vol/vol-update.jsp");
        mv.setUrl("../pages/sidebar.jsp");
        return mv;
    }
    
    @Post
    @Url("/vol/update")
    @Authenticated(roles = {1})
    public String updatetVol(@RequestBody Vol vol, @Parametre(name="idvol") int idvol) throws Exception {
        Vol vole = volModel.getById(idvol);
        vole = vol;
        vole.setIdvol(idvol);
        vole.updateToTable();
        return "redirect:/vol/list";
    }
    
}
