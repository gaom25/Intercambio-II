<%-- 
    Document   : formularioSolicitudExt
    Created on : Feb 27, 2013, 8:48:45 AM
    Author     : dreabalbas
--%>

<%Object var = session.getAttribute("nombreusuario");%>

<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html:html lang="true">

    <script language="javascript">
        var fCount = 0;
        var Count = 0;
        var mCount = 0;
        
        
        function addMate(tableID) {
            mCount++;

            var fObject = document.getElementById(tableID);
            var checkbox2 = "checkbox";
            var nomUSB = "materiaUSB[" +  mCount +  "]";
            var codUSB = "codigoUSB[" +  mCount +  "]";
            var creUSB = "creditosUSB[" +  mCount +  "]";
            var arr2 = "c[]";
            var type = "text";
            
            var style1 = "width:80%;";
            var style2 = "width:60%;";
            
            var o2 = document.createElement("input");
            var check2 = document.createElement("input");
            var i1 = document.createElement("input");
            var i2 = document.createElement("input");
            var i3 = document.createElement("input");
            var tr = document.createElement("tr");
            var td = document.createElement("td");
            var td2 = document.createElement("td");
            var td4 = document.createElement("td");
            var td6 = document.createElement("td");
            var td8 = document.createElement("td");
            var td10 = document.createElement("td");
            var td12 = document.createElement("td");
                
            //Atributos para el checkbox
            check2.setAttribute("type",checkbox2);
            check2.setAttribute("name",arr2);
            i1.setAttribute("type",type);
            i1.setAttribute("name",codUSB);
            i1.setAttribute("style",style1);
            i2.setAttribute("type",type);
            i2.setAttribute("name",nomUSB);
            i2.setAttribute("style",style1);
            i3.setAttribute("type",type);
            i3.setAttribute("name",creUSB);
            i3.setAttribute("style",style1);
             
            td.appendChild(check2);
            td2.appendChild(i1);
            td4.appendChild(i2);
            td6.appendChild(i3);
            
            
            tr.appendChild(td);
            
            tr.appendChild(td2);
            
            tr.appendChild(td4);
            
            tr.appendChild(td6);
            
            fObject.appendChild(tr);
               
        }
        
       
        function addIdi(tableID) {
            Count++;

            var fObject = document.getElementById(tableID);
            var checkbox = "checkbox";
            var idioma = "idiomaDest[" +  Count +  "]";
            var verbal = "nivelVerbal[" +  Count +  "]";
            var escrito = "nivelEscrito[" +  Count +  "]";
            var conversacional = "nivelConversacional[" + Count + "]";
            var basico = "Basico";
            var intermedio = "Intermedio";
            var avanzado = "Avanzado";
            var arr = "chk[]";
            var type = "text";
            
            var tit1 = "Idioma que maneja";
            var tit2 = "Nivel Verbal";
            var tit3 = "Nivel Escrito";
            var tit4 = "Nivel Conversacional";
            var o2 = document.createElement("input");
            var check = document.createElement("input");
            
            //Nivel Escrito
            var op1 = document.createElement("option"); //basico
            var op2 = document.createElement("option");//intermedio
            var op3 = document.createElement("option");//avanzado
            
            //Nivel Verbal
            var op4 = document.createElement("option");//basico
            var op5 = document.createElement("option");//intermedio
            var op6 = document.createElement("option");//avanzado
            
            //Nivel Conversacional
            var op7 = document.createElement("option");//basico
            var op8 = document.createElement("option"); //intermedio
            var op9 = document.createElement("option"); //avanzado
            
            var op10 = document.createElement("option");
            var op11 = document.createElement("option");
            
            var tr = document.createElement("tr");
            var select1 = document.createElement("select");
            var select2 =document.createElement("select");
            var select3 = document.createElement("select");
            var td = document.createElement("td");
            var td2 = document.createElement("td");
            var td3 = document.createElement("td");
            var td4 = document.createElement("td");
            var td5 = document.createElement("td");
            var td6 = document.createElement("td");
            var td7 = document.createElement("td");
            var td8 = document.createElement("td");
            var td9 = document.createElement("td");
                
            //Atributos para el checkbox
            check.setAttribute("type",checkbox);
            check.setAttribute("name",arr);
            op1.setAttribute("value",basico);
            op1.innerHTML = "Basico";
            op4.setAttribute("value",basico);
            op4.innerHTML = "Basico";
            op7.setAttribute("value", basico);
            op7.innerHTML = "Basico";
            op2.setAttribute("value",intermedio);
            op2.innerHTML = "Intermedio";
            op5.setAttribute("value",intermedio);
            op5.innerHTML = "Intermedio";
            op8.setAttribute("value", intermedio);
            op8.innerHTML = "Intermedio";
            op3.setAttribute("value",avanzado);
            op3.innerHTML = "Avanzado";
            op6.setAttribute("value",avanzado);
            op6.innerHTML = "Avanzado";
            op9.setAttribute("value", avanzado);
            op9.innerHTML = "Avanzado";
            
            op10.setAttribute("value","")
            op11.setAttribute("value","")
            op12.setAttribute("value","")
            
            o2.setAttribute("type",type);
            o2.setAttribute("name",idioma);
            op1.setAttribute("value",basico);
            op2.setAttribute("value", intermedio);
            op3.setAttribute("value",avanzado);
            select1.setAttribute("name",verbal);
            select2.setAttribute("name",escrito);
            select3.setAttribute("name",conversacional);
            
            td7.appendChild(check);
            tr.appendChild(td7);
            td.innerHTML = tit1;
            tr.appendChild(td);
            td2.appendChild(o2);
            tr.appendChild(td2);
            
            td3.innerHTML = tit2;
            tr.appendChild(td3);
            select1.appendChild(op7);
            select1.appendChild(op1);
            select1.appendChild(op2);
            select1.appendChild(op3);
            td4.appendChild(select1);
            tr.appendChild(td4);
            
            td5.innerHTML = tit3;
            tr.appendChild(td5);
            select2.appendChild(op8);
            select2.appendChild(op4);
            select2.appendChild(op5);
            select2.appendChild(op6);
            td6.appendChild(select2);
            tr.appendChild(td6);
            
            td8.innerHTML = tit4;
            tr.appendChild(td8);
            select3.appendChild(op12);
            select3.appendChild(op7);
            select3.appendChild(op8);
            select3.appendChild(op9);
            
            fObject.appendChild(tr);
               
        }
         
        
        function addRow(tableID) {
            fCount++;

            var fObject = document.getElementById(tableID);
            var checkbox = "checkbox";
            var tag='<input type="file" name="theFile[' +  fCount +  ']" value="">';
            var name = "theFile[" +  fCount +  "]";
            var file = "file";
            var valgin = "middle";
            var value = "";
            var id = "archivos";
            var clas = "feed";
            var arr = "chk[]"
            var style = "position:relative;"
            var o3 = document.createElement("br");
            var o2 = document.createElement("input");
            var check = document.createElement("input");
            var tr = document.createElement("tr");
            var td = document.createElement("td");
            var div1 = document.createElement("div");
            var div2 = document.createElement("div");
                
                
               
            //Atributos para div1
            div1.setAttribute("id",id);
            //fin de atributos para div1
                
            //Atributos para div2
            div2.setAttribute("class",clas);
            //fin de atributos para div2
                
            //Atributos para el checkbox
            check.setAttribute("type",checkbox);
            check.setAttribute("name",arr)
            //Fin de atributos para checkbox
            //Atributos para el archivo
            o2.setAttribute("type", file);
            o2.setAttribute("name", name );
            o2.setAttribute("value", value);
            o2.setAttribute("styame", name );
            o2.setAttribute("valule",style);
            //Fin Atributos para el archivo
            var td2 = document.createElement("td").appendChild(div1).appendChild(div2).appendChild(o2);
                
            //Atributos para el td interno
            td2.setAttribute("valgin",valgin);
            //Fin atributos del td
                                
            fObject.appendChild(tr).appendChild(td).appendChild(check);
                
            var segundo_p = document.getElementById(tableID).getElementsByTagName('td');
                
                
            fObject.appendChild(tr).insertBefore(td2, segundo_p);
       
        }
 
        function deleteRow(tableID) {
            try {

                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;
	
                for(var i=0; i<rowCount; i++) {
                    var row = table.rows[i];
                    var chkbox = row.cells[0].childNodes[0];
                    if(null != chkbox && true == chkbox.checked) {
				
                        if(rowCount <= 1) {
                            alert("No puede borrar todas las opciones");
                            break;
                        }
                        table.deleteRow(i);
                        rowCount--;
                        i--;
                    }
	
                }
		
            } catch(e) {
                alert(e);
            }
        }
        
        function deletePlan(tableID) {
            try {

                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;
        
                for(var i=0; i<rowCount; i++) {
                    var row = table.rows[i];
                    var chkbox = row.cells[0].childNodes[0];
                    
                    if(null != chkbox && true == chkbox.checked) {	
                        if(rowCount <= 2) {
                            alert("No puede borrar todas las opciones");
                            break;
                        }
                       
                        table.deleteRow(i);
                        rowCount--;
                        i--;
                    }
	
                }
		
            } catch(e) {
                alert(e);
            }
        }
        
        function show(target){
            document.getElementById(target).style.display = 'block';
        }

        function hide(target){
            document.getElementById(target).style.display = 'none';
        }

        function seleccion(opc)
        {
            //escondemos todos los contenidos
            document.getElementById("opci1").style.display="none";
            document.getElementById("opci2").style.display="none";
            document.getElementById("opci3").style.display="none";
            document.getElementById("opci4").style.display="none";
            document.getElementById("opci5").style.display="none";
            document.getElementById("opci6").style.display="none";
            switch(opc)
            {
                    case 1:
                            //mostramos elcontenido de la primera opcion
                            document.getElementById("opci1").style.display="block";
                            break;
                    case 2:
                            //mostramos elcontenido de la segunda opcion
                            document.getElementById("opci2").style.display="block";
                            break;
                    case 3:
                            //mostramos elcontenido de la tercera opcion
                            document.getElementById("opci3").style.display="block";
                            break;
                    case 4:
                            //mostramos elcontenido de la tercera opcion
                            document.getElementById("opci4").style.display="block";
                            break;
                    case 5:
                            //mostramos elcontenido de la tercera opcion
                            document.getElementById("opci5").style.display="block";
                            break;
                    case 6:
                            //mostramos elcontenido de la tercera opcion
                            document.getElementById("opci6").style.display="block";
                            break;                           
            }
        }

