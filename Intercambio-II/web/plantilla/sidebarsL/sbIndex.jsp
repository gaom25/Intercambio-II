<%-- 
    Document   : sbIndex
    Created on : Nov 14, 2012, 11:53:40 PM
    Author     : kosmos
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html:html>
    <div id="twitterInt" style="width: 240px"> 
        <a style="font-size: 1.4em; font-weight: bold; text-decoration: underline"  href="/Intercambio-II/">Inicio</a>
        <br><br>
        <a class="twitter-timeline" height="300" href="https://twitter.com/IntercambioUSB" data-widget-id="317086117033811968"> </a>
        <script>!function(d,s,id){
            var js,fjs=d.getElementsByTagName(s)[0];
            if(!d.getElementById(id)){js=d.createElement(s);
                js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}
        }(document,"script","twitter-wjs");
        </script>

    </div> 
</html:html>
