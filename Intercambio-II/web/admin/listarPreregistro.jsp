<%-- 
    Document   : listarPreregistro
    Created on : Oct 18, 2012, 12:58:41 AM
    Author     : caponte
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SGI - Listar Usuarios</title>

    <script language="JavaScript">
        function submitForm() { document.ObtenerDatos.submit(); }
    </script>

    <h4>Lista de Usuarios Preregistrados en el Sistema:</h4>
    <table>
        <tr>
            <td width="220px">
                Nombre
            </td>
            <td width="150px" align="center">
                Aceptar Usuario
            </td>
            <td width="150px" align="center">
                Ver Preregistro
            </td>
            <td width="150px" align="center">
                Eliminar Usuario
            </td>
        </tr>
    </table>
    <logic:iterate name="usuario" id="usuarios">
        <table border="0">
            <tbody>
                <tr>
                    <td width="220px">
                        <bean:write name="usuarios" property="nombreusuario" />
                    </td>
                    <td align="center" width="150px">
                        <html:form action="/AceptarPreregistro" onsubmit="return(this)">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <html:image src="images/user_accept.png" style="width:32px;height:32px" styleClass="button" value="" property="" /> 
                        </html:form>
                    </td>
                    <td align="center" width="150px">
                        <html:form action="/ConsultarPreregistro" onsubmit="return(this)">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <html:image src="images/view_data.png" style="width:32px;height:32px" styleClass="button" value="" property="" /> 
                        </html:form>
                    </td>
                    <td align="center" width="150px">
                        <html:form action="/EliminarPreregistro" onsubmit="return(this)">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <a onclick="javascript: return confirm('Seguro Que Deses Elmininar Este Usuario?')">
                                <html:image src="images/trashcan-delete.png" styleClass="button" value="" property="" /> 
                            </a>
                        </html:form>
                    </td>
                </tr>
            </tbody>
        </table>
    </logic:iterate>
</html>
