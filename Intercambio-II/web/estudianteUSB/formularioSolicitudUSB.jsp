<%-- 
    Document   : formularioSolicitudUSB
    Created on : Nov 13, 2012, 10:13:53 AM
    Last Modif : Feb 21, 2013
    Author     : Katy
--%>

<%Object var = session.getAttribute("nombreusuario");%>

<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html:html lang="true">

    <script language="javascript">
        var fCount = 3;
        var Count = 0;
        var mCount = 0;
        var direccionPlanillaSmile1='/Intercambio-II/estudianteUSB/Recursos/SMILE_Student_Learning-Agreement.doc'
        var direccionPlanillaSmile2='/Intercambio-II/estudianteUSB/Recursos/SMILE_Student_Application-Form.doc'
        var direccionPlanillaCinda1='/Intercambio-II/estudianteUSB/Recursos/CINDA_Ficha_de_reconocimiento.doc'
        var direccionPlanillaCinda2='/Intercambio-II/estudianteUSB/Recursos/CINDA_Ficha_solicitud_de_participación.doc'
        
        function cambiar_link1(){
            
            var seleccion=document.getElementById('prog_princ');
            if(seleccion.value == "SMILE"){
                document.getElementById('planilla1-1').href=direccionPlanillaSmile1;
                document.getElementById('planilla1-1').innerHTML='Descargue el Contrato de estudiantes para SMILE';
                document.getElementById('planilla1-2').href=direccionPlanillaSmile2;
                document.getElementById('planilla1-2').innerHTML='Descargue el formulario de Aplicacion SMILE'
            }
            
            if(seleccion.value == "CINDA"){
                document.getElementById('planilla1-1').href=direccionPlanillaCINDA;
                document.getElementById('planilla1-1').innerHTML='Descargue el formulario de Reconocimiento para CINDA';
                document.getElementById('planilla1-2').href=direccionPlanillaCINDA;
                document.getElementById('planilla1-2').innerHTML='Descargue el formulario de participación para CINDA';
            }
            
        }
        
        
        function cambiar_link2(){
            
            
            var seleccion=document.getElementById('prog_princ2');
            if(seleccion.value == "SMILE"){
                document.getElementById('planilla2-1').href=direccionPlanillaSmile1;
                document.getElementById('planilla2-1').innerHTML='Descargue el Contrato de estudiantes para SMILE';
                document.getElementById('planilla2-2').href=direccionPlanillaSmile2;
                document.getElementById('planilla2-2').innerHTML='Descargue el formulario de Aplicacion SMILE'
            }
            
            if(seleccion.value == "CINDA"){
                document.getElementById('planilla2-1').href=direccionPlanillaCINDA;
                document.getElementById('planilla2-1').innerHTML='Descargue el formulario de Reconocimiento para CINDA';
                document.getElementById('planilla2-2').href=direccionPlanillaCINDA;
                document.getElementById('planilla2-2').innerHTML='Descargue el formulario de participación para CINDA';
            }
        }
        
        
        
        function addMate(tableID) {
            mCount++;

            var fObject = document.getElementById(tableID);
            var checkbox2 = "checkbox";
            var nomUSB = "materiaUSB[" +  mCount +  "]";
            var codUSB = "codigoUSB[" +  mCount +  "]";
            var creUSB = "creditosUSB[" +  mCount +  "]";
            var nomUniv = "materiaUniv[" +  mCount +  "]";
            var codUniv = "codigoUniv[" +  mCount +  "]";
            var creUniv = "creditosUniv[" +  mCount +  "]";
            var arr2 = "c[]";
            var type = "text";
            
            var style1 = "width:80%;";
            var style2 = "width:60%;";
            
            var o2 = document.createElement("input");
            var check2 = document.createElement("input");
            var i1 = document.createElement("input");
            var i2 = document.createElement("input");
            var i3 = document.createElement("input");
            var i4 = document.createElement("input");
            var i5 = document.createElement("input");
            var i6 = document.createElement("input");
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
            i4.setAttribute("type",type);
            i4.setAttribute("name",codUniv);
            i4.setAttribute("style",style2);
            i5.setAttribute("type",type);
            i5.setAttribute("name",nomUniv);
            i5.setAttribute("style",style2);
            i6.setAttribute("type",type);
            i6.setAttribute("name",creUniv);
            i6.setAttribute("style",style2);
            
            td.appendChild(check2);
            td2.appendChild(i1);
            td4.appendChild(i2);
            td6.appendChild(i3);
            td8.appendChild(i4);
            td10.appendChild(i5);
            td12.appendChild(i6);
            
            tr.appendChild(td);
            
            tr.appendChild(td2);
            
            tr.appendChild(td4);
            
            tr.appendChild(td6);
            
            tr.appendChild(td8);
            
            tr.appendChild(td10);
            
            tr.appendChild(td12);
            
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
            var op12 = document.createElement("option");
            
            
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
            var td10 = document.createElement("td");
            
                
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
            
            op10.setAttribute("value","");
            op11.setAttribute("value","");
            op12.setAttribute("value","");
            
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
            select1.appendChild(op10);
            select1.appendChild(op7);
            select1.appendChild(op1);
            select1.appendChild(op2);
            select1.appendChild(op3);
            td4.appendChild(select1);
            tr.appendChild(td4);
            
            td5.innerHTML = tit3;
            tr.appendChild(td5);
            select2.appendChild(op11);
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
            td10.appendChild(select3);
            tr.appendChild(td10);
            
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
            var td3 = document.createElement("td");
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
                
            fObject.appendChild(tr).appendChild(td3);    
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
				
                        if(rowCount <= 4) {
                            alert("No puede borrar todas las opciones");
                            break;
                        }
                        table.deleteRow(i);
                        rowCount--;
                        i--;
                        fCount--;
                    }
	
                }
		
            } catch(e) {
                alert(e);
            }
        }
        
        function deleteRow2(tableID) {
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
                        Count--;
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
                        mCount--;
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
            document.getElementById("opci7").style.display="none";
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
                case 7:
                    //mostramos elcontenido de la tercera opcion
                    document.getElementById("opci7").style.display="block";
                    break;                            
            }
        }


        // CAMBIA EL PAIS DE ACUERDO AL TIPO DE CONVENIO ELEGIDO

        // Convenios Bilaterales
        var paises_Bilaterales=new Array("Seleccione", "Alemania","Australia", "Canadá", "Colombia", "España", "EstadosUnidos", "Finlandia", "Francia", "Italia", "Japón", "México", "Noruega", "Perú", "PuertoRico", "ReinoUnido", "Suecia")
        // SMILE
        var paises_SMILE=new Array("Seleccione", "Alemania", "Bélgica", "Brasil", "Chile", "Colombia", "España", "Polonia", "Portugal", "RepúblicaCheca")
        // CINDA
        var paises_Cinda=new Array("Seleccione", "Argentina", "Bolivia", "Brasil", "Chile", "Colombia", "CostaRica", "Ecuador", "España", "Italia", "México", "Panamá", "Paraguay", "Perú", "RepúblicaDominicana", "Uruguay", "Venezuela")

        function cambia_pais(){ 
            //tomo el valor del select del pais elegido 
            programa = document.getElementById("prog_princ")[document.getElementById("prog_princ").selectedIndex].value 
            if (programa != 0) { 
                mis_paises=eval("paises_" + programa) 
                num_paises = mis_paises.length 
                document.getElementById("pais_princ").length = num_paises
                document.getElementById("pais_princ").options[0].value=0
                document.getElementById("pais_princ").options[0].text="Seleccione"
                for(i=1;i<num_paises;i++){ 
                    document.getElementById("pais_princ").options[i].value=mis_paises[i]
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
                document.getElementById("pais_princ2").options[0].value=0
                document.getElementById("pais_princ2").options[0].text="Seleccione"
                for(i=1;i<num_paises;i++){ 
                    document.getElementById("pais_princ2").options[i].value=mis_paises[i]
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
        var uni_BilateralesAlemania=new Array("Seleccione", "Universidad de Karlsruhe", "Universidad de Siegen")
        var uni_BilateralesAustralia=new Array("Seleccione", "Universidad Tecnológica de Swinburne")
        var uni_BilateralesCanadá=new Array("Seleccione", "Instituto de Tecnología de Ontario")
        var uni_BilateralesColombia=new Array("Seleccione", "Pontificia Universidad Bolivariana", "Universidad Externado")
        var uni_BilateralesEspaña=new Array("Seleccione", "Universidad de Granada", "Universidad de Zaragoza", "Universidad Politécnica de Valencia")
        var uni_BilateralesEstadosUnidos=new Array("Seleccione", "Universidad de Nuevo México", "Universidad de Oklahoma")
        var uni_BilateralesFinlandia=new Array("Seleccione", "Universidad Abo Akademi")
        var uni_BilateralesFrancia=new Array("Seleccione", "Arts et Métiers ParisTech", "EPF Escuela de Ingenieros", "Escuela de Minas de Nantes", "INSA – Lyon", "TELECOM – SudParis", "Universidad Paris Est Marne la Vallé", "Universidad Paris Ouest Nanterre", "Universidad Tecnológica de Compiègne")
        var uni_BilateralesItalia=new Array("Seleccione", "Politécnico de Milano", "Politécnico de Torino")
        var uni_BilateralesJapón=new Array("Seleccione", "Universidad de Tohoku", "Universidad Tecnológica de Nagaoka")
        var uni_BilateralesMéxico=new Array("Seleccione", "Instituto Tecnológico Superior de Cajeme (ITESCA)", "ITESM Monterrey", "Universidad Veracruzana")
        var uni_BilateralesNoruega=new Array("Seleccione", "NTNU- Trondheim")
        var uni_BilateralesPerú=new Array("Seleccione", "Universidad San Martín de Porres")
        var uni_BilateralesPuertoRico=new Array("Seleccione", "Universidad de Puerto Rico")
        var uni_BilateralesReinoUnido=new Array("Seleccione", "Universidad de Ulster")
        var uni_BilateralesSuecia=new Array("Seleccione", "Real Instituto de Estocolmo KTH", "Universidad de Lund", "Universidad de Uppsala")

        // Universidad con SMILE
        var uni_SMILEAlemania=new Array("Seleccione", "Universidad de Stuttgart")
        var uni_SMILEBélgica=new Array("Seleccione", "Universidad Católica de Lovaina")
        var uni_SMILEBrasil=new Array("Seleccione", "PSML - BRA - Universidad de Sao Paulo", "PSML - BRA - Universidad Federal de Río de Janeiro")
        var uni_SMILEChile=new Array("Seleccione", "PSML - CHI - Pontifica Universidad Católica de Chile")
        var uni_SMILEColombia=new Array("Seleccione", "PSML - COL - Pontificia Universidad Javeriana")
        var uni_SMILEEspaña=new Array("Seleccione", "PSML - ESP - Universidad Politécnica de Cataluña", "PSML - ESP - Universidad Politécnica de Madrid")
        var uni_SMILEPolonia=new Array("Seleccione", "PSML - POL - AGH Universidad de Ciencias y Tecnología")
        var uni_SMILEPortugal=new Array("Seleccione", "PSML - POR - Universidad Técnica de Lisboa")
        var uni_SMILERepúblicaCheca=new Array("Seleccione", "PSML - RPC - Universidad Técnica Checa en Praga")

        // Universidad con CINDA
        var uni_CindaArgentina=new Array("Seleccione", "Universidad Nacional de Cuyo", "Universidad Nacional de Quilmes", "Universidad Nacional de San Martín")
        var uni_CindaBolivia=new Array("Seleccione", "Universidad Católica Boliviana San Pablo", "Universidad Privada Santa Cruz de la Sierra")
        var uni_CindaBrasil=new Array("Seleccione", "Universidad de Sao Paulo ", "Universidad Estadual de Campinas")
        var uni_CindaChile=new Array("Seleccione", "Pontificia Universidad Católica de Chile", "Pontificia Universidad Católica de Valparaíso", "Universidad Austral de Chile", "Universidad de Concepción", "Universidad de Talca", "Universidad de Tarapacá")
        var uni_CindaColombia=new Array("Seleccione", "Pontificia Universidad Javeriana ", "Universidad de los Andes", "Universidad del Norte", "Universidad del Valle")
        var uni_CindaCostaRica=new Array("Seleccione", "Universidad de Costa Rica ")
        var uni_CindaEcuador=new Array("Seleccione", "Escuela Superior Politécnica del Litoral")
        var uni_CindaEspaña=new Array("Seleccione", "Universidad Carlos III de Madrid", "Universidad de Barcelona", "Universidad de las Islas Baleares", "Universidad de Santiago de Compostela", "Universitat Oberta de Catalunya", "Universitat Politécnica de Catalunya")
        var uni_CindaItalia=new Array("Seleccione", "Universidad Degli Studi Di Genova")
        var uni_CindaMéxico=new Array("Seleccione", "ITESM Monterrey ", "Universidad Autónoma Metropolitana")
        var uni_CindaPanamá=new Array("Seleccione", "Universidad de Panamá ")
        var uni_CindaParaguay=new Array("Seleccione", "Universidad Católica de Nuestra Señora de la Asunción")
        var uni_CindaPerú=new Array("Seleccione", "Pontificia Universidad Católica del Perú ", "Universidad de Lima", "Universidad del Pacífico ", "Universidad Peruana Cayetano Heredia")
        var uni_CindaRepúbicaDominicana=new Array("Seleccione", "Instituto Tecnológico de Santo Domingo", "Pontificia Universidad Católica Madre Maestra ")
        var uni_CindaUruguay=new Array("Seleccione", "Universidad Católica del Uruguay")
        var uni_CindaVenezuela=new Array("Seleccione", "Universidad Centroccidental Lisandro Alvarado", "Universidad Metropolitana")


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

    <h4 align ="center">Formulario de solicitud</h4>
    <h5 align ="center"> Por favor complete los datos que son requeridos a continuación</h5>
    <h5 align ="center"> Recuerde no dejar en blanco los campos obligatorios</h5>

    <!-- LLENAR EL FORMULARIO DE DATOS -->

    <div class="nav" style="text-align: center;">
        <a href="#" onclick=" if (true) show('datosplanilla'), hide('archivos'),hide('plan'),hide('idio')"> Llenar Formulario de Datos </a>
    </div>

    <div id="datosplanilla" style="display: none ; width: 92%;">
        <div>
            <div align=center>

                <html:form action="/LlenarPlanilla_EstUSB"  method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
                    <p hidden="true"><html:text name="PlanillaUSB" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>
                    <br>

                    <!-- pesteñas -->

                    <div>
                        <span style="background-color: #F9F4CF; border-radius: 5px;"><a href='javascript:seleccion(1);'> Datos </a></span>
                        <span style="background-color: #ADFFAD; border-radius: 5px;"><a href='javascript:seleccion(2);'> Domicilio </a></span>
                        <span style="background-color: #B8B8FF; border-radius: 5px;"><a href='javascript:seleccion(3);'> Contacto </a></span>
                        <span style="background-color: #FFFF94; border-radius: 5px;"><a href='javascript:seleccion(4);'> Programa </a></span>
                        <span style="background-color: #F2D8FF; border-radius: 5px;"><a href='javascript:seleccion(5);'> Info. Académica </a></span>                        
                        <span style="background-color: #D6D6C2; border-radius: 5px;"><a href='javascript:seleccion(6);'> Financiamiento </a></span>                        
                        <span style="background-color: #ADD6FF; border-radius: 5px;"><a href='javascript:seleccion(7);'> Contac. Emergencia</a></span>
                    </div>

                    <!-- contenido de las pestañas -->


                    <div id="opci1" style="display:block;width:650px;height:300px; border: 5px solid #F9F4CF; border-width:5px; border-radius: 10px">
                        <table border="0"  align="center">
                            <tbody>
                            <br>
                            <tr>
                                <td>Primer Apellido</td>

                                <td>
                                    <html:text name="PlanillaUSB" property="apellido1" maxlength="80" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>

                                <td>
                                    <html:errors property="apellido1" />
                                </td>
                            </tr>

                            <tr>
                                <td>Segundo Apellido</td>

                                <td>
                                    <html:text name="PlanillaUSB" property="apellido2" maxlength="80" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>

                                <td>
                                    <html:errors property="apellido2" />
                                </td>
                            </tr>

                            <tr>
                                <td>Primer Nombre</td>

                                <td>
                                    <html:text name="PlanillaUSB" property="nombre1" maxlength="80" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>

                                <td>
                                    <html:errors property="nombre1" />
                                </td>
                            </tr>

                            <tr>
                                <td>Segundo Nombre</td>

                                <td>
                                    <html:text name="PlanillaUSB" property="nombre2" maxlength="80" errorStyleClass="error"
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
                                    <html:text name="PlanillaUSB" property="nacionalidad" maxlength="80" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:errors property="nacionalidad" />
                                </td>
                            </tr>

                            <tr>
                                <td>Cédula de Identidad</td>

                                <td>
                                    <html:text name="PlanillaUSB" property="cedula" maxlength="10" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:errors property="cedula" />
                                </td>
                            </tr>

                            <tr>
                                <td>Nro Carnet Estudiantil</td>
                                <td>
                                    <html:text name="PlanillaUSB" property="carnet" maxlength="10" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>
                                <td>
                                    <html:errors property="carnet" />
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
                                    <td>Urb / Sector / Barrio</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="urbanizacion" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                </tr>                                

                                <tr>
                                    <td>Calle</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="calle" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                </tr>    
                                <tr>
                                    <td>Edificio / Casa </td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="edificio" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                </tr>                                    
                                <tr>
                                    <td>Apartamento / Núm. Casa</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="apartamento" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                </tr>                                    

                                <tr>

                                    <td>Ciudad</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="ciudad"  maxlength="30" errorStyleClass="error"
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
                                        <html:text name="PlanillaUSB" property="estado" maxlength="30" errorStyleClass="error"
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
                                        <html:text name="PlanillaUSB" property="codPostal"  maxlength="30" errorStyleClass="error"
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
                                        <html:text name="PlanillaUSB" property="telefonoCelular" maxlength="15" errorStyleClass="error"
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
                                        <html:text name="PlanillaUSB" property="telefonoCasa" maxlength="15" errorStyleClass="error"
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
                                        <html:text name="PlanillaUSB" property="email" maxlength="45"  errorStyleClass="error"
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

                    <div id="opci4" style="display:none;width:650px;height:570px; border: 5px solid #FFFF94; border-radius: 10px; border-width:5px;">
                        <br>
                        <table border="0"  align="center">
                            <tbody>

                                <tr>
                                    <td> <b>Opción 1</b> </td>
                                </tr>
                                <tr>
                                    <td> Nombre de Programa: </td>
                                    <td>
                                        <html:select styleId="prog_princ" onchange="cambia_pais();cambiar_link1()" property="nombreProgramaOpcion1"> 
                                            <html:option value="0">Seleccione </html:option>
                                            <html:option value="Bilaterales">Convenios Bilaterales </html:option>
                                            <html:option value="SMILE">Programa SMILE </html:option>
                                            <html:option value="CINDA">Programa de Movilidad Estudiantil CINDA </html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="#" id="planilla1-1" title="Debe llenar este formulario y luego cargarlo en el sistema"> </a>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        <a href="#" id="planilla1-2" title="Debe llenar este formulario y luego cargarlo en el sistema"> </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td> País Destino: </td>
                                    <td>
                                        <html:select styleId="pais_princ" onchange="cambia_universidad()" property="paisOpcion1"> 
                                            <html:option value="-">- </html:option>
                                        </html:select>
                                    </td>
                                </tr>

                                <tr>
                                    <td> Universidad Destino: </td>
                                    <td>
                                        <html:select styleId="uni_princ" property="nombreOpcion1"> 
                                            <html:option value="-">- </html:option>
                                        </html:select>
                                    </td>
                                </tr>

                                <tr>
                                    <td> Tipo de Programa: </td>
                                    <td>
                                        <html:select  property="programaOpcion1">
                                            <html:option value="Seleccione"></html:option>
                                            <html:option value="Intercambio Académico (sólo Asignaturas)"></html:option>
                                            <html:option value="Intercambio Académico + Pasantía Internacional"></html:option>
                                            <html:option value="Intercambio Académico + Trabajo de Grado"></html:option>
                                            <html:option value="Trabajo de Grado"></html:option>
                                            <html:option value="Doble Titulación"></html:option>
                                        </html:select>
                                    </td>
                                    <td>
                                        <html:errors property="programaOpcion1" />
                                    </td>
                                </tr>                            
                                <tr>
                                    <td> Fecha Tentativa Inicio: </td>
                                    <td>
                                        <html:select  property="mesFechaIni1">
                                            <html:option value="Mes"></html:option>
                                            <html:option value="Enero"></html:option>
                                            <html:option value="Febrero"></html:option>
                                            <html:option value="Marzo"></html:option>
                                            <html:option value="Abril"></html:option>
                                            <html:option value="Mayo"></html:option>
                                            <html:option value="Junio"></html:option>
                                            <html:option value="Julio"></html:option>
                                            <html:option value="Agosto"></html:option>
                                            <html:option value="Septiembre"></html:option>
                                            <html:option value="Octubre"></html:option>
                                            <html:option value="Noviembre"></html:option>
                                            <html:option value="Diciembre"></html:option>
                                        </html:select>
                                        <html:select  property="anoFechaIni1">
                                            <html:option value="Año"></html:option>
                                            <html:option value="2014"></html:option>
                                            <html:option value="2015"></html:option>
                                            <html:option value="2016"></html:option>
                                        </html:select>
                                    <td>
                                        <html:errors property="mesFechaIni1" />
                                        <html:errors property="anoFechaIni1" />
                                    </td>
                                </tr>                        
                                <tr>
                                    <td> Fecha Tentativa Fin: </td>
                                    <td>
                                        <html:select  property="mesFechaFin1">
                                            <html:option value="Mes"></html:option>
                                            <html:option value="Enero"></html:option>
                                            <html:option value="Febrero"></html:option>
                                            <html:option value="Marzo"></html:option>
                                            <html:option value="Abril"></html:option>
                                            <html:option value="Mayo"></html:option>
                                            <html:option value="Junio"></html:option>
                                            <html:option value="Julio"></html:option>
                                            <html:option value="Agosto"></html:option>
                                            <html:option value="Septiembre"></html:option>
                                            <html:option value="Octubre"></html:option>
                                            <html:option value="Noviembre"></html:option>
                                            <html:option value="Diciembre"></html:option>
                                        </html:select>
                                        <html:select  property="anoFechaFin1">
                                            <html:option value="Año"></html:option>
                                            <html:option value="2014"></html:option>
                                            <html:option value="2015"></html:option>
                                            <html:option value="2016"></html:option>
                                        </html:select>
                                    <td>
                                        <html:errors property="mesFechaFin1" />
                                        <html:errors property="anoFechaFin1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td> Duración: </td>
                                    <td>
                                        <html:select  property="duracionProgramaOpcion1">
                                            <html:option value="Seleccione"></html:option>
                                            <html:option value="Un Trimestre"></html:option>
                                            <html:option value="Dos Trimestres"></html:option>
                                            <html:option value="Año Académico"></html:option>
                                        </html:select>
                                    </td>
                                    <td>
                                        <html:errors property="duracionProgramaOpcion1" />
                                    </td>
                                </tr>  

                                <tr>
                                    <td> <b>Opción 2</b> </td>
                                </tr>
                                <tr>
                                    <td> Nombre de Programa: </td>
                                    <td>
                                        <html:select styleId="prog_princ2" onchange="cambia_pais2();cambiar_link2()" property="nombreProgramaOpcion2"> 
                                            <html:option value="0">Seleccione </html:option>
                                            <html:option value="Bilaterales">Convenios Bilaterales </html:option>
                                            <html:option value="SMILE">Programa SMILE </html:option>
                                            <html:option value="CINDA">Programa de Movilidad Estudiantil CINDA </html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="#" id="planilla2-1" title="Debe llenar este formulario y luego cargarlo en el sistema"> </a>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        <a href="#" id="planilla2-2" title="Debe llenar este formulario y luego cargarlo en el sistema"> </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td> País Destino: </td>
                                    <td>
                                        <html:select styleId="pais_princ2" onchange="cambia_universidad2()" property="paisOpcion2"> 
                                            <html:option value="-">-</html:option>
                                        </html:select>
                                    </td>
                                </tr>

                                <tr>
                                    <td> Universidad Destino: </td>
                                    <td>
                                        <html:select styleId="uni_princ2" property="nombreOpcion2"> 
                                            <html:option value="-">- </html:option>
                                        </html:select>
                                    </td>
                                </tr>

                                <tr>
                                    <td> Tipo de Programa: </td>
                                    <td>
                                        <html:select  property="programaOpcion2">
                                            <html:option value="Seleccione"></html:option>
                                            <html:option value="Intercambio Académico (sólo Asignaturas)"></html:option>
                                            <html:option value="Intercambio Académico + Pasantía Internacional"></html:option>
                                            <html:option value="Intercambio Académico + Trabajo de Grado"></html:option>
                                            <html:option value="Trabajo de Grado"></html:option>
                                            <html:option value="Doble Titulación"></html:option>
                                        </html:select>
                                    </td>
                                </tr>                            
                                <tr>
                                    <td> Fecha Tentativa Inicio: </td>
                                    <td>
                                        <html:select  property="mesFechaIni2">
                                            <html:option value="Mes"></html:option>
                                            <html:option value="Enero"></html:option>
                                            <html:option value="Febrero"></html:option>
                                            <html:option value="Marzo"></html:option>
                                            <html:option value="Abril"></html:option>
                                            <html:option value="Mayo"></html:option>
                                            <html:option value="Junio"></html:option>
                                            <html:option value="Julio"></html:option>
                                            <html:option value="Agosto"></html:option>
                                            <html:option value="Septiembre"></html:option>
                                            <html:option value="Octubre"></html:option>
                                            <html:option value="Noviembre"></html:option>
                                            <html:option value="Diciembre"></html:option>
                                        </html:select>
                                        <html:select  property="anoFechaIni2">
                                            <html:option value="Año"></html:option>
                                            <html:option value="2014"></html:option>
                                            <html:option value="2015"></html:option>
                                            <html:option value="2016"></html:option>
                                        </html:select>
                                </tr>                        
                                <tr>
                                    <td> Fecha Tentativa Fin: </td>
                                    <td>
                                        <html:select  property="mesFechaFin2">
                                            <html:option value="Mes"></html:option>
                                            <html:option value="Enero"></html:option>
                                            <html:option value="Febrero"></html:option>
                                            <html:option value="Marzo"></html:option>
                                            <html:option value="Abril"></html:option>
                                            <html:option value="Mayo"></html:option>
                                            <html:option value="Junio"></html:option>
                                            <html:option value="Julio"></html:option>
                                            <html:option value="Agosto"></html:option>
                                            <html:option value="Septiembre"></html:option>
                                            <html:option value="Octubre"></html:option>
                                            <html:option value="Noviembre"></html:option>
                                            <html:option value="Diciembre"></html:option>
                                        </html:select>
                                        <html:select  property="anoFechaFin2">
                                            <html:option value="Año"></html:option>
                                            <html:option value="2014"></html:option>
                                            <html:option value="2015"></html:option>
                                            <html:option value="2016"></html:option>
                                        </html:select>
                                </tr>
                                <tr>
                                    <td> Duración: </td>
                                    <td>
                                        <html:select  property="duracionProgramaOpcion2">
                                            <html:option value="Seleccione"></html:option>
                                            <html:option value="Un Trimestre"></html:option>
                                            <html:option value="Dos Trimestres"></html:option>
                                            <html:option value="Año Académico"></html:option>
                                        </html:select>
                                    </td>
                                    <td>
                                        <html:errors property="duracionProgramaOpcion2" />
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
                                    <td> Decanato: </td>
                                    <td>
                                        <html:select styleId="dec" onchange="cambia_area()" property="decanato"> 
                                            <html:option value="0">Seleccione</html:option>
                                            <html:option value="1"> Decanato de Estudios Profesionales</html:option>
                                            <html:option value="2"> Decanato de Estudios Tecnológicos </html:option>
                                        </html:select>
                                    </td>
                                </tr>        

                                <tr>
                                    <td> Área de Estudio: </td>
                                    <td>
                                        <html:select styleId="area" onchange="cambia_carrera()" property="areaEstud"> 
                                            <html:option value="-">- </html:option>
                                        </html:select>
                                    </td>
                                </tr>                        

                                <tr>
                                    <td> Carrera: </td>
                                    <td>
                                        <html:select styleId="carr" property="carrera"> 
                                            <html:option value="-">- </html:option>
                                        </html:select>
                                    </td>
                                </tr>                                       

                                <tr>
                                    <td> Número de Créditos Aprobados Hasta la Fecha</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="creditosApro" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>

                                    <td>
                                        <html:errors property="creditosApro" />
                                    </td>
                                </tr>

                                <tr>
                                    <td> Índice Académico: </td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="indice" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>

                                    <td>
                                        <html:errors property="indice" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>

                    <div id="opci6" style="display:none;width:650px;height:150px; border: 5px solid #D6D6C2; border-radius: 10px; border-width:5px;">
                        <br>
                        <table border="0"  align="center">
                            <tbody>
                                <tr>
                                    <td> Principal Fuente de Ingresos: </td>
                                    <td><html:select name="PlanillaUSB" property="fuenteFinanciamiento">
                                            <html:option value="Seleccione"></html:option>
                                            <html:option value="Personal"></html:option>
                                            <html:option value="Familiar"></html:option>
                                            <html:option value="Otro"></html:option>
                                        </html:select>              
                                        Especifique:
                                        <html:text name="PlanillaUSB" property="descripcion1" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>     
                                    </td>
                                </tr>
                                <tr>
                                    <td> ¿Recibe algún tipo de ayuda económica?: </td>
                                    <td><html:select name="PlanillaUSB" property="ayudaEc">
                                            <html:option value="Seleccione"></html:option>
                                            <html:option value="Si"></html:option>
                                            <html:option value="No"></html:option>
                                        </html:select>
                                        Especifique:
                                        <html:text name="PlanillaUSB" property="descripcion2" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text> 
                                    </td>                    
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div id="opci7" style="display:none;width:650px;height:350px; border: 5px solid #ADD6FF; border-radius: 10px; border-width:5px;">
                        <br>
                        <table border="0"  align="center">
                            <tbody>

                                <tr>
                                    <td> Apellidos: </td>
                                    <td>
                                        <html:text name="PlanillaUSB" property="apellidosRep" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>                     
                                                                    
                                <tr>
                                    <td> Nombres: </td>
                                    <td>
                                        <html:text name="PlanillaUSB" property="nombresRep" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                 
                                <tr>
                                    <td> Teléfono Celular: </td>
                                    <td>
                                        <html:text name="PlanillaUSB" property="celRep" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>                      
                                <tr>
                                    <td> Teléfono Casa: </td>
                                    <td>
                                        <html:text name="PlanillaUSB" property="tlfRepCasa" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>                      

                                <tr>
                                    <td> E-mail: </td>
                                    <td>
                                        <html:text name="PlanillaUSB" property="emailRep" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td> Relación con el Estudiante: </td>
                                    <td>
                                        <html:text name="PlanillaUSB" property="relacion" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>    

                                <tr>

                                    <td>Dirección: </td>

                                    <td>
                                        <html:textarea name="PlanillaUSB" property="direccionRep" cols="50" rows="5"  errorStyleClass="error"
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
        <a href="#" onclick=" if (true) hide('datosplanilla'), show('archivos'),hide('plan'),hide('idio')"> Documentos requeridos </a>
    </div>
    <div id="archivos" style="display: none; width: 88%;">
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
                                    <td>Foto</td>
                                    <td valign="left">
                                        <div id="archivos" >
                                            <div class="feed">  
                                                <html:file value="hola" property="theFile[0]"></html:file>
                                                <br />
                                            </div>
                                        </div>

                                    </td> 
                                </tr>
                                <tr>
                                    <td><INPUT type="checkbox" name="chk[]"/></td>
                                    <td>Informe Académico</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  

                                                <html:file value="chao" property="theFile[1]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td><INPUT type="checkbox" name="chk[]"/></td>
                                    <td>Carta de Motivación</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  

                                                <html:file value="hello" property="theFile[2]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td><INPUT type="checkbox" name="chk[]"/></td>
                                    <td><a style="color: red; font-size: 14px; font-weight: bold">*</a>Planilla CINDA/SMILE</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  

                                                <html:file value="bye" property="theFile[3]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td><INPUT type="checkbox" name="chk[]"/></td>
                                    <td><a style="color: red; font-size: 14px; font-weight: bold">**</a>Certificado de idiomas</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  

                                                <html:file value="bye" property="theFile[4]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                            </tbody>
                        </table>  
                    </div>
                    <p style="color: red; font-size: 12px; font-weight: bold">*Sólo para quienes apliquen a uno de estos programas</p>  
                    <p style="color: red; font-size: 12px; font-weight: bold">**Sólo para quienes apliquen a países que NO sean de habla hispana</p>  
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
        <a href="#" onclick=" if (true) hide('datosplanilla'), hide('archivos'),show('plan'),hide('idio')"> Plan de Estudio </a>
    </div>

    <div id="plan" style="display: none; width: 88%;">

        <div style="width:auto;height:auto;border:6px solid #F9F4CF; border-color: #F9F4CF; border-radius: 10px; border-width:5px;">
            <div align=center>
                <html:form action="/AccionPlanDeEstudio" acceptCharset="ISO-8859-1" method="post" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="PlanDeEstudio" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>

                    <table border="0"  align="center" style="margin-left: auto;margin-right: auto">
                        <tbody id ="MateBody">
                            <tr>
                                <td></td>
                                <td> Código-USB</td>

                                <td> Nombre-USB</td>

                                <td> Créditos-USB</td>

                                <td> Codigo-Univ. Destino</td>

                                <td> Nombre-Univ. Destino</td>                                

                                <td> Créditos-Univ. Destino</td>

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

                                <td>
                                    <html:text name="PlanDeEstudio" property="codigoUniv[0]" maxlength="45" errorStyleClass="error" value="" style="width:60%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:text name="PlanDeEstudio" property="materiaUniv[0]" maxlength="45" errorStyleClass="error" value="" style="width:60%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:text name="PlanDeEstudio" property="creditosUniv[0]" maxlength="45" errorStyleClass="error" value="" style="width:60%;"
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
        <a href="#" onclick=" if (true) hide('datosplanilla'), hide('archivos'),hide('plan'),show('idio')"> Dominio de idiomas</a>
    </div>

    <div id="idio" style="display: none; width: 88%;">
        <div style="width:auto;height:auto;border:6px solid #F9F4CF; border-color: #F9F4CF; border-radius: 10px; border-width:5px;">
            <div align=center>
                <html:form action="/CargarIdioma" method="post" acceptCharset="ISO-8859-1" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="Idiomas" property="nombreusuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>


                    <table border="0"  align="center" style="margin-left: auto;margin-right: auto">
                        <tbody id ="IdioBody">

                            <tr>
                                <td><INPUT type="checkbox" name="ch[]"/></td>
                                <td> Idioma que maneja:</td>

                                <td>
                                    <html:text name="Idiomas" property="idiomaDest[0]" maxlength="45" style="width:77px;" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>Nivel Verbal</td>

                                <td>

                                    <html:select property="nivelVerbal[0]" style="width:50px;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <html:option value=""></html:option>
                                        <html:option value="Basico">Basico</html:option>
                                        <html:option value="Intermedio">Intermedio</html:option>
                                        <html:option value="Avanzado">Avanzado</html:option>
                                    </html:select>
                                </td>

                                <td>Nivel Escrito</td>

                                <td>
                                    <html:select property="nivelEscrito[0]" style="width:50px;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <html:option value=""></html:option>
                                        <html:option value="Basico">Basico</html:option>
                                        <html:option value="Intermedio">Intermedio</html:option>
                                        <html:option value="Avanzado">Avanzado</html:option>
                                    </html:select>
                                </td>

                                <td>Nivel Conversacional</td>

                                <td>
                                    <html:select property="nivelConversacional[0]" style="width:50px;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
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
                    <input type="button" value="Eliminar Seleccionados" style="font-size:16px; padding:4px 6px" onclick="deleteRow2('IdioBody')"/>

                    <p  align=center>
                        <html:submit> Enviar Formulario </html:submit>
                    </p>
                </html:form>
            </div>
        </div>
    </div>

</html:html>
