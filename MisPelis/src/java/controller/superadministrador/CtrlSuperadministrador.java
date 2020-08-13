/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.superadministrador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis Angel
 */
@WebServlet(name = "CtrlSuperadministrador", urlPatterns = {"/CtrlSuperadministrador"})
public class CtrlSuperadministrador extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        switch(request.getServletPath()){
            
            case "/CtrlSuperadministrador":
                request.getRequestDispatcher("WEB-INF/superadministrador/inicio-superadministrador.jsp").forward(request, response);
                break;
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
}
