<%-- 
    Document   : listarUsuario
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

            <h4>Lista de Usuarios del Sistema:</h4>
            <table style="margin: auto">
                <tr>
                    <td width="220px">
                        Nombre
                    </td>
                    <td width="150px" align="center">
                        Ver Usuario
                    </td>
                    <td width="150px" align="center">
                        Modificar Usuario
                    </td>
                    <td width="150px" align="center">
                        Eliminar Usuario
                    </td>
                </tr>
            </table>
            <logic:iterate name="usuario" id="usuarios">
                <table border="0" style="margin: auto">
                    <tbody>
                        <tr>
                            <td width="220px">
                                <bean:write name="usuarios" property="nombreusuario" />
                            </td>
                            <td align="center" width="150px">
                                <html:form action="/ConsultarUsuario2" onsubmit="return(this)">
                                    <html:hidden name = "usuarios" property="nombreusuario"/>
                                    <html:image src="images/verDatos.png" styleClass="button" value="" property="" style=""/> 
                                </html:form>
                            </td>
                            <td align="center" width="150px">
                                <html:form action="/ObtenerDatos" onsubmit="return(this)">
                                    <html:hidden name = "usuarios" property="nombreusuario"/>
                                    <html:image src="images/document-edit.png" styleClass="button" value="" property="" /> 
                                </html:form>
                            </td>
                            <td align="center" width="150px">
                                <html:form action="/EliminarUsuario" onsubmit="return(this)">
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