<%-- 
    Document   : LogAuditoria
    Created on : 01-may-2013, 19:11:59
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>


<!DOCTYPE html>
<html>

    <script src="/Intercambio-II/css/jquery-1.8.2.min.js"></script>
    <script  src="/Intercambio-II/css/easypaginate.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SGI - Log Auditoria</title>

    <script type="text/javascript">
  
        jQuery(function($){ 
            $('ul#items').easyPaginate({
                step:15 
            });
        }); 
  
        function ocultar(id){
            if(document.getElementsByTagName){  

                    var table = document.getElementById(id);  
                    var rows = table.getElementsByTagName("li"); 

                    for(i = 0; i < rows.length; i++){          
                            if((rows[i].className)=="prev" || (rows[i].className)=="next" ){
                                rows[i].style.display = 'block';
                            }
                    }
            }
        }
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
        window.onload=function(){
            ocultar('pagination');
            altRows('alternatecolor');
        }
    </script>


    <h4>Log de Auditoria</h4>
    <table style="margin: auto" >
        <tr>
            <td width="150px">
                Usuario
            </td>
            <td width="220px" align="center">
                Fecha
            </td>
            <td width="220px" align="center">
                Accion
            </td>
        </tr>
    </table>
    <ul id="items" >
        <logic:iterate name="usuario" id="usuarioid">
            <li>
                <table >
                    <tr>
                        <td width="200px">
                            <bean:write name="usuarioid" property="nombreusuario" />
                        </td>
                        <td width="260px">
                            <bean:write name="usuarioid" property="nombre" />
                        </td>
                        <td width="220px">
                            <bean:write name="usuarioid" property="confirmar" />
                        </td>

                    </tr>
                </table>
            </li>
        </logic:iterate>
    </ul>


</html>
