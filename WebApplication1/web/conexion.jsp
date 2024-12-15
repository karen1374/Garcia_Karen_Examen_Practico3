<%-- 
    Document   : conexion
    Created on : 14/12/2024, 12:50:29 PM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page language = "java" import = "java.sql.*"  %>
<%
    Connection conexion = null;

    try {
        
        Class.forName("com.mysql.jdbc.Driver");

        // Establecer la conexión a la base de datos
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/bdexagarcia175", "ugarcia", "ud123");

       
        application.setAttribute("conexion", conexion);

        // Mensaje de éxito
        out.println("<p>.</p>");
    } catch (ClassNotFoundException e) {
        out.println("<p>Error: No se encontró el driver JDBC. " + e.getMessage() + "</p>");
    } catch (SQLException e) {
        out.println("<p>Error al conectar a la base de datos: " + e.getMessage() + "</p>");
    }
%>