<%-- 
    Document   : accionesEstUSB
    Created on : Nov 13, 2012, 3:48:59 PM
    Author     : dreabalbas
--%>
<%Object tmp = session.getAttribute("nombreusuario");%>
<%Object var = session.getAttribute("nombre");%>
<%@page import="javax.swing.text.html.HTML"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<title>Sistema de Gesti&oacute;n de Intercambio</title>
<html:html lang="true">

    <div id="Bienve">
        <h1>Bienvenido:</h1>
    </div>
    <div id="NombreUser">
        <h1><%=var.toString()%></h1>
    </div>

    <p hidden="true"><bean:write name="Usuario" property="nombre"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="email"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="nombreusuario"></bean:write></p>



    <h4 align ="center">Estudiante USB</h4>
    <h5 align ="center">¿Qu&eacute; desea hacer?</h5>

    <html:form  action="/CargarLlenarPlanillaUSB" method="POST" enctype="multipart/form-data" onsubmit="return(this)">
        <p hidden="true"><html:text name="PlanillaUSB" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=tmp.toString()%>"
                   errorKey="org.apache.struts.action.ERROR"></html:text></p>
            <p style="text-align: center">
            <html:submit >
                Gestionar Formulario de Solicitud
            </html:submit>
        </p>
    </html:form>

    <html:form  action="/ObtenerEstadoSolicitud" method="POST" enctype="multipart/form-data" onsubmit="return(this)">
        <p hidden="true"><html:text name="PlanillaUSB" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=tmp.toString()%>"
                   errorKey="org.apache.struts.action.ERROR"></html:text></p>
            <p style="text-align: center">
            <html:submit >
                Ver Estado de la solicitud
            </html:submit>
        </p>
    </html:form>

    <html:form  action="/ListarDocumentos" method="POST" enctype="multipart/form-data" onsubmit="return(this)">
        <p hidden="true"><html:text name="Usuario" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=tmp.toString()%>"
                   errorKey="org.apache.struts.action.ERROR"></html:text></p>
            <p style="text-align: center">
            <html:submit >
                Ver Archivos Adjuntos
            </html:submit>
        </p>
    </html:form>

    <html:form  action="/VerificarPlanillaGestor" method="POST" enctype="multipart/form-data" onsubmit="return(this)">
        <p hidden="true"><html:text name="Usuario" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=tmp.toString()%>"
                   errorKey="org.apache.struts.action.ERROR"></html:text></p>
            <p style="text-align: center">
            <html:submit >
                Verificar Planilla Gestor
            </html:submit>
        </p>
    </html:form>

    <html:form  action="/VerificarPlanillaUSB" method="POST" enctype="multipart/form-data" onsubmit="return(this)">
        <table border="0" >
            <tbody>
                <tr>
                    <td >
                        <p hidden="true"> <html:text name="Usuario" property="nombreusuario" maxlength="20" errorStyleClass="error"
                                   errorKey="org.apache.struts.action.ERROR"></html:text></p>
                        </td>
                        <td>        
                            <p style="text-align: center">
                            <html:submit onclick="javascript: return confirm('¿Está seguro que los datos son correctos?')">
                                Generar Planilla USB
                            </html:submit>
                            <html:select  property="confirmar">
                                <html:option value="2013-2014">2013-2014</html:option>
                                <html:option value="2014-1015">2014-2015</html:option>
                            </html:select>
                        </p>    
                    </td>

                </tr>
            </tbody>
        </table>
    </html:form>

</html:html>