<%-- 
    Document   : acciones
    Created on : Oct 17, 2012, 8:03:13 PM
    Author     : dycicle Systems
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>

    <title>SGI - Pre-Registro de Usuario</title>


    <body onload ="clearForms()" onUnload="clearForms()">

        <h4>Preregistro de un Nuevo Usuario</h4>
        <h5>Por favor introduzca los datos del nuevo usuario.</h5>
        <div>
            <html:form action="/PreRegistroUsuario"  method="POST" enctype="multipart/form-data" onsubmit="return(this)">
                <table border="0" >
                    <tbody>
                        <tr>
                            <td style="color: black">Usuario</td>
                            <td>
                                <html:text name="Usuario" property="nombreusuario" maxlength="20" value="" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <html:errors property="nombreusuario" />
                            </td>
                        </tr>

                        <tr>
                            <td style="color: black">Email</td>
                            <td>
                                <html:text name="Email" property="email" maxlength="30" value="" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <html:errors property="email" />
                            </td>
                        </tr>

                        <tr>
                            <td style="color: black">Nombre Completo</td>       
                            <td><html:text name="Nombre" property="nombre" maxlength="100" value="" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <html:errors property="nombre" />
                            </td>
                        </tr>
                        <tr hidden="true">
                            <td style="color: black">Sector</td>
                            <td><html:select  property="privilegio">
                                    <html:option value="1">Decanato</html:option>
                                    <html:option value="1">DRIC</html:option>
                                    <html:option value="2">Coordinación</html:option>
                                    <html:option value="2">Universidad Extranjera</html:option>
                                </html:select>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div  style="position: relative; height: 120px; bottom: -10px;width: 500px; left: 290px">
                    <div id="Imagencita" style="height: 75px;width: 300px">
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
                <br>
                <p style="text-align: center">
                    <html:submit onclick="javascript: return confirm('¿Está seguro que los datos son correctos?')">
                        Preregistrar Usuario
                    </html:submit>
                </p>
            </html:form>
        </div>
    </body>

</html>
