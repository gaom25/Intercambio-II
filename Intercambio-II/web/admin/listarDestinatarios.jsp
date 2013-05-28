<%-- 
    Document   : listarDestinatarios
    Created on : 26-abr-2013, 22:13:44
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SGI - Listar Usuarios</title>
    <script  src="/Intercambio-II/css/jquery.js"></script>
    <script  src="/Intercambio-II/css/jquery.tablePagination.0.5.js"></script>
    <script language="JavaScript">
        function submitForm() { document.ObtenerDatos.submit(); }
        function altRows(id){
            if(document.getElementsByTagName){  

                var table = document.getElementById(id);  
                var rows = table.getElementsByTagName("tr"); 

                for(i = 0; i < rows.length; i++){          
                    if(i % 2 == 0){
                        rows[i].className = "evenrowcolor";
                    }else{
                        rows[i].className = "oddrowcolor";
                    }      
                }
            }
        }
        $(document).ready(function() {
            $('table').tablePagination({});
        } );
        window.onload=function(){
            altRows('alternatecolor');
        }
    </script>

    <h4>Lista de Usuarios del Sistema:</h4>
    <div align="center"><html:link style="text-decoration: underline;font-weight: bold" action="/BuscarDestinatarios">Volver</html:link></div>
    <br>
    <div id="testTable">
        <table  style="margin: auto" class="altrowstable" id="alternatecolor" >
            <thead>
                <tr>
                    <th width="150px" align="center">
                        <b>Nombre</b>
                    </th>
                    <th width="220px" align="center">
                        <b>Email</b>
                    </th>
                    <th width="150px" align="center">
                        <b>Destinatario</b>
                    </th>
                </tr>
            </thead>

            <html:form action="/SeleccionarDestinatarios" method="POST" enctype="multipart/form-data" onsubmit="return(this)">

                <logic:iterate name="usuarios" id="usuarios">


                    <tr>
                        <td align="center" width="150px">
                            <bean:write name="usuarios" property="nombre" />
                            <input type="hidden" name="op1" value=<bean:write name="usuarios" property="nombreusuario" />/>

                        </td>

                        <td align="center" width="220px">
                            <bean:write name="usuarios" property="email" />
                            <input type="hidden" name="op2" value=<bean:write name="usuarios" property="email"></bean:write>/>
                        </td>

                        <td align="center" width="150px">
                            <html:select name="SuperArray" property="op3"><html:option value=""></html:option><html:option value="Enviar">Enviar</html:option></html:select> 

                        </td>

                    </tr>


                </logic:iterate>
            </table>
        </div>
        <p style="text-align: center;clear: both;position: relative;"><html:submit>Redactar Mensaje</html:submit></p>
    </html:form>

</html>
