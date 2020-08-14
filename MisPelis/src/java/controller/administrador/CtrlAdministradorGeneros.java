/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.administrador;

import Entitys.Genero;
import Sessions.GeneroFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis Angel
 */
@WebServlet(name = "CtrlAdministradorGeneros", urlPatterns = {"/Admin_Generos",
                                                            "/NuevoAdminGenero","/editGenero","/deleteGenero"})
public class CtrlAdministradorGeneros extends HttpServlet {

   @EJB
   GeneroFacade FGenero;   
   Genero EGenero;
   List<Genero> ListaGeneros;
  
  
   


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url;
        int id=0;
        int totalRegistros=0;
             PrintWriter out = response.getWriter();
       // ListaGeneros = new ArrayList<>();
       url = request.getServletPath();
        switch(url){
            
            case "/Admin_Generos":
                
                   
                ListaGeneros= FGenero.findAll();
                totalRegistros=ListaGeneros.size(); 
                request.setAttribute("generos", ListaGeneros);
                request.setAttribute("total", totalRegistros);
                request.getRequestDispatcher("WEB-INF/administrador/generos.jsp").forward(request, response);
                
                break;
                
                
                 case "/editGenero":
                    EGenero = new Genero();
                    id = Integer.parseInt(request.getParameter("id"));
                    EGenero = FGenero.find(id);
                    request.setAttribute("modificargenero", EGenero);
                    request.setAttribute("Ruta", "editGenero");
                    request.getRequestDispatcher("WEB-INF/administrador/admingenero_edit.jsp").forward(request, response);


                    
                    break;
                    
                    case "/deleteGenero":
                    EGenero = new Genero();
                    id = Integer.parseInt(request.getParameter("id"));
                    EGenero=FGenero.find(id);
                    FGenero.remove(EGenero);
                    
                    out.println("<script>alert('guardado correctamente')</script>");
                    out.println("<script>location.assign('Admin_Generos')</script>");

                    
                    break;
        }
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String url;
            int id=0;
           url = request.getServletPath();
           PrintWriter out = response.getWriter();
        switch(url){
            
         case "/NuevoAdminGenero":
         
              EGenero = new Genero();
             EGenero.setNombre(request.getParameter("txtGenero"));
              FGenero.create(EGenero);
               
                 out.println("<script>alert('guardado correctamente')</script>");
                    out.println("<script>location.assign('Admin_Generos')</script>");
                    
           break;
                 case "/editGenero":
                    EGenero = new Genero();
                    id = Integer.parseInt(request.getParameter("txtIdGenero"));
                    EGenero = FGenero.find(id);
                    EGenero.setNombre(request.getParameter("txtGeneroModificar").toUpperCase());
                    FGenero.edit(EGenero);
                    out.println("<script>alert('guardado correctamente')</script>");
                    out.println("<script>location.assign('Admin_Generos')</script>");

                    
                    break;
        }
        
        
        
    }
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
