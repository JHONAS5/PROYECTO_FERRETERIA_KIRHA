<%@page import="com.emergentes.entidades.Cliente"%>
<%
    Cliente clie = (Cliente) request.getAttribute("cliente");
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
        <form action="ClienteServlet" method="post"class="form">
            <input type="hidden" name="id" value="<%= clie.getIdCliente()%>">
            <div class="form-header">
                <h1>Registro de Cliente</h1>
            </div>
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" name="apellido" class="form-input" value="<%= clie.getApellidoCli()%>" placeholder="Escriba El Apellido" required>
            <table>
                <th width="100%"><input type="submit" class="btn save" value="Guardar"></th>
                <th><input type="button" onclick="history.back()" class="btn cancel" name="Cancelar" value="Cancelar"></th>
            </table> 
        </form>
        </div>
    </body>
</html>
