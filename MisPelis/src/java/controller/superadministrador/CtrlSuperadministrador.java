/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.superadministrador;

import Entitys.Genero;
import Entitys.Pelicula;
import Entitys.TipoUsuario;
import Entitys.Usuario;
import Sessions.GeneroFacade;
import Sessions.PeliculaFacade;
import Sessions.UsuarioFacade;
import java.io.File;
import java.io.FileNotFoundException;
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
import jdk.nashorn.internal.objects.NativeError;

/**
 *
 * @author Luis Angel
 */
@WebServlet(name = "CtrlSuperadministrador", urlPatterns = {
 "/Home_superAdmin",
    "/ListAdministradores",
    "/ListPeliculas",
    "/frmAdministradores",
    "/frmPeliculas",
    "/frmEditAdministradores",
    "/frmEditPeliculas",
    "/RegistroAdministradores",
    "/RegistroPeliculas",
    "/EditAdministrador",
    "/EditPelicula",
    "/EliminarAdministradores",
    "/EliminarPeliculas"
})
@MultipartConfig
public class CtrlSuperadministrador extends HttpServlet {
    @EJB
    private UsuarioFacade usuarioF;
    private Usuario usuarioE;
    
    @EJB
    private PeliculaFacade peliculaF;
    private Pelicula peliculaE;
    
    @EJB
    private GeneroFacade generoF;
    
   
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          PrintWriter writer = response.getWriter();
        
        String URL="WEB-INF/superadministrador/";
    
       
        