// CAMBIA EL PAIS DE ACUERDO AL TIPO DE CONVENIO ELEGIDO

    // Convenios Bilaterales
    var paises_1=new Array("Seleccione", "Alemania","Australia", "Canadá", "Colombia", "España", "Estados Unidos", "Finlandia", "Francia", "Italia", "Japón", "México", "Noruega", "Perú", "Puerto Rico", "Reino Unido", "Suecia")
    // SMILE
    var paises_2=new Array("Seleccione", "Alemania", "Bélgica", "Brasil", "Chile", "Colombia", "España", "Polonia", "Portugal", "República Checa")
    // CINDA
    var paises_3=new Array("Seleccione", "Argentina", "Bolivia", "Brasil", "Chile", "Colombia", "Costa Rica", "Ecuador", "España", "Italia", "México", "Panamá", "Paraguay", "Perú", "República Dominicada", "Uruguay", "Venezuela")

    function cambia_pais(){ 
        //tomo el valor del select del pais elegido 
        programa = document.getElementById("prog_princ")[document.getElementById("prog_princ").selectedIndex].value 
        if (programa != 0) { 
           mis_paises=eval("paises_" + programa) 
           num_paises = mis_paises.length 
           document.getElementById("pais_princ").length = num_paises
           for(i=0;i<num_paises;i++){ 
              document.getElementById("pais_princ").options[i].value=i
              document.getElementById("pais_princ").options[i].text=mis_paises[i] 
           } 
        }else{ 
           //si no había provincia seleccionada, elimino las universidades del select 
           document.getElementById("pais_princ").length = 1 
           document.getElementById("pais_princ").options[0].value = "-" 
           document.getElementById("pais_princ").options[0].text = "-" 
        } 
        //marco como seleccionada la opción primera de provincia 
        document.getElementById("pais_princ").options[0].selected = true 
    }

    function cambia_pais2(){ 
        //tomo el valor del select del pais elegido 
        programa = document.getElementById("prog_princ2")[document.getElementById("prog_princ2").selectedIndex].value 
        if (programa != 0) { 
           mis_paises=eval("paises_" + programa) 
           num_paises = mis_paises.length 
           document.getElementById("pais_princ2").length = num_paises
           for(i=0;i<num_paises;i++){ 
              document.getElementById("pais_princ2").options[i].value=i
              document.getElementById("pais_princ2").options[i].text=mis_paises[i] 
           } 
        }else{ 
           //si no había provincia seleccionada, elimino las universidades del select 
           document.getElementById("pais_princ2").length = 1 
           document.getElementById("pais_princ2").options[0].value = "-" 
           document.getElementById("pais_princ2").options[0].text = "-" 
        } 
        //marco como seleccionada la opción primera de provincia 
        document.getElementById("pais_princ2").options[0].selected = true 
    }

