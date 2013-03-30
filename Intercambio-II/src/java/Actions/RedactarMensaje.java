/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;
import Clases.Anuncio;
import Clases.Correo;
import DBMS.DBMS;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author gustavo
 */
public class RedactarMensaje extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Anuncio a = (Anuncio) form;
        Correo c = new Correo();
        
        System.out.println(a.getTitulo());
        System.out.println(a.getMensaje());
        String[] emails = a.getEmails();
        ArrayList<String> pasaje = new ArrayList<String>(Arrays.asList(emails));
        int i;
        //las cosas estan malas pues apararece un "/" al final de cada correo
        for(i=0;i<emails.length;i++){
            System.out.println(pasaje.get(i));
        }
        
        if(DBMS.getInstance().agregarAnuncio(a)){
            c.enviarAnuncio(pasaje);
            return mapping.findForward(SUCCESS);
        }
        return mapping.findForward("error");
        
    }
}
