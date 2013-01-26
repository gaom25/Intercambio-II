<%-- 
    Document   : llenadoplanillaincorrecto
    Created on : 02-dic-2012, 11:45:01
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exito</title>
    </head>
    <body>
        <h1>Los Datos ingresados no son correctos, por favor revise y vuelve a llenar la solicitud</h1>
        <html:link action="formularioUSB">
            Continuar
        </html:link>
    </body>
</html>