// CAMBIA LA UNIVERSIDAD DE ACUERDO AL PAIS ESCOGIDO 

// Universidad con Convenios Bilaterales
var uni_11=new Array("Seleccione", "Universidad de Karlsruhe", "Universidad de Siegen")
var uni_12=new Array("Seleccione", "Universidad Tecnológica de Swinburne")
var uni_13=new Array("Seleccione", "Instituto de Tecnología de Ontario")
var uni_14=new Array("Seleccione", "Pontificia Universidad Bolivariana", "Universidad Externado")
var uni_15=new Array("Seleccione", "Universidad de Granada", "Universidad de Zaragoza", "Universidad Politécnica de Valencia")
var uni_16=new Array("Seleccione", "Universidad de Nuevo México", "Universidad de Oklahoma")
var uni_17=new Array("Seleccione", "Universidad Abo Akademi")
var uni_18=new Array("Seleccione", "Arts et Métiers ParisTech", "EPF Escuela de Ingenieros", "Escuela de Minas de Nantes", "INSA – Lyon", "TELECOM – SudParis", "Universidad Paris Est Marne la Vallé", "Universidad Paris Ouest Nanterre", "Universidad Tecnológica de Compiègne")
var uni_19=new Array("Seleccione", "Politécnico de Milano", "Politécnico de Torino")
var uni_110=new Array("Seleccione", "Universidad de Tohoku", "Universidad Tecnológica de Nagaoka")
var uni_111=new Array("Seleccione", "Instituto Tecnológico Superior de Cajeme (ITESCA)", "ITESM Monterrey", "Universidad Veracruzana")
var uni_112=new Array("Seleccione", "NTNU- Trondheim")
var uni_113=new Array("Seleccione", "Universidad San Martín de Porres")
var uni_114=new Array("Seleccione", "Universidad de Puerto Rico")
var uni_115=new Array("Seleccione", "Universidad de Ulster")
var uni_116=new Array("Seleccione", "Real Instituto de Estocolmo KTH", "Universidad de Lund", "Universidad de Uppsala")

// Universidad con SMILE
var uni_21=new Array("Seleccione", "Universidad de Stuttgart")
var uni_22=new Array("Seleccione", "Universidad Católica de Lovaina")
var uni_23=new Array("Seleccione", "PSML - BRA - Universidad de Sao Paulo", "PSML - BRA - Universidad Federal de Río de Janeiro")
var uni_24=new Array("Seleccione", "PSML - CHI - Pontifica Universidad Católica de Chile")
var uni_25=new Array("Seleccione", "PSML - COL - Pontificia Universidad Javeriana")
var uni_26=new Array("Seleccione", "PSML - ESP - Universidad Politécnica de Cataluña", "PSML - ESP - Universidad Politécnica de Madrid")
var uni_27=new Array("Seleccione", "PSML - POL - AGH Universidad de Ciencias y Tecnología")
var uni_28=new Array("Seleccione", "PSML - POR - Universidad Técnica de Lisboa")
var uni_29=new Array("Seleccione", "PSML - RPC - Universidad Técnica Checa en Praga")

