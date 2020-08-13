/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.HomePublico;

import Entitys.TipoUsuario;
import Entitys.Usuario;
import Sessions.UsuarioFacade;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cecio
 */
@WebServlet(name="Login", urlPatterns={"/Login","/Inicio","/autenticar","/Registro"})
public class Login extends HttpServlet {
    
    String url;
    @EJB 
    private UsuarioFacade usuarioF;
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        HttpSession sesion = request.getSession(true);
        url = request.getServletPath();
        
        switch(url){
            case "/Login":
                if(sesion.getAttribute("usuario") != null){
                    
                    Usuario usuario = (Usuario) sesion.getAttribute("usuario");
                    
                    if(usuario.getIdTipousuario().getIdTipousuario().equals(3)){
                                                 
                        response.sendRedirect("Home_Registrado");
                    }
                    
                    if(usuario.getIdTipousuario().getIdTipousuario().equals(1)){
                        
                    }
                    
                    if(usuario.getIdTipousuario().getIdTipousuario().equals(2)){
                        
                    }
                 
                }
                else{response.sendRedirect("Home_Publico");}
                
                break;
            
            case "/Inicio":
                
                HttpSession session = request.getSession(true); 
                sesion.setAttribute("usuario", null);
                sesion.removeAttribute("usuario");
                response.sendRedirect("Home_Publico");
                 
                break;
        
        }
        
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         
        try {
            
            PrintWriter out = response.getWriter();
            HttpSession sesion = request.getSession();
            url= request.getServletPath();
            switch(url){
            
                case "/autenticar":
                    Usuario u = new Usuario();
                    String usuario = request.getParameter("Username");
                    String password = request.getParameter("Password");
                    u = usuarioF.BuscarUsuario(usuario, password);
                    sesion.setAttribute("usuario", u);
                    response.sendRedirect("Login");
                    break;
                
                case "/Registro":
                    Usuario us = new Usuario();
                    us.setNomUsuario(request.getParameter("username"));
                    us.setPassword(request.getParameter("password"));
                    us.setNombres(request.getParameter("nombre"));
                    us.setApellidos(request.getParameter("apellido"));
                    us.setCorreo(request.getParameter("email"));
                    int tipo = 3;
                    TipoUsuario tu = new TipoUsuario();
                    tu.setIdTipousuario(tipo);
                    us.setIdTipousuario(tu);
                    usuarioF.create(us);
                    out.print("<script>alert('Agregado correctamente')</script>");
                    response.sendRedirect("Inicio");
                    break;
            }
            
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            response.sendRedirect("Home_Publico");
        }
        
    }

}
