<%@page import="com.emergentes.entidades.Proveedor"%>
<%
    Proveedor prov = (Proveedor) request.getAttribute("proveedor");
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
        <form action="ProveedorServlet" method="post" class="form">
            <input type="hidden" name="id" value="<%= prov.getIdProveedor()%>">
            <div class="form-header">
                <h1>Registro Proveedor</h1>
            </div>
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" name="nombre" class="form-input" value="<%= prov.getNombreProv()%>" placeholder="Escriba El Nombre" required>
                <label for="telefono" class="form-label">Telefono:</label>
                <input type="text" name="telefono" class="form-input" value="<%= prov.getTelefono()%>" placeholder="Escriba El Telefono" required>
                <label for="direccion" class="form-label">Direccion:</label>
                <input type="text" name="direccion" class="form-input" value="<%= prov.getDireccion() %>" placeholder="Escriba La Descripcion" required>
            <table>
                <th width="100%"><input type="submit" class="btn save" value="Guardar"></th>
                <th><input type="button" onclick="history.back()" class="btn cancel" name="Cancelar" value="Cancelar"></th>
            </table> 
        </div>
    </body>
</html>
