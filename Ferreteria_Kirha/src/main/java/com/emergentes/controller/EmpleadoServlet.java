
package com.emergentes.controller;

import com.emergentes.bean.BeanEmpleado;
import com.emergentes.entidades.Empleado;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EmpleadoServlet", urlPatterns = {"/EmpleadoServlet"})
public class EmpleadoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        BeanEmpleado daoEmpleado = new BeanEmpleado();
        Empleado em = new Empleado();
        
        String action =(request.getParameter("action")!=null)? request.getParameter("action") : "view";
        
        switch(action){
            case "add":
                request.setAttribute("empleado", em);
                request.getRequestDispatcher("empleado-edit.jsp").forward(request, response);
                break;
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                em=daoEmpleado.buscar(id);
                request.setAttribute("empleado", em);
                request.getRequestDispatcher("empleado-edit.jsp").forward(request, response);
                break;
            case "dele":
                id = Integer.parseInt(request.getParameter("id"));
                daoEmpleado.eliminar(id);
                response.sendRedirect("EmpleadoServlet");
                break;
            case "view":
                List<Empleado> lista = daoEmpleado.listarTodos();
                request.setAttribute("empleados", lista);
                request.getRequestDispatcher("empleados.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeanEmpleado daoEmpleado = new BeanEmpleado();
         
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre =request.getParameter("nombre");
        int ci = Integer.parseInt(request.getParameter("ci"));
        String direccion =request.getParameter("direccion");
        String cargo =request.getParameter("cargo");
        
        Empleado em = new Empleado();
        em.setIdEmpleado(id);
        em.setNombreEmp(nombre);
        em.setCi(ci);
        em.setDireccion(direccion);
        em.setCargo(cargo);
        
        if (id > 0){
            daoEmpleado.editar(em);
        }
        else{
            daoEmpleado.insertar(em);
        }
        response.sendRedirect("EmpleadoServlet");
    }

}
