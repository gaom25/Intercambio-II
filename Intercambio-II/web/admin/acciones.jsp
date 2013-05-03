
<% Object var = session.getAttribute("nombre");
    if (var != "") {%>
<%@page import="javax.swing.text.html.HTML"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>    
<html:html>
    <title> Sistema de Gesti&oacute;n de Intercambio</title>

    <body onload ="clearForms()" onunload="clearForms()">
        <div id="Bienve">
            <h1>Bienvenido, <a ><%=var.toString()%></a> </h1>
        </div>


        <p hidden="true"><bean:write name="Usuario" property="nombre"></bean:write></p>
        <p hidden="true"><bean:write name="Usuario" property="email"></bean:write></p>
        <p hidden="true"><bean:write name="Usuario" property="nombreusuario"></bean:write></p>
            <br>
            <h4 align ="center">Administrador</h4>

            <h5 align ="center">¿Qu&eacute; desea hacer?</h5>

        <html:link action="/AgregarUsuarios">
            <p align ="center">Agregar Usuario</p>
        </html:link>

        <html:link action="/ListarUsuarios">
            <p align ="center">Consultar Usuarios</p>
        </html:link> 

        <html:link action="/ListarPreregistro">
            <p align ="center">Consultar Preregistro</p>
        </html:link> 
    </body>
</html:html>
<%} else {%>
<html>

    <title> hello</title>
</html>
<% }%>

