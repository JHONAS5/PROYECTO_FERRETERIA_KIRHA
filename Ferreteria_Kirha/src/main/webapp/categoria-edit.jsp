<%@page import="com.emergentes.entidades.Categoria"%>
<%
    Categoria cate = (Categoria) request.getAttribute("categoria");
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
        <form action="CategoriaServlet" method="post"  class="form">
            <input type="hidden" name="id" value="<%= cate.getIdCategoria()%>">
            <h1>Registro categoria</h1>
            <label for="descripcion" class="form-label">Descripcion</label>
            <input type="text" name="descripcion" class="form-input" value="<%= cate.getDescripcion()%>" placeholder="Escriba La Descripcion" required>
            <table>
                <th width="100%"><input type="submit" class="btn save" value="Guardar"></th>
                <th><input type="button" onclick="history.back()" class="btn cancel" name="Cancelar" value="Cancelar"></th>
            </table> 
        </form>
    </body>
</html>
