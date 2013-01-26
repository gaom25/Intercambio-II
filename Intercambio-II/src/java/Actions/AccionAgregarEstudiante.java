/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Correo;
import Clases.EstudianteUSB;
import DBMS.*;
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
public class AccionAgregarEstudiante extends org.apache.struts.action.Action {

    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "failure";
    private static final String ERROR = "error";
    private Pattern patron;
    private Matcher match;

    public AccionAgregarEstudiante() {
        patron = Pattern.compile(patronEmail);
    }

    public boolean validate(final String username) {

        match = patron.matcher(username);
        return match.matches();
    }

    /**
     * AccionAgregarEstudiante This is the action called from the Struts
     * framework.
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

        EstudianteUSB e = (EstudianteUSB) form;
        ActionErrors error = new ActionErrors();
        boolean huboError = false;
        String pswd = e.generarContrasena();
        String confPswd = pswd;
        String mail = e.getEmail();

        e.setPrivilegio(5);


        e.setContrasena(pswd);
        e.setConfirmar(confPswd);

        if (e.getNombreusuario().equals("")) {
            error.add("nombreusuario", new ActionMessage("error.nombreusuario.required"));
            saveErrors(request, error);
            huboError = true;
        }

        if (e.getNombre().equals("")) {
            error.add("nombres", new ActionMessage("error.nombre.required"));
            saveErrors(request, error);
            huboError = true;
        }

        if (e.getApellidos().equals("")) {
            error.add("apellidos", new ActionMessage("error.apellidos.required"));
            saveErrors(request, error);
            huboError = true;
        }

        System.out.println();

        String tmp = e.getNombre();
        e.setNombre(e.getNombre() + " " + e.getApellidos());
        // Si hubo error lo notifica, si no, procede a agregar en la BD.
        if (huboError) {
            return mapping.findForward(ERROR);

        } else if (DBMS.getInstance().agregarUsuario(e)) {

            e.setNombre(tmp);
            if (DBMS.getInstance().agregarEstudiante(e)) {

                Correo c = new Correo();
                String asunto = "Su usuario en el Sistema de Gestión de Intercambios ha sido creado";
                String mensaje = "Su usuario en el Sistema de Gestión de Intercambios ha sido creado."
                        + "\nSu usuario es: " + e.getNombreusuario()
                        + "\nSu clave de acceso temporal es: " + e.getContrasena();
                c.setAsunto(asunto);
                c.setMensaje(mensaje);
                boolean correoEnviado = c.enviarUsuario(e.getEmail());

                if (correoEnviado) {
                    return mapping.findForward(SUCCESS);
                } else {
                    return mapping.findForward(FAIL);
                }
            }

        } else {
            return mapping.findForward(FAIL);
        }
        
        return null;
    }
}
