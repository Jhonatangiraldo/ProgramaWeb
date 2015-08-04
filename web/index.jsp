


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="objeto.*" import="java.util.Date" import="java.sql.Connection" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="encabezado.html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
        td
        {
            
            padding-top: 20px;
        }
        </style>
       
    </head>
    <body>
        <br><br><br><br><br>
      <div class="container">
	<section id="content">
            <div id="formulario">
 <!--Opcion 1-->
    <% Connection conexion = DBConexion.conexion();
    
      if (request.getParameter("nombre")!= null)
      {
           Persona persona = new Persona();
           persona.setNombre(request.getParameter("nombre"));
           persona.setCedula(Integer.valueOf(request.getParameter("cedula")));
           persona.setFacultad(Integer.valueOf(request.getParameter("facultad")));
           persona.setCarrera(Integer.valueOf(request.getParameter("carrera")));
           
           conexion.createStatement().execute("INSERT INTO tblestudiante VALUES "
                   + "( id+id, '"+persona.getNombre()+"', '"+persona.getCedula()+"')");
           ResultSet id_estudiante = conexion.createStatement().executeQuery
                ("SELECT id FROM tblestudiante ORDER BY id DESC");
           id_estudiante.next();
           conexion.createStatement().execute("INSERT INTO estudio VALUES (id+id, "
                   + " '"+persona.getFacultad()+"','"+persona.getCarrera()+"', '"+id_estudiante.getInt("id")+"')");
           %>
           <script>alert('El registro se ha completado');</script>
           <div align="center">
               <table>
                    <tr><td align="center"><h1>Datos de la persona </h1></td></tr>
                    <tr><td align="center">Nombre: <%=persona.getNombre()%></td></tr>
                    <tr><td align="center">Cedula: <%=persona.getCedula()%></td></tr>
                    <tr><td align="center">Facultad: <%=persona.getFacultad()%></td></tr>
                    <tr><td align="center">Carrera: <%=persona.getCarrera()%></td></tr>
               </table>
           </div><br><br><br>
           <div align="center"><input type="button" value="Regresar" onclick="location.href='index.jsp';"/></div>
     
  <%  }else
      {
    %>
        <div align="center">
            <form action="index.jsp" method="post">
                <table border="1">
                    <tr><th style="padding-top:10px;" align="center"><h2>Datos: </h2></th></tr>
                    <tr><td><input type="text" placeholder="Nombre" name="nombre" required/></td></tr>
                    <tr><td align="center"><input type="number" placeholder="Cedula" name="cedula" required/></td></tr>
                        
                    <tr><td align="center">
                            <select name="facultad">
                            <% ResultSet resultado = conexion.createStatement().executeQuery
                                        ("SELECT * FROM facultad");
                            while (resultado.next())
                            { 
                                out.println("<option value='"+resultado.getInt("id")+"'>"+
                                        resultado.getString("facultad")+"</option>");
                            } 
                            %>
                            </select>
                        </td></tr>
                    
                    <tr><td align="center">
                            <select name="carrera">
                            <% ResultSet resultadoC = conexion.createStatement().executeQuery
                                        ("SELECT * FROM carrera");
                            while (resultadoC.next())
                            { 
                                out.println("<option value='"+resultadoC.getInt("id")+"'>"+
                                        resultadoC.getString("carrera")+"</option>");
                            } 
                            %>
                            </select>
                        </td></tr>
                    <tr><td align="center"><input type="submit" value="Enviar"/></td><br></tr>
                </table>
             </form>
        </div>
     <!--
    -->
     <% 
 } %>
 <!--Opcion 2-->
<%/*<jsp:useBean id="persona" class="objeto.Persona" />
<jsp:setProperty name="persona" property="nombre" value="Andres" />
<jsp:setProperty name="persona" property="apellidos" value="Ospina" />

<h1>Datos de la persona:</h1>
<p>Nombre: <jsp:getProperty name="persona" property="nombre" /></p>
<p>Ciudad: <jsp:getProperty name="persona" property="apellidos" /></p>
*/
     
  
         //out.println(persona.getnombre()+" "+persona.getapellidos());
         
    /*int contador = 4;  
    for (int i=1;i<=contador;i++)
    {
        out.print("El numero actual es "+i+" <br>");
    }
        out.print("<br>");
        out.print("Finalizo!! <br>");
        Date hora = new Date();
     out.print("La hora del servidor es "
         +hora.getHours()+":"+hora.getMinutes()+":"+hora.getSeconds());*/
     %>
     
         </div>
        </section>
      </div>
        
    </body>
</html>
