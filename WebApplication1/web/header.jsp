<%-- 
    Document   : header
    Created on : 14/12/2024, 01:16:46 PM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Header Centrado</title>
        <style>
          
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }
            header {
                display: flex;
                justify-content: center; 
                align-items: center;
                background-color: #89A8B2; 
                color: white;
                padding: 10px 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            }
            .header-content {
                display: flex;
                align-items: center;
            }
            .logo {
                height: 86px; 
                margin-right: 15px;
            }
            .nombre-empresa {
                font-size: 24px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <header>
            
            <div class="header-content">
                
                <img src="img/ballena.png" alt="Logo de la Empresa" class="logo"> <!--logo de la empresa -->
                
                
                <div class="nombre-empresa">TecnoZone</div> 
            </div>
        </header>
        
