<%-- 
    Document   : acciones
    Created on : Oct 17, 2012, 8:03:13 PM
    Author     : Tesseract Systems
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>
    <title>SGI - Agregar Usuario</title>

    <body onload ="clearForms()" onunload="clearForms()">

        <h4>Creaci&oacute;n de Nuevo Usuario</h4>
        <h5>Porfavor introduzca los datos del nuevo usuario.</h5>

        <html:form action="/AccionAgregarUsuario"  method="POST" enctype="multipart/form-data" onsubmit="return(this)">
            <table border="0" >
                <tbody>
                    <tr>
                        <td style="color: black">Usuario</td>
                        <td>
                            <html:text name="Usuario" property="nombreusuario" maxlength="20" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                            </td>
                            <td>
                            <html:errors property="nombreusuario" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Email</td>
                        <td>
                            <html:text name="Usuario" property="email" maxlength="30" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                            </td>
                            <td>
                            <html:errors property="email" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Nombre Completo</td>       
                        <td><html:text name="Usuario" property="nombre" maxlength="100" errorStyleClass="error"
                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                            </td>
                            <td>
                            <html:errors property="nombre" />
                        </td>
                    </tr>
                    <tr>
                        <td style="color: black">Privilegios</td>
                        <td><html:select  property="privilegio">
                                <html:option value="2">Decanato</html:option>
                                <html:option value="2">DRIC</html:option>
                                <html:option value="3">Coordinación</html:option>
                                <html:option value="4">Universidad Extranjera</html:option>
                                <html:option value="5">Estudiante USB</html:option>
                                <html:option value="6">Estudiante Extranjero</html:option>
                            </html:select>
                        </td>
                    </tr>
                </tbody>
            </table>

            <p style="text-align: center">
                <html:submit onclick="javascript: return confirm('¿Está seguro que los datos son correctos?')">
                    Agregar Usuario
                </html:submit>
            </p>
        </html:form>

    </body>
</html>
