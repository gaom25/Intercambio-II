<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Gestión de Intercambio</title>
        <html:base/>
    </head>


    <body onload ="clearForms()" onUnload="clearForms()">  

        <h4>Contáctanos</h4>
        <h5>Por favor complete el formulario a continuación.</h5>

        <div id="login-form">
            <html:form action="/EnviarCorreo"  method="POST" enctype="multipart/form-data" onsubmit="return(this)">
                <table border="0" >
                    <tbody>
                        <tr>
                            <td style="color: black">Nombre completo:</td>
                            <td>
                                <html:text name="Nombre" property="nombreRemitente" maxlength="20" value="" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>
                                <td>
                                <html:errors property="nombreRemitente" />
                            </td>
                        </tr>

                        <tr>
                            <td style="color: black">Email: </td>
                            <td>
                                <html:text name="MailRemitente" property="correoRemitente" maxlength="30" value="" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>
                                <td>
                                <html:errors property="email" />
                            </td>
                        </tr>

                        <tr>
                            <td style="color: black">Asunto: </td>       
                            <td><html:text name="Asunto" property="asunto" maxlength="100" value="" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>
                                <td>
                                <html:errors property="asunto" />
                            </td>
                        </tr>
                        <tr>
                            <td style="color: black">Mensaje: </td>
                            <td><html:textarea name="Mensaje" property="mensaje"  value="" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR" cols="30" rows="10"></html:textarea>
                            </td>
                             <td>
                                <html:errors property="mensaje" />
                            </td>
                        </tr>
                    </tbody>
                </table>

                <p style="text-align: center">
                    <html:submit onclick="javascript: return confirm('¿Está seguro que los datos son correctos?')">
                        Enviar mensaje
                    </html:submit>
                </p>
            </html:form>
        </div>
        <div class="espacio" style="height:90px">
        </div>

    </body>


</html>