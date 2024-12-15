<%-- 
    Document   : altaProductos
    Created on : 14/12/2024, 05:10:21 PM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="includes/header.jsp"/>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding-top: 50px;
        }

        .container {
            max-width: 600px;
            margin-top: 50px;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h3 {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-primary {
            width: 100%;
            padding: 10px;
            font-size: 1.2em;
            background-color: #007bff;
            border: none;
            margin-top: 20px;
        }

        .btn-primary:hover {
            opacity: 0.8;
        }

        .back-btn {
            width: 100%;
            padding: 10px;
            font-size: 1.2em;
            background-color: #dc3545;
            border: none;
            margin-top: 10px;
        }

        .back-btn:hover {
            opacity: 0.8;
        }

        .form-control, .form-control:focus {
            border-radius: 0.375rem;
            border: 1px solid #ccc;
        }

        textarea.form-control {
            height: 120px;
        }
    </style>
    
    
    <div class="container">
    <h3>Ingresar Producto</h3>
    <form action="ingresarProducto.jsp" method="POST">
        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" class="form-control" id="nombre" name="nombre" required>
        </div>
        <div class="form-group">
            <label for="descripcion">Descripción:</label>
            <textarea class="form-control" id="descripcion" name="descripcion" rows="4" required></textarea>
        </div>
        <div class="form-group">
            <label for="precioUnitario">Precio Unitario:</label>
            <input type="number" class="form-control" id="precioUnitario" name="precioUnitario" required>
        </div>
        <div class="form-group">
            <label for="stock">Stock:</label>
            <input type="number" class="form-control" id="stock" name="stock" required>
        </div>
        <button type="submit" class="btn btn-primary">Guardar Producto</button>
        <a href="vendedor.jsp" class="btn back-btn">Cancelar</a>
    </form>
</div>

    <jsp:include page="includes/footer.jsp"/>