<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ page import="nl.captcha.Captcha" %>
<html:html lang="true">

    <title>Sistema de Gesti&oacute;n de Intercambio</title>

    <h4>Bienvenido</h4>
    <h5>Para ingresar al sistema introduzca su usuario y contraseña.</h5>
    <div id="login-form">
        <html:form action="Login">
            <table style="border: none">
                <tr style="border: none">
                    <td style="border: none"> Usuario </td>
                    <td style="border: none"><html:text name="Usuario" property="nombreusuario" size="14" value=""
                               errorStyleClass="error" errorKey="org.apache.struts.action.ERROR"></html:text>
                    </td>
                </tr>
                <tr style="border: none">
                    <td style="border: none" colspan="2"><html:errors property="nombreusuario"/></td>
                </tr>
                <tr style="border: none">
                    <td style="border: none"> Contraseña </td>
                    <td style="border: none"><html:password name="Usuario" property="contrasena" value="" size="14"
                                   errorStyleClass="error" errorKey="org.apache.struts.action.ERROR" ></html:password>
                    </td>
                </tr>
                <tr style="border: none">
                    <td style="border: none" colspan="2"><html:errors property="contrasena"/></td>
                </tr>
            </table>
            <div  style="position: relative; height: 120px; bottom: -10px;">
                <div id="Imagencita" style="height: 75px;">
                    <img src="/Intercambio-II/stickyImg"/>
                    <br/>
                        <a href="javascript:history.go(0)">Click para cambiar captcha</a>
                </div>
                <br><br>
                <div>
                    Captcha <input name="answer" />
                </div>
            </div>
                <br>
                <br>
            <html:submit value = "Login"> Login</html:submit>   
        </html:form>
        <html:link action="reccontra">¿Olvid&oacute; su contraseña?</html:link><br />
    </div>

    <br /><br />


    <div class="espacio" style="height:90px">
    </div>
    
</html:html>
