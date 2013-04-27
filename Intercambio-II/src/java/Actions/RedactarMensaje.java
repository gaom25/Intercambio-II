/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Anuncio;
import Clases.Correo;
import Clases.HiloCorreo;
import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        HiloCorreo c2 = new HiloCorreo(a);


        HttpSession session = request.getSession();

        String[] emails = a.getEmails();
        ArrayList<String> pasaje = new ArrayList<String>(Arrays.asList(emails));
        int i;
        //las cosas estan malas pues apararece un "/" al final de cada correo
        for (i = 0; i < emails.length; i++) {
            System.out.println(pasaje.get(i));
        }

        if (DBMS.getInstance().agregarAnuncio(a)) {
            c2.start();
            Usuario obj = (Usuario) session.getAttribute("Usuario");
            boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(), "Envio del anuncio " + a.getTitulo() + "a los usuarios seleccionados");
            return mapping.findForward(SUCCESS);
        }
        return mapping.findForward("error");

    }
}
