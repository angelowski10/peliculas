/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.HomePublico;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cecio
 */
@WebServlet(name="CtrlHomePublico", urlPatterns={
    "/HomePublico",
    "/ListaEstrenos",
    "/DetalleEstrenos",
    "/PeliculaDetalle",
    "/ListaPelicula",
    "/Generos"
})

public class CtrlHomePublico extends HttpServlet {
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        switch(request.getServletPath()){
            
            case "/HomePublico":
                request.getRequestDispatcher("WEB-INF/HomePublico/inicio.jsp").forward(request, response);
                break;
            case "/ListaEstrenos":
                request.getRequestDispatcher("WEB-INF/HomePublico/estrenos.jsp").forward(request, response);
                break;
             case "/DetalleEstrenos":
                request.getRequestDispatcher("WEB-INF/HomePublico/estreno-detalle.jsp").forward(request, response);
                break;
            case "/PeliculaDetalle":
                request.getRequestDispatcher("WEB-INF/HomePublico/pelicula-detalle.jsp").forward(request, response);
                break;
            case "/ListaPelicula":
                request.getRequestDispatcher("WEB-INF/HomePublico/lista-peliculas.jsp").forward(request, response);
                break;
            case "/Generos":
                request.getRequestDispatcher("WEB-INF/HomePublico/generos.jsp").forward(request, response);
                break;
            
        }

    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
