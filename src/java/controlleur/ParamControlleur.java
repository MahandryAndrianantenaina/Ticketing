package controlleur;

import avion.Avion;
import com.google.gson.Gson;
import java.util.List;
import mg.itu.annotation.*;
import mg.itu.annotation.Error;
import mg.itu.prom16.ModelAndView;
import param.Promotion;
import siege.TypeSiege;
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
@Authenticated(roles = {1})
public class ParamControlleur {         
    @Get
    @Url("/param/prom")
    public ModelAndView getFormParam() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Vol> result1 = new Vol().getAll();
        List<TypeSiege> result2 = new TypeSiege().getAll();
        mv.addObject("vols", result1);
        mv.addObject("sieges", result2);
        mv.addObject("import", "param/param-promotion.jsp");
        mv.setUrl("../pages/sidebar.jsp");
        return mv;
    }
    
    @Post
    @Url("/param/prominsert")
    @Error("/param/prom")
    public String insertVol(@RequestBody Promotion promotion) throws Exception {
        promotion.insertToTable();
        return "redirect:/param/prom";
    }
}
