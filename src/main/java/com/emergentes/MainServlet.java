
package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //peticion desde enlace
        String op = request.getParameter("op");
        
        Estudiante objestudiante = new Estudiante();
        int id, posicion;
        
        HttpSession ses = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaestudiante");
        
        switch (op) {
            case "nuevo":
                //enviar un objeto vacio a editar
                request.setAttribute("miobjestudiante", objestudiante);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                //averiguar la posicion del elemento en la lista
                posicion = buscaPorIndice(request, id);
                //obtener el objeto
                objestudiante = lista.get(posicion);
                
                request.setAttribute("miobjestudiante", objestudiante);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                //enciar un objeto a editar pero con contenido
                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                posicion = buscaPorIndice(request, id);
                if (posicion >= 0) {
                    lista.remove(posicion);
                }
                request.setAttribute("listaestudiante", lista);
                
                response.sendRedirect("index.jsp");
                //eliminar el registro de la coleccion segun el id que se reciba
                break;
            
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaestudiante");
        
        Estudiante objestudiante = new Estudiante();
        objestudiante.setId(id);
        objestudiante.setNombre(request.getParameter("nombre"));
        objestudiante.setP1(Integer.parseInt(request.getParameter("P1")));
        objestudiante.setP2(Integer.parseInt(request.getParameter("P2")));
        objestudiante.setP3(Integer.parseInt(request.getParameter("P3")));
        
        if (id == 0) {
            //nuevo registro
            int idNuevo = obtenerID(request);
            objestudiante.setId(idNuevo);
            lista.add(objestudiante);
        } else {
            //edicion de registro
            int pos = buscaPorIndice(request, id);
            lista.set(pos, objestudiante);
            
        }
        request.setAttribute("listaestudiante", lista);
        response.sendRedirect("index.jsp");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public int buscaPorIndice(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaestudiante");
        // ele= es elemento
        int pos = -1;
        if (lista != null) {
            for (Estudiante ele : lista) {
                ++pos;
                if (ele.getId() == id) {
                    break;
                }
            }
        }
        return pos;
    }
    
    public int obtenerID(HttpServletRequest request) {
        HttpSession ses = request.getSession();
        
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaestudiante");

//buscar el ultimo id
        int idm = 0;
        
        for (Estudiante ele : lista) {
            idm = ele.getId();
        }
        
        return idm + 1;
        
    }
}