// Universidad con CINDA
var uni_31=new Array("Seleccione", "Universidad Nacional de Cuyo", "Universidad Nacional de Quilmes", "Universidad Nacional de San Martín")
var uni_32=new Array("Seleccione", "Universidad Católica Boliviana San Pablo", "Universidad Privada Santa Cruz de la Sierra")
var uni_33=new Array("Seleccione", "Universidad de Sao Paulo ", "Universidad Estadual de Campinas")
var uni_34=new Array("Seleccione", "Pontificia Universidad Católica de Chile", "Pontificia Universidad Católica de Valparaíso", "Universidad Austral de Chile", "Universidad de Concepción", "Universidad de Talca", "Universidad de Tarapacá")
var uni_35=new Array("Seleccione", "Pontificia Universidad Javeriana ", "Universidad de los Andes", "Universidad del Norte", "Universidad del Valle")
var uni_36=new Array("Seleccione", "Universidad de Costa Rica ")
var uni_37=new Array("Seleccione", "Escuela Superior Politécnica del Litoral")
var uni_38=new Array("Seleccione", "Universidad Carlos III de Madrid", "Universidad de Barcelona", "Universidad de las Islas Baleares", "Universidad de Santiago de Compostela", "Universitat Oberta de Catalunya", "Universitat Politécnica de Catalunya")
var uni_39=new Array("Seleccione", "Universidad Degli Studi Di Genova")
var uni_310=new Array("Seleccione", "ITESM Monterrey ", "Universidad Autónoma Metropolitana")
var uni_311=new Array("Seleccione", "Universidad de Panamá ")
var uni_312=new Array("Seleccione", "Universidad Católica de Nuestra Señora de la Asunción")
var uni_313=new Array("Seleccione", "Pontificia Universidad Católica del Perú ", "Universidad de Lima", "Universidad del Pacífico ", "Universidad Peruana Cayetano Heredia")
var uni_314=new Array("Seleccione", "Instituto Tecnológico de Santo Domingo", "Pontificia Universidad Católica Madre Maestra ")
var uni_315=new Array("Seleccione", "Universidad Católica del Uruguay")
var uni_316=new Array("Seleccione", "Universidad Centroccidental Lisandro Alvarado", "Universidad Metropolitana")


function cambia_universidad(){ 
        //tomo el valor del select del pais elegido 
        programa = document.getElementById("prog_princ")[document.getElementById("prog_princ").selectedIndex].value 
        pais = document.getElementById("pais_princ")[document.getElementById("pais_princ").selectedIndex].value 
        if (programa != 0) { 
           mis_universidades=eval("uni_" + programa + pais) 
           num_universidades = mis_universidades.length 
           document.getElementById("uni_princ").length = num_universidades 
           for(i=0;i<num_universidades;i++){ 
              document.getElementById("uni_princ").options[i].value=mis_universidades[i] 
              document.getElementById("uni_princ").options[i].text=mis_universidades[i] 
           } 
        }else{ 
           //si no había provincia seleccionada, elimino las universidades del select 
           document.getElementById("uni_princ").length = 1 
           document.getElementById("uni_princ").options[0].value = "-" 
           document.getElementById("uni_princ").options[0].text = "-" 
        } 
        //marco como seleccionada la opción primera de provincia 
        document.getElementById("uni_princ").options[0].selected = true 
    }


function cambia_universidad2(){ 
        //tomo el valor del select del pais elegido 
        programa = document.getElementById("prog_princ2")[document.getElementById("prog_princ2").selectedIndex].value 
        pais = document.getElementById("pais_princ2")[document.getElementById("pais_princ2").selectedIndex].value 
        if (programa != 0) { 
           mis_universidades=eval("uni_" + programa + pais) 
           num_universidades = mis_universidades.length 
           document.getElementById("uni_princ2").length = num_universidades 
           for(i=0;i<num_universidades;i++){ 
              document.getElementById("uni_princ2").options[i].value=mis_universidades[i] 
              document.getElementById("uni_princ2").options[i].text=mis_universidades[i] 
           } 
        }else{ 
           //si no había provincia seleccionada, elimino las universidades del select 
           document.getElementById("uni_princ2").length = 1 
           document.getElementById("uni_princ2").options[0].value = "-" 
           document.getElementById("uni_princ2").options[0].text = "-" 
        } 
        //marco como seleccionada la opción primera de provincia 
        document.getElementById("uni_princ2").options[0].selected = true 
    }

    // Estudios Profesionales
    var area_1=new Array("Seleccione", "Áreas de Ciencias Básicas", "Área de Arquitectura y Urbanismo", "Área de Ingeniería", "Área de Ciencias Administrativas")
    // Estudios Tecnologicos 
    var area_2=new Array("Seleccione", "Área de Tecnología", "Área de Ciencias Sociales")

    function cambia_area(){ 
        decanato = document.getElementById("dec")[document.getElementById("dec").selectedIndex].value 
        if (decanato != 0) { 
           mis_areas=eval("area_" + decanato) 
           num_areas = mis_areas.length 
           document.getElementById("area").length = num_areas
           for(i=0;i<num_areas;i++){ 
              document.getElementById("area").options[i].value=i
              document.getElementById("area").options[i].text=mis_areas[i] 
           } 
        }else{ 
           //si no había provincia seleccionada, elimino las universidades del select 
           document.getElementById("area").length = 1 
           document.getElementById("area").options[0].value = "-" 
           document.getElementById("area").options[0].text = "-" 
        } 
        //marco como seleccionada la opción primera de provincia 
        document.getElementById("area").options[0].selected = true 
    }
    
var carrera_11=new Array("Seleccione", "Lic. Biología", "Lic. Física", "Lic. Matemática", "Lic. Química")
var carrera_12=new Array("Seleccione", "Arquitectura", "Urbanismo")
var carrera_13=new Array("Seleccione", "Ing. Eléctrica", "Ing. Mecánica", "Ing. Química", "Ing. Computación", "Ing. Telecomunicaciones", "Ing. Mantenimiento", "Ing. Electrónica", "Ing. Geofísica", "Ing. Materiales", "Ing. Producción")
var carrera_14=new Array("Seleccione", "Lic. Gestión de la Hospitalidad", "Lic. Com. Internacional")

