package controlleur;

import com.google.gson.Gson;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Base64;
import mg.itu.annotation.*;
import mg.itu.prom16.ModelAndView;
import user.Utilisateur;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author mahan
 */
@AnnotationController
public class UtilisateurControlleur {
    private Utilisateur utilisateur;
    private MySession session;
    
    @Get
    @Url("/")
    public String getLogin() {
        return "redirect:/user/back";
    }
    
    @Get
    @Url("/user/back")
    public ModelAndView getLoginBackOffice() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("import", null);
        mv.setUrl("../pages/user/back-login.jsp");
        return mv;
    }
    
    @Post
    @Url("/user/back/login")
    public String login(@Parametre(name = "email") String email, 
                        @Parametre(name = "mdp") String mdp, 
                        HttpServletResponse response) throws Exception {
        Utilisateur utilisateur = new Utilisateur(email, mdp);
        utilisateur = utilisateur.checkLogin();
        Gson gson = new Gson();

        // Encodage pour éviter les erreurs de cookie
        String userJson = gson.toJson(utilisateur);
        String encodedUserJson = Base64.getEncoder().encodeToString(userJson.getBytes());

        Cookie cookie = new Cookie("user", encodedUserJson);
        cookie.setMaxAge(24 * 60 * 60);
        cookie.setPath("/");
        cookie.setHttpOnly(true);
        cookie.setSecure(true);

        response.addCookie(cookie);
        session.add("user", utilisateur.getIdtype());

        return "redirect:/vol/list";
    }
    
    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

    public MySession getSession() {
        return session;
    }

    public void setSession(MySession session) {
        this.session = session;
    }    
}
