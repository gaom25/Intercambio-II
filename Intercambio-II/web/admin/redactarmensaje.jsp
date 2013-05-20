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
        <title>Redactar mensaje</title>
    </head>
    <br><br><br>
    
    <html:form action="/RedactarMensaje" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
        <table style=" alignment-baseline: central; border:none; vertical-align: middle;width: 70%; background: #dcebe8; border: 2px solid; border-color: #96d1f8;border-radius: 5px;">
            <tr>
                <td></td>
                <td><h1 style="alignment-baseline: central">Envio de Anuncios</h3></td>
            </tr>
            <tr>
                <td>
                    <b>Asunto: </b>
                </td>
                <td>
                    <html:text name="Anuncio" property="titulo" value=""/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Destinatarios: </b>
                </td>
                <td>
                     <logic:iterate id="usuarios" name="usuarios">
                         <bean:write name="usuarios" property="nombreusuario"></bean:write><br>
                         <input type="hidden" name="emails" value=<bean:write name="usuarios" property="email"></bean:write>/>
                     </logic:iterate>   
                </td>
            </tr>
            <tr>
                <td>
                    <b>Mensaje:</b>
                </td>
                <td>
                    <html:textarea name="Anuncio" property="mensaje" rows="6" cols="30"/>
                </td>
                
            </tr>
            <tr>
                <td></td>
                <td>
                    <html:submit>Enviar Mensaje</html:submit>
                </td>
                
            </tr>
        </table>
    </html:form>
</html>
