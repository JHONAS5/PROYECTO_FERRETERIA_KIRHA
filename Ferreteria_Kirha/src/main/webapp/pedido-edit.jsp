<%@page import="com.emergentes.entidades.Empleado"%>
<%@page import="com.emergentes.entidades.Cliente"%>
<%@page import="com.emergentes.entidades.Pedido"%>
<%@page import="java.util.List"%>
<%
    Pedido ped = (Pedido) request.getAttribute("pedido");
    List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
    List<Empleado> empleados = (List<Empleado>) request.getAttribute("empleados");
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
        <h1>Registro de Pedido</h1>
            <form action="PedidoServlet" method="post" class="form">
                <input type="hidden" name="id" value="<%= ped.getIdPedido()%>">
                <input type="hidden" name="fecha" value="<%= ped.getFecha()%>">
                <div class="form-header">
                    <<h1>Registro de Pedido</h1>
                </div>
                    <label for="montototal" class="form-label"> Monto Total:</label>
                    <input type="text" name="montototal" class="form-input" value="<%= ped.getMontoTotal()%>" placeholder="Escriba El Monto Total" required>

                    <label for="cliente_id" class="form-label">Cliente:</label>
                        <select name="cliente_id" class="form-input" required>
                            <%
                                for(Cliente item: clientes){
                            %>
                            <option value="<%= item.getIdCliente()%>"<%= (item.getIdCliente()== ped.getClienteId().getIdCliente())? "selected":""%>>
                                <%= item.getApellidoCli()%>
                            </option>
                            <%
                                }
                            %>
                        </select>

                    <label for="empleado_id" class="form-label">Empleado:</label>
                        <select name="empleado_id" class="form-input" required>
                            <%
                                for(Empleado itemm: empleados){
                            %>
                            <option value="<%= itemm.getIdEmpleado()%>"<%= (itemm.getIdEmpleado()== ped.getEmpleadoId().getIdEmpleado())? "selected":""%>>
                                <%= itemm.getNombreEmp()%>
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
