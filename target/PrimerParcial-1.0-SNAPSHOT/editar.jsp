<%@page import="com.emergentes.Estudiante"%>
<%
Estudiante reg = (Estudiante) request.getAttribute("miobjestudiante");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        .centrado {
            width: 400px; /* Tamaño del cuadrado */
            height: 100px; /* Tamaño del cuadrado */
            margin: 0 auto; /* Centra horizontalmente */
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid black; /* Borde del cuadrado */
        }
        .cen {
            width: 500px; /* Tamaño del cuadrado */
            height: 110px; /* Tamaño del cuadrado */
            margin: 0 auto; /* Centra horizontalmente */
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid black; /* Borde del cuadrado */
        }
        .but {
            width: 55px; /* Tamaño del cuadrado */
            height: 25px; /* Tamaño del cuadrado */
            margin: 0 auto; /* Centra horizontalmente */
            display: flex;
            justify-content: center;
            align-items: center;
            border: 1px solid black; /* Borde del cuadrado */
            box-shadow: 1px 1px 2px;
        }
        h1 {
            
            text-align: center; /* Centra horizontalmente el texto */
        }
    </style>
    </head>
    <body>
        <div class="centrado">PRIMER PARCIAL TEM-742 <br>
            Nombre: Maribel Carola Choque Torrez<br>
            Carnet: 10930634
        </div>
        <h1>Registro de calificaciones</h1>
        
        <form action="MainServlet" method="post" >
            <fieldset style="width: 50%" class="cen">
            <table >
                <tr style="display: none;">
                    <td>ID</td>
                    <td><input type="text" name="id" value="<%=reg.getId() %>" size="2" readonly></td>
                </tr>
                <tr>
                    <td>Nombre del estudiante</td>
                    <td><input type="text" name="nombre" value="<%=reg.getNombre() != null ? reg.getNombre() :"" %>" placeholder="nombre"></td>
                </tr><!-- comment -->
                <tr>
                    <td>Primer parcial (sobre 30 pts)</td>
                    <td><input type="number" name="P1"  value="<%=reg.getP1() %>" max="30" placeholder="P1" ></td>
                </tr>
                <tr>
                    <td>Segundo parcial (sobre 30 pts)</td>
                    <td><input type="number" name="P2"  value="<%=reg.getP2() %>" max="30" placeholder="P2" ></td>
                </tr>
                <tr>
                    <td>Examen final (sobre 40 pts)</td>
                    <td><input type="number" name="P3" value="<%=reg.getP3() %>" max="40" placeholder="P3" ></td>
                </tr>
                
                   
                </tr>
            </table>
        </fieldset> 
                <br>   <input type="submit" value="Enviar" class="but">      
    </body>
</html>
