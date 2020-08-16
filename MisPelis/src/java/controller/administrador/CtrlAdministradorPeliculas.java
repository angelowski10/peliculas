/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.administrador;

import Entitys.Genero;
import Entitys.Pelicula;
import Sessions.GeneroFacade;
import Sessions.PeliculaFacade;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Luis Angel
 */
@WebServlet(name = "CtrlAdministradorPeliculas", urlPatterns = {"/Admin_Peliculas"
                                                                ,"/AdminAddPelicula"
                                                                ,"/AdminEditPelicula"
                                                                ,"/AdminEliminarPelicula"
        
        


})
@MultipartConfig
public class CtrlAdministradorPeliculas extends HttpServlet {

    @EJB
    PeliculaFacade FacadePeliculas;
    @EJB
    GeneroFacade FacadeGenero;
    Pelicula peliculas;
    Genero EntidadGeneros;
    List<Pelicula> ListPeliculas;
    List<Genero> ListGenero;
    
    //RUTA MODULO
    String RutaModuloAdministrador="WEB-INF/administrador/";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //RESPUESTA DEL SERVLET
       String url = request.getServletPath();
       ListPeliculas = new ArrayList<>();
       ListGenero = new ArrayList<>();
         PrintWriter writer = response.getWriter();
       
       //CONDICIONES DE LA PETICION
        switch(url){
            case"/Admin_Peliculas":
                //MOSTRAR TODAS LAS PELICULAS
                //Listado de peliculas
                ListPeliculas = FacadePeliculas.findAll();
                
                //ATRIBUTOS A PASAR
                request.setAttribute("ListadoPeliculas", ListPeliculas);
                request.setAttribute("PeliculasCarpeta", "imagenes/Peliculas");
                
                //RUTA+JSP
                request.getRequestDispatcher(RutaModuloAdministrador+"peliculas.jsp").forward(request, response);
                
                
                break;
                
                case"/AdminAddPelicula":
                    
                
                  ListGenero=FacadeGenero.findAll();
                
                request.setAttribute("action","RegistroPeliculas");
                request.setAttribute("generos", ListGenero);   
                request.getRequestDispatcher(RutaModuloAdministrador+"AdminAddPelicula.jsp").forward(request, response);
                    
                    break;
                    
                    case"/AdminEditPelicula":
                        
                 ListGenero=FacadeGenero.findAll();
                peliculas=FacadePeliculas.find(Integer.parseInt(request.getParameter("id")));
                
                request.setAttribute("PeliculasCarpeta", "imagenes/Peliculas");
               
                request.setAttribute("action","AdminEditGenero");
                request.setAttribute("editPeli", peliculas);
                  request.setAttribute("generos", ListGenero);
                
                
                request.getRequestDispatcher(RutaModuloAdministrador+"AdminEditPelicula.jsp").forward(request, response);
                
                    break;
                    
                    case"/AdminEliminarPelicula":
                                 try {
                    
                
              int idPelicula=Integer.parseInt(request.getParameter("id"));
                
                peliculas=FacadePeliculas.find(idPelicula);
                
                FacadePeliculas.remove(peliculas);
                
               writer.println("<script type='text/javascript'>alert(Eliminado correctamente);</scrip>");
            
              
                response.sendRedirect("Admin_Peliculas");
                
               
                 
                 } catch (Exception e) {
                     
                     response.sendRedirect("Admin_Peliculas");
                     
                }
                
                        
                        break;
        }
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            final String path=getServletContext().getInitParameter("imagenes");
        Part filePart = null;
        String fileName = null;
         String url = request.getServletPath();
         ListGenero = new ArrayList<>();
         peliculas= new Pelicula();
         EntidadGeneros= new Genero();
        switch(url){
            case "/AdminAddPelicula" :
                
               
                
                String titulo=request.getParameter("titulo");
                String duracion=request.getParameter("duracion");
                String sinopsis=request.getParameter("sinopsis");
                String lanzamiento=request.getParameter("lanzamiento");
                
                String generos[]=request.getParameterValues("genero");
              
                
                
                filePart= request.getPart("imagen");
                
                if(filePart!=null || !filePart.getSubmittedFileName().isEmpty()){
                    
            try {
                fileName =guardarArchivo(filePart,path);
                
                System.out.println("File name: "+fileName);
                System.out.println("titulo: "+titulo);
                System.out.println("duracion: "+duracion);
                System.out.println("sinopsis: "+sinopsis);
                System.out.println("lanzamiento: "+lanzamiento);
                 
               
                
                
            } catch (Exception ex) {
                Logger.getLogger(CtrlAdministradorPeliculas.class.getName()).log(Level.SEVERE, null, ex);
            }
                    
                }
                
               //    List<Genero> GeneroList= new ArrayList<>();
             //ListGenero
                    for (String idGenero : generos) {
                       
                        Genero genero=FacadeGenero.find(Integer.parseInt(idGenero));                             
                        ListGenero.add(genero);
                    }
           
                 peliculas.setAnioLanzamiento(lanzamiento);
                peliculas.setDuracion(duracion);
                peliculas.setImagen(fileName);
                peliculas.setSinopsis(sinopsis);
                peliculas.setTitulo(titulo);           
                peliculas.setGeneroList(ListGenero);
                
                
                FacadePeliculas.create(peliculas);
                
                response.sendRedirect("Admin_Peliculas");
               
                
                
                break;
                
                
                case"/AdminEditPelicula":
                    
                    // Pelicula editPelicula= new Pelicula();
                
                
                String Etitulo=request.getParameter("titulo");
                String Eduracion=request.getParameter("duracion");
                String Esinopsis=request.getParameter("sinopsis");
                String Elanzamiento=request.getParameter("lanzamiento");
                
                String Egeneros[]=request.getParameterValues("genero");
              
                String imagen= request.getParameter("imagen");
                
                filePart= request.getPart("imagen");
                
                peliculas=FacadePeliculas.find(Integer.parseInt(request.getParameter("id")));
                
                if(!filePart.getSubmittedFileName().isEmpty() ){
                    
           
            try {
                fileName =guardarArchivo(filePart,path);
                
                 peliculas.setImagen(fileName);
                
                System.out.println("File name: "+fileName);
                
               
            } catch (Exception ex) {
               
            }
                
           
                    
                }
                
                  // List<Genero> GeneroListE= new ArrayList<>();
             
                    for (String idGenero : Egeneros) {
                       
                        EntidadGeneros=FacadeGenero.find(Integer.parseInt(idGenero));                             
                        ListGenero.add(EntidadGeneros);
                    }
           
                
              
                peliculas.setAnioLanzamiento(Elanzamiento);
                peliculas.setDuracion(Eduracion);    
               
                peliculas.setSinopsis(Esinopsis);
                peliculas.setTitulo(Etitulo.toUpperCase());           
                peliculas.setGeneroList(ListGenero);
                
                
                
                FacadePeliculas.edit(peliculas);
                
                response.sendRedirect("Admin_Peliculas");
                
               
                    
                    
                    break;
                

            
            
        }
        
        
    }
    
    
     private String getFileName(final Part part){
        
        final String partHeader=part.getHeader("content-disposition");
        Logger.getLogger(CtrlAdministradorPeliculas.class.getName()).log(Level.INFO,"Part Header = {0}",partHeader);
        for(String content : part.getHeader("content-disposition").split(";")){
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"","");
               
            }
            
        }
        
        return null;
    }
    
    private String guardarArchivo(Part filePart, String path) throws Exception{
        
                    OutputStream out= null;
                    InputStream filecontent= null;
                    String fileName= getFileName(filePart);
                    out = new FileOutputStream(new File(path + File.separator + fileName));
                    filecontent=filePart.getInputStream();
                    
                    int read=0;
                    final byte[] bytes = new byte[1024];
                    
                    while((read =filecontent.read(bytes)) != -1){
                        out.write(bytes,0,read);
                    }
                    
                    if(out != null){
                        out.close();
                    }
                    if (filecontent != null) {
                        filecontent.close();
                    }
                    
                    return fileName;
        
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
