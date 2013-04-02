<%-- 
    Document   : sidebarR
    Created on : Nov 14, 2012, 9:28:49 PM
    Modified by: Katy
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div id="sidebarR" style="width:150px;">
        <div>
            <html:link href="http://www.usb.ve/">
                <img width="150" height="50" src="/Intercambio-II/images/somosusb.gif">
            </html:link>
        </div>
        <div style="height:20px"></div>
        <div>
            <html:link href="http://www.internacionales.dsm.usb.ve/">
                <img width="150" height="50" src="/Intercambio-II/images/DRIC.jpg">
            </html:link>
        </div>
        <div style="height:20px"></div>
    </div>
    
    <div id="info" style="position:absolute;left:85px;top:400px;">
        <html:link action="infoImportante">
            <img width="150" height="120" src="/Intercambio-II/images/info.jpg">        
        </html:link>
    </div>
    
    
</html>
