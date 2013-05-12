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
import java.io.FileInputStream;
import java.io.File;
import javax.servlet.ServletOutputStream;
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
    private static final String SUCCESS_Gest = "successGest";
    private static final String VACIO_USB = "vacioUSB";
    private static final String VACIO_Ext = "vacioEXT";
    private static final String VACIO_Gest = "vacioGest";

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
        Usuario obj = (Usuario) session.getAttribute("Usuario");
        Usuario u = (Usuario) form;
        Usuario UserData;
        Document document = new Document(PageSize.LETTER);
       
        // Archivo de salida
        String filePath =
                getServlet().getServletContext().getRealPath("/") + "Documentos/" + u.getNombreusuario();
        String OUTPUTFILE = filePath + "/carpeta.pdf";
        
        PdfWriter writer;
        
        ArrayList<String> files = DBMS.getInstance().listarDocumentos(u);
        
        if (u.getNuevacontra() != null) {
            UserData = DBMS.getInstance().obtenerDatos(u);
            u.setPrivilegio(UserData.getPrivilegio());
        }
        
        if (u.getPrivilegio() == 5) {
            if (files == null) {
                if (u.getNuevacontra() != null) {
                    return mapping.findForward(VACIO_Gest);
                } else {
                    return mapping.findForward(VACIO_USB);
                }
            } else {
                writer = PdfWriter.getInstance(document, new FileOutputStream(OUTPUTFILE));
                document.open();
                Iterator it = files.iterator();
                
                Image img;
                PdfImportedPage pagina;
                int cantPaginas;
                Image aux;
                
                while (it.hasNext()) {
                    
                    String archivo = (String) it.next();
                    
                    if ((archivo.endsWith(".jpg") || archivo.endsWith(".png"))
                            && !archivo.endsWith("Foto.png")
                            && !archivo.endsWith("Cedula.png")) {
                        img = Image.getInstance(archivo);
                        
                        
                        document.add(img);
                        
                    } else if (archivo.endsWith(".pdf")
                            && !archivo.endsWith("carpeta.pdf")) {
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
                
                session.setAttribute("carpeta", OUTPUTFILE);

                /*De aqui empieza la magia para descargar el documento sacado de :
                 http://www.mkyong.com/struts/struts-download-file-from-website-example/
                 */
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment;filename=Carpeta.pdf");
                
                try {
                    //Get it from file system
                    FileInputStream in =
                            new FileInputStream(new File(OUTPUTFILE));
                    
                    ServletOutputStream out = response.getOutputStream();
                    
                    byte[] outputByte = new byte[4096];
                    //copy binary content to output stream
                    while (in.read(outputByte, 0, 4096) != -1) {
                        out.write(outputByte, 0, 4096);
                    }
                    in.close();
                    out.flush();
                    out.close();
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
                String accion1 = "Generó su carpeta";
                String accion2 = "Revisó la carpeta del estudiante "
                        + u.getNombreusuario();
                if (u.getNuevacontra() != null) {
                    boolean boo = DBMS.getInstance().registrar(u.getNuevacontra(), accion2);
                } else {
                    boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(), accion1);
                }
                return mapping.findForward(SUCCESS_USB);
            }
            
        }
        
        if (u.getPrivilegio() == 6) {
            if (files == null) {
                if (u.getNuevacontra() != null) {
                    return mapping.findForward(VACIO_Gest);
                } else {
                    return mapping.findForward(VACIO_Ext);
                }
                
            } else {
                writer = PdfWriter.getInstance(document, new FileOutputStream(OUTPUTFILE));
                document.open();
                Iterator it = files.iterator();
                
                Image img;
                PdfImportedPage pagina;
                int cantPaginas;
                Image aux;
                
                while (it.hasNext()) {
                    
                    String archivo = (String) it.next();
                    
                    if ((archivo.endsWith(".jpg") || archivo.endsWith(".png"))
                            && !archivo.endsWith("Foto.png")
                            && !archivo.endsWith("Cedula.png")) {
                        img = Image.getInstance(archivo);
                        
                        
                        document.add(img);
                        
                    } else if (archivo.endsWith(".pdf")
                            && !archivo.endsWith("carpeta.pdf")) {
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
                session.setAttribute("carpeta", OUTPUTFILE);

                /*De aqui empieza la magia para descargar el documento sacado de :
                 http://www.mkyong.com/struts/struts-download-file-from-website-example/
                 */
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment;filename=Carpeta.pdf");
                
                try {
                    //Get it from file system
                    FileInputStream in =
                            new FileInputStream(new File(OUTPUTFILE));
                    
                    ServletOutputStream out = response.getOutputStream();
                    
                    byte[] outputByte = new byte[4096];
                    //copy binary content to output stream
                    while (in.read(outputByte, 0, 4096) != -1) {
                        out.write(outputByte, 0, 4096);
                    }
                    in.close();
                    out.flush();
                    out.close();
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
                String accion1 = "Generó su carpeta";
                String accion2 = "Revisó la carpeta del estudiante " + u.getNombreusuario();
                if (u.getNuevacontra() != null) {
                    boolean boo = DBMS.getInstance().registrar(u.getNuevacontra(), accion2);
                } else {
                    boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(), accion1);
                }
                return mapping.findForward(SUCCESS_Ext);
            }
            
        }
        
        return mapping.findForward("error");
    }
}
