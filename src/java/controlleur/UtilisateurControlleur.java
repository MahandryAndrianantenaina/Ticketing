package controlleur;

import com.google.gson.Gson;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import mg.itu.annotation.Get;
import mg.itu.annotation.MySession;
import mg.itu.annotation.Parametre;
import mg.itu.annotation.Post;
import mg.itu.annotation.Url;
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
public class UtilisateurControlleur {
    private Utilisateur utilisateur;
    private MySession session;
    
    @Get
    @Url("/user/back")
    public ModelAndView getLoginBackOffice() {
        ModelAndView mv = new ModelAndView();
        mv.setUrl("pages/user/back-login.jsp");
        return mv;
    }
    
    @Post
    @Url("/user/back/login")
    public String login(@Parametre(name = "email")String email, @Parametre(name = "mdp")String mdp, HttpServletResponse response) throws Exception {
        Utilisateur utilisateur = new Utilisateur(email, mdp);
        utilisateur = utilisateur.checkLogin();
        Gson gson = new Gson();
        Cookie cookie = new Cookie("user", gson.toJson(utilisateur));
        cookie.setMaxAge(24 * 60 * 60); 
        cookie.setPath("/");
        cookie.setHttpOnly(true);
        cookie.setSecure(true);
        response.addCookie(cookie);
        session.add("user", utilisateur.getIdtype());
        return "redirect:/";
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
