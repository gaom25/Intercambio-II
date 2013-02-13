/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import DBMS.DBMS;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author caponte
 */
public class GeneradorPlanillas {

    /*
     * To change this template, choose Tools | Templates
     * and open the template in the editor.
     */
    /**
     *
     * @author caponte
     */
    public Boolean generarPlanillaUSB(PlanillaUSB p, String path) throws BadElementException, DocumentException {

        Document document = new Document(PageSize.LETTER); // Pdf de tamano carta
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");

        try {

            int n = 1;
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String creacion = dateFormat.format(cal.getTime());

            PdfWriter salida = PdfWriter.getInstance(document,
                    new FileOutputStream(path+"/PlanillaIntercambio_USB.pdf"));

            document.addTitle("Planilla Postulacion Intercambio."); //Titulo del PDF.
            document.addCreationDate(); // Fecha de cracion del PDF.
            document.addCreator("dycicle Systems"); // Crador del PDF.
            document.setMargins(36, 72, 108, 180);

            // Font para el titulo en Times Roman 10
            BaseFont areas = FontFactory.getFont(FontFactory.TIMES_ROMAN).getCalculatedBaseFont(false);
            Font fontTitulos = new Font(Font.FontFamily.TIMES_ROMAN, 9, Font.BOLD, BaseColor.BLACK);
            Font fontCampo = new Font(Font.FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK);
            Font fontPequena = new Font(Font.FontFamily.TIMES_ROMAN, 7, Font.NORMAL, BaseColor.BLACK);
            document.open();

            PdfContentByte canvas = salida.getDirectContent();


            /* #####E#####################################################
             * #  Header del pdf, titulo, foto del aplicante y logo USB. #
             * ###########################################################*/
            ColumnText ct = new ColumnText(canvas);

            //Estampado de fecha y hora de creacion
            Phrase campo = new Phrase("Solicitud Nro:" + n + "      ||  Fecha Cracion:   " + creacion, fontCampo);
            ct.setSimpleColumn(campo, 350, 70, 650, 80, 10, Element.ALIGN_LEFT);
            ct.go();

            Phrase titulo = new Phrase("SOLICITUD DE INCORPORACIÓN AL PROGRAMA DE INTERCAMBIO DE ESTUDIANTES", fontTitulos);
            ct.setSimpleColumn(titulo, 40, 655, 600, 680, 25, Element.ALIGN_CENTER);
            ct.go();

            Image imagen = Image.getInstance("/home/gustavo/NetBeansProjects/Intercambio-II/web/images/user_data.png");
            imagen.setAbsolutePosition(500f, 680f); // define la posicion de la imagen del aplicante
            imagen.scaleAbsolute(75f, 75f); // define el tamano de la imagen del aplicante

            document.add(imagen); // agrega la imagen al pdf

            imagen = Image.getInstance("/home/gustavo/NetBeansProjects/Intercambio-II/web/images/usb_logo.png");
            imagen.setAbsolutePosition(50f, 680f); // define la posicion de la imagen
            imagen.scaleAbsolute(200f, 80f); // define el tamano de la imagen


            campo = new Phrase("Coordinación de Apoyo a los Programas de Intercambio\n"
                    + "Programa de Intercambio de Estudiantes\n"
                    + "Convocatoria 2013-2014", fontCampo);
            ct.setSimpleColumn(campo, 200, 625, 480, 730, 10, Element.ALIGN_RIGHT);
            ct.go();


            document.add(imagen); // agrega la imagen al pdf


            /* #################################
             * #  Seccion de Datos Personales. #
             * #################################*/
            // Titulo del area
            campo = new Phrase("DATOS PERSONALES", fontTitulos);
            ct.setSimpleColumn(campo, 70, 630, 560, 645, 10, Element.ALIGN_LEFT);
            ct.go();
            // Linea divisoria del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(60, 630, 455, 0);
            canvas.stroke();
            canvas.restoreState();

            // Nombres y Apellidos
//            campo = new Phrase("Apellidos:  " + p.getApellidos(), fontCampo);
  //          ct.setSimpleColumn(campo, 70, 610, 250, 620, 10, Element.ALIGN_LEFT);
    //        ct.go();
      //      campo = new Phrase("Nombres:  " + p.getNombres(), fontCampo);
        //    ct.setSimpleColumn(campo, 320, 610, 560, 620, 10, Element.ALIGN_LEFT);
          //  ct.go();

            // Fecha de Nacimiento
            String s = p.getFechaNacimiento();
            campo = new Phrase("Fecha de Nacimiento (DD/MM/AA):  " + s, fontCampo);
            ct.setSimpleColumn(campo, 70, 590, 350, 600, 10, Element.ALIGN_LEFT);
            ct.go();

            // Sexo
            campo = new Phrase("Genero:  " + p.getSexo(), fontCampo);
            ct.setSimpleColumn(campo, 70, 570, 350, 580, 10, Element.ALIGN_LEFT);
            ct.go();


            //Nacionalidad
            campo = new Phrase("Nacionalidad:  " + p.getNacionalidad(), fontCampo);
            ct.setSimpleColumn(campo, 70, 550, 300, 560, 10, Element.ALIGN_LEFT);
            ct.go();

            // Pasaporte
            campo = new Phrase("Nro Pasaporte Vigente:  " + p.getPasaporte(), fontCampo);
            ct.setSimpleColumn(campo, 320, 550, 600, 560, 10, Element.ALIGN_LEFT);
            ct.go();

            //Cedula
            campo = new Phrase("Cédula de Identidad:  " + p.getCedula(), fontCampo);
            ct.setSimpleColumn(campo, 70, 530, 250, 540, 10, Element.ALIGN_LEFT);
            ct.go();

            // Carnet USB
            campo = new Phrase("Carné Estudiantil USB:  " + p.getCarnet(), fontCampo);
            ct.setSimpleColumn(campo, 70, 510, 250, 520, 10, Element.ALIGN_LEFT);
            ct.go();

            // Domicilio
            campo = new Phrase("Domicilio Actual:  ", fontCampo);
            ct.setSimpleColumn(campo, 70, 490, 250, 500, 10, Element.ALIGN_LEFT);
            ct.go();

            // 
            campo = new Phrase("Direccion:  " + p.getCalle(), fontCampo);
            ct.setSimpleColumn(campo, 90, 460, 400, 480, 10, Element.ALIGN_LEFT);
            ct.go();

            // Ciudad
            campo = new Phrase("Ciudad:  " + p.getCiudad(), fontCampo);
            ct.setSimpleColumn(campo, 90, 450, 500, 460, 10, Element.ALIGN_LEFT);
            ct.go();

            // Estado
            campo = new Phrase("Estado:  " + p.getEstado(), fontCampo);
            ct.setSimpleColumn(campo, 250, 450, 500, 460, 10, Element.ALIGN_LEFT);
            ct.go();

            // Codigo Postal
            campo = new Phrase("Código Postal:  " + p.getCodPostal(), fontCampo);
            ct.setSimpleColumn(campo, 400, 450, 600, 460, 10, Element.ALIGN_LEFT);
            ct.go();

            // Informacion de contacto
            campo = new Phrase("Información de Contacto:  ", fontCampo);
            ct.setSimpleColumn(campo, 70, 430, 450, 440, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Tlf. Habitación:  " + p.getTelefonoCasa(), fontCampo);
            ct.setSimpleColumn(campo, 90, 410, 450, 420, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Tlf. Celular:  " + p.getTelefonoCelular(), fontCampo);
            ct.setSimpleColumn(campo, 250, 410, 450, 420, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Fax:  " + p.getFax(), fontCampo);
            ct.setSimpleColumn(campo, 400, 410, 600, 420, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("E-mail:  " + p.getEmail(), fontCampo);
            ct.setSimpleColumn(campo, 90, 390, 600, 400, 10, Element.ALIGN_LEFT);
            ct.go();

            // Contacto de Emergencia -- Representante
            campo = new Phrase("Persona de Contacto en Caso de Emergencia:  ", fontCampo);
            ct.setSimpleColumn(campo, 70, 360, 300, 380, 10, Element.ALIGN_LEFT);
            ct.go();
//            campo = new Phrase("Apellidos y Nombres:  " + p.getApellidoNombresRep(), fontCampo);
  //          ct.setSimpleColumn(campo, 90, 340, 300, 360, 10, Element.ALIGN_LEFT);
    //        ct.go();
            campo = new Phrase("Parentesco con el estudiante: " + p.getRelacion(), fontCampo);
            ct.setSimpleColumn(campo, 90, 330, 300, 340, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Dirección:  " + p.getDireccionRep(), fontCampo);
            ct.setSimpleColumn(campo, 90, 310, 300, 320, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Teléfono:  " + p.getTlfRep(), fontCampo);
            ct.setSimpleColumn(campo, 90, 290, 350, 300, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("E-mail:  " + p.getEmailRep(), fontCampo);
            ct.setSimpleColumn(campo, 250, 290, 450, 300, 10, Element.ALIGN_LEFT);
            ct.go();


            /* #################################################
             * #  Identificacion del Programa y Lapso de tiempo #
             * ##################################################*/
            // Titulo del area.
            titulo = new Phrase("IDENTIFICACIÓN DEL PROGRAMA Y LAPSO DE ESTUDIO EN INTERCAMBIO:  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 260, 450, 280, 20, Element.ALIGN_LEFT);
            ct.go();
            // Linea divisoria del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(60, 255, 455, 0);
            canvas.stroke();
            canvas.restoreState();

            ArrayList<Usuario> id = new ArrayList<Usuario>(0);
            Usuario u = new Usuario();
            u.setNombreusuario(p.getNombreUsuario());
            id = DBMS.getInstance().listarIdiomas(u);

            Iterator i = id.iterator();
            int linea = 0;
            int num =0;
            while (i.hasNext()) {

                
                Usuario tmp = (Usuario) i.next();

                // Idioma de destino y 
                campo = new Phrase("Idioma que maneja:  " + tmp.getNombre(), fontCampo);
                ct.setSimpleColumn(campo, 70, (235 -(linea*num)), 450, (245 -(linea*num)), 10, Element.ALIGN_LEFT);
                ct.go();
                // Nivel de Suficiencia
                campo = new Phrase("Nivel de Suficiencia del idioma a emplear:  ", fontCampo);
                ct.setSimpleColumn(campo, 90, (220-(linea*num)), 450, (230-(linea*num)), 10, Element.ALIGN_LEFT);
                ct.go();
                campo = new Phrase("Verbal:  " + tmp.getConfirmar(), fontCampo);
                ct.setSimpleColumn(campo, 250, (220-(linea*num)), 600, (230-(linea*num)), 10, Element.ALIGN_LEFT);
                ct.go();
                campo = new Phrase("Escrito: " + tmp.getEmail(), fontCampo);
                ct.setSimpleColumn(campo, 450, (220-(linea*num)), 700, (230-(linea*num)), 10, Element.ALIGN_LEFT);
                ct.go();
                linea += 35;
                num ++;
            }

            // Universidad de Destino
            campo = new Phrase("Nombre de la Universidad Seleccionada:  " + p.getNombreOpcion1(), fontCampo);
            ct.setSimpleColumn(campo, 70, 155, 450, 165, 10, Element.ALIGN_LEFT);
            ct.go();

            // Programa
            campo = new Phrase("Nombre del Programa:  ", fontCampo);
            ct.setSimpleColumn(campo, 70, 135, 450, 145, 10, Element.ALIGN_LEFT);
            ct.go();


            //Fechas Inicio y Fin
//            String s1 = p.getFechaFin1();
  //          s = p.getFechaIni1();
    //        campo = new Phrase("Fechas tentativas de Inicio y Fin, según calendario de la Universidad de Destino:           "
      //              + "Inicio: " + s + "          Fin:  " + s1, fontCampo);
        //    ct.setSimpleColumn(campo, 70, 115, 600, 125, 10, Element.ALIGN_LEFT);
          //  ct.go();

            /* ###########################
             * #  Informacion Academica  #
             * ###########################*/
            document.newPage();

            //Estampado de numero de planilla, fecha y hora de creacion
            campo = new Phrase("Solicitud Nro:" + n + "      ||  Fecha Cracion:  " + creacion, fontCampo);
            ct.setSimpleColumn(campo, 400, 20, 650, 30, 10, Element.ALIGN_LEFT);
            ct.go();


            // Linea Divisoria  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(60, 715, 455, 0);
            canvas.stroke();
            canvas.restoreState();

            // Titulo del area.
            titulo = new Phrase("INFORMACIÓN ACADÉMICA:  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 720, 450, 745, 25, Element.ALIGN_LEFT);
            ct.go();

            //Carrera
            campo = new Phrase("Carrera que estudia en la USB:  " + p.getCarrera(), fontCampo);
            ct.setSimpleColumn(campo, 70, 695, 350, 705, 10, Element.ALIGN_LEFT);
            ct.go();

            // Opcion
            campo = new Phrase("Mencion (en caso que aplique):  ", fontCampo);
            ct.setSimpleColumn(campo, 310, 695, 600, 705, 10, Element.ALIGN_LEFT);
            ct.go();

            // Creditos Aprobados
            campo = new Phrase("Nro de Créditos Aprobados a la Fecha:  " + p.getCreditosApro(), fontCampo);
            ct.setSimpleColumn(campo, 70, 675, 350, 685, 10, Element.ALIGN_LEFT);
            ct.go();

            // Indice
            campo = new Phrase("Índice Académico a la Fecha:  " + p.getIndice(), fontCampo);
            ct.setSimpleColumn(campo, 310, 675, 600, 685, 10, Element.ALIGN_LEFT);
            ct.go();

            // Tabla de materias.
            canvas.saveState();
            canvas.rectangle(90, 450, 435, 183);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            canvas.rectangle(90, 605, 435, 0);

            canvas.stroke();
            canvas.restoreState();

            // Tabla de la seccion 18
            canvas.saveState();
            canvas.rectangle(150, 450, 0, 183);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            canvas.rectangle(220, 450, 0, 183);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            canvas.rectangle(295, 450, 0, 183);
            canvas.stroke();
            canvas.restoreState();

            // Tabla de la seccion 19
            canvas.saveState();
            canvas.rectangle(298, 450, 0, 183);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();

            canvas.rectangle(360, 450, 0, 183);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            canvas.rectangle(430, 450, 0, 183);
            canvas.stroke();
            canvas.restoreState();


            // Plan de Estudio
            campo = new Phrase("Asignaturas del Plan de Estudio USB que aspira \n "
                    + "sean convalidadas u otorgadas en equivalencia:  ", fontCampo);

            ct.setSimpleColumn(campo, 110, 645, 500, 665, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Código", fontCampo);
            ct.setSimpleColumn(campo, 110, 615, 500, 625, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Denominación", fontCampo);

            ct.setSimpleColumn(campo, 160, 615, 500, 625, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Nro Créditos USB", fontCampo);
            ct.setSimpleColumn(campo, 230, 615, 500, 625, 10, Element.ALIGN_LEFT);
            ct.go();


            // Asignaturas a cursar
            campo = new Phrase("Asignaturas a cursar en la Universidad de Destino:  ", fontCampo);

            ct.setSimpleColumn(campo, 330, 650, 600, 660, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Código", fontCampo);
            ct.setSimpleColumn(campo, 315, 615, 500, 625, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Denominación", fontCampo);

            ct.setSimpleColumn(campo, 370, 615, 500, 625, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Nro Créditos \n Nro Horas x Semana", fontCampo);
            ct.setSimpleColumn(campo, 400, 605, 550, 630, 10, Element.ALIGN_CENTER);
            ct.go();

            //  Texto informativo            
            campo = new Phrase("Nota: De acuerdo a las Normas de Intercambio Estudiantil el "
                    + "estudiante debe cursar al menos un trimestre en la USB al regresar del"
                    + " Programa de Intercambio.\n"
                    + "La presentación y defensa de Pasantia Larga o"
                    + " Proyectos de Grado debe ajustarse a la \"Normativa para aceptacion y"
                    + " evaluación de los trabajos de grado y pa-\n"
                    + " santías largas de los estudiantes de intercambio de la Universidad Simón Bolívar\" y la publicación del"
                    + " documento debe ajustarse a las normas de presentación\n"
                    + " de Proyectos de "
                    + "Grado establecidas por la Coordinacion Docente respectiva.", fontPequena);

            ct.setSimpleColumn(campo, 90, 350, 1000, 450, 10, Element.ALIGN_LEFT);
            ct.go();


            /* ###################
             * #  Segunda Opcion #0
             * ###################*/
            // Cuadro del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(60, 370, 455, 0);
            canvas.stroke();
            canvas.restoreState();
            // Titulo del area.
            titulo = new Phrase("OPCIONAL:  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 365, 450, 405, 20, Element.ALIGN_LEFT);
            ct.go();
            titulo = new Phrase("En caso de no ser aceptado en la Universidad seleccionada, favor indique una segunda opción:  ", fontCampo);
            ct.setSimpleColumn(titulo, 70, 355, 1000, 385, 10, Element.ALIGN_LEFT);
            ct.go();
            // 2da Opcion -- Universidad de Destino
            campo = new Phrase("Nombre de la Universidad Seleccionada:  " + p.getNombreOpcion2(), fontCampo);
            ct.setSimpleColumn(campo, 70, 335, 550, 365, 10, Element.ALIGN_LEFT);
            ct.go();

            // 2da Opcion --Programa
            campo = new Phrase("Nombre del Programa:  ", fontCampo);
            ct.setSimpleColumn(campo, 70, 315, 550, 345, 10, Element.ALIGN_LEFT);
            ct.go();

            //2da Opcion -- Fechas Inicio y Fin
//            s1 = p.getFechaFin2();
  //          s = p.getFechaIni2();
    //        campo = new Phrase("Fechas tentativas de Inicio y Fin, según calendario de la Universidad de Destino:           "
      //              + "Inicio: " + s + "          Fin:  " + s1, fontCampo);
        //    ct.setSimpleColumn(campo, 70, 295, 800, 325, 10, Element.ALIGN_LEFT);
          //  ct.go();


            /* ###################
             * #  Financiamiento #
             * ###################*/
            canvas.saveState();
            canvas.rectangle(60, 285, 455, 0);
            canvas.stroke();
            canvas.restoreState();
            // Titulo del area.
            titulo = new Phrase("FINANCIAMIENTO:  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 275, 450, 310, 20, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Fuente del financiamiento:  " + p.getFuenteFinanciamiento(), fontCampo);
            ct.setSimpleColumn(campo, 70, 265, 350, 280, 15, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Descripcion:  " + p.getDescripcion1(), fontCampo);
            ct.setSimpleColumn(campo, 70, 245, 350, 260, 15, Element.ALIGN_LEFT);
            ct.go();

            /* ################################
             * #  Firma y Fecha de Solici7tud  # 
             * ################################*/
            // Creditos Aprobados
            campo = new Phrase("Firma del Solicitante:  ", fontCampo);
            ct.setSimpleColumn(campo, 140, 165, 350, 180, 15, Element.ALIGN_LEFT);
            ct.go();


            dateFormat = new SimpleDateFormat("MM/dd/yyyy");
            cal = Calendar.getInstance();
            creacion = dateFormat.format(cal.getTime());

            // Indice
            campo = new Phrase("Fecha de Solicitud:  " + creacion, fontCampo);
            ct.setSimpleColumn(campo, 350, 165, 500, 180, 15, Element.ALIGN_LEFT);
            ct.go();

            // Declaracion de veracidad
            campo = new Phrase("El estudiante firmante declara que los datos y documentos suministrados son verídicos"
                    + " y asume cumplir cabalmente con las normas del programa de \n"
                    + "intercambio estudiantil.", fontPequena);

            ct.setSimpleColumn(campo, 70, 130, 1000, 160, 10, Element.ALIGN_LEFT);
            ct.go();

            /* ##########################
             * #  Campos Coordinacion   #
             * ##########################*/

            // Cuadro del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(80, 35, 455, 70);
            canvas.stroke();
            canvas.restoreState();

            // Titulo del area.
            titulo = new Phrase("**Esta sección debe ser llenada exclusivamente por la Coordinación Docente**", fontTitulos);
            ct.setSimpleColumn(titulo, 165, 100, 1000, 135, 20, Element.ALIGN_LEFT);
            ct.go();
            // Idioma de destino y 
            campo = new Phrase("Opinión de la Coordinación Docente sobre esta solicitud (explicación breve):  ", fontCampo);
            ct.setSimpleColumn(campo, 95, 90, 350, 100, 10, Element.ALIGN_LEFT);
            ct.go();
            // Nivel de Suficiencia
            campo = new Phrase("Muy Favorable:  ", fontCampo);
            ct.setSimpleColumn(campo, 125, 70, 350, 80, 10, Element.ALIGN_LEFT);
            ct.go();


            document.close();

        } catch (IOException ex) {
            Logger.getLogger(GeneradorPlanillas.class.getName()).log(Level.SEVERE, null, ex);
        }

        return true;
    }
}
