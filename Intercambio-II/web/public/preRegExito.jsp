<%-- 
    Document   : preRegExito
    Created on : 03-dic-2012, 22:05:20
    Author     : kosmos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>

    <title>Exito</title>


    <div style="text-align: center;">
        <h1>El pre-registro fue enviado</h1>
        
        <html:image src="images/correct.png" /> 
        <br />
        
        <html:link action="Welcome">
            Continuar
        </html:link>
    </div>


</html>
