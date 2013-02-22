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
        <html:link style="color:#126598" action="/accionesPostulante">
            Inicio
        </html:link>
    </div>
    
     <div class="nav">
           <a href="#" style="color:#126598" onclick="if (document.getElementById('GestionDeEstudiantes').style.display=='none') 
            show('GestionDeEstudiantes'); else hide('GestionDeEstudiantes');">+ Gestion De Estudiantes</a>
     </div>
    
    <div class="submenu" id="GestionDeEstudiantes" style=" background-color:#FFFFFF; display: none; margin-left: 15px"> 
        <div>
            <html:link style="color:#126598" action="/AgregarEstudiantes">
                Agregar Estudiante
            </html:link>
        </div>
        <div>
            <html:link style="color:#126598" action="/ListarEstudiantes">
                Consultar Estudiantes
            </html:link>
        </div>
    </div>

    <div style="margin-top: 5px;padding-right:5px">
        <html:link style="color:#126598" action="/modPerfilAdm">
            Modificar perfil
        </html:link>
    </div>
    <div style="margin-top: 5px;padding-right:5px">
        <html:link style="color:#126598" action="/contactoCoord">
            Contactenos 
        </html:link>
    </div>
    <div style="height:20px"></div>
    <div>
        <html:link style="color:#126598" action="/CerrarSesion">
            Cerrar sesion
        </html:link>
    </div>
</html:html>
