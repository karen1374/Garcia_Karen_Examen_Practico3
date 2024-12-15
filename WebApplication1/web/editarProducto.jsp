<%-- 
    Document   : editarProducto
    Created on : 15/12/2024, 10:45:50 AM
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
            padding-top: 50px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        h3 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-primary, .btn-danger {
            width: 48%;
            margin-top: 20px;
        }
    </style>
    
    
    <%
    int idProducto = Integer.parseInt(request.getParameter("idProducto"));
    String nombre = "";
    String descripcion = "";
    double precioUnitario = 0.0;
    int stock = 0;

    // Obtener los datos del producto seleccionado
    try {
        PreparedStatement ps = conexion.prepareStatement("SELECT * FROM producto WHERE idProducto = ?");
        ps.setInt(1, idProducto);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            nombre = rs.getString("nombre");
            descripcion = rs.getString("descripcion");
            precioUnitario = rs.getDouble("precioUnitario");
            stock = rs.getInt("stock");
        }
    } catch (SQLException e) {
        out.println("<p>Error al obtener el producto: " + e.getMessage() + "</p>");
    }
%>

<div class="container">
    <h3>Editar Producto</h3>
    <form action="editarProducto.jsp" method="POST">
        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" class="form-control" id="nombre" name="nombre" value="<%= nombre %>" required>
        </div>
        <div class="form-group">
            <label for="descripcion">Descripción:</label>
            <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required><%= descripcion %></textarea>
        </div>
        <div class="form-group">
            <label for="precioUnitario">Precio Unitario:</label>
            <input type="number" step="0.01" class="form-control" id="precioUnitario" name="precioUnitario" value="<%= precioUnitario %>" required>
        </div>
        <div class="form-group">
            <label for="stock">Stock:</label>
            <input type="number" class="form-control" id="stock" name="stock" value="<%= stock %>" required>
        </div>

        <input type="hidden" name="idProducto" value="<%= idProducto %>">
        <button type="submit" name="enviar" class="btn btn-primary">Guardar Cambios</button>
        <a href="vendedor.jsp" class="btn btn-danger">Cancelar</a>
    </form>
</div>

<%
    // Actualizar los datos cuando se envíe el formulario
    if (request.getParameter("enviar") != null) {
        String nuevoNombre = request.getParameter("nombre");
        String nuevaDescripcion = request.getParameter("descripcion");
        double nuevoPrecio = Double.parseDouble(request.getParameter("precioUnitario"));
        int nuevoStock = Integer.parseInt(request.getParameter("stock"));

        try {
            PreparedStatement ps = conexion.prepareStatement(
                "UPDATE producto SET nombre = ?, descripcion = ?, precioUnitario = ?, stock = ? WHERE idProducto = ?"
            );
            ps.setString(1, nuevoNombre);
            ps.setString(2, nuevaDescripcion);
            ps.setDouble(3, nuevoPrecio);
            ps.setInt(4, nuevoStock);
            ps.setInt(5, idProducto);

            ps.executeUpdate();
            response.sendRedirect("vendedor.jsp"); // Redirige de vuelta a la lista de productos
        } catch (SQLException e) {
            out.println("<p>Error al actualizar el producto: " + e.getMessage() + "</p>");
        }
    }
%>






<jsp:include page="includes/footer.jsp"/>