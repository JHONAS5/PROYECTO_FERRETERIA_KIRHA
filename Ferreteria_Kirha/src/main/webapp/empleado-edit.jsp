<%@page import="com.emergentes.entidades.Empleado"%>
<%
    Empleado empl = (Empleado) request.getAttribute("empleado");
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
        <form action="EmpleadoServlet" method="post" class="form">
            <input type="hidden" name="id" value="<%= empl.getIdEmpleado()%>">
            <div class="form-header">
                <h1>Registro Empleado</h1>
            </div>   
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" name="nombre" class="form-input" value="<%= empl.getNombreEmp() %>"placeholder="Escriba El Nombre" required>
                <label for="ci" class="form-label">CI:</label>
                <input type="text" name="ci" class="form-input" value="<%= empl.getCi() %>"placeholder="Escriba El CI" required>
                <label for="direccion" class="form-label">Direccion:</label>
                <input type="text" name="direccion" class="form-input" value="<%= empl.getDireccion() %>"placeholder="Escriba La Direccion" required>
                <label for="cargo" class="form-label">Cargo:</label>
                <input type="text" name="cargo" class="form-input" value="<%= empl.getCargo() %>"placeholder="Escriba El Cargo" required> 
            <table>
                <th width="100%"><input type="submit" class="btn save" value="Guardar"></th>
                <th><input type="button" onclick="history.back()" class="btn cancel" name="Cancelar" value="Cancelar"></th>
            </table> 
        </form>
        </div>
    </body>
</html>
