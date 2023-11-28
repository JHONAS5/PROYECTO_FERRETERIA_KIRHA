<%@page import="com.emergentes.entidades.Proveedor"%>
<%@page import="com.emergentes.entidades.Producto"%>
<%@page import="com.emergentes.entidades.Categoria"%>
<%@page import="java.util.List"%>
<%
    Producto prod = (Producto) request.getAttribute("producto");
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
    List<Proveedor> proveedores = (List<Proveedor>) request.getAttribute("proveedores");
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
        <form action="ProductoServlet" method="post" class="form">
            <input type="hidden" name="id" value="<%= prod.getIdProducto() %>">
            <div class="form-header">
                <h1>Registro de Producto</h1>
            </div>
                <label for="descripcion" class="form-label">Descripcion:</label>
                <input type="text" name="descripcion" class="form-input" value="<%= prod.getDescripcion()%>" placeholder="Escriba La Descripcion" required>

                <label for="precio" class="form-label" >Precio:</label>
                <input type="text" name="precio"  class="form-input" value="<%= prod.getPrecio() %>" required>

                <label for="disponible" class="form-label" >Disponible:</label>
                <input type="checkbox"  name="disponible" value="0" <%= (prod.getDisponible()== 0)? "checked":""%>> No Disponible
                <input type="checkbox"  name="disponible" value="1" <%= (prod.getDisponible() == 1)? "checked":""%>> Disponible
                <h6>´</h6>
                <label for="disponible" class="form-label" >Categoria:</label>
                <select name="categoria_id" class="form-input" required>
                    <%
                        for(Categoria item: categorias){
                    %>
                        <option value="<%= item.getIdCategoria()%>"<%= (item.getIdCategoria()== prod.getCategoriaId().getIdCategoria())? "selected":""%>>
                            <%= item.getDescripcion()%>
                        </option>
                    <%
                        }
                    %>
                </select>
                
                <label for="proveedor_id" class="form-label" >Proveedor:</label>
                <select name="proveedor_id" class="form-input" required>
                    <%
                        for(Proveedor itemm: proveedores){
                    %>
                        <option value="<%= itemm.getIdProveedor()%>"<%= (itemm.getIdProveedor()== prod.getProveedorId().getIdProveedor())? "selected":""%>>
                            <%= itemm.getNombreProv()%>
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
