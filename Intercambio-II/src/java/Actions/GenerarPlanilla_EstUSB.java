/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.PlanillaUSB;
import Clases.Usuario;
import DBMS.DBMS;
import com.itextpdf.text.BaseColor;
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
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author caponte
 */
public class GenerarPlanilla_EstUSB extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String INCOMPLETA = "incompleta";
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

        Document document = new Document(PageSize.LETTER); // Pdf de tamano carta
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Usuario u = (Usuario) form;


        try {

            // Traemos la data de la BD
            PlanillaUSB p = DBMS.getInstance().obtenerPlanillaUSB(u);

            System.out.println(u.getConfirmar());
            System.out.println(u.getNombreusuario());
            int n = 1;
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String creacion = dateFormat.format(cal.getTime());

            PdfWriter salida = PdfWriter.getInstance(document,
                    // CAMBIAR ESTE PATH A LA HORA DE EJECUTAR LOCAL
                    new FileOutputStream("/home/kattys/Desktop/PlanillaIntercambio_USB.pdf"));

            document.addTitle("Planilla Postulacion Intercambio."); //Titulo del PDF.
            document.addCreationDate(); // Fecha de cracion del PDF.
            document.addCreator("dycicle Systems"); // Crador del PDF.
            document.setMargins(36, 72, 108, 180);
            
            // FONTS
            // BaseFont areas = FontFactory.getFont(FontFactory.TIMES_ROMAN).getCalculatedBaseFont(false);
            //Para Titulo Principal
	    Font fontTitulos1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
            //Para Titulo de Áreas
            Font fontTitulos = new Font(FontFamily.HELVETICA, 10, Font.BOLD, BaseColor.BLACK);
            //PAra Subtitulos de bloque
            Font fontTitulos2 = new Font(FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.BLACK);
            //Para texto normal
            Font fontCampo = new Font(FontFamily.HELVETICA, 8, Font.NORMAL, BaseColor.BLACK);
            //para textos pequeños
            Font fontPequena = new Font(FontFamily.HELVETICA, 7, Font.NORMAL, BaseColor.BLACK);
            
            //Apertura Documento
            document.open();

            PdfContentByte canvas = salida.getDirectContent();


            /* ###########################################################
             * #  Header del pdf, titulo, foto del aplicante y logo USB. #
             * ###########################################################*/
            ColumnText ct = new ColumnText(canvas);
            
            //Estampado de fecha y hora de creacion
            Phrase campo = new Phrase("Solicitud Nro:"+ n + "      ||  Fecha Creacion:   "+ creacion, fontCampo);
            ct.setSimpleColumn(campo, 200, 70, 580, 80, 10, Element.ALIGN_RIGHT);
            ct.go();

            // TITULO PRINCIPAL
            Phrase titulo = new Phrase("FORMULARIO DE POSTULACIÓN AL PROGRAMA DE INTERCAMBIO DE ESTUDIANTES", fontTitulos1);
            ct.setSimpleColumn(titulo, 30, 660, 600, 690, 25, Element.ALIGN_CENTER);
            ct.go();

            //IMAGEN APLICANTE
            //Cambiar Path
            Image imagen = Image.getInstance("C:/Users/Katty/Documents/SISTEMAS II/PRUEBAS_iTExtPDF/3985.jpg");
            // define la posicion de la imagen del aplicante
            imagen.setAbsolutePosition(500f, 680f); 
            // define el tamano de la imagen del aplicante
            imagen.scaleAbsolute(75f, 75f); 
            // agrega la imagen al pdf
            document.add(imagen); 

            //IMAGEN CEBOLLA
            //Cambiar Path    
            imagen = Image.getInstance("C:/Users/Katty/Documents/SISTEMAS II/PRUEBAS_iTExtPDF/cebollaUSB.jpg");
            // Posición Imagen
            imagen.setAbsolutePosition(125f, 730f); 
            // Tamano de la imagen
            imagen.scalePercent(20f);
            // agrega la imagen al pdf
            document.add(imagen); 
			
            //ENCABEZADO DERECHA 
            campo = new Phrase("                                             \n"
                    +	"Coordinación de Apoyo a los Programas de Intercambio\n"
                    + "Programa de Intercambio de Estudiantes", fontPequena);
            ct.setSimpleColumn(campo, 200, 625, 480, 730, 10, Element.ALIGN_RIGHT);
            ct.go();

            //ENCABEZADO IZQUIERDA
            campo = new Phrase("                UNIVERSIDAD SIMÓN BOLÍVAR\n"
                    + "                                RECTORADO\n"
                    + "Dirección de Relaciones Internacionales y de Cooperación", fontPequena);
            ct.setSimpleColumn(campo, 60, 625, 340, 730, 10, Element.ALIGN_LEFT);
            ct.go();


            /* #################################
             * #      Datos Personales         #
             * #################################*/
            
            // Titulo del area
            campo = new Phrase("DATOS PERSONALES", fontTitulos);
            ct.setSimpleColumn(campo, 70, 630, 560, 645, 10, Element.ALIGN_LEFT);
            ct.go();
            // Linea divisoria del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(70, 630, 455, 0);
            canvas.stroke();
            canvas.restoreState();

            // Nombres Completo
            campo = new Phrase("1.-Nombre Completo:  "+ p.getNombre1()+ " "+ p.getNombre2()+" "+
                              p.getApellido1()+" "+ p.getApellido2(), fontCampo);
            ct.setSimpleColumn(campo, 70, 610, 300, 620, 10, Element.ALIGN_LEFT);
            ct.go();
            // Género
            campo = new Phrase("2.-Género:  "+p.getSexo(),  fontCampo);
            ct.setSimpleColumn(campo, 70, 590, 350, 600, 10, Element.ALIGN_LEFT);
            ct.go();
            // Email
            campo = new Phrase("3.-Email:  "+p.getEmail(),  fontCampo);
            ct.setSimpleColumn(campo, 70, 570, 250, 580, 10, Element.ALIGN_LEFT);
            ct.go();
            //Fecha de Nacimiento
            campo = new Phrase("5.- Fecha de Nacimiento:  "+ p.getFechaNacimiento(), fontCampo);
            ct.setSimpleColumn(campo, 320, 590, 560, 600, 10, Element.ALIGN_LEFT);
            ct.go();
            //Nacionalidad
            campo = new Phrase("6.- Nacionalidad:  "+p.getNacionalidad(), fontCampo);
            ct.setSimpleColumn(campo, 320, 570, 600, 580, 10, Element.ALIGN_LEFT);
            ct.go();
            //Cédula de Identidad
            campo = new Phrase("7.-Cédula de Identidad:  "+ p.getCedula() , fontCampo);
            ct.setSimpleColumn(campo, 70, 550, 300, 560, 10, Element.ALIGN_LEFT);
            ct.go();
            // Carnet USB
            campo = new Phrase("8.-Carné Estudiantil USB:  "+p.getCarnet()  ,fontCampo);
            ct.setSimpleColumn(campo, 70, 530, 300, 540, 10, Element.ALIGN_LEFT);
            ct.go();
            // Tlf. Celular
            campo = new Phrase("9.-Tlf. Celular:  "+ p.getTelefonoCelular() ,fontCampo);
            ct.setSimpleColumn(campo, 320, 550, 600, 560, 10, Element.ALIGN_LEFT);
            ct.go();
            // Tlf. Habitación
            campo = new Phrase("10.-Tlf. Habitación:  "+ p.getTelefonoCasa() ,fontCampo);
            ct.setSimpleColumn(campo, 320, 530, 600, 540, 10, Element.ALIGN_LEFT);
            ct.go();
            // Domicilio
            campo = new Phrase("11.-Domicilio Actual  ", fontCampo);
            ct.setSimpleColumn(campo, 70, 510, 300, 520, 10, Element.ALIGN_LEFT);
            ct.go();
            // Urb/Sector/Barrio
            campo = new Phrase("11.1.-Urb/Sector/Barrio:  "+ p.getUrbanizacion() ,fontCampo);
            ct.setSimpleColumn(campo, 90, 490, 300, 500, 10, Element.ALIGN_LEFT);
            ct.go();
            // Calle
            campo = new Phrase("11.2.-Calle:  "+ p.getCalle() ,fontCampo);
            ct.setSimpleColumn(campo, 90, 470, 300, 480, 10, Element.ALIGN_LEFT);
            ct.go();
            // Ciudad
            campo = new Phrase("11.5.-Ciudad:  " + p.getCiudad()  ,fontCampo);
            ct.setSimpleColumn(campo, 90, 450, 300, 460, 10, Element.ALIGN_LEFT);
            ct.go();
            // Codigo Postal
            campo = new Phrase("11.7.-Código Postal:  " + p.getCodPostal()  ,fontCampo);
            ct.setSimpleColumn(campo, 90, 430, 300, 440, 10, Element.ALIGN_LEFT);
            ct.go();
            // Edificio/NombreCasa
            campo = new Phrase("11.3.-Nombre (Edificio|Casa): " + p.getEdificio()  ,fontCampo);
            ct.setSimpleColumn(campo, 320, 490, 600, 500, 10, Element.ALIGN_LEFT);
            ct.go();
            // Apartamento/Nro.Casa
            campo = new Phrase("11.4.-Apartamento/Nro.Casa: " + p.getApartamento() ,fontCampo);
            ct.setSimpleColumn(campo, 320, 470, 600, 480, 10, Element.ALIGN_LEFT);
            ct.go();
            // Estado
            campo = new Phrase("11.6.-Estado:  " + p.getEstado() , fontCampo);
            ct.setSimpleColumn(campo, 320, 450, 600, 460, 10, Element.ALIGN_LEFT);
            ct.go();
            
            
            /* #################################################
             * #  Identificacion del Programa y Lapso de tiempo #
             * ##################################################*/
            // Titulo del area.
            titulo = new Phrase("IDENTIFICACIÓN DEL PROGRAMA Y LAPSO DE ESTUDIO EN INTERCAMBIO:  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 400, 450, 420, 20, Element.ALIGN_LEFT);
            ct.go();
            // Linea divisoria del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(70, 395, 455, 0);
            canvas.stroke();
            canvas.restoreState();
            
            //Subtitulo Area PRIMERA OPCION
            titulo = new Phrase("12.- Primera Opción  ", fontTitulos2);
            ct.setSimpleColumn(titulo, 70, 370, 450, 380, 10, Element.ALIGN_LEFT);
            ct.go();
            // País de Destino
            campo = new Phrase("12.1-País de Destino:  " + p.getPaisOpcion1() , fontCampo);
            ct.setSimpleColumn(campo, 70, 350, 300, 360, 10, Element.ALIGN_LEFT);
            ct.go();
            // Tipo de Programa
            campo = new Phrase("12.2-Tipo de Programa:  " + p.getProgramaOpcion1() , fontCampo);
            ct.setSimpleColumn(campo, 70, 330, 300, 340, 10, Element.ALIGN_LEFT);
            ct.go();
            // Duración del Programa
            campo = new Phrase("12.3.-Duración del Programa:  " + p.getDuracionProgramaOpcion1() , fontCampo);
            ct.setSimpleColumn(campo, 320, 350, 600, 360, 10, Element.ALIGN_LEFT);
            ct.go();
            // Programa
            campo = new Phrase("12.4.-Nombre del Programa:  " + p.getNombreProgramaOpcion1(), fontCampo);
            ct.setSimpleColumn(campo, 320, 330, 600, 340, 10, Element.ALIGN_LEFT);
            ct.go();
            //Nombre de la Universidad de Destino
            campo = new Phrase("12.5.-Nombre de la Universidad de Destino:  " + p.getNombreOpcion1(), fontCampo);
            ct.setSimpleColumn(campo, 70, 310, 600, 320, 10, Element.ALIGN_LEFT);
            ct.go();
            //Fechas Inicio y Fin
            campo = new Phrase("12.5.-Fechas tentativas de Inicio y Fin(según calendario de la Universidad de Destino)", fontCampo);
            ct.setSimpleColumn(campo, 70, 290, 600, 300, 10, Element.ALIGN_LEFT);
            ct.go();
            //aquivas
            campo = new Phrase("12.5.1.-Inicio:  " + p.getMesFechaIni1()+ " "+ p.getAnoFechaIni1() , fontCampo);
            ct.setSimpleColumn(campo, 90, 270, 300, 280, 10, Element.ALIGN_CENTER);
            ct.go();
            //aquivas1
            campo = new Phrase("12.5.2.-Fin: "+p.getMesFechaFin1()+ " "+ p.getAnoFechaFin1() , fontCampo);
            ct.setSimpleColumn(campo, 90, 250, 300, 260, 10, Element.ALIGN_CENTER);
            ct.go();
            
            //Subtitulo Area SEGUNDA OPCION
            titulo = new Phrase("13.-Segunda Opción  ", fontTitulos2);
            ct.setSimpleColumn(titulo, 70, 230, 450, 240, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("En caso de no ser aceptado en la Universidad seleccionada favor indique una segunda opción  ", fontPequena);
            ct.setSimpleColumn(campo, 70, 220, 550, 230, 10, Element.ALIGN_LEFT);
            ct.go();
            // País de Destino
            campo = new Phrase("13.1.-País de Destino:  "+ p.getPaisOpcion2() , fontCampo);
            ct.setSimpleColumn(campo, 70, 200, 300, 210, 10, Element.ALIGN_LEFT);
            ct.go();
            // Tipo de Programa
            campo = new Phrase("13.2.-Tipo de Programa:  " + p.getProgramaOpcion2(), fontCampo);
            ct.setSimpleColumn(campo, 70, 180, 300, 190, 10, Element.ALIGN_LEFT);
            ct.go();
            //Duracion del Programa
            campo = new Phrase("13.3.-Duración del Programa:  "+ p.getDuracionProgramaOpcion2(), fontCampo);
            ct.setSimpleColumn(campo, 320, 200, 600, 210, 10, Element.ALIGN_LEFT);
            ct.go();
            // Programa
            campo = new Phrase("13.4.-Nombre del Programa:  " + p.getNombreProgramaOpcion2(), fontCampo);
            ct.setSimpleColumn(campo, 320, 180, 600, 190, 10, Element.ALIGN_LEFT);
            ct.go();
            // Universidad de Destino
            campo = new Phrase("12.5.-Nombre Universidad de Destino:  " + p.getNombreOpcion2() , fontCampo);
            ct.setSimpleColumn(campo, 70, 160, 600, 170, 10, Element.ALIGN_LEFT);
            ct.go();
            //Fechas Inicio y Fin
            campo = new Phrase("13.5.-Fechas tentativas de Inicio y Fin(Según calendario de la Universidad de Destino) ", fontCampo);
            ct.setSimpleColumn(campo, 70, 140, 600, 150, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("13.5.1.-Inicio:  " + p.getMesFechaIni2()+" "+ p.getAnoFechaIni2() , fontCampo);
            ct.setSimpleColumn(campo, 90, 120, 300, 130, 10, Element.ALIGN_CENTER);
            ct.go();
            campo = new Phrase("13.5.2.-Fin:  " +p.getMesFechaFin2() +" "+ p.getAnoFechaFin2() , fontCampo);
            ct.setSimpleColumn(campo, 90, 100, 300, 110, 10, Element.ALIGN_CENTER);
            ct.go();
            
            
            /* ###########################
             * #  Informacion Academica  #
             * ###########################*/

            document.newPage();

            //Estampado de numero de planilla, fecha y hora de creacion
            campo = new Phrase("Solicitud Nro:"+ n + "      ||  Fecha Creación:  "  + creacion, fontCampo);
            ct.setSimpleColumn(campo, 200, 20, 580, 30, 10, Element.ALIGN_RIGHT);
            ct.go();

            // Linea Divisoria  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(70, 715, 455, 0);
            canvas.stroke();
            canvas.restoreState();

            // Titulo del area.
            titulo = new Phrase("INFORMACIÓN ACADÉMICA:  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 720, 450, 745, 25, Element.ALIGN_LEFT);
            ct.go();
            //Decanato
            campo = new Phrase("14.-Decanato:  " + p.getDecanato() , fontCampo);
            ct.setSimpleColumn(campo, 70, 690, 350, 700, 10, Element.ALIGN_LEFT);
            ct.go();
            // Nro de Créditos Aprobados
            campo = new Phrase("17.-Nro de Créditos Aprobados a la Fecha de Postulación:  " + p.getCreditosApro() , fontCampo);
            ct.setSimpleColumn(campo, 310, 690, 600, 700, 10, Element.ALIGN_LEFT);
            ct.go();
            //Carrera
            campo = new Phrase("15.-Carrera que estudia en la USB:  " + p.getCarrera() , fontCampo);
            ct.setSimpleColumn(campo, 70, 670, 350, 680, 10, Element.ALIGN_LEFT);
            ct.go();
            // Índice Académico
            campo = new Phrase("18.-Índice Académico a la Fecha de Postulación:  "+ p.getIndice() , fontCampo);
            ct.setSimpleColumn(campo, 310, 670, 600, 680, 10, Element.ALIGN_LEFT);
            ct.go();
            // Área de Estudio
            campo = new Phrase("16.-Área de Estudio:  " + p.getAreaEstud() , fontCampo);
            ct.setSimpleColumn(campo, 70, 650, 350, 660, 10, Element.ALIGN_LEFT);
            ct.go();
            // Índice Ponderado
            campo = new Phrase("19.-Índice Ponderado a la Fecha de postulación:  " + p.getIndicePon() , fontCampo);
            ct.setSimpleColumn(campo, 310, 650, 600, 660, 10, Element.ALIGN_LEFT);
            ct.go();

            // Tabla de materias.
            canvas.saveState();
            //Rectangulo grabde, cubre los títulos
            canvas.rectangle(70, 420, 455, 190);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            //Rectangulo pequeño
            canvas.rectangle(70, 580, 450, 0);
            canvas.stroke();
            canvas.restoreState();

            // Tabla de la seccion 20
            canvas.saveState();
            canvas.rectangle(150, 420, 0, 190);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            canvas.rectangle(220, 420, 0, 190);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            canvas.rectangle(295, 420, 0, 190);
            canvas.stroke();
            canvas.restoreState();


            // Tabla de la seccion 21
            canvas.saveState();
            canvas.rectangle(298, 420, 0, 190);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            canvas.rectangle(360, 420, 0, 190);
            canvas.stroke();
            canvas.restoreState();
            canvas.saveState();
            canvas.rectangle(430, 420, 0, 190);
            canvas.stroke();
            canvas.restoreState();


            // Plan de Estudio
            campo = new Phrase("20.-Asignaturas del Plan de Estudio USB que aspira \n "
                             + "sean convalidadas u otorgadas en equivalencia:  ", fontCampo);
            ct.setSimpleColumn(campo, 70, 620, 350, 640, 10, Element.ALIGN_LEFT);
            ct.go();
// SACAR DEL ArrayList LISTA las materias y colocarlas
            campo = new Phrase("Código", fontCampo);
            ct.setSimpleColumn(campo, 90, 590, 500, 610, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Denominación", fontCampo);
            ct.setSimpleColumn(campo, 160, 590, 500, 610, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Nro Créditos USB", fontCampo);
            ct.setSimpleColumn(campo, 230, 590, 500, 610, 10, Element.ALIGN_LEFT);
            ct.go();


            // Asignaturas a cursar
            campo = new Phrase("21.-Asignaturas a cursar en la Universidad de Destino:  ", fontCampo);
            ct.setSimpleColumn(campo, 310, 620, 600, 640, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Código", fontCampo);
            ct.setSimpleColumn(campo, 315, 590, 500, 610, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Denominación", fontCampo);
            ct.setSimpleColumn(campo, 370, 590, 500, 610, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Nro Créditos \n Nro Horas x Semana", fontCampo);
            ct.setSimpleColumn(campo, 400, 580, 550, 610, 10, Element.ALIGN_CENTER);
            ct.go();
            
            //Cuadro de Aprobación de la Coordinación
            canvas.saveState();
            canvas.rectangle(70, 390, 455, 30);
            canvas.stroke();
            canvas.restoreState();
            // Mensaje Aprobación
            campo = new Phrase("Aprobación Coordinación de la Carrera  " , fontCampo);
            ct.setSimpleColumn(campo, 70, 400, 300, 410, 10, Element.ALIGN_CENTER);
            ct.go();
            // línea firma
            canvas.saveState();
            canvas.rectangle(310, 400, 170, 0);
            canvas.stroke();
            canvas.restoreState();
            
            /* ##############################
             * #  FUENTE DE FINANCIAMIENTOO #
             * ##############################*/
            // Cuadro del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(70, 355, 455, 0);
            canvas.stroke();
            canvas.restoreState();
            
            // Titulo del area.
            titulo = new Phrase("FUENTE DE FINANCIAMIENTO DEL ESTUDIANTE:  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 350, 500, 370, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Fuente de Ingresos
            titulo = new Phrase("22.- Principal Fuente de Ingresos:  " + p.getFuenteFinanciamiento(), fontCampo);
            ct.setSimpleColumn(titulo, 70, 330, 500, 340, 10, Element.ALIGN_LEFT);
            ct.go();
            //Becado o no
            campo = new Phrase("23.-¿Recibe ayuda económica por parte de la universidad u otro organismo?  " + p.getAyudaEc() , fontCampo);
            ct.setSimpleColumn(campo, 70, 310, 550, 320, 10, Element.ALIGN_LEFT);
            ct.go();
            
            /* ##############################
             * #  CONOCIMIENTO DE IDIOMAS   #
             * ##############################*/
            
            //Cuadro del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(70, 275, 455, 0);
            canvas.stroke();
            canvas.restoreState();
            // Titulo del area.
            titulo = new Phrase("CONOCIMIENTO DE IDIOMAS  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 280, 450, 300, 20, Element.ALIGN_LEFT);
            ct.go();
            // Idioma de destino
            campo = new Phrase("24.-Idioma a emplear en la Universidad de Destino:  " + p.getIdiomaDest() , fontCampo);
            ct.setSimpleColumn(campo, 70, 260, 450, 270, 10, Element.ALIGN_LEFT);
            ct.go();
            //Nivel de Suficiencia
            campo = new Phrase("25.-Nivel de Suficiencia del idioma a emplear:  ", fontCampo);
            ct.setSimpleColumn(campo, 70, 240, 600, 250, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("25.1.-Verbal:  " + p.getNivelVerbal(), fontCampo);
            ct.setSimpleColumn(campo, 90, 220, 550, 230, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("25.2.-Escrito: " + p.getNivelEscrito(), fontCampo);
            ct.setSimpleColumn(campo, 90, 200, 550, 210, 10, Element.ALIGN_LEFT);
            ct.go();
            
            /* ##############################
             * #  	INFO CONTACTO       #
             * ##############################*/
            
            //Cuadro del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(70, 165, 455, 0);
            canvas.stroke();
            canvas.restoreState();
            //Titulo del area.
            titulo = new Phrase("DATOS DE CONTACTO EN CASO DE EMERGENCIA  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 170, 450, 190, 20, Element.ALIGN_LEFT);
            ct.go();
            //Nombre Contacto
            campo = new Phrase("26.-Nombre Contacto:  " + p.getNombresRep(), fontCampo);
            ct.setSimpleColumn(campo, 70, 150, 300, 160, 10, Element.ALIGN_LEFT);
            ct.go();
            //Apellido Contacto
            campo = new Phrase("27.-Apellido Contacto:  " + p.getApellidosRep(), fontCampo);
            ct.setSimpleColumn(campo, 320, 150, 600, 160, 10, Element.ALIGN_LEFT);
            //Tlf. Habitación Contacto
            campo = new Phrase("28.-Tlf. Habitación Contacto:  " + p.getTlfRepCasa() , fontCampo);
            ct.setSimpleColumn(campo, 70, 130, 300, 140, 10, Element.ALIGN_LEFT);
            ct.go();
            //Tlf. Celular Contacto
            campo = new Phrase("29.-Tlf. Celular Contacto:  " + p.getCelRep() , fontCampo);
            ct.setSimpleColumn(campo, 320, 130, 600, 140, 10, Element.ALIGN_LEFT);
            ct.go();
            //Relación con el Estudiante
            campo = new Phrase("30.-Relación con el Estudiante:  " + p.getRelacion() , fontCampo);
            ct.setSimpleColumn(campo, 70, 110, 300, 120, 10, Element.ALIGN_LEFT);
            ct.go();
            //Email Contacto
            campo = new Phrase("31.-Email Contacto:  " + p.getEmailRep() , fontCampo);
            ct.setSimpleColumn(campo, 320, 110, 600, 120, 10, Element.ALIGN_LEFT);
            ct.go();
            //Domicilio Contacto
            campo = new Phrase("32.-Domicilio Contacto:  " + p.getDireccionRep() , fontCampo);
            ct.setSimpleColumn(campo, 70, 90, 600, 100, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //NUEVA PAGINA
            
            document.newPage();

            //Estampado de numero de planilla, fecha y hora de creacion
            campo = new Phrase("Solicitud Nro:"+ n + "      ||  Fecha Creacion:  "  + creacion, fontCampo);
            ct.setSimpleColumn(campo, 200, 20, 580, 30, 10, Element.ALIGN_RIGHT);
            ct.go();
			
			
            // CUADRITO 
            canvas.saveState();
            canvas.rectangle(60, 605, 470, 110);
            canvas.stroke();
            canvas.restoreState();

            
            /* ################################
             * #  Firma y Fecha de Solicitud  # 
             * ################################*/
            // Firma Solicitante
            campo = new Phrase("Firma del Solicitante:  ", fontCampo);
            ct.setSimpleColumn(campo, 70, 670, 200, 690, 15, Element.ALIGN_CENTER);
            ct.go();

            dateFormat = new SimpleDateFormat("MM/dd/yyyy");
            cal = Calendar.getInstance();
            creacion = dateFormat.format(cal.getTime());

            //FECHA SOLICITUD
            campo = new Phrase("Fecha de Solicitud:  " + creacion, fontCampo);
            ct.setSimpleColumn(campo, 230, 670, 460, 690, 15, Element.ALIGN_CENTER);
            ct.go();

            //Declaracion de veracidad
            campo = new Phrase("El estudiante firmante declara que los datos y documentos suministrados son verídicos"
                    + " y asume cumplir cabalmente con las normas del programa de intercambio estudiantil.", fontPequena);

            ct.setSimpleColumn(campo, 120, 605, 500, 650, 15, Element.ALIGN_CENTER);
			//ct.setSimpleColumn(campo, 70, 190, 1000, 230, 10, Element.ALIGN_LEFT);
            ct.go();

            /* ##########################
             * #  Campos Coordinacion   #
             * ##########################*/

            //Cuadro del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.rectangle(60, 430, 470, 110);
            canvas.stroke();
            canvas.restoreState();

            //Titulo del area.
            titulo = new Phrase("           **Esta sección debe ser llenada exclusivamente por la Coordinación Docente**", fontTitulos);
            ct.setSimpleColumn(titulo, 60, 530, 660, 570, 20, Element.ALIGN_LEFT);
            ct.go();
			
             //Idioma de destino y 
            campo = new Phrase("Opinión de la Coordinación Docente sobre esta solicitud (explicación breve):  ", fontCampo);
            ct.setSimpleColumn(campo, 90, 520, 660, 530, 10, Element.ALIGN_LEFT);
            ct.go();
            //Nivel de Suficiencia
            campo = new Phrase("Muy Favorable:  ", fontCampo);
            ct.setSimpleColumn(campo, 125, 500, 350, 510, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Favorable:  ", fontCampo);
            ct.setSimpleColumn(campo, 125, 480, 600, 490, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Con reservas:  ", fontCampo);
            ct.setSimpleColumn(campo, 125, 460, 600, 470, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Índice normalizado:  ", fontCampo);
            ct.setSimpleColumn(campo, 125, 440, 600, 450, 10, Element.ALIGN_LEFT);
            ct.go(); 


            document.close();

        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        
        boolean boo = DBMS.getInstance().registrar(u.getNombreusuario(),"Generacion del pdf con la planilla del estudiante nacional");
        return mapping.findForward(SUCCESS);
    }
}
