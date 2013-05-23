/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.PlanillaUSB;
import Clases.Usuario;

import DBMS.DBMS;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author caponte
 */
public class LlenarPlanilla_EstUSB extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
    private static final String patronCedula = "[0-9]+";
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private static final String ERROR = "error";
    private static final String MODIFICAR = "modificar";
    private Pattern patron;
    private Matcher match;

    public boolean validate(final String username) {
        patron = Pattern.compile(patronEmail);
        match = patron.matcher(username);
        return match.matches();
    }

    public boolean validate2(final String pat) {
        patron = Pattern.compile(patronCedula);
        match = patron.matcher(pat);
        return match.matches();
    }

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
        ActionErrors error = new ActionErrors();
        boolean huboError = false;
        boolean arre[] = new boolean[7];
        Arrays.fill(arre, false);

        // ####################################
        //        Validacion de datos.
        // ####################################

        //Verifica que los apellidos no  esten vacios.
//        PASO 1.1
        if (p.getApellido1().equals("")) {
            error.add("apellido1", new ActionMessage("error.apellidos.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        //Verifica que los nombres no  esten vacios.
        if (p.getNombre1().equals("")) {
            error.add("nombre1", new ActionMessage("error.nombres.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        if (p.getApellido2().equals("")) {
            error.add("apellido2", new ActionMessage("error.apellidos.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        //Verifica que los nombres no  esten vacios.
        if (p.getNombre2().equals("")) {
            error.add("nombre2", new ActionMessage("error.nombres.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        // Verificar escogencia de Sexo
        if (p.getSexo().contains("Seleccione")) {
            error.add("sexo", new ActionMessage("error.sexo.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        //Verifica que la nacionalidad.
        if (p.getNacionalidad().equals("")) {
            error.add("nacionalidad", new ActionMessage("error.nacionalidad.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }


        // Cedula no vacia y bien estructurada (solo numeros)
        if (p.getCedula().equals("")) {
            error.add("cedula", new ActionMessage("error.cedula.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;

        } else if (!validate2(p.getCedula())) {
            error.add("cedula", new ActionMessage("error.cedula.malestructurada"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        // Carnet no  vacio y bien estructurado
        if (p.getCarnet().equals("")) {
            error.add("carnet", new ActionMessage("error.carnet.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;

        } else if (!p.getCarnet().matches("[0-9]{2}\\-[0-9]{5}")) {
            error.add("carnet", new ActionMessage("error.carnet.malestructurado"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }


//        PASO 1.2
        // Calle no  vacio.
        if (p.getCalle().equals("")) {
            error.add("calle", new ActionMessage("error.calle.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }

        // Ciudad no  vacio.
        if (p.getCiudad().equals("")) {
            error.add("ciudad", new ActionMessage("error.ciudad.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }

        // Estado no vacio.
        if (p.getEstado().equals("")) {
            error.add("estado", new ActionMessage("error.estado.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }
        // Apartamento no vacio
        if (p.getApartamento().equals("")) {
            error.add("apartamento", new ActionMessage("error.apartamento.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }
        if (p.getEdificio().equals("")) {
            error.add("edificio", new ActionMessage("error.edificio.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }
        // Codigo postal no vacio
        if (p.getCodPostal().equals("")) {
            error.add("codPostal", new ActionMessage("error.codpostal.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }
        // urbanizacion no vacia
        if (p.getUrbanizacion().equals("")) {
            error.add("urbanizacion", new ActionMessage("error.urbanizacion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }

//        PASO 1.3
        // Verifica que el telefono celular no sea vacio
        if (p.getTelefonoCelular().equals("")) {
            error.add("telefonoCelular", new ActionMessage("error.telefono.required"));
            saveErrors(request, error);
            huboError = true;
            arre[2] = true;
        }

        // Verifica que el telefono de la casa no sea vacio
        if (p.getTelefonoCasa().equals("")) {
            error.add("telefonoCasa", new ActionMessage("error.telefonocasa.required"));
            saveErrors(request, error);
            huboError = true;
            arre[2] = true;
        }

        //Verifica que el email no sea vacio y que este estructurado correctamente.
        if (p.getEmail().equals("")) {
            error.add("email", new ActionMessage("error.email.required"));
            saveErrors(request, error);
            huboError = true;
            arre[2] = true;
        } else if (validate(p.getEmail()) == false) {
            error.add("email", new ActionMessage("error.email.malformulado"));
            saveErrors(request, error);
            huboError = true;
            arre[2] = true;
        }

        // ####################################
        //   Validacion del representante
        // ####################################

        // Verifica que los nombres y apellidos del representante no esten vacios
        if (p.getApellidosRep().equals("")) {
            error.add("apellidosRep", new ActionMessage("error.apellidosRep.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }

        if (p.getNombresRep().equals("")) {
            error.add("nombresRep", new ActionMessage("error.nombresRep.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }

        if (p.getCelRep().equals("")) {
            error.add("celRep", new ActionMessage("error.celRep.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }

        if (p.getTlfRepCasa().equals("")) {
            error.add("tlfRepCasa", new ActionMessage("error.tlfRepCasa.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }

        if (p.getRelacion().equals("")) {
            error.add("relacion", new ActionMessage("error.relacion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }

        if (p.getDireccionRep().equals("")) {
            error.add("direccionRep", new ActionMessage("error.direccionRep.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }
        //Verifica que el email del Representante no sea vacio y que este estructurado correctamente.
        if (p.getEmailRep().equals("")) {
            error.add("emailRep", new ActionMessage("error.email.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;

        } else if (validate(p.getEmailRep()) == false) {
            error.add("emailRep", new ActionMessage("error.email.malformulado"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }



//  ############### Comparar ambas fechas

//        else if ((p.getFechaI().compareTo(p.getFechaFin1())) >= 0) {
//            error.add("fechaIni1", new ActionMessage("error.fecha.orden"));
//            saveErrors(request, error);
//            huboError = true;
//        }
//
////
////
////
////// ############# Comparar ambas fechas.
////        if ((p.getFechaIni2().compareTo(p.getFechaFin2())) >= 0) {
////            error.add("fechaIni1", new ActionMessage("error.fecha.orden"));
////            saveErrors(request, error);
////            huboError = true;
////        }
//
//
//
//        // Indice no  vacio y bien estructurado
//        if (p.getIndice().equals("")) {
//            error.add("indice", new ActionMessage("error.campo.required"));
//            saveErrors(request, error);
//            huboError = true;
//        } else if (p.getCarnet().matches("[0-4]\\.[0-9]{4}|5\\.0{4}")) {
//
//            error.add("indice", new ActionMessage("error.indice.malestructurado"));
//            saveErrors(request, error);
//            huboError = true;
//        }

        Usuario u = new Usuario();
        u.setNombreusuario(p.getNombreUsuario());
        u.setConfirmar(p.getPeriodo());

        PlanillaUSB hay = DBMS.getInstance().obtenerPlanillaUSB(u);


        if (huboError) {
            String especial = "";
            for (int i = 0; i < 7; i++) {
                if (arre[i]) {
                    especial = especial + "1." + (i + 1) + " ";
                }
            }
            u.setNombre(especial);
            request.setAttribute("Usuario", u);
            return mapping.findForward(ERROR);

        } else if (hay.getNombreUsuario() != null) {

            if (DBMS.getInstance().modificarPlanillaUSB(p)) {

                boolean boo = DBMS.getInstance().registrar(p.getNombreUsuario(), "Modificacion de la Planilla por parte del estudiante nacional");
                return mapping.findForward(SUCCESS);
            } else {
                return mapping.findForward(FAIL);
            }
        } else if (DBMS.getInstance().agregarPlanillaUSB(p)) {

            boolean boo = DBMS.getInstance().registrar(p.getNombreUsuario(), "Creacion de la planilla por parte del estudiante nacional");
            return mapping.findForward(SUCCESS);

        } else {
            return mapping.findForward(FAIL);

        }
    }
}
