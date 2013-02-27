<%-- 
    Document   : datoserrados
    Created on : 25-oct-2012, 18:41:52
    Author     : gustavo
--%>

<%@page pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ page import="nl.captcha.Captcha" %>

<html:html lang="true">

    <title>Sistema de Gesti&oacute;n de Intercambio</title>


    <h4></h4>
    <h6>Usuario/contraseña inválidos, por favor inténtelo nuevamente</h6>
    <div id="login-form">
        <html:form action="Login">
            <table>
                <tr>
                    <td> Login </td>
                    <td><html:text name="Usuario" property="nombreusuario" size="14"
                               errorStyleClass="error" errorKey="org.apache.struts.action.ERROR"></html:text>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><html:errors property="nombreusuario"/></td>
                </tr>
                <tr>
                    <td> Password </td>
                    <td><html:password name="Usuario" property="contrasena" value="" size="14"
                                   errorStyleClass="error" errorKey="org.apache.struts.action.ERROR" ></html:password>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><html:errors property="contrasena"/></td>
                </tr>
            </table>

            <div  style="position: relative; height: 120px; bottom: -10px;">
                <div id="Imagencita" style="height: 75px;">
                    <img src="/Intercambio-II/stickyImg"/>
                    <br><br>
                    <div>
                        <a href="javascript:history.go(0)">Click para cambiar captcha</a>
                    </div>
                </div>
                <br><br>
                <div>
                    Captcha <input name="answer" />
                </div>
            </div>

            <br><br>
            <html:submit value = "Login"> Login</html:submit>   
        </html:form>
        <html:link action="reccontra">¿Olvid&oacute; su contraseña?</html:link><br />
    </div>

    <br /><br />
    <div align="center" > 
        <html:link action="preRegistro">
            ¿No tiene una cuenta?<br />
            Preregistrese.
        </html:link>
    </div>

    <div class="espacio" style="height:90px">

    </div>

</html:html>