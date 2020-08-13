/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.HomeRegistrado;

import Entitys.Comentario;
import Entitys.Genero;
import Entitys.Pelicula;
import Entitys.Usuario;
import Sessions.ComentarioFacade;
import Sessions.GeneroFacade;
import Sessions.PeliculaFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name="CtrlHomeResgistrado", urlPatterns={
    "/Home_Registrado",
    "/ListaEstrenos_Registrado",
    "/DetalleEstrenos_Registrado",
    "/PeliculaDetalle__Registrado",
    "/ListaPelicula_Registrado",
    "/Generos_Registrado",
    "/MostrarLista_Registrado",
    "/Buscar_Registrado",
    "/Pelicula",
    "/AgregarComentario"
})
public class CtrlHomeResgistrado extends HttpServlet {
    
    String url;
    @EJB
    private GeneroFacade generoF;
    @EJB
    private PeliculaFacade peliculaF;
    @EJB
    private ComentarioFacade comentarioF;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        HttpSession sesion = request.getSession(true);
        Usuario usuario1 = (Usuario) request.getSession().getAttribute("usuario");
        
        List<Genero> generoList;
        List<Pelicula> peliculaList , peliculaDestacada, peliculaNueva, peliculaGenero;
        List<Comentario> peliculasPopulares, peliculaRecomendacion;
        url = request.getServletPath();
        Pelicula p;
     
