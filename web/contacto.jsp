<%-- 
    Document   : contacto
    Created on : 4/08/2015, 11:45:37 AM
    Author     : jhonatanandres
--%>
<%@page import="objeto.Persona"%>
<%@page import="java.sql.Connection"%>
<%@page import="objeto.DBConexion"%>
<!DOCTYPE html>
<html>
    <head>
   
    </head>
<%@include file="encabezado.html"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


    <body><br><br><br><br><br>
        <div class="container">
	<section id="content">
            <% if (request.getParameter("nombre")==null)
            { %>
            <form id="formulario" action=""><br>
                <h2>Ingrese los datos</h2><br>
			<div>
				<input type="text" placeholder="Nombre" required="" name="nombre" />
                        </div><br>
			<div>
				<input type="email" placeholder="Correo" required="" name="correo" />
                        </div><br>
                        <div>
				<input type="number" placeholder="Telefono" required="" name="telefono" />
                        </div><br>
                        <div>
                            <textarea style="background: coffe;width: 190px; height: 50px;"  
                                placeholder="Mensaje" required="" name="mensaje">
                            </textarea>
                        </div><br>
			<div>
				<input type="submit" value="Enviar" />
                        </div><br>
		</form><!-- form -->
            <% } else
            { 
              Connection conexion = DBConexion.conexion();
              conexion.createStatement().execute("INSERT INTO correo VALUES (id+id,"
                      + " '"+request.getParameter("nombre")+"', '"+request.getParameter("correo")+"',"
                      + " '"+request.getParameter("mensaje")+"', '"+request.getParameter("telefono")+"')");
              %> <script>alert('Registro Guardado');
                  location.href = 'contacto.jsp';
                 </script>
            <%
            }%>
		
	</section><!-- content -->
</div><!-- container -->
    </body>
</html>
