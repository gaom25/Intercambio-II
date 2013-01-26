/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.*;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/**
 *
 * @author gustavo
 */
public class AcccionPlanDeEstudio extends Action {
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // aqui recibimos el archivo puesto en el form
        Usuario user = new Usuario();
        PlanDeEstudio plan = (PlanDeEstudio) form;
        String nom = plan.getNombreUsuario();
        
        ArrayList codiusb = plan.getListCodigoUSB();
        ArrayList crediusb = plan.getListCreditoUSB();
        ArrayList nomusb = plan.getListMateriaUSB();
        ArrayList codiuni = plan.getListCodigoUniv();
        ArrayList crediuni = plan.getListCreditoUniv();
        ArrayList nomuni = plan.getListMateriaUniv();
        for(int i = 0; i < codiusb.size();i++){
            System.out.println(codiusb.get(i)+"-"+crediusb.get(i)+"-"+nomusb.get(i)+"-"+
                    codiuni.get(i)+"-"+crediuni.get(i)+"-"+nomuni.get(i));
        }
        /*if(!DBMS.getInstance().InsertarIdioma(idioma)){
            
            System.out.println("Falloooooo");
        }*/
        
        return mapping.findForward("success");
    }
    
}
