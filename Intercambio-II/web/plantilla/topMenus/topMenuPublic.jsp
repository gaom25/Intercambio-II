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
        <nav>
            <html:link action="Welcome">&nbsp;&nbsp;Español&nbsp;&nbsp; </html:link>
            <html:link action="englishWelcome"> &nbsp;&nbsp;English&nbsp;&nbsp;</html:link>
        </nav>
    </div>
</div>