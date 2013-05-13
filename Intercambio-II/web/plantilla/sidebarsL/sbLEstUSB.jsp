<%-- 
    Document   : sbGestUsuarios
    Created on : Nov 15, 2012, 12:16:02 AM
    Author     : kosmos
    Modified by: dreabalbas
--%>

<%Object var = session.getAttribute("nombre");%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript" src="/Intercambio-II/css/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/Intercambio-II/plantilla/sidebarsL/ddmenu.js"></script>
<script type="text/javascript">


ddmenu.init({
	headerclass: "submenuheader", 
	contentclass: "submenu", 
	collapseprev: true,
	defaultexpanded: [], 
	animatedefault: false, 
	persiststate: true, 
	toggleclass: ["", ""], 
	togglehtml: ["suffix", "<img src='/Intercambio-II/images/plus.png' class='statusicon' />", "<img src='/Intercambio-II/images/minus.png' class='statusicon' />"],
	animatespeed: "normal" 
})


</script>

<html:html>

    <div class="glossymenu" style="width: 190px">
        <a style="border-bottom: none;" ><html:link styleClass="menuitem" action="/accionesEstUSB">Inicio</html:link></a>
        
        <a class="menuitem submenuheader">Gestión de solicitudes </a>
        <div class="submenu">
            <ul>
                <li><a> <html:link action="/CargarLlenarPlanillaUSB">Llenar formulario</html:link></a></li>
                <li><a> <html:link action="/ObtenerDatos2">Modificar solicitud</html:link></a></li>
                <li><a> <html:link action="/VerificarPlanillaUSB">Generar planilla</html:link></a></li>
                <li><a> <html:link action="/GenerarCarpeta">Generar carpeta</html:link></a></li>
            </ul>
        </div>
        
        <a style="border-bottom: none;"> <html:link styleClass="menuitem" action="/modificarperUSB" >Modificar perfil</html:link></a>
         <a style="border-bottom: none;"> <html:link styleClass="menuitem" action="/contactoEstUSB">Contáctenos</html:link></a>
         <a style="border-bottom: none;"> <html:link styleClass="menuitem" action="/CerrarSesion">Cerrar sesión</html:link></a>
    </div>
    
</html:html>
