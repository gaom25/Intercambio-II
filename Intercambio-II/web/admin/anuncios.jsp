<%-- 
    Document   : anuncios
    Created on : 28-mar-2013, 10:53:32
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <br>
    <div>
        <html:link style="color:#126598" action="/BuscarDestinatarios">
                Redactar Anuncio
            </html:link>
    </div>
    <br>
    <table style="margin: auto">
                <tr>
                    <td width="220px">
                        Asunto
                    </td>
                    <td width="150px" align="center">
                        Fecha
                    </td>
                    <td width="150px" align="center">
                        Más información
                    </td>
                </tr>
            </table>
   <logic:iterate name="anuncios" id="anuncios">
                <table border="0" style="margin: auto">
                    <tbody>
                        <tr>
                            <td width="220px">
                                <bean:write name="anuncios" property="titulo" />
                            </td>
                            <td>
                                <bean:write name="anuncios" property="fecha" />
                            </td>
                            <td align="center" width="150px">
                                 <html:form action="/verAnuncio" onsubmit="return(this)">
                                    <html:hidden name="anuncios" property="fecha"/>
                                    <html:hidden name="anuncios" property="titulo"/>
                                    <html:image src="images/view_data.png" styleClass="button" value="" property="" style=""/> 
                                </html:form>
                            </td>
                            <%--<td align="center" width="150px">
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
                            </td>--%>
                        </tr>
                    </tbody>
                </table>
            </logic:iterate>
</html>
