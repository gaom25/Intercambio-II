/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Chunk;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfWriter;
import java.awt.Color;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author caponte
 */
public class GenerarPlanilla_EstExt extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

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

        Document document = new Document(PageSize.LETTER); // Pdf de tamano carta del

        try {

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String creacion = dateFormat.format(cal.getTime());

            PdfWriter salida = PdfWriter.getInstance(document,
                    new FileOutputStream("/home/caponte/Desktop/Planilla_Ext.pdf"));

            document.addTitle("Planilla Postulacion Intercambio."); //Titulo del PDF.
            document.addCreationDate(); // Fecha de cracion del PDF.
            document.addCreator("Tesseract Systems"); // Crador del PDF.
            document.setMargins(36, 72, 108, 180);

            // Font para el titulo en Times Roman 10
            BaseFont areas = FontFactory.getFont(FontFactory.TIMES_ROMAN).getCalculatedBaseFont(false);
            Font fontTitulos = new Font(FontFamily.TIMES_ROMAN, 9, Font.BOLD, BaseColor.BLACK);
            Font fontCampo = new Font(FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK);
            Font fontPequena = new Font(FontFamily.TIMES_ROMAN, 7, Font.NORMAL, BaseColor.BLACK);
            document.open();

            PdfContentByte canvas = salida.getDirectContent();


            /* #####E#####################################################
             * #  Header del pdf, titulo, foto del aplicante y logo USB. #
             * ###########################################################*/
            ColumnText ct = new ColumnText(canvas);

            //Estampado de fecha y hora de creacion
            Phrase campo = new Phrase(creacion, fontCampo);
            ct.setSimpleColumn(campo, 500, 50, 650, 60, 10, Element.ALIGN_LEFT);
            ct.go();

            Phrase titulo = new Phrase("SOLICITUD -- APPLICATIN FORM", fontTitulos);
            ct.setSimpleColumn(titulo, 230, 660, 600, 680, 20, Element.ALIGN_LEFT);
            ct.go();

            Image imagen = Image.getInstance("/home/caponte/PruebaFolder/Intercambio"
                    + "/web/images/user_data.png");
            imagen.setAbsolutePosition(500f, 680f); // define la posicion de la imagen del aplicante
            imagen.scaleAbsolute(75f, 75f); // define el tamano de la imagen del aplicante

            document.add(imagen); // agrega la imagen al pdf

            imagen = Image.getInstance("/home/caponte/PruebaFolder/Intercambio"
                    + "/web/images/usb_logo.png");
            imagen.setAbsolutePosition(50f, 680f); // define la posicion de la imagen
            imagen.scaleAbsolute(200f, 80f); // define el tamano de la imagen


            campo = new Phrase("Coordinacion de Apoyo a los Programas de Intercambio\n"
                    + "Programa de Intercambio de Estudiantes\n"
                    + "Convocatoria 2013-2014", fontCampo);
            ct.setSimpleColumn(campo, 200, 625, 480, 730, 10, Element.ALIGN_RIGHT);
            ct.go();


            document.add(imagen); // agrega la imagen al pdf


            /* #################################
             * #  Seccion de Datos Personales. #
             * #################################*/
            // Titulo del area
            campo = new Phrase("DATOS PERSONALES -- PERSONAL INFORMATION", fontTitulos);
            ct.setSimpleColumn(campo, 70, 630, 560, 645, 10, Element.ALIGN_LEFT);
            ct.go();
            // Linea divisoria del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(60, 630, 500, 0);
            canvas.stroke();
            canvas.restoreState();

            // Nombres y Apellidos
            campo = new Phrase("Apellidos -- Family Name:", fontCampo);
            ct.setSimpleColumn(campo, 70, 610, 200, 620, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Nombres -- First and Middle name:", fontCampo);
            ct.setSimpleColumn(campo, 320, 610, 560, 620, 10, Element.ALIGN_LEFT);
            ct.go();

            // Fecha de Nacimiento
            campo = new Phrase("Fecha de Nacimiento -- Birthdate (DD/MM/AA):   ____/____/____", fontCampo);
            ct.setSimpleColumn(campo, 70, 590, 350, 600, 10, Element.ALIGN_LEFT);
            ct.go();

            // Sexo
            campo = new Phrase("Hombre -- Male ____          Mujer -- Female ____", fontCampo);
            ct.setSimpleColumn(campo, 70, 570, 350, 580, 10, Element.ALIGN_LEFT);
            ct.go();


            //Nacionalidad
            campo = new Phrase("Nacionalidad -- Nationality:", fontCampo);
            ct.setSimpleColumn(campo, 70, 550, 200, 560, 10, Element.ALIGN_LEFT);
            ct.go();

            // Pasaporte
            campo = new Phrase("Nro Pasaporte Vigente -- Passport Number:", fontCampo);
            ct.setSimpleColumn(campo, 320, 550, 600, 560, 10, Element.ALIGN_LEFT);
            ct.go();

            // Lengua Materna
            campo = new Phrase("Lengua Materna -- Native Language:", fontCampo);
            ct.setSimpleColumn(campo, 70, 530, 200, 540, 10, Element.ALIGN_LEFT);
            ct.go();

            // Otras Idiomas
            campo = new Phrase("Otros idiomas -- Other languages:", fontCampo);
            ct.setSimpleColumn(campo, 320, 530, 800, 540, 10, Element.ALIGN_LEFT);
            ct.go();

            // Domicilio
            campo = new Phrase("Domicilio Actual -- Permanent address:", fontCampo);
            ct.setSimpleColumn(campo, 70, 510, 300, 520, 10, Element.ALIGN_LEFT);
            ct.go();

            // Calle
            campo = new Phrase("Calle -- Steet:", fontCampo);
            ct.setSimpleColumn(campo, 90, 490, 200, 500, 10, Element.ALIGN_LEFT);
            ct.go();

            // Ciudad
            campo = new Phrase("Ciudad -- City:", fontCampo);
            ct.setSimpleColumn(campo, 90, 470, 500, 480, 10, Element.ALIGN_LEFT);
            ct.go();

            // Estado
            campo = new Phrase("Estado -- State:", fontCampo);
            ct.setSimpleColumn(campo, 250, 470, 500, 480, 10, Element.ALIGN_LEFT);
            ct.go();

            // Codigo Postal
            campo = new Phrase("Codigo Postal -- Postal Code:", fontCampo);
            ct.setSimpleColumn(campo, 400, 470, 500, 480, 10, Element.ALIGN_LEFT);
            ct.go();

            // Informacion de contacto
            campo = new Phrase("Informacion de Contacto -- Contact Information:", fontCampo);
            ct.setSimpleColumn(campo, 70, 450, 450, 460, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Tel:", fontCampo);
            ct.setSimpleColumn(campo, 90, 430, 450, 440, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Tlf Celular -- Cellphone:", fontCampo);
            ct.setSimpleColumn(campo, 250, 430, 450, 440, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Fax:", fontCampo);
            ct.setSimpleColumn(campo, 90, 410, 450, 420, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("E-mail:", fontCampo);
            ct.setSimpleColumn(campo, 250, 410, 450, 420, 10, Element.ALIGN_LEFT);
            ct.go();

            // Contacto de Emergencia -- Representante
            campo = new Phrase("Datos del Representante -- Person to notify if needed:", fontCampo);
            ct.setSimpleColumn(campo, 70, 390, 300, 400, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Apellidos y Nombres: -- Full Name:", fontCampo);
            ct.setSimpleColumn(campo, 90, 370, 250, 380, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Relacion con el estudiante --  Relation with the student:", fontCampo);
            ct.setSimpleColumn(campo, 90, 350, 350, 360, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Direccion -- Address:", fontCampo);
            ct.setSimpleColumn(campo, 90, 330, 250, 340, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Tel:", fontCampo);
            ct.setSimpleColumn(campo, 90, 295, 350, 305, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("E-mail:", fontCampo);
            ct.setSimpleColumn(campo, 250, 295, 350, 305, 10, Element.ALIGN_LEFT);
            ct.go();


            /* #################################################
             * #  Identificacion del Programa y Lapso de tiempo #
             * ##################################################*/
            // Titulo del area.
            titulo = new Phrase("PROGRAMA Y LAPSO DE ESTUDIO -- PROGRAM AND DURATION", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 260, 450, 290, 20, Element.ALIGN_LEFT);
            ct.go();
            // Linea divisoria del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(60, 265, 500, 0);
            canvas.stroke();
            canvas.restoreState();

            // Universidad de Destino
            campo = new Phrase("Universidad de Origen -- Home Institution:", fontCampo);
            ct.setSimpleColumn(campo, 70, 235, 350, 255, 10, Element.ALIGN_LEFT);
            ct.go();

            // Programa
            campo = new Phrase("Estudios Actuales -- Currently Studying:", fontCampo);
            ct.setSimpleColumn(campo, 70, 215, 350, 235, 10, Element.ALIGN_LEFT);
            ct.go();
            // Fechas Inicio y Fin

            campo = new Phrase("Periodo de estudios en la USB -- Period of studies in USB:", fontCampo);
            ct.setSimpleColumn(campo, 70, 195, 600, 215, 10, Element.ALIGN_LEFT);
            ct.go();
            // Nivel de Suficiencia
            campo = new Phrase("Septiembre - Diciembre      20___     (Sep - Dec).", fontCampo);
            ct.setSimpleColumn(campo, 95, 175, 550, 195, 10, Element.ALIGN_LEFT);
            ct.go();
            // Nivel de Suficiencia
            campo = new Phrase("Enero - Marzo                     20___      (Jan - Mar).", fontCampo);
            ct.setSimpleColumn(campo, 95, 155, 550, 175, 10, Element.ALIGN_LEFT);
            ct.go();
            // Nivel de Suficiencia
            campo = new Phrase("Abril - Julio                         20___      (Apr - Jul).", fontCampo);
            ct.setSimpleColumn(campo, 95, 135, 550, 155, 10, Element.ALIGN_LEFT);
            ct.go();

            // Nivel de Suficiencia
            campo = new Phrase("Motivacion -- Motivation:", fontCampo);
            ct.setSimpleColumn(campo, 70, 125, 550, 135, 10, Element.ALIGN_LEFT);
            ct.go();
            // Area de texto de motivacion
            canvas.saveState();
            canvas.rectangle(100, 70, 370, 45);
            canvas.stroke();
            canvas.restoreState();



            /* ###########################
             * #  Informacion Academica  #
             * ###########################*/
            document.newPage();

            //Estampado de fecha y hora de creacion
            campo = new Phrase(creacion, fontCampo);
            ct.setSimpleColumn(campo, 500, 50, 650, 60, 10, Element.ALIGN_LEFT);
            ct.go();

            // Linea Divisoria  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(60, 715, 500, 0);
            canvas.stroke();
            canvas.restoreState();

            // Titulo del area.
            titulo = new Phrase("INFORMACION ACADEMICA -- ACADEMIC INFORMATION:", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 720, 450, 745, 25, Element.ALIGN_LEFT);
            ct.go();

            // Tabla de materias.
            canvas.saveState();
            canvas.rectangle(90, 470, 425, 203);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            canvas.rectangle(90, 635, 425, 0);

            canvas.stroke();
            canvas.restoreState();

            // Tabla de la seccion 18
            canvas.saveState();
            canvas.rectangle(150, 470, 0, 203);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            canvas.rectangle(220, 470, 0, 203);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            canvas.rectangle(295, 470, 0, 203);
            canvas.stroke();
            canvas.restoreState();

            // Tabla de la seccion 19
            canvas.saveState();
            canvas.rectangle(298, 470, 0, 203);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();

            canvas.rectangle(360, 470, 0, 203);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            canvas.rectangle(430, 470, 0, 203);
            canvas.stroke();
            canvas.restoreState();


            // Plan de Estudio
            campo = new Phrase("Asignaturas del Plan de Estudio de la Institucion de Origen \n "
                    + "Study Plan of the home institution.", fontCampo);

            ct.setSimpleColumn(campo, 90, 640, 300, 700, 10, Element.ALIGN_CENTER);
            ct.go();

            campo = new Phrase("Codigo \n Code", fontCampo);
            ct.setSimpleColumn(campo, 90, 615, 150, 665, 10, Element.ALIGN_CENTER);
            ct.go();

            campo = new Phrase("Denominacion \n Denomination", fontCampo);

            ct.setSimpleColumn(campo, 160, 615, 210, 665, 10, Element.ALIGN_CENTER);
            ct.go();

            campo = new Phrase("Nro Creditos \n Number of Credits", fontCampo);
            ct.setSimpleColumn(campo, 215, 615, 300, 665, 10, Element.ALIGN_CENTER);
            ct.go();


            // Asignaturas a cursar
            campo = new Phrase("Asignaturas a cursar en la USB \n Study Plan in the USB", fontCampo);

            ct.setSimpleColumn(campo, 335, 650, 500, 700, 10, Element.ALIGN_CENTER);
            ct.go();

            campo = new Phrase("Codigo \n Code", fontCampo);
            ct.setSimpleColumn(campo, 255, 615, 400, 665, 10, Element.ALIGN_CENTER);
            ct.go();

            campo = new Phrase("Denominacion \n Denomination", fontCampo);

            ct.setSimpleColumn(campo, 290, 615, 500, 665, 10, Element.ALIGN_CENTER);
            ct.go();

            campo = new Phrase("Nro Creditos \n Number of Credits", fontCampo);
            ct.setSimpleColumn(campo, 400, 605, 550, 670, 10, Element.ALIGN_CENTER);
            ct.go();

            /* ################################
             * #  Firma y Fecha de Solici7tud  # 
             * ################################*/
            // Firma Solicitante
            campo = new Phrase("Firma del Solicitante \n Signature of the applicant", fontCampo);
            ct.setSimpleColumn(campo, 90, 430, 200, 450, 10, Element.ALIGN_CENTER);
            ct.go();

            // Indice
            campo = new Phrase("Fecha de Solicitud:   ____/____/____ \nDate of application", fontCampo);
            ct.setSimpleColumn(campo, 350, 430, 500, 450, 10, Element.ALIGN_LEFT);
            ct.go();

            // Declaracion de veracidad
            campo = new Phrase("El estudiante firmante declara que los datos y documentos suministrados son veridicos"
                    + " y asume cumplir cabalmente con las normas del programa de \n"
                    + "intercambio estudiantil.", fontPequena);

            ct.setSimpleColumn(campo, 70, 400, 1000, 420, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("The signing student declares that the information provided and the documents submitted"
                    + "are real, and compromised himself to follow the rules of the"
                    + "\nstudent exchange program.", fontPequena);

            ct.setSimpleColumn(campo, 70, 370, 1000, 390, 10, Element.ALIGN_LEFT);
            ct.go();

            /* ##########################
             * #  Campos Coordinacion   #
             * ##########################*/

            // Cuadro del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(80, 190, 455, 130);
            canvas.stroke();
            canvas.restoreState();

            // Titulo del area.
            titulo = new Phrase("**Esta seccion debe ser llenada exclusivamente por la institucion de origen**"
                    + "\n**This seccion is for use of the home institution**", fontTitulos);
            ct.setSimpleColumn(titulo, 130, 330, 480, 360, 15, Element.ALIGN_CENTER);
            ct.go();

            // Idioma de destino y 
            campo = new Phrase("Opinion de la institucion de origen sobre esta solicitud (explicacion breve)"
                             + "\nOpinion of the home institution about this application (brief explanation)", fontCampo);
            ct.setSimpleColumn(campo, 95, 290, 400, 315, 10, Element.ALIGN_LEFT);
            ct.go();
            // Nivel de Suficiencia
            campo = new Phrase("Muy Favorable -- Exelent :", fontCampo);
            ct.setSimpleColumn(campo, 125, 110, 350, 280, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Favorable -- Good:", fontCampo);
            ct.setSimpleColumn(campo, 125, 90, 600, 260, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Con reservas -- :", fontCampo);
            ct.setSimpleColumn(campo, 125, 70, 600, 240, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Notas -- Grades:", fontCampo);
            ct.setSimpleColumn(campo, 125, 50, 600, 220, 10, Element.ALIGN_LEFT);
            ct.go();

            document.close();

        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return mapping.findForward(SUCCESS);
    }
}
