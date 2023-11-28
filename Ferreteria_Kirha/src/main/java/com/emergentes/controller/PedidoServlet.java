
package com.emergentes.controller;

import com.emergentes.bean.BeanCliente;
import com.emergentes.bean.BeanPedido;
import com.emergentes.bean.BeanEmpleado;
import com.emergentes.entidades.Cliente;
import com.emergentes.entidades.Pedido;
import com.emergentes.entidades.Empleado;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PedidoServlet", urlPatterns = {"/PedidoServlet"})
public class PedidoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        BeanPedido daoPedido = new BeanPedido();
        BeanCliente daoCliente = new BeanCliente();
        BeanEmpleado daoEmpleado = new BeanEmpleado();
        Pedido ped = new Pedido();
        List<Cliente> lista;
        List<Empleado> listass;
        
        String action =(request.getParameter("action")!=null)? request.getParameter("action") : "view";
        
        switch(action){
            case "add":
                lista = daoCliente.listarTodos();
                listass = daoEmpleado.listarTodos();
                request.setAttribute("clientes", lista);
                request.setAttribute("empleados", listass);
                request.setAttribute("pedido", ped);
                request.getRequestDispatcher("pedido-edit.jsp").forward(request, response);
                break;
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                ped=daoPedido.buscar(id);
                lista = daoCliente.listarTodos();
                listass = daoEmpleado.listarTodos();
                request.setAttribute("clientes", lista);
                request.setAttribute("empleados", listass);
                request.setAttribute("pedido", ped);
                request.getRequestDispatcher("pedido-edit.jsp").forward(request, response);
                break;
            case "dele":
                id = Integer.parseInt(request.getParameter("id"));
                daoPedido.eliminar(id);
                response.sendRedirect("PedidoServlet");
                break;
            case "view":
                List<Pedido> peds = daoPedido.listarTodos();
                request.setAttribute("pedidos", peds);
                request.getRequestDispatcher("pedidos.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeanPedido daoPedido = new BeanPedido();
        BeanCliente daoCliente = new BeanCliente();
        BeanEmpleado daoEmpleado = new BeanEmpleado();
         
        int id = Integer.parseInt(request.getParameter("id"));
        int montototal =Integer.parseInt(request.getParameter("montototal"));
        Date fecha = new Date(System.currentTimeMillis());
        int cliente_id = Integer.parseInt(request.getParameter("cliente_id"));
        int empleado_id = Integer.parseInt(request.getParameter("empleado_id"));
        
        Cliente clie = daoCliente.buscar(cliente_id);
        Empleado emp = daoEmpleado.buscar(empleado_id);
        
        Pedido ped = new Pedido();
        ped.setIdPedido(id);
        ped.setMontoTotal(montototal);
        ped.setFecha(fecha);
        ped.setClienteId(clie);
        ped.setEmpleadoId(emp);
        
        if (id > 0){
            daoPedido.editar(ped);
        }
        else{
            daoPedido.insertar(ped);
        }
        response.sendRedirect("PedidoServlet");
    }

}
