
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            background-image:url("imagen/Fondo.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        a{
            color: white !important;
            font-size: 30px;
        }
        .boton {
            display: inline-block;
            padding: 6px;
            width: 200px;
            color:black;
            font-size: 20px;
            text-align: center;
            text-decoration: none;
            border-radius: 16px;
        }
        h1{
            color: white !important;
        }
        .inicio{
            background-color:black;
            opacity: 90%;
            text-align: center;

        }
        inicio{
            background-color:black;
            opacity: 90%;
            text-align: center;
            color: white !important;
            font-size: 40px;
        }
        a:hover{
            background-color:bisque;
            transition: background-color .5s;
            style: black;
        }
        header .textos {
            color: black !important;
            margin-top: 100px;
            text-align: center;
        }
        header .titulo {
            color: black !important;
            font-size: 85px;
            text-align: center;
        }
        header .subtitulo {
            font-size: 42px;
            font-weight: 300;
            margin-bottom: 32px;
        }
        .contenedor {
            width: 90%;
            max-width: 650px;
            margin: auto;
            padding: 52px 0;

        }
    </style>
    <body>
        <div class="inicio" id="inicio_id">
            <h1 class="inicios">Ferreteria Kirha</h1>
            <a href="CategoriaServlet"class="boton">Categorias</a>
            <a href="ClienteServlet"class="boton">Clientes</a>
            <a href="EmpleadoServlet"class="boton">Empleados</a>
            <a href="ProveedorServlet"class="boton">Proveedores</a>
            <a href="ProductoServlet"class="boton">Productos</a>
            <a href="PedidoServlet"class="boton">Pedidos</a>
            <a href="VentaServlet"class="boton">Ventas</a>
        </div>
        <header>
            <div class="textos">
                <h1 class="titulo">!BIENVENIDO¡</h1>
                <h3 class="subtitulo">LA MEJOR MEJOR FERRETERIA CON TODOS LO QUE NESECITAS ¡</h3>
            </div>
            <div class="sesgoabajo"></div>
            <div class="contenedor">
                <img src="imagen/Logo.jpg" alt=""/>
            </div>
        </header>
    </body>
</html>
