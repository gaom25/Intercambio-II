<%-- 
    Document   : LogAuditoria
    Created on : 01-may-2013, 19:11:59
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>


<!DOCTYPE html>
<html>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SGI - Log Auditoria</title>

        <script language="JavaScript">
            function submitForm() { document.ObtenerDatos.submit(); }
        </script>

            <h4>Log de Auditoria</h4>
            <table style="margin: auto">
                <tr>
                    <td width="150px">
                        Usuario
                    </td>
                    <td width="220px" align="center">
                        Fecha
                    </td>
                    <td width="220px" align="center">
                        Accion
                    </td>
                </tr>
            </table>
            <logic:iterate name="usuario" id="usuarioid">
                <table border="0" style="margin: auto">
                    <tbody>
                        <tr>
                            <td width="150px">
                                <bean:write name="usuarioid" property="nombreusuario" />
                            </td>
                            <td align="center" width="220px">
                                <bean:write name="usuarioid" property="nombre" />
                            </td>
                            <td align="center" width="220px">
                                <bean:write name="usuarioid" property="confirmar" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </logic:iterate>
</html>
