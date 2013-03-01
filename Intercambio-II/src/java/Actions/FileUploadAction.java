/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.EstudianteUSB;
import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import Clases.FileUploadForm;
import Clases.Usuario;
import DBMS.DBMS;

public class FileUploadAction extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // aqui recibimos el archivo puesto en el form
        Usuario user = new Usuario();
        FileUploadForm fileUploadForm = (FileUploadForm) form;
        String nom = fileUploadForm.getNombreusuario();
        File folder;
        
        //obtenemos los archivos de un arraylist
        ArrayList archivos = fileUploadForm.getListFile();
        ArrayList tam = fileUploadForm.getListFile();
        int cant = 0;
        /*iteramos sobre la lista de archivos y sumamos sus tamaños para obtener
        el peso de toda lac arga*/
        for(int i =0; i<tam.size();i++){
            FormFile file2 = (FormFile) tam.get(i);
            cant = cant + file2.getFileSize();
        
        }
        /*si la carga es mayor de 5000000 de bytes que es 5Mbytes no se cargan
         los archivos*/
        if(cant > 50000000){
            return mapping.findForward("error");
        }
        /*en caso contrario*/
        user.setNombreusuario(nom);
        EstudianteUSB est = new EstudianteUSB();
        est.setNombreusuario(user.getNombreusuario());
        est.setCarnet("0");
        est.setCedula("0");

        //buscamos el path real para guardar el archivo, 
        //este path lo guarda en el la capeta build/web/Documentos
        
        String filePath =
                getServlet().getServletContext().getRealPath("/") + "Documentos/" + nom;
        String documentos = getServlet().getServletContext().getRealPath("/") + "Documentos/";
        /*Guardamos el path de los archivos relacionados a un usuario en la base
         de datos*/
        if(!DBMS.getInstance().InsertarPath(filePath,est)){
            System.out.println("No funciona el insertar");
        }
        
        System.out.println(filePath);
        
        folder = new File(filePath);
        if (!folder.exists()) {
            folder.mkdir();
        }
        
        
        /*Creamos la carpeta donde se guardaran los archivos, si ya existe seguimos,
         si no la creamos*/
        folder = new File(filePath);
        if (!folder.exists()) {
            folder.mkdir();
        }
        
        /*Para cada archivo*/
        for (int i = 0; i < archivos.size(); i++) {

            //del archivo del form obtenemos el archivo como tal
            FormFile file = (FormFile) archivos.get(i);

            //obtenemos el nombre
            String fileName = file.getFileName();
            //obtenemos el arreglo de bytes del archivo
            byte[] fileData = file.getFileData();


            if (!fileName.equals("")) {

                /* Se crea el archivo para poder guardalo en el servidor
                 */
                System.out.println("Server path:" + filePath);
                File newFile;
                if (i == 0){
                    newFile = new File(filePath, "Foto.png");
                }else if (i == 1){
                    newFile = new File(filePath, "Cedula.png");
                }
                else{
                    newFile = new File(filePath, fileName);
                }

                // si existe el archivo lo sobreescribe
                if (!newFile.exists()) {
                    FileOutputStream fos = new FileOutputStream(newFile);
                    fos.write(file.getFileData());
                    fos.flush();
                    fos.close();
                }

            }

        }
        return mapping.findForward("success");
    }
}