<%-- 
    Document   : ingresarProducto
    Created on : 14/12/2024, 05:20:13 PM
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
<%@ include file="conexion.jsp" %> <!-- Llamada a la conexión -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">


<%
// Inicializar las variables necesarias
PreparedStatement st = null;

String nombre = request.getParameter("nombre");
String descripcion = request.getParameter("descripcion");
String precioUnitarioParam = request.getParameter("precioUnitario");
String stockParam = request.getParameter("stock");

try {
    // Convertir los parámetros numéricos a sus tipos correspondientes
    double precioUnitario = Double.parseDouble(precioUnitarioParam);
    int stock = Integer.parseInt(stockParam);

    // Sentencia SQL para ingresar datos
    String sql = "INSERT INTO producto (nombre, descripcion, precioUnitario, stock) VALUES (?, ?, ?, ?)";

    // Preparar la sentencia SQL
    st = conexion.prepareStatement(sql);

    // Asignar los valores a la sentencia SQL
    st.setString(1, nombre);
    st.setString(2, descripcion);
    st.setDouble(3, precioUnitario);
    st.setInt(4, stock);

    // Ejecutar la sentencia
    st.executeUpdate();

    // Redirigir a la página de productos (vendedor.jsp)
    response.sendRedirect("vendedor.jsp");
} catch (NumberFormatException e) {
    out.println("<p>Error: Verifica los datos numéricos (precioUnitario o stock).</p>");
} catch (SQLException e) {
    out.println("<p>Error al ejecutar la consulta SQL: " + e.getMessage() + "</p>");
} finally {
    // Asegurarse de cerrar el PreparedStatement si fue creado
    if (st != null) {
        try {
            st.close(); // Cerrar el statement
        } catch (SQLException e) {
            out.println("<p>Error al cerrar el statement: " + e.getMessage() + "</p>");
        }
    }
}
%>

 <jsp:include page="includes/footer.jsp"/>