<%-- 
    Document   : sbGestUsuarios
    Created on : Nov 15, 2012, 12:16:02 AM
    Author     : kosmos
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html:html>

    <script language="javascript">
        function show(target){
            document.getElementById(target).style.display = 'block';
        }

        function hide(target){
            document.getElementById(target).style.display = 'none';
        }
    </script>

    <div style="margin-top: 5px;padding-right:5px">
        <html:link action="/accionesEstUSB">
            <a style="color:#126598">Inicio</a>
        </html:link>
    </div>

    <div class="nav">
       <a style="color:#126598" onclick="if (document.getElementById('GestionDeSolicitudes').style.display=='none') 
               show('GestionDeSolicitudes'); else hide('GestionDeSolicitudes');">+ Gestion De Solicitudes</a>
    </div>

    <div class="submenu" id="GestionDeSolicitudes" style="background-color:#FFFFFF; display: none; margin-left: 15px"> 
        <div>
            <html:link action="/CargarLlenarPlanillaUSB">
                <a style="color: #126598">Llenar Formulario</a>
            </html:link>
        </div>
        <div>
            <html:link action="">
                <a style="color: #126598">Modificar Formulario</a>
            </html:link>
        </div>
        <div>
            <html:link action="">
                <a style="color: #126598">Consultar Estado de Solicitud</a>
            </html:link>
        </div>
        <div>
            <html:link action="">
                <a style="color: #126598">Generar Planilla</a>
            </html:link>
        </div>
    </div>

    <div style="margin-top: 5px;padding-right:5px">
        <html:link action="/modificarperUSB">
            <a style="color: #126598">Modificar perfil</a>
        </html:link>
    </div>
    <div style="margin-top: 5px;padding-right:5px">
        <html:link action="/contactoEstUSB">
            <a style="color: #126598">Contactenos </a>
        </html:link>
    </div>
    <div style="height:20px"></div>
    <div>
        <html:link action="/CerrarSesion">
            <a style="color: #126598">Cerrar sesion</a>
        </html:link>
    </div>
</html:html>
