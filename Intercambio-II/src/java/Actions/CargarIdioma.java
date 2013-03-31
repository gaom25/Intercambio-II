/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.*;
import DBMS.DBMS;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author gustavo
 */
public class CargarIdioma extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // aqui recibimos los idiomas puestos en el form
        
        Idiomas idioma = (Idiomas) form;
        Usuario u = new Usuario();
        Usuario u2 = new Usuario();
        u.setNombreusuario(idioma.getNombreusuario());
        
        u2 = DBMS.getInstance().obtenerDatos(u);
        /*obtenemos los arraylist para los campos de cada idioma*/
        
        ArrayList archivos = idioma.getListEscrito();
        ArrayList archivo = idioma.getListVerbal();
        ArrayList archiv = idioma.getListIdioma();
        ArrayList archi = idioma.getListConversacional();
        
        /*por ultimo ejecutamos la funcion que inserta en la base de datos los
         diferentes idiomas de un usuario*/
        if(!DBMS.getInstance().InsertarIdioma(idioma)){
            
            System.out.println("Falloooooo");
        }

        if(u2.getPrivilegio() == 5){
            return mapping.findForward("usb");
        }
        return mapping.findForward("ext");
    }
}