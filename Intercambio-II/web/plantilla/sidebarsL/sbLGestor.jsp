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
        <html:link action="/accionesGestor">
            Inicio
        </html:link>
    </div>
    
    
     <div class="nav">
           <a href="#" onclick="if (document.getElementById('GestionDeUsuarios').style.display=='none') 
            show('GestionDeUsuarios'); else hide('GestionDeUsuarios');">+ Gestion De Usuarios</a>
     </div>
    
    <div class="submenu" id="GestionDeUsuarios" style="display: none; margin-left: 15px"> 
        <div>
            <html:link action="/AgregarUsuarios">
            Agregar Usuario
            </html:link>
        </div>
        <div>
            <html:link action="/ListarUsuarios">
            Consultar Usuarios
            </html:link>
        </div>
        <div>
            <html:link action="/ListarPreregistro">
            Consultar PreRegistro
            </html:link>
        </div>
    </div>
    
    <div style="margin-top: 5px;padding-right:5px">
        <html:link action="/ListarEstudiantesPostulados">
            Consultar Estudiantes Postulados
        </html:link>
    </div>
    <div style="margin-top: 5px;padding-right:5px">
        <html:link action="">
            Modificar perfil
        </html:link>
    </div>
    <div style="margin-top: 5px;padding-right:5px">
        <html:link action="/contactoGestor">
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
