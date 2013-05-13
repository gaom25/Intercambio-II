<%-- 
    Document   : sbLGestor
    Created on : 29-nov-2012, 10:29:36
    Author     : kosmos
--%>
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
        <a style="border-bottom: none;" ><html:link styleClass="menuitem" action="ListarEstudiantesPostulados">Inicio</html:link></a>
        
        <a class="menuitem submenuheader">Gestión de usuarios </a>
        <div class="submenu">
            <ul>
                <li><a> <html:link action="/AgregarUsuarios">Agregar usuario</html:link></a></li>
                <li><a> <html:link action="/ListarUsuarios">Consultar usuarios</html:link></a></li>
            </ul>
        </div>
        
         <a style="border-bottom: none;"> <html:link styleClass="menuitem" action="/modPerfilAdm">Modificar perfil</html:link></a>
         <a style="border-bottom: none;"> <html:link styleClass="menuitem" action="/contactoGestor">Contáctenos</html:link></a>
         <a style="border-bottom: none;"> <html:link styleClass="menuitem" action="/BusquedaAvanzada"> Búsqueda Avanzada</html:link></a>
         <a style="border-bottom: none;"> <html:link styleClass="menuitem" action="/CerrarSesion">Cerrar sesión</html:link></a>
    </div>
         
</html:html>