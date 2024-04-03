<%@page import="com.emergentes.Estudiante"%>
<%@page import="java.util.ArrayList"%>
<%
    
    //si devuelve null es la primera vez
    if (session.getAttribute("listaestudiante")==null){
    ArrayList<Estudiante> lisAux= new ArrayList<Estudiante> ();
    session.setAttribute("listaestudiante", lisAux);
    }
    ArrayList<Estudiante> lista = (ArrayList<Estudiante>)session.getAttribute("listaestudiante");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Estilos para la tabla */
        table {
            border: 1px solid #000;
            border-collapse: collapse;/* Colapsar los bordes de la tabla */
            width: 80%; /* Ancho de la tabla */
        }
        
        /* Estilos para las celdas de encabezado */
        th {
            border: 1px solid black; /* Borde sólido en todas las celdas de encabezado */
            padding: 8px; /* Espaciado interno */
            text-align: left; /* Alinear texto a la izquierda */
        }
        
        /* Estilos para las celdas de datos */
        td {
            border-left: 1px solid black; /* Borde izquierdo sólido en todas las celdas de datos */
            border-right: 1px solid black; /* Borde derecho sólido en todas las celdas de datos */
            padding: 8px; /* Espaciado interno */
            text-align: left; /* Alinear texto a la izquierda */
        }
        .centrado {
            width: 400px; /* Tamaño del cuadrado */
            height: 100px; /* Tamaño del cuadrado */
            margin: 0 auto; /* Centra horizontalmente */
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid black; /* Borde del cuadrado */
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
        <h1 ">Registro de calificaciones</h1>
        <a href="MainServlet?op=nuevo"><input style="box-shadow: 1px 1px 2px; " type="submit" value="Nuevo"></a>
        <br><br>
        <table >
            <tr>
                
                <th>Id</th>
                <th>Nombre</th>
                <th>P1(30)</th>
                <th>P2(30)</th>
                <th>P3(40)</th>
                <th>Nota</th>
                <th></th>
                <th></th>
            </tr>
            
            <%
            if (lista!=null){
            for(Estudiante item: lista){
                int sumaNotas = item.getP1() + item.getP2() + item.getP3();
            %>
            <tr >
                <td><%=item.getId() %></td>
                <td><%=item.getNombre() %></td>
                <td><%=item.getP1() %></td>
                <td><%=item.getP2() %></td>
                <td><%=item.getP3() %></td>
                <td><%=sumaNotas %></td>
                <td><a href="MainServlet?op=editar&id=<%=item.getId() %>">Editar</a></td>
                <td><a href="MainServlet?op=eliminar&id=<%=item.getId() %>"onclick="return(confirm('Esta suguro de eliminar?'))"  
                       >Eliminar</a></td>
                
                
            </tr>
            <%
            }
            }
            %>
            
        </table>
    </body>
</html>
