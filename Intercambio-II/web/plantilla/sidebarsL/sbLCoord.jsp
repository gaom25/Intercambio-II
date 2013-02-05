<%-- 
    Document   : sbLCoord
    Created on : Nov 29, 2012, 12:01:05 AM
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
        <html:link action="/accionesPostulante">
            <a style="color:#126598">Inicio</a>
        </html:link>
    </div>
    
     <div class="nav">
           <a href="#" style="color:#126598" onclick="if (document.getElementById('GestionDeEstudiantes').style.display=='none') 
            show('GestionDeEstudiantes'); else hide('GestionDeEstudiantes');">+ Gestion De Estudiantes</a>
     </div>
    
    <div class="submenu" id="GestionDeEstudiantes" style=" background-color:#FFFFFF; display: none; margin-left: 15px"> 
        <div>
            <html:link action="/AgregarEstudiantes">
                <a style="color: #126598">Agregar Estudiante</a>
            </html:link>
        </div>
        <div>
            <html:link action="/ListarEstudiantes">
                <a style="color: #126598">Consultar Estudiantes</a>
            </html:link>
        </div>
    </div>

    <div style="margin-top: 5px;padding-right:5px">
        <html:link action="">
            <a style="color: #126598">Modificar perfil</a>
        </html:link>
    </div>
    <div style="margin-top: 5px;padding-right:5px">
        <html:link action="/contactoCoord">
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
