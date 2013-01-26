<%-- 
    Document   : accionesPostulante
    Created on : Nov 13, 2012, 3:48:59 PM
    Author     : dreabalbas
--%>
<%Object var = session.getAttribute("nombre");%>
<%@page import="javax.swing.text.html.HTML"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<html:html lang="true">
    <title>Sistema de Gesti&oacute;n de Intercambio</title>
    <div id="Bienve">
        <h1>Bienvenido:</h1>
    </div>
    <div id="NombreUser">
        <h1><%=var.toString()%></h1>
    </div>
    <p hidden="true"><bean:write name="Usuario" property="nombre"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="email"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="nombreusuario"></bean:write></p>

        <h4 align ="center">Postulante</h4>
        <h5 align ="center">¿Qu&eacute; desea hacer?</h5>

    <html:link action="AgregarEstudiantes">
        <p align ="center">Agregar Estudiante</p>
    </html:link>

    <html:link action="/ListarEstudiantes">
        <p align ="center">Consultar Estudiantes</p>
    </html:link> 

</html:html>