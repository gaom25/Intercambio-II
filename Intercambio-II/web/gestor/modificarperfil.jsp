<%-- 
    Document   : ModificarPerfil
    Created on : 11-nov-2012, 10:45:40
    Author     : gustavo
--%>
<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/Intercambio-II/css/estilo.css">
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>

    <title>SGI - Modificar Perfil</title>

    <h4>Modificaci&oacute;n de Datos de Usuario</h4>
    <h5>Actualice sus datos</h5>

    <html:form action="/ModificarPerfil" onsubmit="return(this)">
        <table border="0">
            <tbody>
                <tr>
                    <td>Usuario </td>
                    <td><html:text disabled="true" name="Usuario" property="nombreusuario"  errorStyleClass="error"
                               errorKey="org.apache.struts.action.ERROR"></html:text></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <html:errors property="nombreusuario" />
                    </td>
                </tr>
                <tr>
                    <td>E-mail</td>

                    <td><html:text name="Usuario" property="email"  errorStyleClass="error"
                               errorKey="org.apache.struts.action.ERROR"></html:text></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <html:errors property="email" />
                    </td>

                </tr>
                <tr>
                    <td>Nombre Completo</td>
                    <td><html:text name="Usuario" property="nombre" maxlength="100"  errorStyleClass="error"
                               errorKey="org.apache.struts.action.ERROR"></html:text></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <html:errors property="nombre" />
                    </td>
                </tr>
                <tr>
                    <td>Contraseña Actual</td>
                    <td><html:password name="Usuario" value="" property="contrasena" maxlength="100"  errorStyleClass="error"
                                   errorKey="org.apache.struts.action.ERROR"></html:password></td>
                </tr>
                <tr>
                    <td style="width: 100px;" colspan="2">
                        <html:errors property="contrasena" />
                    </td>
                </tr>
                <tr>
                    <td>Contraseña Nueva</td>
                    <td><html:password name="Usuario" value="" property="nuevacontra" maxlength="100" errorStyleClass="error"
                                   errorKey="org.apache.struts.action.ERROR"></html:password></td>
                </tr>
                <tr>
                    <td style="width: 100px;" colspan="2">
                        <html:errors property="nuevacontra" />
                    </td>
                </tr>
                <tr>
                    <td>Confirmar Nueva Contraseña</td>
                    <td><html:password name="Usuario" value="" property="confirmar" maxlength="100"  errorStyleClass="error"
                                   errorKey="org.apache.struts.action.ERROR"></html:password></td>
                </tr>
                <tr>
                    <td style="width: 100px;" colspan="2">
                        <html:errors property="confirmar" />
                    </td>
                </tr>
            </tbody>
        </table>
        <p style="text-align: center"><html:submit>Modificar Perfil</html:submit></p>
    </html:form>
</html>
