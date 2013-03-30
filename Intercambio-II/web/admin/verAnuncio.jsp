<%-- 
    Document   : verAnuncio
    Created on : 29-mar-2013, 21:22:43
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <bean:write name="anuncio" property="titulo"/>
        <br/>
        <bean:write name="anuncio" property="mensaje"/>
        <br/>
        <bean:write name="anuncio" property="fecha"/>
    </body>
</html>
