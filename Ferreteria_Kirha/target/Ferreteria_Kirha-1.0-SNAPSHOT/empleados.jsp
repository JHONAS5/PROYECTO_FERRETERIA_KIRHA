<%@page import="com.emergentes.entidades.Empleado"%>
<%@page import="java.util.List"%>
<%
    List<Empleado> empleados = (List<Empleado>) request.getAttribute("empleados");
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
        <h1>Listado de Empleados</h1>
        <table class="container1">
            <th><p><a href="EmpleadoServlet?action=add" class="btn fourth">NUEVO</a></p></th>
            <th><a href="index.jsp"class="btn fourth">VOLVER</a></th>
        </table>
        <table class="container1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>CI</th>
                <th>Direccion</th>
                <th>Cargo</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
            <%
                for(Empleado item: empleados){
            %>
            <tr>
                <td><%= item.getIdEmpleado()%></td>
                <td><%= item.getNombreEmp()%></td>
                <td><%= item.getCi()%></td>
                <td><%= item.getDireccion()%></td>
                <td><%= item.getCargo()%></td>
                <td><a href="EmpleadoServlet?action=edit&id=<%= item.getIdEmpleado()%>"><i class="fa-solid fa-pen-to-square"></i></a></td>
                <td><a href="EmpleadoServlet?action=dele&id=<%= item.getIdEmpleado()%>" onclick="return(confirm('Esta seguro?'))"><i class="fa-solid fa-trash-can"></i></a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
