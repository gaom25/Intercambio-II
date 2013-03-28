<%-- 
    Document   : redactarmensaje
    Created on : 28-mar-2013, 14:37:52
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
    <html:form action="/RedactarMensaje" method="POST" enctype="multipart/form-data" onsubmit="return(this)">
        <div>
            Asunto
        </div>
        
        <html:text name="Anuncio" property="titulo" value=""/>
        <br/>

        
        <logic:iterate id="usuarios" name="usuarios">  
            <input type="hidden" name="emails" value=<bean:write name="usuarios" property="email" />/>
            
        </logic:iterate>   

        <div>
            Mensaje
        </div>
        <html:textarea name="Anuncio" property="mensaje"/>
        
         <p style="text-align: center"><html:submit>Enviar Mensaje</html:submit></p>
    </html:form>
</html>
