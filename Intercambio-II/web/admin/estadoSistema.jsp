<%-- 
    Document   : estadoSistema
    Created on : 27-abr-2013, 10:19:44
    Author     : gustavo
--%>

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
    <div>
        Actualmente el sistema se encuentra <bean:write name="usuario" property="confirmar"></bean:write>
    </div>
</html>
