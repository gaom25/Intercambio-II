/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;


import Clases.Busqueda;
import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/**
 *
 * @author brahyam
 */
public class AccionBusquedaAvanzada extends org.apache.struts.action.Action {
    
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "failure";
    
    
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
        Busqueda busq = (Busqueda) form;
        String priv=null;
        priv = DBMS.getInstance().getPrivilegioUsuario(busq.getNombreSolicitante());
        ArrayList<Usuario> users = DBMS.getInstance().listarBusquedaAvanzada(busq);
        request.setAttribute("usuario", users);
        
        if(priv==null){
            return mapping.findForward(FAIL);
        }
        else{
            if(priv.equals("3")){
                return mapping.findForward("postulante");
            }
            else if(priv.equals("2")){
                return mapping.findForward("gestor");
            }
            else if(priv.equals("1")){
                return mapping.findForward("admin");
                
            }
        }
        
        return mapping.findForward(FAIL);

    }
    
}
