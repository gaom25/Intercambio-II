<%-- 
    Document   : accionesPostulante
    Created on : Nov 13, 2012, 3:48:59 PM
    Author     : dreabalbas
--%>
<%Object var = session.getAttribute("nombre");
    Object var2 = session.getAttribute("nombreusuario");%>
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
        <a hidden="true"> <%=var2.toString()%> </a>
    </div>
    <p hidden="true"><bean:write name="Usuario" property="nombre"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="email"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="nombreusuario"></bean:write></p>

        <h4 align ="center">Postulante</h4>
        <h5 align ="center">¿Qu&eacute; desea hacer?</h5>

    <html:link action="/AgregarEstudiantes">
        <p align ="center">Agregar Estudiante</p>
    </html:link>
        <div align="center">
        <html:form action="/ListarEstudiantes">
            <html:hidden name="Usuario" property="nombreusuario" value="<%=var2.toString()%>"/>
            <html:submit style=";">Consultar Estudiantes</html:submit>
        </html:form> 
    </div>
</html:html>