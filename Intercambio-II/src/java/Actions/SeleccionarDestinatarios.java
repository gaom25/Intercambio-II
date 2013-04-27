/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;
import Clases.SuperArray;
import Clases.Usuario;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author gustavo
 */
public class SeleccionarDestinatarios extends org.apache.struts.action.Action {

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
        SuperArray a = (SuperArray) form;
        ArrayList<Usuario> usuarios = new ArrayList();
        String [] names = a.getOp1();
        String [] emails = a.getOp2();
        String [] conf = a.getOp3();
        int i;
        
        for(i = 0; i< emails.length;i++){
            if(conf[i].equals("Enviar")){
                Usuario tmp = new Usuario();
                tmp.setEmail(emails[i].substring(0, emails[i].length()-1));
                tmp.setNombreusuario(names[i].substring(0, names[i].length()-1));
                usuarios.add(tmp);
            }
        
        }
        
        request.setAttribute("usuarios", usuarios);
        return mapping.findForward(SUCCESS);
    }
}
