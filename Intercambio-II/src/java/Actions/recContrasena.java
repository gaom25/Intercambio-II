/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import Clases.Correo;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import nl.captcha.Captcha;

/**
 *
 * @author dreabalbas
 */
public class recContrasena extends org.apache.struts.action.Action {

    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";
    private final static String ERROR = "error";
    private static final String patronEmail =
            "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
    private Pattern patron;
    private Matcher match;

    public recContrasena() {
        patron = Pattern.compile(patronEmail);
    }

    public boolean validate(final String username) {

        match = patron.matcher(username);
        return match.matches();
    }

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Usuario u = (Usuario) form;
        ActionErrors error = new ActionErrors();
        HttpSession session = request.getSession();
        boolean huboError = false;

        String nombreusuario = u.getNombreusuario();
        String email = u.getEmail();

        String[] datos = new String[3];

        Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
        request.setCharacterEncoding("UTF-8");
        String answer = request.getParameter("answer");
        if (!captcha.isCorrect(answer)) {
            huboError = true;
        }

        //Verifica si se introdujo un correo
        if (!email.equals("")) {

            //Verifica si el email esta correcto o no
            if (validate(email)) {
              error.add("email", new ActionMessage("error.email.malformulado"));
              saveErrors(request, error);
              huboError = true;
            } else {
                datos = DBMS.getInstance().existeEmail(email);
            }

            //Verifica si se introdujo un usuario
        } else if (!nombreusuario.equals("")) {
            datos = DBMS.getInstance().existeUsuario(nombreusuario);

            //Verifica si se dejaron ambos campos vacios
        } else if (nombreusuario.equals("") && email.equals("")) {
            error.add("nombreusuario",
                    new ActionMessage("error.nombreusuario.required"));
            saveErrors(request, error);
            error.add("email", new ActionMessage("error.email.required"));
            saveErrors(request, error);
            huboError = true;
        }

        if (huboError) {
            return mapping.findForward(ERROR);
        } else {

            if (datos != null) {

                Correo c = new Correo();
                String msj = "Su usuario es: " + datos[0] + ".\n"
                        + "Su contraseña es:" + datos[1] + ".\n";
                String asunto = "Recuperación de contraseña";
                c.setAsunto(asunto);
                c.setMensaje(msj);
                System.out.println(datos[2]);
                boolean envio = c.enviarUsuario(datos[2]);

                if (envio) {
                    Usuario obj = (Usuario) session.getAttribute("Usuario");
                    boolean boo =
                            DBMS.getInstance().registrar(obj.getNombreusuario(),
                            "Recuperación de contraseña");
                    return mapping.findForward(SUCCESS);
                }
            }
        }

        return mapping.findForward(FAILURE);


    }
}
