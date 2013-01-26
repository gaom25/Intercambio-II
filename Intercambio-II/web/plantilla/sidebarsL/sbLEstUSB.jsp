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
            Inicio
        </html:link>
    </div>
    
     <div class="nav">
           <a onclick="if (document.getElementById('GestionDeSolicitudes').style.display=='none') 
            show('GestionDeSolicitudes'); else hide('GestionDeSolicitudes');">+ Gestion De Solicitudes</a>
     </div>
    
    <div class="submenu" id="GestionDeSolicitudes" style="display: none; margin-left: 15px"> 
        <div>
            <html:link action="/CargarLlenarPlanillaUSB">
            Llenar Formulario
            </html:link>
        </div>
        <div>
            <html:link action="">
            Modificar Formulario
            </html:link>
        </div>
        <div>
            <html:link action="">
            Consultar Estado de Solicitud
            </html:link>
        </div>
        <div>
            <html:link action="">
            Generar Planilla
            </html:link>
        </div>
    </div>

    <div style="margin-top: 5px;padding-right:5px">
        <html:link action="/modificarperUSB">
            Modificar perfil
        </html:link>
    </div>
    <div style="margin-top: 5px;padding-right:5px">
        <html:link action="/contactoEstUSB">
            Contactenos
        </html:link>
    </div>
    <div style="height:20px"></div>
    <div>
        <html:link action="/CerrarSesion">
            Cerrar sesion
        </html:link>
    </div>
</html:html>
