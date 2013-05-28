/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import Clases.Idiomas;
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
public class CargarIdioma extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // aqui recibimos los idiomas puestos en el form
        
        Idiomas idioma = (Idiomas) form;
        Idiomas iditmp = new Idiomas();
        Idiomas idiDB = new Idiomas();
        Usuario u = new Usuario();
        Usuario u2 = new Usuario();
        u.setNombreusuario(idioma.getNombreusuario());
        int i;
        u2 = DBMS.getInstance().obtenerDatos(u);
        idiDB = DBMS.getInstance().obtenerIdiomas(u);
        
        /*obtenemos los arraylist para los campos de cada idioma*/
        
        ArrayList escri = idioma.getListEscrito();
        ArrayList verb = idioma.getListVerbal();
        ArrayList idi = idioma.getListIdioma();
        ArrayList conv = idioma.getListConversacional();
        ArrayList audi = idioma.getListAuditivo();
        
        ArrayList idiomaDB = idiDB.getListIdioma();
        
        /*por ultimo ejecutamos la funcion que inserta en la base de datos los
         diferentes idiomas de un usuario*/
        
        for(i = 0; i<escri.size();i++){
            if( !idiomaDB.contains((String)idi.get(i))){

                iditmp.setIdiomaDest(0,(String)idi.get(i));
                iditmp.setNivelConversacional(0,(String)conv.get(i));
                iditmp.setNivelEscrito(0,(String)escri.get(i));
                iditmp.setNivelVerbal(0,(String)verb.get(i));
                iditmp.setNivelAuditivo(0,(String)audi.get(i));
                iditmp.setNombreusuario(idioma.getNombreusuario());
                
                if(!DBMS.getInstance().InsertarIdioma(iditmp)){

                    System.out.println("Falloooooo");
                }
            }else{
                iditmp.setIdiomaDest(0,(String)idi.get(i));
                iditmp.setNivelConversacional(0,(String)conv.get(i));
                iditmp.setNivelEscrito(0,(String)escri.get(i));
                iditmp.setNivelVerbal(0,(String)verb.get(i));
                iditmp.setNivelAuditivo(0,(String)audi.get(i));
                iditmp.setNombreusuario(idioma.getNombreusuario());
                
                
                if(!DBMS.getInstance().modificarIdioma(iditmp)){
                    System.out.println("yey");
                }
            }
        }
       
        String accion = "Guardó en el sistema los idiomas que domina";
        boolean boo = DBMS.getInstance().registrar(u2.getNombreusuario(),accion);

        if(u2.getPrivilegio() == 5){
            return mapping.findForward("usb");
        }
        return mapping.findForward("ext");
    }
}