        try {
           
             switch(url){
            
            case "/Home_Registrado":
                
                if (usuario1.getIdTipousuario().getIdTipousuario().equals(3)){
                    
                    if(sesion.getAttribute("usuario") == null){response.sendRedirect("Home_Publico");}
                    else{
                        generoList = generoF.findAll();
                        peliculaList = peliculaF.findAll();
                        peliculaDestacada = peliculaF.PeliculaDestacada();
                        peliculasPopulares = peliculaF.PeliculasPopulares();
                        peliculaRecomendacion = peliculaF.Recomendadas();
                        request.setAttribute("generoList",generoList);
                        request.setAttribute("peliculaList", peliculaList);
                        request.setAttribute("peliculaDestacada", peliculaDestacada);
                        request.setAttribute("peliculasPopulares", peliculasPopulares);
                        request.setAttribute("peliculaRecomendacion", peliculaRecomendacion);
                        request.getRequestDispatcher("WEB-INF/HomeRegistrado/inicio.jsp").forward(request, response);  
                    }
                }
                else{response.sendRedirect("Home_Publico");}
                    
                break;
                
            case "/ListaEstrenos_Registrado":
                if (usuario1.getIdTipousuario().getIdTipousuario().equals(3)){
                    if(sesion.getAttribute("usuario") == null){response.sendRedirect("Home_Publico");}
                    else{
                    generoList = generoF.findAll();
                    peliculaNueva = peliculaF.PeliculaNueva();
                    request.setAttribute("generoList",generoList);
                    request.setAttribute("peliculaNueva", peliculaNueva);
                    request.getRequestDispatcher("WEB-INF/HomeRegistrado/estrenos.jsp").forward(request, response);
                    }
                }
                else{response.sendRedirect("Home_Publico");}
                break;
            
            case "/PeliculaDetalle__Registrado":
                if (usuario1.getIdTipousuario().getIdTipousuario().equals(3)){
                    if(sesion.getAttribute("usuario") == null){response.sendRedirect("Home_Publico");}
                    else{
                        p = peliculaF.find(Integer.parseInt(request.getParameter("id")));
                        generoList = generoF.findAll();
                        peliculaRecomendacion = peliculaF.Recomendadas();
                        request.setAttribute("peliculaRecomendacion", peliculaRecomendacion);
                        request.setAttribute("generoList",generoList);
                        request.setAttribute("pelicula", p);
                        request.getRequestDispatcher("WEB-INF/HomeRegistrado/pelicula-detalle.jsp").forward(request, response);
                        }
                }
                else{response.sendRedirect("Home_Publico");}
                break;
                
            case "/ListaPelicula_Registrado":
             if (usuario1.getIdTipousuario().getIdTipousuario().equals(3)){
                    if(sesion.getAttribute("usuario") == null){response.sendRedirect("Home_Publico");}
                    else{
                        generoList = generoF.findAll();
                        peliculaList = peliculaF.findAll();
                        request.setAttribute("generoList",generoList);
                        request.setAttribute("peliculaList", peliculaList);
                        request.getRequestDispatcher("WEB-INF/HomeRegistrado/lista-peliculas.jsp").forward(request, response);
                        }
                }
                else{response.sendRedirect("Home_Publico");}
                break;
            
            case "/MostrarLista_Registrado":
             if (usuario1.getIdTipousuario().getIdTipousuario().equals(3)){
                    if(sesion.getAttribute("usuario") == null){response.sendRedirect("Home_Publico");}
                    else{
                        generoList = generoF.findAll();
                        request.setAttribute("generoList",generoList);
                        peliculaList = peliculaF.PeliculaLetra(request.getParameter("letra"));
                        request.setAttribute("peliculaList", peliculaList);
                        request.getRequestDispatcher("WEB-INF/HomeRegistrado/lista-peliculas.jsp").forward(request, response);
                        }
                }
                else{response.sendRedirect("Home_Publico");}
                break;
           
                
            case "/Generos_Registrado":
             if (usuario1.getIdTipousuario().getIdTipousuario().equals(3)){
                    if(sesion.getAttribute("usuario") == null){response.sendRedirect("Home_Publico");}
                    else{
                        generoList = generoF.findAll();
                        request.setAttribute("generoList",generoList);
                        peliculaGenero = peliculaF.PeliculaGenero(Integer.parseInt(request.getParameter("id")));
                        request.setAttribute("peliculas", peliculaGenero);
                        request.getRequestDispatcher("WEB-INF/HomeRegistrado/generos.jsp").forward(request, response);
                        }
                }
                else{response.sendRedirect("Home_Publico");}
                break;
                
            case "/Buscar_Registrado":
             if (usuario1.getIdTipousuario().getIdTipousuario().equals(3)){
                    if(sesion.getAttribute("usuario") == null){response.sendRedirect("Home_Publico");}
                    else{
                        generoList = generoF.findAll();
                        request.setAttribute("generoList",generoList);
                        peliculaList = peliculaF.PeliculaBuscar(request.getParameter("Search"));
                        request.setAttribute("peliculaList", peliculaList);
                        request.getRequestDispatcher("WEB-INF/HomeRegistrado/lista-peliculas.jsp").forward(request, response);
                        }
                }
                else{response.sendRedirect("Home_Publico");}
            break;
            
            case "/Pelicula":
             if (usuario1.getIdTipousuario().getIdTipousuario().equals(3)){
                    if(sesion.getAttribute("usuario") == null){response.sendRedirect("Home_Publico");}
                    else{
                        p = peliculaF.find(Integer.parseInt(request.getParameter("id")));
                        generoList = generoF.findAll();
                        peliculaRecomendacion = peliculaF.Recomendadas();
                        request.setAttribute("peliculaRecomendacion", peliculaRecomendacion);
                        request.setAttribute("generoList",generoList);
                        request.setAttribute("pelicula", p);
                        request.getRequestDispatcher("WEB-INF/HomeRegistrado/pelicula.jsp").forward(request, response);
                        }
                }
                else{response.sendRedirect("Home_Publico");}
                break;
        }
            
        } catch (Exception e) {
            
            System.err.println("Error: " + e.getMessage());
            response.sendRedirect("Home_Publico");
        }
        
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        HttpSession sesion = request.getSession(true);
        Usuario usuario1 = (Usuario) request.getSession().getAttribute("usuario");
        url = request.getServletPath();
        
        PrintWriter out = response.getWriter();
        
        try {
           
            switch(url){
        
            case "/AgregarComentario":
                 if (usuario1.getIdTipousuario().getIdTipousuario().equals(3)){
                    if(sesion.getAttribute("usuario") == null){response.sendRedirect("Home_Publico");}
                    else{
                        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                        Comentario c = new Comentario();
                        c.setCalificacion(Integer.parseInt(request.getParameter("calificacion")));
                        c.setComentario(request.getParameter("comentario"));
                        int pelicula = Integer.parseInt(request.getParameter("pelicula"));
                        Pelicula p = new Pelicula();
                        p.setIdPelicula(pelicula);
                        c.setIdPelicula(p);
                        Usuario u = new Usuario();
                        u.setIdUsuario(usuario.getIdUsuario());
                        c.setIdUsuario(u);
                        comentarioF.create(c);
                        response.sendRedirect("Home_Publico");
                         }
                }
                else{response.sendRedirect("Home_Publico");}
                break;
        
            }
            
        } catch (Exception e) {
            
            System.err.println("Error: " + e.getMessage());
            response.sendRedirect("Home_Publico");
        }
        
        
        
    }

}
