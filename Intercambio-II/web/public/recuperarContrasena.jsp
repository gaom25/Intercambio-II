<%-- 
    Document   : recuperarContrasena
    Created on : Oct 25, 2012, 7:16:30 PM
    Author     : caponte
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html:html lang="true">

    <title>Sistema de Gesti&oacute;n de Intercambio</title>

    <h4>Bienvenido</h4>
    <h5>Para recuperar su contraseña por favor indique</h5>
    <h5>su nombre de usuario y/o e-mail:</h5>
    <div align="center">
        <html:form action="/recContrasena" onsubmit= "return(this)">
            <table>
                <tr>
                    <td> Usuario </td>
                    <td><html:text name="Usuario" property="nombreusuario" size="14"
                               errorStyleClass="error" errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><html:errors property="nombreusuario"/></td>
                </tr>

                <tr>
                    <td> E-mail</td>
                    <td><html:text name="Usuario" property="email" value="" size="14"
                               errorStyleClass="error" errorKey="org.apache.struts.action.ERROR" ></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><html:errors property="email"/></td>
                </tr>
            </table>

            <div  style="position: relative; height: 120px; bottom: -10px;">
                <div id="Imagencita" style="height: 75px;">
                    <img onloadstart="loadstart" src="/Intercambio-II/stickyImg"/>
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

            <html:submit value="Recuperar">Recuperar contraseña</html:submit>
        </html:form>



    </div>

</html:html>
