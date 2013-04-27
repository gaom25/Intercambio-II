/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import Clases.Correo;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import DBMS.DBMS;
import javax.servlet.http.HttpSession;

/**
 *
 * @author caponte
 */
public class AceptarPreregistro extends org.apache.struts.action.Action {

    /* Patrones a Validar */
    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
//            "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*" + "@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "failure";
    private static final String ERROR = "error";
    private Pattern patron;
    private Matcher match;

    public AceptarPreregistro() {
        patron = Pattern.compile(patronEmail);
    }

    public boolean validate(final String username) {

        match = patron.matcher(username);
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
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Usuario u = (Usuario) form;
        String pass = u.generarContrasena();
        u.setContrasena(pass);

        if (DBMS.getInstance().aceptarPreregistro(u)) {
            
            HttpSession session = request.getSession();
            Usuario obj = (Usuario)session.getAttribute("Usuario");
            String accion = "Aceptó el preregistro del usuario " + u.getNombreusuario();
            boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(),accion);
            
            u = DBMS.getInstance().obtenerDatos(u);
            
            Correo c = new Correo();
            String asunto = "Su usuario en el Sistema de Gestión de Intercambios ha sido creado";
            String mensaje = "Su usuario en el Sistema de Gestión de Intercambios ha sido creado."
                    + "\nSu usuario es: " + u.getNombreusuario()
                    + "\nSu clave de acceso es: " + u.getContrasena();
            c.setAsunto(asunto);
            c.setMensaje(mensaje);
            
            boolean correoEnviado = c.enviarUsuario(u.getEmail());
            if (correoEnviado) {
                return mapping.findForward(SUCCESS);
            } else {
                return mapping.findForward(FAIL);
            }
        } else {
            return mapping.findForward(FAIL);
        }

    }
}
