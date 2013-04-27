<%-- 
    Document   : listarDestinatarios
    Created on : 26-abr-2013, 22:13:44
    Author     : gustavo
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

    <table style="margin: auto" border=1>
        <tr>
            <td width="150px" align="center">
                Nombre
            </td>
            <td width="220px" align="center">
                Email
            </td>
            <td width="150px" align="center">
                Destinatario
            </td>

        </tr>


        <html:form action="/SeleccionarDestinatarios" method="POST" enctype="multipart/form-data" onsubmit="return(this)">

            <logic:iterate name="usuarios" id="usuarios">


                <tr>
                    <td align="center" width="150px">
                        <bean:write name="usuarios" property="nombre" />
                        <input type="hidden" name="op1" value=<bean:write name="usuarios" property="nombreusuario" />/>

                    </td>

                    <td align="center" width="220px">
                        <bean:write name="usuarios" property="email" />
                        <input type="hidden" name="op2" value=<bean:write name="usuarios" property="email"></bean:write>/>
                    </td>

                    <td align="center" width="150px">
                        <html:select name="SuperArray" property="op3"><html:option value=""></html:option><html:option value="Enviar">Enviar</html:option></html:select> 

                    </td>

                </tr>


            </logic:iterate>
        </table>
        <p style="text-align: center"><html:submit>Redactar Mensaje</html:submit></p>
    </html:form>

</html>
