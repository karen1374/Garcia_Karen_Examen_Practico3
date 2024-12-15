<%-- 
    Document   : eliminar
    Created on : 15/12/2024, 11:15:27 AM
    Author     : Karen
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp"/>
<%@include file="conexion.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">


<%
    // Obtener el idProducto desde la URL
    int idProducto = Integer.parseInt(request.getParameter("idProducto"));

    // Procesar la eliminación cuando se envía el formulario
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            PreparedStatement ps = conexion.prepareStatement("DELETE FROM producto WHERE idProducto = ?");
            ps.setInt(1, idProducto);
            ps.executeUpdate();
            // Redirigir a vendedor.jsp después de eliminar el producto
            response.sendRedirect("vendedor.jsp");
            return; // Detiene la ejecución del JSP aquí mismo
        } catch (Exception e) {
            out.println("<p>Error al eliminar el producto: " + e.getMessage() + "</p>");
        }
    }
%>    

<hr>
<div class="container">
    <h2 class="text-center">Eliminar Producto</h2>
    <form method="POST" action="eliminarProducto.jsp?idProducto=<%= idProducto %>" onsubmit="return confirmarEliminacion();">
        <div class="form-group">
            <p class="text-center"><strong>ID del Producto a eliminar:</strong> <%= idProducto %></p>
            <div class="text-center">
                <!-- Botón de eliminar con confirmación -->
                <input type="submit" name="Submit" class="btn btn-danger" value="Confirmar Eliminación">
                <!-- Botón de cancelar -->
                <a href="vendedor.jsp" class="btn btn-secondary">Cancelar</a>
            </div>
        </div>
    </form>
</div>

<!-- Script para confirmar eliminación -->
<script>
    function confirmarEliminacion() {
        return confirm("¿Estás seguro de que deseas eliminar este producto?");
    }
</script>


 <jsp:include page="includes/footer.jsp"/>