var carrera_21=new Array("Seleccione", "TSU Tec. Electrónica", "TSU Tec. Mecánica", "TSU Mant. Aeronáutico")
var carrera_22=new Array("Seleccione", "TSU Admin. Turismo", "TSU Admin. Hotelera", "TSU Admin. Transporte", "TSU Admin. Aduanera", "TSU Com. Exterior", "TSU Org. Empresarial")

function cambia_carrera(){ 
        //tomo el valor del select del pais elegido 
        decanato = document.getElementById("dec")[document.getElementById("dec").selectedIndex].value 
        areas = document.getElementById("area")[document.getElementById("area").selectedIndex].value 
        if (decanato != 0) { 
           mis_carreras=eval("carrera_" + decanato + areas) 
           num_carreras = mis_carreras.length 
           document.getElementById("carr").length = num_carreras
           for(i=0;i<num_carreras;i++){ 
              document.getElementById("carr").options[i].value=mis_carreras[i] 
              document.getElementById("carr").options[i].text=mis_carreras[i] 
           } 
        }else{ 
           //si no había provincia seleccionada, elimino las universidades del select 
           document.getElementById("carr").length = 1 
           document.getElementById("carr").options[0].value = "-" 
           document.getElementById("carr").options[0].text = "-" 
        } 
        //marco como seleccionada la opción primera de provincia 
        document.getElementById("carr").options[0].selected = true 
    }    
    
    
    </script>

    <title>Sistema de Gestión de Intercambio</title>

    <h4 align ="center"> Formulario de solicitud</h4>
    <h5 align ="center"> Por favor complete los datos que son requeridos a continuación</h5>
    <h5 align ="center"> Recuerde no dejar en blanco los campos obligatorios</h5>

    <!-- LLENAR EL FORMULARIO DE DATOS -->

    <div class="nav" style="text-align: center;">
        <a href="#" onclick=" if (true) show('datosplanilla'), hide('archivos'),hide('plan'),hide('idio')"> Llenar Formulario de Datos </a>
    </div>

    <div id="datosplanilla" style="display: none">
        <div>
            <div align=center>

                <html:form action="/LlenarPlanilla_EstExt" method="POST" enctype="multipart/form-data" onsubmit="return(this)">
                    <p hidden="true"><html:text name="PlanillaExt" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>
                    <br>
                  
                <!-- pestañas -->
                
                <div>
                        <span style="background-color: #F9F4CF; border-radius: 5px;"><a href='javascript:seleccion(1);'> Datos </a></span>
                        <span style="background-color: #ADFFAD; border-radius: 5px;"><a href='javascript:seleccion(2);'> Domicilio </a></span>
                        <span style="background-color: #B8B8FF; border-radius: 5px;"><a href='javascript:seleccion(3);'> Contacto </a></span>
                        <span style="background-color: #FFFF94; border-radius: 5px;"><a href='javascript:seleccion(4);'> Programa </a></span>
                        <span style="background-color: #F2D8FF; border-radius: 5px;"><a href='javascript:seleccion(5);'> Info. Académica </a></span>                       
                        <span style="background-color: #ADD6FF; border-radius: 5px;"><a href='javascript:seleccion(6);'> Contac. Emergencia</a></span>
                </div>
                
                <!-- contenido de las pestañas -->
                
                
                <div id="opci1" style="display:block;width:650px;height:300px; border: 5px solid #F9F4CF; border-width:5px; border-radius: 10px">
                    <table border="0"  align="center">
                            <tbody>
                            <br>
                            <tr>
                                <td>Primer Apellido</td>

                                <td>
                                <html:text name="PlanillaExt" property="apellido1" maxlength="80" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>

                                <td>
                                <html:errors property="apellido1" />
                            </td>
                        </tr>

                        <tr>
                            <td>Segundo Apellido</td>

                            <td>
                                <html:text name="PlanillaExt" property="apellido2" maxlength="80" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>

                                <td>
                                <html:errors property="apellido2" />
                            </td>
                        </tr>

                        <tr>
                            <td>Primer Nombre</td>

                            <td>
                                <html:text name="PlanillaExt" property="nombre1" maxlength="80" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>

                                <td>
                                <html:errors property="nombre1" />
                            </td>
                        </tr>

                        <tr>
                            <td>Segundo Nombre</td>

                            <td>
                                <html:text name="PlanillaExt" property="nombre2" maxlength="80" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>

                                <td>
                                <html:errors property="nombre2" />
                            </td>

                        </tr>                                

                        <tr>
                            <td>Fecha de Nacimiento</td>

                            <td>
                                <input type="date" name="fechaNacimiento" maxlength="80" errorStyleClass="error" />
                                <!--                               errorKey="org.apache.struts.action.ERROR" />-->
                            </td>

                            <td>
                                <html:errors name="fechaNacimiento" />
                            </td>
                        </tr>

                        <tr>
                            <td>Género</td>

                            <td>
                                <html:select property="sexo" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                    <html:option value="">Seleccione</html:option>
                                    <html:option value="Femino">Femenino</html:option>
                                    <html:option value="Masculino">Masculino</html:option>
                                </html:select>
                            </td>

                            <td>
                                <html:errors property="sexo" />
                            </td>

                        </tr>

                        <tr>
                            <td>Nacionalidad</td>

                            <td>
                                <html:text name="PlanillaExt" property="nacionalidad" maxlength="80" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>

                            <td>
                                <html:errors property="nacionalidad" />
                            </td>
                        </tr>

                        <tr>
                            <td>Número de pasaporte</td>

                            <td>
                                <html:text name="PlanillaExt" property="pasaporte" maxlength="10" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>

                            <td>
                                <html:errors property="pasaporte" />
                            </td>
                        </tr>
                        
                    </tbody>
                </table>

                </div>
                            
                <div id="opci2" style="display:none;width:650px;height:250px; border: 5px solid #ADFFAD; border-width:5px; border-radius: 10px">
                    <br>
                    <table border="0"  align="center">
                            <tbody>                
                                
                            <tr>
                                <td>Calle</td>

                                <td>
                                <html:text name="PlanillaExt" property="calle" maxlength="80" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>
                            </tr>    
                            <tr>
                                <td>Edificio / Casa </td>

                                <td>
                                <html:text name="PlanillaExt" property="edificio" maxlength="80" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>
                            </tr>                                    
                            <tr>
                                <td>Apartamento / Núm. Casa</td>

                                <td>
                                <html:text name="PlanillaExt" property="apartamento" maxlength="80" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>
                            </tr>                                    

                            <tr>

                                <td>Ciudad</td>

                                <td>
                                <html:text name="PlanillaExt" property="ciudad"  maxlength="30" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>

                            <td>
                                <html:errors property="ciudad" />
                            </td>
                        </tr>

                        <tr>

                            <td>Estado</td>

                            <td>
                                <html:text name="PlanillaExt" property="estado" maxlength="30" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>

                            <td>
                                <html:errors property="estado" />
                            </td>
                        </tr>

                        <tr>

                            <td>Código Postal</td>

                            <td>
                                <html:text name="PlanillaExt" property="codPostal"  maxlength="30" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>

                            <td>
                                <html:errors property="codPostal" />
                            </td>
                        </tr>
                        
                            </tbody>
                    </table>
                </div>

                <div id="opci3" style="display:none;width:650px;height:150px; border: 5px solid #B8B8FF; border-width:5px; border-radius: 10px">
                    <br>
                    <table border="0"  align="center">
                        <tbody>
                            
                        <tr>

                            <td> Tlf. Celular:</td>

                            <td>
                                <html:text name="PlanillaExt" property="telefonoCelular" maxlength="15" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>

                            <td>
                                <html:errors property="telefonoCelular" />
                            </td>
                        </tr>

                        <tr>

                            <td> Tlf. Casa:</td>

                            <td>
                                <html:text name="PlanillaExt" property="telefonoCasa" maxlength="15" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>

                            <td>
                                <html:errors property="telefonoCasa" />
                            </td>
                        </tr>


                        <tr>

                            <td> E-mail:</td>

                            <td>
                                <html:text name="PlanillaExt" property="email" maxlength="45"  errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>

                            <td>
                                <html:errors property="email" />
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>                    
                            
                <div id="opci4" style="display:none;width:650px;height:350px; border: 5px solid #FFFF94; border-radius: 10px; border-width:5px;">
                    <br>
                    <table border="0"  align="center">
                        <tbody>
                      
                        <tr>
                            <td> Nombre de Programa: </td>
                            <td>
                            <html:select styleId="prog_princ" onchange="cambia_pais()" property="nombrePrograma"> 
                                <html:option value="0">Seleccione </html:option>
                            <html:option value="1">Convenios Bilaterales </html:option>
                            <html:option value="2">Programa SMILE </html:option>
                            <html:option value="3">Programa de Movilidad Estudiantil CINDA </html:option>
                            </html:select>
                            </td>
                        </tr>
                        
                        <tr>
                            <td> Pais de origen: </td>
                            <td>
                            <html:select styleId="pais_princ" onchange="cambia_universidad()" property="paisOrigen"> 
                                <html:option value="-">- </html:option>
                            </html:select>
                            </td>
                        </tr>

                        <tr>
                            <td> Universidad de origen: </td>
                            <td>
                            <select id="uni_princ" property="nombreUniOrigen"> 
                            <option value="-">- 
                            </select>
                            </td>
                        </tr>                        

                        <tr>
                            <td>Nombre del coordinador de movilidad: </td>

                            <td>
                                <html:text name="PlanillaExt" property="nombreCoordMovilidad" maxlength="80" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>

                                <td>
                                <html:errors property="nombreCoordMovilidad" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td>Nombre del coordinador académico: </td>

                            <td>
                                <html:text name="PlanillaExt" property="nombreCoordAcademico" maxlength="80" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>

                                <td>
                                <html:errors property="nombreCoordAcademico" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td> Tipo de Programa: </td>
                            <td>
                                <html:select  property="programa">
                                    <html:option value="Seleccione"></html:option>
                                    <html:option value="Intercambio Académico (sólo Asignaturas)"></html:option>
                                    <html:option value="Intercambio Académico + Pasantía Internacional"></html:option>
                                    <html:option value="Intercambio Académico + Trabajo de Grado"></html:option>
                                    <html:option value="Trabajo de Grado"></html:option>
                                    <html:option value="Doble Titulación"></html:option>
                                </html:select>
                            </td>
                            <td>
                                <html:errors property="programa" />
                            </td>
                        </tr>                            
                        <tr>
                            <td> Duración del intercambio: </td>
                            <td>
                                <html:select property="duracionPrograma" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                    <html:option value="Septiembre - Diciembre"></html:option>
                                    <html:option value="Enero - Marzo"></html:option>
                                    <html:option value="Abril - Julio"></html:option>
                                    <html:option value="Septiembre - Marzo"></html:option>
                                    <html:option value="Enero - Julio"></html:option>
                                    <html:option value="Septiembre - Julio"></html:option>
                                   
                                </html:select>
                               
                            <td>
                                <html:errors property="duracionPrograma" />
                            </td>
                        </tr>      
                        
                        </tbody>
                    </table>
                </div>
                            
                <div id="opci5" style="display:none;width:650px;height:250px; border: 5px solid #F2D8FF; border-radius: 10px; border-width:5px;">
                    <br>
                    <table border="0"  align="center">
                        <tbody>
                        

                        <tr>
                            <td> Área de Estudio: </td>
                            <td>
                            <html:select property="areaEstud"> 
                                <html:option value="Seleccione"></html:option>                                                                
                                <html:option value="Áreas de Arquitectura y Urbanismo"></html:option>                                
                                <html:option value="Áreas de Ciencias Administrativas"></html:option>                                
                                <html:option value="Áreas de Ciencias Básicas"></html:option>
                                <html:option value="Áreas de Ciencias Sociales"></html:option>
                                <html:option value="Áreas de Ingeniería"></html:option>
                                <html:option value="Áreas de Tecnología"></html:option>
                            </html:select>
                            </td>
                        </tr>
                        
                  
                        <tr>
                            <td>Carrera: </td>

                            <td>
                                <html:text name="PlanillaExt" property="carrera" maxlength="80" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>

                                <td>
                                <html:errors property="carrera" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td> Año de ingreso a la carrera: </td>

                            <td>
                                <html:text name="PlanillaExt" property="anioIngreso" maxlength="60"  errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>

                            <td>
                                <html:errors property="anioIngreso" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td> Cantidad de años aprobados hasta la fecha: </td>

                            <td>
                                <html:text name="PlanillaExt" property="aniosAprobados" maxlength="60"  errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>

                            <td>
                                <html:errors property="aniosAprobados" />
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                            
                            
                <div id="opci6" style="display:none;width:650px;height:350px; border: 5px solid #ADD6FF; border-radius: 10px; border-width:5px;">
                    <br>
                    <table border="0"  align="center">
                        <tbody>
                    
                        <tr>
                            <td> Primer Apellido: </td>
                            <td>
                                <html:text name="PlanillaExt" property="apellidoRep1" maxlength="80"  errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>
                        </tr>                     
                        <tr>
                            <td> Segundo Apellido: </td>
                            <td>
                                <html:text name="PlanillaExt" property="apellidoRep2" maxlength="80"  errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>
                        </tr>                                     
                        <tr>
                            <td> Primer Nombre: </td>
                            <td>
                                <html:text name="PlanillaExt" property="nombreRep1" maxlength="80"  errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>
                        </tr>
                        <tr>
                            <td> Segundo Nombre: </td>
                            <td>
                                <html:text name="PlanillaExt" property="nombreRep2" maxlength="80"  errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>
                        </tr> 
                        <tr>
                            <td> Teléfono Celular: </td>
                            <td>
                                <html:text name="PlanillaExt" property="celRep" maxlength="80"  errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>
                        </tr>                      
                        <tr>
                            <td> Teléfono Casa: </td>
                            <td>
                                <html:text name="PlanillaExt" property="tlfRepCasa" maxlength="80"  errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>
                        </tr>                      

                        <tr>
                            <td> E-mail: </td>
                            <td>
                                <html:text name="PlanillaExt" property="emailRep" maxlength="80"  errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>
                        </tr>
                        <tr>
                            <td> Relación con el Estudiante: </td>
                            <td>
                                <html:text name="PlanillaExt" property="relacion" maxlength="80"  errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR">
                                </html:text>
                            </td>
                        </tr>    

                        <tr>

                            <td>Dirección: </td>

                            <td>
                                <html:textarea name="PlanillaExt" property="direccionRep" cols="50" rows="5"  errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR">
                                </html:textarea >
                            </td>

                            <td>
                                <html:errors property="direccionRep" />
                            </td>
                        </tr>

                        </tbody>
                    </table>    
                </div>                

                <br>
                <p  align=center>
                    <html:submit> Enviar Formulario </html:submit>
                </p>            
                
            </html:form>
            </div>
        </div>
    </div>
    <br>
    
    <!-- CARGA DE DOCUMENTOS -->

    <div class="nav" style="text-align: center;">
        <a href="#" onclick=" if (true) hide('datosplanilla'), show('archivos'),hide('plan'),hide('idio')"> Adjuntar archivos </a>
    </div>
    <div id="archivos" style="display: none">
        <div style="width:auto;height:auto;border:6px solid  #F9F4CF; border-color: #F9F4CF; border-radius: 10px; border-width:5px;">

            <div align=center>
                <html:form action="/FileUploadAction" method="post" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="FileUploadForm" property="nombreusuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>
                        <div style="width:auto;height:auto;">
                            <table id="dataTable" width="350px" cellspacing="14px">
                                <tbody id="dataBody">
                                    <tr>
                                        <td><INPUT type="checkbox" name="chk[]"/></td>

                                        <td valign="middle">
                                            <div id="archivos" >
                                                <div class="feed" >  
                                                    <html:file property="theFile[0]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td> 
                                    </tr>
                                    <tr>
                                    <td><INPUT type="checkbox" name="chk[]"/></td>

                                        <td valign="middle">
                                            <div id="archivos" >
                                                <div class="feed">  
                                                <html:file property="theFile[1]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                            </tbody>
                        </table>  
                    </div>
                    <input type="button" value="Seleccionar Otro Documento" style="font-size:12px; padding:4px 6px" onclick="addRow('dataBody')">
                    <input type="button" value="Eliminar Documentos Seleccionados" style="font-size:12px; padding:4px 6px" onclick="deleteRow('dataTable')"/>

                </div>
            </div>
            <p  align=center>
                <html:submit>Cargar Documentos </html:submit>
                </p>
        </html:form>
    </div>
    <br />

    <!--Carga Materias-->

    <div class="nav" style="text-align: center;">
        <a href="#" onclick=" if (true) hide('datosplanilla'), hide('archivos'),show('plan'),hide('idio')"> Cargar Plan de Estudio </a>
    </div>

    <div id="plan" style="display: none">

        <div style="width:auto;height:auto;border:6px solid #F9F4CF; border-color: #F9F4CF; border-radius: 10px; border-width:5px;">
            <div align=center>
                <html:form action="/AccionPlanEstudioExt" method="post" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="PlanDeEstudio" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>

                        <table border="0"  align="center" style="margin-left: auto;margin-right: auto">
                            <tbody id ="MateBody">
                                <tr>
                                    <td></td>
                                    <td> Codigo-USB</td>

                                    <td> Nombre-USB</td>

                                    <td> Creditos-USB</td>
                                </tr>

                                <tr>
                                    <td> <input type="checkbox" name="c[]"></td>
                                    <td>
                                    <html:text name="PlanDeEstudio" property="codigoUSB[0]" maxlength="45" errorStyleClass="error" value="" style="width:80%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:text name="PlanDeEstudio" property="materiaUSB[0]" maxlength="45" errorStyleClass="error" value="" style="width:80%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:text name="PlanDeEstudio" property="creditosUSB[0]" maxlength="45" errorStyleClass="error" value="" style="width:80%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                            </tr>

                        </tbody>
                    </table>
                    <input type="button"  value="Agregar Materia" style="font-size:16px; padding:4px 6px;" onclick="addMate('MateBody')"/>
                    <input type="button" value="Eliminar Materia" style="font-size:16px; padding:4px 6px" onclick="deletePlan('MateBody')"/>

                </div>
            </div>
            <p  align=center>
                <html:submit>Cargar Plan </html:submit>
                </p>
        </html:form>
    </div>

    <br>


    <div class="nav" style="text-align: center;">
        <a href="#" onclick=" if (true) hide('datosplanilla'), hide('archivos'),hide('plan'),show('idio')"> Cargar Idiomas </a>
    </div>

    <div id="idio" style="display: none">
        <div style="width:auto;height:auto;border:6px solid #F9F4CF; border-color: #F9F4CF; border-radius: 10px; border-width:5px;">
            <div align=center>
                <html:form action="/CargarIdioma" method="post" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="Idiomas" property="nombreusuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>


                        <table border="0"  align="center" style="margin-left: auto;margin-right: auto">
                            <tbody id ="IdioBody">
                                
                                 <tr>
                                  <td>Lengua materna: </td>

                                  <td>
                                   <html:text name="PlanillaExt" property="lenguaMaterna" maxlength="80" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                  </td>

                                  <td>
                                    <html:errors property="lenguaMaterna" />
                                  </td>
                                </tr>
                                
                                <tr>
                                  <td>¿Le gustaría tomar un curso de español? </td>

                                  <td>
                                      <html:radio name="PlanillaExt" property="tomarCursoDeEspaniol" value="Sí" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:radio>
                                  </td>
                                  
                                  <td>
                                      <html:radio name="PlanillaExt" property="tomarCursoDeEspaniol" value="No" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:radio>
                                  </td>

                                  <td>
                                    <html:errors property="tomarCursoDeEspaniol" />
                                  </td>
                                </tr>

                                <tr>
                                    <td><INPUT type="checkbox" name="ch[]"/></td>
                                    <td> Idioma que maneja:</td>

                                    <td>
                                    <html:text name="Idiomas" property="idiomaDest[0]" maxlength="45" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>Nivel Verbal</td>

                                <td>

                                    <html:select name="Idiomas" property="nivelVerbal[0]" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <html:option value=""></html:option>
                                        <html:option value="Basico">Basico</html:option>
                                        <html:option value="Intermedio">Intermedio</html:option>
                                        <html:option value="Avanzado">Avanzado</html:option>
                                    </html:select>
                                </td>

                                <td>Nivel Escrito</td>

                                <td>
                                    <html:select name="Idiomas" property="nivelEscrito[0]" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <html:option value=""></html:option>
                                        <html:option value="Basico">Basico</html:option>
                                        <html:option value="Intermedio">Intermedio</html:option>
                                        <html:option value="Avanzado">Avanzado</html:option>
                                    </html:select>
                                </td>
                                
                                <td>Nivel Conversacional</td>

                                <td>
                                    <html:select name="Idiomas" property="nivelConversacional[0]" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <html:option value=""></html:option>
                                        <html:option value="Basico">Basico</html:option>
                                        <html:option value="Intermedio">Intermedio</html:option>
                                        <html:option value="Avanzado">Avanzado</html:option>
                                    </html:select>
                                </td>

                            </tr>

                        </tbody>
                    </table>
                    <input type="button"  value="Especificar Otro Idioma" style="font-size:16px; padding:4px 6px;" onclick="addIdi('IdioBody')"/>
                    <input type="button" value="Eliminar Seleccionados" style="font-size:16px; padding:4px 6px" onclick="deleteRow('IdioBody')"/>

                    <p  align=center>
                        <html:submit> Enviar Formulario </html:submit>
                        </p>
                </html:form>
            </div>
        </div>
    </div>

</html:html>