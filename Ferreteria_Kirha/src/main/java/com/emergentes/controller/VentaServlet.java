
package com.emergentes.controller;

import com.emergentes.bean.BeanVenta;
import com.emergentes.bean.BeanProducto;
import com.emergentes.bean.BeanPedido;
import com.emergentes.entidades.Producto;
import com.emergentes.entidades.Pedido;
import com.emergentes.entidades.Venta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JHONASSENPAI
 */
@WebServlet(name = "VentaServlet", urlPatterns = {"/VentaServlet"})
public class VentaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        BeanPedido daoPedido = new BeanPedido();
        BeanProducto daoProducto = new BeanProducto();
        BeanVenta daoVenta = new BeanVenta();
        Venta ven = new Venta();
        List<Producto> lista;
        List<Pedido> listass;
        
        String action =(request.getParameter("action")!=null)? request.getParameter("action") : "view";
        
        switch(action){
            case "add":
                lista = daoProducto.listarTodos();
                listass = daoPedido.listarTodos();
                request.setAttribute("productos", lista);
                request.setAttribute("pedidos", listass);
                request.setAttribute("venta", ven);
                request.getRequestDispatcher("venta-edit.jsp").forward(request, response);
                break;
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                ven=daoVenta.buscar(id);
                lista = daoProducto.listarTodos();
                listass = daoPedido.listarTodos();
                request.setAttribute("productos", lista);
                request.setAttribute("pedidos", listass);
                request.setAttribute("venta", ven);
                request.getRequestDispatcher("venta-edit.jsp").forward(request, response);
                break;
            case "dele":
                id = Integer.parseInt(request.getParameter("id"));
                daoVenta.eliminar(id);
                response.sendRedirect("VentaServlet");
                break;
            case "view":
                List<Venta> vens = daoVenta.listarTodos();
                request.setAttribute("ventas", vens);
                request.getRequestDispatcher("ventas.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeanPedido daoPedido = new BeanPedido();
        BeanProducto daoProducto = new BeanProducto();
        BeanVenta daoVenta = new BeanVenta();
         
        int id = Integer.parseInt(request.getParameter("id"));
        int cantidad =Integer.parseInt(request.getParameter("cantidad"));
        int Producto_id = Integer.parseInt(request.getParameter("producto_id"));
        int Pedido_id = Integer.parseInt(request.getParameter("pedido_id"));
        
        Producto prod = daoProducto.buscar(Producto_id);
        Pedido ped = daoPedido.buscar(Pedido_id);
        
        Venta ven = new Venta();
        ven.setIdVentas(id);
        ven.setCantidad(cantidad);
        ven.setProductoId(prod);
        ven.setPedidoId(ped);
        
        if (id > 0){
            daoVenta.editar(ven);
        }
        else{
            daoVenta.insertar(ven);
        }
        response.sendRedirect("VentaServlet");
    }

}
