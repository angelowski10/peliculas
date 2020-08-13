/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.HomePublico;

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
@WebServlet(name="CtrlHomePublico", urlPatterns={
    "/Home_Publico",
    "/ListaEstrenos_Publico",
    "/PeliculaDetalle__Publico",
    "/ListaPelicula_Publico",
    "/Generos_Publico",
    "/MostrarLista",
    "/Buscar"
})

public class CtrlHomePublico extends HttpServlet {
    
    String url;
    @EJB
    private GeneroFacade generoF;
    @EJB
    private PeliculaFacade peliculaF;
   

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        List<Genero> generoList;
        List<Pelicula> peliculaList , peliculaDestacada, peliculaNueva, peliculaGenero;
        List<Comentario> peliculasPopulares, peliculaRecomendacion;
        url = request.getServletPath();
        Pelicula p;
        switch(url){
            
            case "/Home_Publico":
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
                request.getRequestDispatcher("WEB-INF/HomePublico/inicio_publico.jsp").forward(request, response);
                break;
                
            case "/ListaEstrenos_Publico":
                generoList = generoF.findAll();
                peliculaNueva = peliculaF.PeliculaNueva();
                request.setAttribute("generoList",generoList);
                request.setAttribute("peliculaNueva", peliculaNueva);
                request.getRequestDispatcher("WEB-INF/HomePublico/estrenos_publico.jsp").forward(request, response);
                break;
 
                
            case "/PeliculaDetalle__Publico":
                p = peliculaF.find(Integer.parseInt(request.getParameter("id")));
                generoList = generoF.findAll();
                peliculaRecomendacion = peliculaF.Recomendadas();
                request.setAttribute("peliculaRecomendacion", peliculaRecomendacion);
                request.setAttribute("generoList",generoList);
                request.setAttribute("pelicula", p);
                request.getRequestDispatcher("WEB-INF/HomePublico/pelicula-detalle_publico.jsp").forward(request, response);
                break;
                
            case "/ListaPelicula_Publico":
                generoList = generoF.findAll();
                peliculaList = peliculaF.findAll();
                request.setAttribute("generoList",generoList);
                request.setAttribute("peliculaList", peliculaList);
                request.getRequestDispatcher("WEB-INF/HomePublico/lista-peliculas_publico.jsp").forward(request, response);
                break;
            
            case "/MostrarLista":
                generoList = generoF.findAll();
                request.setAttribute("generoList",generoList);
                peliculaList = peliculaF.PeliculaLetra(request.getParameter("letra"));
                request.setAttribute("peliculaList", peliculaList);
                request.getRequestDispatcher("WEB-INF/HomePublico/lista-peliculas_publico.jsp").forward(request, response);
                break;
           
                
            case "/Generos_Publico":
                generoList = generoF.findAll();
                request.setAttribute("generoList",generoList);
                peliculaGenero = peliculaF.PeliculaGenero(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("peliculas", peliculaGenero);
                request.getRequestDispatcher("WEB-INF/HomePublico/generos_publico.jsp").forward(request, response);
                break;
                
            case "/Buscar":
            System.out.println("controller.HomePublico.CtrlHomePublico.doPost()");
                generoList = generoF.findAll();
                request.setAttribute("generoList",generoList);
                peliculaList = peliculaF.PeliculaBuscar(request.getParameter("Search"));
                request.setAttribute("peliculaList", peliculaList);
                request.getRequestDispatcher("WEB-INF/HomePublico/lista-peliculas_publico.jsp").forward(request, response);
            break;
            
        }

    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
       
    }
}
