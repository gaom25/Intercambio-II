<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<div id="top-menu">
    <!--<div style="float:left;">
        <nav>
            <html:link action="Welcome" >&nbsp;&nbsp;Inicio&nbsp;&nbsp;</html:link>
            <html:link action="faq">&nbsp;&nbsp;FAQ&nbsp;&nbsp;</html:link>
        </nav>
    </div> -->

    <div style="float:right;">
        <div id="google_translate_element"">
        </div>
                <script type="text/javascript">
                    function googleTranslateElementInit() {
                        new google.translate.TranslateElement({pageLanguage: 'es', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
                    }
                </script>
                <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">
                </script>            
    </div>


<div width="320" height="400" style="position:absolute;right:10px;top:460px;">
    <img id="imgTweet" src="/Intercambio-II/images/tuit.jpg" >
</div>
            
<div id="twitterInt" style="position:absolute;right:50px;top:530px;" > 
    <a class="twitter-timeline" width="250" height="200" href="https://twitter.com/IntercambioUSB" data-widget-id="317086117033811968"> </a>
    <script>!function(d,s,id){
        var js,fjs=d.getElementsByTagName(s)[0];
        if(!d.getElementById(id)){js=d.createElement(s);
            js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}
    }(document,"script","twitter-wjs");
    </script>
    
</div>    

<div width="320" height="400" style="position:absolute;right:10px;top:460px;">
    <img id="imgTweet" src="/Intercambio-II/images/tuit.jpg" >
</div>            
            

</div>