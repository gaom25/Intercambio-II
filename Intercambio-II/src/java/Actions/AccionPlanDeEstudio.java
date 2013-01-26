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
public class AccionPlanDeEstudio extends Action {
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // aqui recibimos el plan de estudio puesto en el form
        PlanDeEstudio plan = (PlanDeEstudio) form;
        String nom = plan.getNombreUsuario();
        
        //Obtenermos los arraylist de cada uno de los campos para el plan de
        //estudio de un estudiante
        
        ArrayList codiusb = plan.getListCodigoUSB();
        ArrayList crediusb = plan.getListCreditoUSB();
        ArrayList nomusb = plan.getListMateriaUSB();
        ArrayList codiuni = plan.getListCodigoUniv();
        ArrayList crediuni = plan.getListCreditoUniv();
        ArrayList nomuni = plan.getListMateriaUniv();
        
        /*Imprimimos los tamaños de cada arralista para saber si la informacion
         se esta pasando correctamente*/
        System.out.println(codiusb.size());
        System.out.println(crediusb.size());
        System.out.println(nomusb.size());
        System.out.println(codiuni.size());
        System.out.println(crediuni.size());
        System.out.println(nomuni.size());
        System.out.println(nom);
        
        /*Llamamos a la funcion para que guarde en la base de datos el plan
         de estudio de un estudiante*/
        if(!DBMS.getInstance().InsertarPlan(plan)){
            
            System.out.println("Falloooooo");
        }
        
        return mapping.findForward("success");
    }
    
}