        switch(request.getServletPath()){
            
            case "/Home_superAdmin":
                request.getRequestDispatcher("WEB-INF/superadministrador/inicio-superadministrador.jsp").forward(request, response);
                
                request.getRequestDispatcher(URL+"inicio-superadministrador.jsp").forward(request, response);
                
                break;
                
                //Controladores de administradores
                
            case "/ListAdministradores":
                
                
                List<Usuario> listUsuarios=usuarioF.findAll();
                
                request.setAttribute("usuarios",listUsuarios);
               
                request.getRequestDispatcher(URL+"listAdministradores.jsp").forward(request, response);
                
                break;
                
                
            case "/frmAdministradores":
                
                
                request.setAttribute("action","RegistroAdministradores");
                request.getRequestDispatcher(URL+"frmAdministradores.jsp").forward(request, response);
                
                break;
                
            case "/frmEditAdministradores":
                
                usuarioE=usuarioF.find(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("action","EditAdministrador");
                request.setAttribute("editAdmin", usuarioE);
                
                
                request.getRequestDispatcher(URL+"frmAdministradores.jsp").forward(request, response);
                
                break;
                
                
                
            case "/EliminarAdministradores":
                
                try {
                    
                
                int idUsuario=Integer.parseInt(request.getParameter("id"));
                
                Usuario deleteUsuario=usuarioF.find(idUsuario);
                
                usuarioF.remove(deleteUsuario);
                
              
                response.sendRedirect("ListAdministradores");
                
               
                 
                 } catch (Exception e) {
                     
                     response.sendRedirect("ListAdministradores");
                     
                }
                
                break;
                
          
                
                //Controladores de pelicula
                
            case "/ListPeliculas":
                
                 
                List<Pelicula> listPelicula=peliculaF.findAll();
              
                request.setAttribute("peliculas",listPelicula);
                
                 request.setAttribute("ruta","imagenes/peliculas");
               
                request.getRequestDispatcher(URL+"listPeliculas.jsp").forward(request, response);
                
                break;
                
            case "/frmPeliculas":
                  List<Genero> listGenero=generoF.findAll();
                
                request.setAttribute("action","RegistroPeliculas");
                request.setAttribute("generos", listGenero);
               
               request.getRequestDispatcher(URL+"frmPeliculas.jsp").forward(request, response);
                
                
                break;
                
            case "/frmEditPeliculas":
                
                 List<Genero> listGeneroE=generoF.findAll();
                
                
                peliculaE=peliculaF.find(Integer.parseInt(request.getParameter("id")));
                       request.setAttribute("ruta","imagenes/peliculas");
               
                request.setAttribute("action","EditPelicula");
                request.setAttribute("editPeli", peliculaE);
                  request.setAttribute("generos", listGeneroE);
                
                
                request.getRequestDispatcher(URL+"frmPeliculas.jsp").forward(request, response);
                
                break;
                
                  case "/EliminarPeliculas":
                
                 try {
                    
                
                int idPelicula=Integer.parseInt(request.getParameter("id"));
                
                Pelicula deletePeli=peliculaF.find(idPelicula);
                
                peliculaF.remove(deletePeli);
                
               writer.println("<script type='text/javascript'>alert(Eliminado correctamente);</scrip>");
               response.sendRedirect("ListPeliculas");
                
               
                 
                 } catch (Exception e) {
                     
                     response.sendRedirect("ListPeliculas");
                     
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
        
        PrintWriter writer =response.getWriter();
        
        switch(request.getServletPath()){
            
            case "/RegistroAdministradores":
                
                String nomUsuario=request.getParameter("usuario");
                String password=request.getParameter("password");
                String nombres=request.getParameter("nombres");
                String apellidos=request.getParameter("apellidos");
                String correo=request.getParameter("correo");
                
         Usuario usuarioE=new Usuario();
        
            usuarioE.setNomUsuario(nomUsuario);
            usuarioE.setPassword(password);
            usuarioE.setNombres(nombres);
            usuarioE.setApellidos(apellidos);
            usuarioE.setCorreo(correo);
        
        TipoUsuario idTipousuario= new TipoUsuario();
        idTipousuario.setIdTipousuario(2);
        
        usuarioE.setIdTipousuario(idTipousuario);
        
        usuarioF.create(usuarioE);
               
        writer.println("<script></scrip>");
                response.sendRedirect("ListAdministradores");
                
                
                break;
                
            case "/EditAdministrador":
                                                                     
                int _idUsuario=Integer.parseInt(request.getParameter("id"));
                String _nomUsuario=request.getParameter("usuario");
                   String _password=request.getParameter("password");
                String _nombres=request.getParameter("nombres");
                String _apellidos=request.getParameter("apellidos");
                String _correo=request.getParameter("correo");
                
                Usuario editUsuario=new Usuario();

              editUsuario.setIdUsuario(_idUsuario);
               editUsuario.setNomUsuario(_nomUsuario);
              editUsuario.setPassword(_password);
               editUsuario.setNombres(_nombres);
               editUsuario.setApellidos(_apellidos);
               editUsuario.setCorreo(_correo);
               TipoUsuario editIdTipousuario= new TipoUsuario();
               editIdTipousuario.setIdTipousuario(2);
               editUsuario.setIdTipousuario(editIdTipousuario);
              
        
                usuarioF.edit(editUsuario);
               
                response.sendRedirect("ListAdministradores");
                
                break;
                
                //URLS pelicula
                
            case "/RegistroPeliculas" :
                
                Pelicula createPelicula= new Pelicula();
                
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
                
               
                
                
            } catch (Exception ex) {
                Logger.getLogger(CtrlSuperadministrador.class.getName()).log(Level.SEVERE, null, ex);
            }
                    
                }
                
                   List<Genero> GeneroList= new ArrayList<>();
             
                    for (String idGenero : generos) {
                       
                        Genero genero=generoF.find(Integer.parseInt(idGenero));                             
                        GeneroList.add(genero);
                    }
           
                 createPelicula.setAnioLanzamiento(lanzamiento);
                createPelicula.setDuracion(duracion);
                createPelicula.setImagen(fileName);
                createPelicula.setSinopsis(sinopsis);
                createPelicula.setTitulo(titulo);           
                createPelicula.setGeneroList(GeneroList);
                
                
                peliculaF.create(createPelicula);
                
                response.sendRedirect("ListPeliculas");
               
                
                
                break;
                
            case "/EditPelicula":
                
                Pelicula editPelicula= new Pelicula();
                
                
                String Etitulo=request.getParameter("titulo");
                String Eduracion=request.getParameter("duracion");
                String Esinopsis=request.getParameter("sinopsis");
                String Elanzamiento=request.getParameter("lanzamiento");
                
                String Egeneros[]=request.getParameterValues("genero");
              
                String imagen= request.getParameter("imagen");
                
                filePart= request.getPart("imagen");
                
                editPelicula=peliculaF.find(Integer.parseInt(request.getParameter("id")));
                
                if(!filePart.getSubmittedFileName().isEmpty() ){
                    
           
            try {
                fileName =guardarArchivo(filePart,path);
                
                 editPelicula.setImagen(fileName);
                
                System.out.println("File name: "+fileName);
                
                System.out.println("entro en imagen");
            } catch (Exception ex) {
               
            }
                
           
                    
                }
                
                   List<Genero> GeneroListE= new ArrayList<>();
             
                    for (String idGenero : Egeneros) {
                       
                        Genero genero=generoF.find(Integer.parseInt(idGenero));                             
                        GeneroListE.add(genero);
                    }
           
                
              
                editPelicula.setAnioLanzamiento(Elanzamiento);
                editPelicula.setDuracion(Eduracion);    
               
                editPelicula.setSinopsis(Esinopsis);
                editPelicula.setTitulo(Etitulo.toUpperCase());           
                editPelicula.setGeneroList(GeneroListE);
                
                
                
                peliculaF.edit(editPelicula);
                
                response.sendRedirect("ListPeliculas");
                
                break;
                
        }
        
    }
     private String getFileName(final Part part){
        
        final String partHeader=part.getHeader("content-disposition");
        Logger.getLogger(CtrlSuperadministrador.class.getName()).log(Level.INFO,"Part Header = {0}",partHeader);
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

    
}
