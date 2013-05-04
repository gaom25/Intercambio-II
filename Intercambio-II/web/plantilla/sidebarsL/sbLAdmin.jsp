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
        <html:link style="color:#126598" action="/accionesAdmin">
            Inicio
        </html:link>
    </div>

    <div class="nav">
       <a href="#" style="color:#126598" onclick="if (document.getElementById('GestionDeUsuarios').style.display=='none') 
               show('GestionDeUsuarios'); else hide('GestionDeUsuarios');">+ Gestion De Usuarios</a>
    </div>

    <div class="submenu" id="GestionDeUsuarios" style=" background-color:#FFFFFF ;margin-left: 5px; padding-left: 3px"> 
        <div>
            <html:link style="color:#126598" action="/agregUsuario">
                Agregar Usuario
            </html:link>
        </div>
        <div>
            <html:link style="color:#126598" action="/ListarUsuarios">
                Consultar Usuarios
            </html:link>
        </div>
    </div>

    <div style="margin-top: 5px;padding-right:5px">
        <html:link style="color:#126598" action="/modPerfilAdm">
            Modificar perfil
        </html:link>
    </div>
    <br/>
     <div style="margin-top: 5px;padding-right:5px">
        <html:link style="color:#126598" action="/Anuncios">
            Anuncios
        </html:link>
    </div>
    <br/>
    <div>
        <html:link style="color:#126598" action="/LogAuditoria">
            Log de Auditoría
        </html:link>
    </div>
    
    <div style="height:20px"></div>
    <div>
        <html:link style="color:#126598" action="/CerrarSesion">
            Cerrar sesión
        </html:link>
    </div>
    
</html:html>