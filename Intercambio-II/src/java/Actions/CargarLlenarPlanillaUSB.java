/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import Clases.PlanillaUSB;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author caponte
 */
public class CargarLlenarPlanillaUSB extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String MODIFICAR = "modificar";

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

        PlanillaUSB p = (PlanillaUSB) form;

        Usuario u = new Usuario();
        u.setNombreusuario(p.getNombreUsuario());
        u.setConfirmar("2013-2014");

        Clases.PlanillaUSB hay = DBMS.getInstance().obtenerPlanillaUSB(u);

        if (hay.getNombreUsuario() != null) {
            p = DBMS.getInstance().obtenerPlanillaUSB(u);
            request.setAttribute("PlanillaUSB", p);
            return mapping.findForward(MODIFICAR);
        }

        return mapping.findForward(SUCCESS);
    }
}
