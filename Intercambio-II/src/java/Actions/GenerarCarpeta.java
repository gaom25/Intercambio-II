/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dreabalbas
 */
public class GenerarCarpeta extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS_USB = "successUSB";
    private static final String SUCCESS_Ext = "successExt";
    private static final String VACIO_USB = "vacioUSB";
    private static final String VACIO_Ext = "vacioEXT";

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
        
        HttpSession session = request.getSession();
        Usuario obj = (Usuario)session.getAttribute("Usuario");
        Usuario u = (Usuario) form;
        Document document = new Document(PageSize.LETTER);

        // Archivo de salida
        String filePath =
                getServlet().getServletContext().getRealPath("/") + "Documentos/" + u.getNombreusuario();
        String OUTPUTFILE = filePath+"/carpeta.pdf";

        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(OUTPUTFILE));
        document.open();
        
        ArrayList<String> files = DBMS.getInstance().listarDocumentos(u);
        
        if (u.getPrivilegio() == 5){
            if (files == null){
                return mapping.findForward(VACIO_USB);
            }else{
                Iterator it = files.iterator();
        
                Image img;
                PdfImportedPage pagina;
                int cantPaginas;
                Image aux;

                while (it.hasNext()){

                    String archivo = (String) it.next();

                    if ((archivo.endsWith(".jpg") || archivo.endsWith(".png")) && !archivo.endsWith("Foto.png") && !archivo.endsWith("Cedula.png")){
                        img = Image.getInstance(archivo);


                        document.add(img);

                    }else if (archivo.endsWith(".pdf") && !archivo.endsWith("carpeta.pdf")){
                        PdfReader reader = new PdfReader(archivo);
                        cantPaginas = reader.getNumberOfPages();

                        for (int i = 1; i <= cantPaginas; i++) {
                            pagina = writer.getImportedPage(reader, i);
                            aux = Image.getInstance(pagina);
                            document.add(aux);     
                        }
                    }            
                }

                document.close();

                session.setAttribute("carpeta",OUTPUTFILE );

                String accion = "Generó su carpeta";
                boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(),accion);
                return mapping.findForward(SUCCESS_USB);
           }
            
        }
        
        if (u.getPrivilegio() == 6){
            if (files == null){
                return mapping.findForward(VACIO_Ext);
            }else{
                Iterator it = files.iterator();
        
                Image img;
                PdfImportedPage pagina;
                int cantPaginas;
                Image aux;

                while (it.hasNext()){

                    String archivo = (String) it.next();

                    if ((archivo.endsWith(".jpg") || archivo.endsWith(".png")) && !archivo.endsWith("Foto.png") && !archivo.endsWith("Cedula.png")){
                        img = Image.getInstance(archivo);


                        document.add(img);

                    }else if (archivo.endsWith(".pdf") && !archivo.endsWith("carpeta.pdf")){
                        PdfReader reader = new PdfReader(archivo);
                        cantPaginas = reader.getNumberOfPages();

                        for (int i = 1; i <= cantPaginas; i++) {
                            pagina = writer.getImportedPage(reader, i);
                            aux = Image.getInstance(pagina);
                            document.add(aux);     
                        }
                    }            
                }

                document.close();
                session.setAttribute("carpeta",OUTPUTFILE);
                
                
                String accion = "Generó su carpeta";
                boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(),accion);
                return mapping.findForward(SUCCESS_Ext);
           }
            
        }
        
        return mapping.findForward("error");
    }
    
}