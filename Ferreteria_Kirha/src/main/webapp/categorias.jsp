<%@page import="com.emergentes.entidades.Categoria"%>
<%@page import="java.util.List"%>
<%
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="CSSS/lista.css">
    <body style="background-image: url(imagen/Fondo1.jpg);">
        <h1>Listado de categorias</h1>
        <table class="container1">
            <tr>
                <th><a href="CategoriaServlet?action=add" class="btn fourth">NUEVO</a></th>
                <th><a href="index.jsp"class="btn fourth">VOLVER</a></th>
            </tr>
        </table>
        <table class="container1">
            <tr>
                <th>Id</th>
                <th>Descripcion</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
            <%
                for(Categoria item: categorias){
            %>
            <tr>
                <td><%= item.getIdCategoria()%></td>
                <td><%= item.getDescripcion() %></td>
                <td><a href="CategoriaServlet?action=edit&id=<%= item.getIdCategoria()%>"><i class="fa-solid fa-pen-to-square"></i></a></td>
                <td><a href="CategoriaServlet?action=dele&id=<%= item.getIdCategoria()%>" onclick="return(confirm('Esta seguro?'))"><i class="fa-solid fa-trash-can"></i></a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
