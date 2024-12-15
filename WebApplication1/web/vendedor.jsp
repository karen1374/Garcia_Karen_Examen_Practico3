<%-- 
    Document   : vendedor
    Created on : 14/12/2024, 03:12:59 PM
    Author     : Karen
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="includes/header.jsp"/>
<%@include file="conexion.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 900px;
            margin-top: 50px;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 1.8em;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .btn-primary, .btn-danger {
            width: 120px;
            padding: 8px;
            font-size: 1em;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-danger:hover, .btn-primary:hover {
            opacity: 0.8;
        }

        .btn-add {
            width: 100%;
            padding: 12px;
            font-size: 1.1em;
            margin-top: 20px;
        }
    </style>
</head>
<div class="container">
    <h2>Lista de Productos</h2>

   
    <a href="altaProductos.jsp" class="btn btn-success btn-add">Nuevo Producto</a>

    <table class="table table-striped table-bordered mt-4">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Precio Unitario</th>
                <th>Stock</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Conexión a la base de datos para obtener los productos
                PreparedStatement ps = conexion.prepareStatement("SELECT * FROM producto");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int idProducto = rs.getInt("idProducto");
                    String nombre = rs.getString("nombre");
                    String descripcion = rs.getString("descripcion");
                    double precioUnitario = rs.getDouble("precioUnitario");
                    int stock = rs.getInt("stock");
            %>
            <tr>
                <td><%= idProducto %></td> 
                <td><%= nombre %></td>
                <td><%= descripcion %></td>
                <td><%= precioUnitario %></td>
                <td><%= stock %></td>
                <td>
                    
                    <a class="btn btn-info" href="editarProducto.jsp?idProducto=<%= idProducto %>
&nombre=<%= nombre %>
&descripcion=<%= descripcion %>
&precioUnitario=<%= precioUnitario %>
&stock=<%= stock %>">Editar</a>

                    <a class="btn btn-danger" 
                       href="eliminarProducto.jsp?idProducto=<%= idProducto %>" 
                       onclick="return confirm('¿Estás seguro de que deseas eliminar este producto?');">
                       Eliminar
                    </a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>


    <jsp:include page="includes/footer.jsp"/>