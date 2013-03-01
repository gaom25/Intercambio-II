/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.*;
import DBMS.DBMS;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/**
 *
 * @author caponte
 */
public class VerificarPlanillaUSB extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String ERROR = "error";

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

        Usuario u = (Usuario) form;
        ActionErrors error = new ActionErrors();
        boolean huboError = false;

        Clases.PlanillaUSB p = DBMS.getInstance().obtenerPlanillaUSB(u);

        String nom = u.getNombreusuario();
        String filePath =
                getServlet().getServletContext().getRealPath("/") + "Documentos/" + nom;


        // HACER AQUI LAS VALIDACIONES, PARA LUEGO REENVIAR A MODIFICAR PLANILLA
        // PARA QUE LLENEN LOS DATOS FALTANTES

//##### ##### ##### ##### VERIFICACION DATOS PERSONALES #### ##### ##### ##### 
        if (p != null) {
//            if (p.getApellido1().equals("")) {
//                error.add("apellidos", new ActionMessage("error.apellidos.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }

            //Verifica que los nombres no  esten vacios.
//            if (p.getNombre1().equals("")) {
//                error.add("nombres", new ActionMessage("error.nombres.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }

//            if (p.getSexo().equals("")) {
//                error.add("sexo", new ActionMessage("error.sexo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }

            // Calle no  vacio.
//            if (p.getCalle().equals("")) {
//                error.add("calle", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//
//            // Ciudad no  vacio.
//            if (p.getCiudad().equals("")) {
//                error.add("ciudad", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//            // Estado no  vacio.
//            if (p.getEstado().equals("")) {
//                error.add("estado", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//            // CodPostal no  vacio.
//            if (p.getCodPostal().equals("")) {
//                error.add("CodPostal", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//            // Telefono Celular no  vacio.
//            if (p.getTelefonoCelular().equals("")) {
//                error.add("telefonoCelular", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//            // Telefono Casa no  vacio.
//            if (p.getTelefonoCasa().equals("")) {
//                error.add("telefonoCasa", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//
//            //Verifica que el email no sea vacio y que este estructurado correctamente.
//            if (p.getFax().equals("")) {
//                error.add("fax", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//
//            //Verifica que el email no sea vacio y que este estructurado correctamente.
//            if (p.getEmail().equals("")) {
//                error.add("email", new ActionMessage("error.email.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//            //Verifica que la nacionalidad.
//            if (p.getNacionalidad().equals("")) {
//                error.add("nacionalidad", new ActionMessage("error.nacionalidad.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//
//            // Cedula no vacia y bien estructurada (solo numeros)
//            if (p.getCedula().equals("")) {
//                error.add("cedula", new ActionMessage("error.cedula.required"));
//                saveErrors(request, error);
//                huboError = true;
//            } else if (p.getCedula().matches("^[0 - 9]+")) {
//
//                error.add("cedula", new ActionMessage("error.cedula.malestructurada"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//            // Carnet no  vacio y bien estructurad0
//            if (p.getCarnet().equals("")) {
//                error.add("carnet", new ActionMessage("error.carnet.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//            // Pasaporte no  vacio.
////            if (p.getPasaporte().equals("")) {
////                error.add("pasaporte", new ActionMessage("error.pasaporte.required"));
////                saveErrors(request, error);
////                huboError = true;
////            }
//
//
////##### ##### ##### ##### FIN DATOS PERSONALES #### ##### ##### #####         
//
////##### ##### ##### VERIFICACION DATOS Representante  ##### ##### ##### 
//
//
////    private String relacion;            //db
////    private String direccionRep;        //db
//
////        if (p.getApellidoNombresRep().equals("")) {
//            //          error.add("apellidoNombresRep", new ActionMessage("error.campo.required"));
//            //        saveErrors(request, error);
//            //      huboError = true;
//            //}
//
//            if (p.getCelRep().equals("")) {
//                error.add("celRep", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//            //Verifica que el email del Representante no sea vacio y que este estructurado correctamente.
//            if (p.getEmailRep().equals("")) {
//                error.add("emailRep", new ActionMessage("error.email.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//            if (p.getRelacion().equals("")) {
//                error.add("relacion", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//            if (p.getDireccionRep().equals("")) {
//                error.add("direccionRep", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//
////##### ##### ##### ##### FIN DATOS REPRESENTANTE #### ##### ##### #####     
//
////##### ##### ##### VERIFICACION DATOS DESTINO ##### ##### ##### 
//
//
//            if (p.getNombreOpcion1().equals("")) {
//                error.add("nombreOpcion1", new ActionMessage("error.destino.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
////        if (p.getFechaIni1().equals("")) {
//            //          error.add("fechaIni1", new ActionMessage("error.campo.required"));
//            //        saveErrors(request, error);
//            //      huboError = true;
//            // }
//
//
////        if (p.getFechaFin1().equals("")) {
//            //          error.add("fechaFin1", new ActionMessage("error.campo.required"));
//            //        saveErrors(request, error);
//            //      huboError = true;
//            // }
//
//
////        if (p.getFechaIni2().equals("")) {
//            //          error.add("fechaIni1", new ActionMessage("error.campo.required"));
//            //        saveErrors(request, error);
//            //      huboError = true;
//            //}
//
////        if (p.getFechaFin2().equals("")) {
//            //          error.add("fechaFin2", new ActionMessage("error.campo.required"));
//            //        saveErrors(request, error);
//            //      huboError = true;
//            //}
//
//            if (p.getNombreOpcion2().equals("")) {
//                error.add("nombreOpcion2", new ActionMessage("error.destino.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
////##### ##### ##### ##### FIN DATOS DESTINO #### ##### ##### #####
//
////##### ##### ##### VERIFICACION DATOS ACADEMICOS ##### ##### ##### 
//
//            //    //Informacion Academica 
//
//
//            if (p.getCarrera().equals("")) {
//                error.add("carrera", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//            // Indice no  vacio 
//            if (p.getIndice().equals("")) {
//                error.add("indice", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
//
//            if (p.getOpcion().equals("")) {
//                error.add("opcion", new ActionMessage("error.campo.required"));
//                saveErrors(request, error);
//                huboError = true;
//            }
            } else {

                huboError = true;
            }


//##### ##### ##### ##### FIN DATOS ACADEMICOS #### ##### ##### #####    


            if (huboError) {
                return mapping.findForward(ERROR);

            } else {

                GeneradorPlanillas g = new GeneradorPlanillas();
                boolean ha = g.generarPlanillaUSB(p, filePath);

                if (p==null & ha & !DBMS.getInstance().InsertarPath(filePath, u)) {
                    return mapping.findForward(ERROR);
                }

                return mapping.findForward(SUCCESS);

            }
        }
    }

