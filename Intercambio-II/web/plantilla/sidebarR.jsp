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
    <div id="sidebarR" style="width:250px; height: 400px">
        
        <div id="google_translate_element" style="margin-left: 75px">
        </div>
                <script type="text/javascript">
                    function googleTranslateElementInit() {
                        new google.translate.TranslateElement({pageLanguage: 'es', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
                    }
                </script>
                <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">
                </script>  
        
                <br>        
        <div style="margin-left: 100px">
            <html:link href="http://www.usb.ve/">
                <img width="150" height="50" src="/Intercambio-II/images/somosusb.gif">
            </html:link>
        </div>
        <br>
        <div style="margin-left: 100px">
            <html:link href="http://www.internacionales.dsm.usb.ve/">
                <img width="150" height="50" src="/Intercambio-II/images/DRIC.jpg">
            </html:link>
        </div>
        <br>
        
        <div id="twitterInt" > 
        <a class="twitter-timeline" height="300" href="https://twitter.com/IntercambioUSB" data-widget-id="317086117033811968"> </a>
        <script>!function(d,s,id){
            var js,fjs=d.getElementsByTagName(s)[0];
            if(!d.getElementById(id)){js=d.createElement(s);
                js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}
        }(document,"script","twitter-wjs");
        </script>

    </div>   
    </div>
    
    
</html>
