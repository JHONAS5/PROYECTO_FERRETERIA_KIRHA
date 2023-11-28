<%@page import="com.emergentes.entidades.Cliente"%>
<%@page import="java.util.List"%>
<%
    List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
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
        <h1>Listado de Clientes</h1>
        <table class="container1">
            <th><a href="ClienteServlet?action=add" class="btn fourth">Nuevo</a></th>
            <th><a href="index.jsp"class="btn fourth">VOLVER</a></th>
        </table>
        <table class="container1">
            <tr>
                <th>Id</th>
                <th>Apellido</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
            <%
                for(Cliente item: clientes){
            %>
            <tr>
                <td><%= item.getIdCliente()%></td>
                <td><%= item.getApellidoCli()%></td>
                <td><a href="ClienteServlet?action=edit&id=<%= item.getIdCliente()%>"><i class="fa-solid fa-pen-to-square"></i></a></td>
                <td><a href="ClienteServlet?action=dele&id=<%= item.getIdCliente()%>" onclick="return(confirm('Esta seguro?'))"><i class="fa-solid fa-trash-can"></i></a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
