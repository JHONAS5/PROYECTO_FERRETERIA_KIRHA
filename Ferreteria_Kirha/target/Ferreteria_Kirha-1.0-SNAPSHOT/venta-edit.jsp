<%@page import="com.emergentes.entidades.Pedido"%>
<%@page import="com.emergentes.entidades.Producto"%>
<%@page import="com.emergentes.entidades.Venta"%>
<%@page import="java.util.List"%>
<%
    Venta ven = (Venta) request.getAttribute("venta");
    List<Producto> productos = (List<Producto>) request.getAttribute("productos");
    List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link rel="stylesheet" href="CSSS/edicion.css">
    <body style="background-image: url(imagen/Fondo1.jpg);">
        <div class="contenedor">
            <form action="VentaServlet" method="post" class="form">
                <input type="hidden" name="id" value="<%= ven.getIdVentas()%>">
                <div class="form-header">
                    <h1>Registro de Venta</h1>
                </div>
                    <label for="cantidad" class="form-label">Cnatidad:</label>
                    <input type="text" name="cantidad" class="form-input" value="<%= ven.getCantidad()%>" placeholder="Escriba La Cantidad" required>

                    <label for="producto_id" class="form-label">Producto:</label>
                        <select name="producto_id" class="form-input" required>
                            <%
                                for(Producto item: productos){
                            %>
                            <option value="<%= item.getIdProducto()%>"<%= (item.getIdProducto()== ven.getProductoId().getIdProducto())? "selected":""%>>
                                <%= item.getDescripcion()%>
                            </option>
                            <%
                                }
                            %>
                        </select>

                    <label for="pedido_id" class="form-label">Pedido:</label>
                        <select name="pedido_id" class="form-input" required>
                            <%
                                for(Pedido itemm: pedidos){
                            %>
                            <option value="<%= itemm.getIdPedido()%>"<%= (itemm.getIdPedido()== ven.getPedidoId().getIdPedido())? "selected":""%>>
                                <%= itemm.getIdPedido() %>
                            </option>
                            <%
                                }
                            %>
                        </select>

                <table>
                    <th width="100%"><input type="submit" class="btn save" value="Guardar"></th>
                    <th><input type="button" onclick="history.back()" class="btn cancel" name="Cancelar" value="Cancelar"></th>
                </table> 
            </form>
        </div>
    </body>
</html>
