<%-- 
    Document   : formularioSolicitudUSB
    Created on : Nov 13, 2012, 10:13:53 AM
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
            
            td.appendChild(check2)
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
            var basico = "Basico";
            var intermedio = "Intermedio";
            var avanzado = "Avanzado";
            var arr = "chk[]";
            var type = "text";
            
            var tit1 = "Idioma que maneja";
            var tit2 = "Nivel Verbal";
            var tit3 = "Nivel Escrito";
            var o2 = document.createElement("input");
            var check = document.createElement("input");
            var op1 = document.createElement("option");
            var op2 = document.createElement("option");
            var op3 = document.createElement("option");
            var op4 = document.createElement("option");
            var op5 = document.createElement("option");
            var op6 = document.createElement("option");
            var op7 = document.createElement("option");
            var op8 = document.createElement("option");
            var tr = document.createElement("tr");
            var select1 = document.createElement("select");
            var select2 =document.createElement("select");
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
            op2.setAttribute("value",intermedio);
            op2.innerHTML = "Intermedio";
            op5.setAttribute("value",intermedio);
            op5.innerHTML = "Intermedio";
            op3.setAttribute("value",avanzado);
            op3.innerHTML = "Avanzado";
            op6.setAttribute("value",avanzado);
            op6.innerHTML = "Avanzado";
            op7.setAttribute("value","")
            op8.setAttribute("value","")
            
            o2.setAttribute("type",type);
            o2.setAttribute("name",idioma);
            op1.setAttribute("value",basico);
            op2.setAttribute("value", intermedio);
            op3.setAttribute("value",avanzado);
            select1.setAttribute("name",verbal);
            select2.setAttribute("name",escrito);
            
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


    </script>

    <title>Sistema de Gestión de Intercambio</title>

    <h4 align ="center">Formulario de solicitud</h4>
    <h5 align ="center"> Por favor complete los datos que son requeridos a continuación</h5>
    <h5 align ="center"> Recuerde no dejar en blanco los campos obligatorios</h5>

    <div class="nav" style="text-align: center;">
        <a href="#" onclick="if (document.getElementById('financiamiento').style.display=='none') 
            show('datosplanilla'), hide('datosPersonales'), hide('archivos'), hide('financiamiento'), hide('academico'), hide('opcion'), hide('idiomas'), hide('representante'); else hide('opcion');"> Llenar Formulario de Datos </a>
    </div>
    <div id="datosplanilla" style="display: none">
        <div style="width:auto;height:auto;border:6px solid #F0F0F0; background-color: #F0F0F0">
            <div align=center>
                <br />
                <div class="nav" style="text-align:center;">
                    <a href="#" onclick="if (document.getElementById('datosPersonales').style.display=='none') 
                        hide('archivos'), hide('financiamiento'), show('datosPersonales'), hide('opcion'), hide('academico'), hide('idiomas'), hide('representante'); else hide('datosPersonales');">Datos personales</a>
                </div>

                <br />

                <div id="datosPersonales" style="display: none">

                    <html:form action="/LlenarPlanilla_EstUSB"  method="POST" enctype="multipart/form-data" onsubmit="return(this)">

                        <p hidden="true"><html:text name="PlanillaUSB" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                                   errorKey="org.apache.struts.action.ERROR"></html:text></p>
                        <div style="width:auto;height:auto;border:6px solid #F0F0F0; background-color: #F0F0F0">

                            <table border="0"  align="center">
                                <tbody>
                                    <tr>
                                        <td>Periodo</td>

                                        <td>
                                            <html:select property="periodo" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                                <html:option value="2013-2014">2013-2014</html:option>
                                            </html:select>
                                        </td>

                                        <td>
                                            <html:errors property="periodo" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Apellidos</td>

                                        <td>
                                            <html:text name="PlanillaUSB" property="apellidos" maxlength="80" errorStyleClass="error"
                                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                                        </td>

                                        <td>
                                            <html:errors property="apellidos" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Nombres</td>

                                        <td>
                                            <html:text name="PlanillaUSB" property="nombres" maxlength="80" errorStyleClass="error"
                                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                                        </td>

                                        <td>
                                            <html:errors property="nombres" />
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

                                    <tr>
                                        <td>Nro Pasaporte</td>

                                        <td>
                                            <html:text name="PlanillaUSB" property="pasaporte" maxlength="80"  errorStyleClass="error"
                                                       errorKey="org.apache.struts.action.ERROR">
                                            </html:text>
                                        </td>

                                        <td>
                                            <html:errors property="pasaporte" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td> <br/> <strong> Domicilio </strong> </td>
                                    </tr>

                                    <tr>

                                        <td style=" padding-left: 50px">Dirección</td>

                                        <td>
                                            <html:textarea name="PlanillaUSB" property="calle" cols="50" rows="5"  errorStyleClass="error"
                                                           errorKey="org.apache.struts.action.ERROR">
                                            </html:textarea >
                                        </td>

                                        <td>
                                            <html:errors property="calle" />
                                        </td>
                                    </tr>

                                    <tr>

                                        <td style=" padding-left: 50px">Ciudad</td>

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

                                        <td style=" padding-left: 50px">Estado</td>

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

                                        <td style=" padding-left: 50px">Código Postal</td>

                                        <td>
                                            <html:text name="PlanillaUSB" property="codPostal"  maxlength="30" errorStyleClass="error"
                                                       errorKey="org.apache.struts.action.ERROR">
                                            </html:text>
                                        </td>

                                        <td>
                                            <html:errors property="codPostal" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td> <br/> <strong>Información de Contacto</strong></td>
                                    </tr>

                                    <tr>

                                        <td style=" padding-left: 50px"> Tlf. Celular:</td>

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

                                        <td style=" padding-left: 50px"> Tlf. Casa:</td>

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

                                        <td style=" padding-left: 50px"> E-mail:</td>

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

                    </div>

                    <div class="nav" style="text-align:center;">
                        <a href="#" onclick="if (document.getElementById('representante').style.display=='none') 
                            hide('financiamiento'), hide('archivos'), hide('datosPersonales'), hide('opcion'), hide('academico'), hide('idiomas'), show('representante'); else hide('representante');">Persona de Contacto en Caso de Emergencia</a>
                    </div>

                    <br />

                    <div id="representante" style="display:none">

                        <div style="width:auto;height:auto;border:6px solid #F0F0F0; background-color: #F0F0F0">
                            <table border="0"  align="center">
                                <tbody>
                                    <tr>
                                        <td> Apellidos y Nombres:</td>

                                        <td>
                                            <html:text name="PlanillaUSB" property="apellidoNombresRep" maxlength="30" errorStyleClass="error"

                                                       errorKey="org.apache.struts.action.ERROR">
                                            </html:text>
                                        </td>

                                        <td>
                                            <html:errors property="apellidoNombresRep" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td> Parentesco:</td>

                                        <td>
                                            <html:text name="PlanillaUSB" property="relacion" maxlength="15" errorStyleClass="error"
                                                       errorKey="org.apache.struts.action.ERROR">
                                            </html:text>
                                        </td>

                                        <td>
                                            <html:errors property="relacion" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td> Teléfono:</td>

                                        <td>
                                            <html:text name="PlanillaUSB" property="tlfRep" maxlength="15" errorStyleClass="error"
                                                       errorKey="org.apache.struts.action.ERROR">
                                            </html:text>
                                        </td>

                                        <td>
                                            <html:errors property="tlfRep" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="color: black"> Dirección:</td>

                                        <td>
                                            <html:textarea name="PlanillaUSB" property="direccionRep"  errorStyleClass="error"
                                                           errorKey="org.apache.struts.action.ERROR">
                                            </html:textarea>
                                        </td>

                                        <td>
                                            <html:errors property="direccionRep" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td> E-mail:</td>

                                        <td>
                                            <html:text name="PlanillaUSB" property="emailRep" maxlength="45" errorStyleClass="error"
                                                       errorKey="org.apache.struts.action.ERROR">
                                            </html:text>
                                        </td>

                                        <td>
                                            <html:errors property="emailRep" />
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>

                    </div>

                    <div class="nav" style="text-align: center;">
                        <a href="#" onclick="if (document.getElementById('academico').style.display=='none') 
                            hide('archivos'),  hide('financiamiento'), hide('datosPersonales'), hide('opcion'), show('academico'), hide('idiomas'), hide('representante'); else hide('academico');">Datos académicos</a>
                    </div>

                    <div id="academico" style="display: none">
                        <div style="width:auto;height:auto;border:6px solid #F0F0F0; background-color: #F0F0F0">
                            <table border="0"  align="center">
                                <tbody>
                                    <tr>
                                        <td> Carrera que estudia en la USB:</td>
                                        <td><html:select name="PlanillaUSB" property="carrera">
                                                <html:option value="N/A"></html:option>
                                                <html:option value="Licenciatura en Quimica"></html:option>
                                                <html:option value="Licenciatura en Matematicas"></html:option>
                                                <html:option value="Licenciatura en Fisica"></html:option>
                                                <html:option value="Licenciatura en Biologia"></html:option>
                                                <html:option value="Arquitectura"></html:option>
                                                <html:option value="Urbanismo"></html:option>
                                                <html:option value="Ingenieria Electrica"></html:option>
                                                <html:option value="Ingenieria Mecanica"></html:option>
                                                <html:option value="Ingenieria Quimica"></html:option>
                                                <html:option value="Ingenieria Electrica"></html:option>
                                                <html:option value="Ingenieria Mecanica"></html:option>
                                                <html:option value="Ingenieria Electronica"></html:option>
                                                <html:option value="Ingenieria de Computacion"></html:option>
                                                <html:option value="Ingenieria Geofisica"></html:option>
                                                <html:option value="Ingenieria de Materiales"></html:option>
                                                <html:option value="Ingenieria de Produccion"></html:option>
                                                <html:option value="Ingenieria de Telecomunicaciones"></html:option>
                                                <html:option value="Ingenieria de Mantenimeinto"></html:option>
                                                <html:option value="Licenciatura en Gestion de la Hospitalidad"></html:option>
                                                <html:option value="Licenciatura en Comercio Internacion"></html:option>
                                                <html:option value="Tecnología  Electrica"></html:option>
                                                <html:option value="Tecnología  Electronica"></html:option>
                                                <html:option value="Organizacion Empresarial"></html:option>
                                                <html:option value="Tecnologia Mecanica"></html:option>
                                                <html:option value="Mantenimiento Aeronautico"></html:option>
                                                <html:option value="Administración del Turismo"></html:option>
                                                <html:option value="Administración Hotelera"></html:option>
                                                <html:option value="Administración del Transporte"></html:option>
                                                <html:option value="Administración Aduanera"></html:option>
                                            </html:select>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td> Número de créditos aprobados hasta la fecha</td>

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
                                        <td> Índice académico: </td>

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
                    </div>
                    <br />

                    <div class="nav" style="text-align: center;">
                        <a href="#" onclick="if (document.getElementById('opcion').style.display=='none') 
                            hide('archivos'),  hide('financiamiento'), hide('datosPersonales'), show('opcion'), hide('academico'), hide('idiomas'), hide('representante'); else hide('opcion');"> Opciones de Destino</a>
                    </div>


                    <div id="opcion" style="display: none">
                        <div style="width:auto;height:auto;border:6px solid #F0F0F0; background-color: #F0F0F0">
                            <table border="0"  align="center">
                                <tbody>
                                    <tr>
                                        <td> Nombre Universidad de Destino:</td>

                                        <td>
                                            <html:select  property="nombreOpcion1">
                                                <html:option value="N/A"></html:option>
                                                <html:option value="ALE -- Universidad de Karlsruhe"></html:option>
                                                <html:option value="ALE -- Universidad de Siegen"></html:option>
                                                <html:option value="ALE -- Universidad de Stuttgart:"></html:option>
                                                <html:option value="AR -- Universidad Nacional de Cuyo"></html:option>
                                                <html:option value="AR -- Universidad Nacional de Quilmes"></html:option>
                                                <html:option value="AR -- Universidad Nacional de San Martín"></html:option>
                                                <html:option value="AU -- Universidad Tecnológica de Swinburne"></html:option>
                                                <html:option value="BE -- Universidad Católica de Lovaina"></html:option>
                                                <html:option value="BO -- Universidad Privada Santa Cruz de la Sierra"></html:option>
                                                <html:option value="BR -- Universidad Federal de Río de Janeiro"></html:option>
                                                <html:option value="BR -- Universidad de Sao Paulo"></html:option>
                                                <html:option value="BR -- Universidad Estadual de Campinas"></html:option>
                                                <html:option value="CA -- Instituto de Tecnología de Ontario"></html:option>
                                                <html:option value="CO -- Universidad Externado"></html:option>
                                                <html:option value="CO -- Pontificia Universidad Bolivariana"></html:option>
                                                <html:option value="CO -- Pontificia Universidad Javeriana"></html:option>
                                                <html:option value="CO -- Universidad de los Andes"></html:option>
                                                <html:option value="CO -- Universidad del Norte"></html:option>
                                                <html:option value="CO -- Universidad del Valle"></html:option>
                                                <html:option value="CL -- Pontifica Universidad Católica de Chile"></html:option>
                                                <html:option value="CL -- Pontificia Universidad Católica de Valparaíso"></html:option>
                                                <html:option value="CL -- Universidad Austral de Chile"></html:option>
                                                <html:option value="CL -- Universidad de Concepción"></html:option>
                                                <html:option value="CL -- Universidad de Talca"></html:option>
                                                <html:option value="CL -- Universidad de Tarapacá"></html:option>
                                                <html:option value="CR -- Universidad de Costa Rica"></html:option>    
                                                <html:option value="DO -- Pontificia Universidad Católica Madre y Maestra"></html:option> 
                                                <html:option value="DO -- Instituto Tecnológico de Santo Domingo"></html:option> 
                                                <html:option value="EC --  Escuela Superior Politécnica del Litoral"></html:option>    
                                                <html:option value="ES -- Universidad de las Islas Baleares"></html:option>
                                                <html:option value="ES -- UUniversidad de Santiago de Compostela"></html:option>
                                                <html:option value="ES -- Universitat Oberta de Catalunya"></html:option>
                                                <html:option value="ES -- Universidad de Barcelona"></html:option>
                                                <html:option value="ES -- Universidad Carlos III de Madrid"></html:option>
                                                <html:option value="ES -- Universidad de Granada"></html:option>
                                                <html:option value="ES -- Universidad Politécnica de Madrid"></html:option>
                                                <html:option value="ES -- Universidad Politécnica de Cataluña"></html:option>
                                                <html:option value="ES -- Universidad Politécnica de Valencia"></html:option>
                                                <html:option value="ES -- Universidad de Zaragoza"></html:option>
                                                <html:option value="EEUU -- Universidad de Nuevo México"></html:option>
                                                <html:option value="EEUU -- Universidad de Oklahoma"></html:option>
                                                <html:option value="FI -- Universidad Abo Akademi"></html:option>
                                                <html:option value="FR -- Arts et Metiers ParisTech"></html:option>
                                                <html:option value="FR -- Escuela de Minas de Nantes"></html:option>
                                                <html:option value="FR -- EPF Escuela de Ingenieros"></html:option>
                                                <html:option value="FR -- INSA – Lyon"></html:option>
                                                <html:option value="FR -- TELECOM – SudParis"></html:option>
                                                <html:option value="FR -- Universidad Tecnológica de Compiegne"></html:option>
                                                <html:option value="FR -- Universidad Paris Ouest Nanterre"></html:option>
                                                <html:option value="FR -- Universidad Paris Est Marne la Valle"></html:option>
                                                <html:option value="ITA -- Politécnico de Milano"></html:option>
                                                <html:option value="ITA -- Politécnico de Torino"></html:option>
                                                <html:option value="ITA -- Universidad Degli Studi Di Genova"></html:option>
                                                <html:option value="ITA -- Universidad Degli Studi Di Siena"></html:option>
                                                <html:option value="JPN -- Universidad Tecnológica de Nagaoka"></html:option>
                                                <html:option value="JPN -- Universidad de Tohoku"></html:option>
                                                <html:option value="MX -- ITESM Monterrey"></html:option>
                                                <html:option value="MX --  Universidad Autónoma Metropolitana"></html:option>
                                                <html:option value="MX -- Instituto Tecnológico Superior de Cajeme(ITESCA)"></html:option>
                                                <html:option value="MX -- Universidad Veracruzana"></html:option>
                                                <html:option value="NO -- NTNU-Trondheim"></html:option>
                                                <html:option value="PE -- Universidad San Martín de Porres"></html:option>
                                                <html:option value="PE -- Pontificia Universidad Católica del Perú"></html:option>
                                                <html:option value="PE -- Universidad de Lima"></html:option>
                                                <html:option value="PE -- Universidad del Pacífico"></html:option>
                                                <html:option value="PE --  Universidad Peruana Cayetano Heredia"></html:option>
                                                <html:option value="PA -- Universidad de Panamá"></html:option>
                                                <html:option value="PY -- Universidad Católica de Nuestra Señora de la Asunción"></html:option>
                                                <html:option value="PL -- AGH Universidad de Ciencias y Tecnología"></html:option>
                                                <html:option value="PT -- Universidad Técnica de Lisboa"></html:option>
                                                <html:option value="PRC -- Universidad de Puerto Rico"></html:option>
                                                <html:option value="UK -- Universidad de Ulster"></html:option>
                                                <html:option value="RCH -- Universidad Técnica Checa en Praga (CTU)"></html:option>
                                                <html:option value="SE -- Real Instituto de Estocolmo KTH"></html:option>
                                                <html:option value="SE -- Universidad de Lund"></html:option>
                                                <html:option value="SE -- Universidad de Uppsala"></html:option>
                                                <html:option value="VE -- Universidad Centroccidental Lisandro Alvarado"></html:option>
                                            </html:select>
                                        </td>

                                        <td>
                                            <html:errors property="nombreOpcion1" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td></br> <strong> Fecha Tentativa de  Inicio y Fin, segun Universidad de Destino </strong></td>
                                    </tr>
                                    <tr>
                                        <td>Inicio</td>

                                        <td>
                                            <input type="date" name="fechaIni1" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" />
                                        </td>

                                        <td>
                                            <html:errors name="fechaIni1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Fin</td>

                                        <td>
                                            <input type="date" name="fechaFin1" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" />
                                        </td>

                                        <td>
                                            <html:errors name="fechaFin1" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td> Nombre Universidad de Destino:</td>

                                        <td>
                                            <html:select  property="nombreOpcion2">
                                                <html:option value="N/A"></html:option>
                                                <html:option value="ALE -- Universidad de Karlsruhe"></html:option>
                                                <html:option value="ALE -- Universidad de Siegen"></html:option>
                                                <html:option value="ALE -- Universidad de Stuttgart:"></html:option>
                                                <html:option value="AR -- Universidad Nacional de Cuyo"></html:option>
                                                <html:option value="AR -- Universidad Nacional de Quilmes"></html:option>
                                                <html:option value="AR -- Universidad Nacional de San Martín"></html:option>
                                                <html:option value="AU -- Universidad Tecnológica de Swinburne"></html:option>
                                                <html:option value="BE -- Universidad Católica de Lovaina"></html:option>
                                                <html:option value="BO -- Universidad Privada Santa Cruz de la Sierra"></html:option>
                                                <html:option value="BR -- Universidad Federal de Río de Janeiro"></html:option>
                                                <html:option value="BR -- Universidad de Sao Paulo"></html:option>
                                                <html:option value="BR -- Universidad Estadual de Campinas"></html:option>
                                                <html:option value="CA -- Instituto de Tecnología de Ontario"></html:option>
                                                <html:option value="CO -- Universidad Externado"></html:option>
                                                <html:option value="CO -- Pontificia Universidad Bolivariana"></html:option>
                                                <html:option value="CO -- Pontificia Universidad Javeriana"></html:option>
                                                <html:option value="CO -- Universidad de los Andes"></html:option>
                                                <html:option value="CO -- Universidad del Norte"></html:option>
                                                <html:option value="CO -- Universidad del Valle"></html:option>
                                                <html:option value="CL -- Pontifica Universidad Católica de Chile"></html:option>
                                                <html:option value="CL -- Pontificia Universidad Católica de Valparaíso"></html:option>
                                                <html:option value="CL -- Universidad Austral de Chile"></html:option>
                                                <html:option value="CL -- Universidad de Concepción"></html:option>
                                                <html:option value="CL -- Universidad de Talca"></html:option>
                                                <html:option value="CL -- Universidad de Tarapacá"></html:option>
                                                <html:option value="CR -- Universidad de Costa Rica"></html:option>    
                                                <html:option value="DO -- Pontificia Universidad Católica Madre y Maestra"></html:option> 
                                                <html:option value="DO -- Instituto Tecnológico de Santo Domingo"></html:option> 
                                                <html:option value="EC --  Escuela Superior Politécnica del Litoral"></html:option>    
                                                <html:option value="ES -- Universidad de las Islas Baleares"></html:option>
                                                <html:option value="ES -- UUniversidad de Santiago de Compostela"></html:option>
                                                <html:option value="ES -- Universitat Oberta de Catalunya"></html:option>
                                                <html:option value="ES -- Universidad de Barcelona"></html:option>
                                                <html:option value="ES -- Universidad Carlos III de Madrid"></html:option>
                                                <html:option value="ES -- Universidad de Granada"></html:option>
                                                <html:option value="ES -- Universidad Politécnica de Madrid"></html:option>
                                                <html:option value="ES -- Universidad Politécnica de Cataluña"></html:option>
                                                <html:option value="ES -- Universidad Politécnica de Valencia"></html:option>
                                                <html:option value="ES -- Universidad de Zaragoza"></html:option>
                                                <html:option value="EEUU -- Universidad de Nuevo México"></html:option>
                                                <html:option value="EEUU -- Universidad de Oklahoma"></html:option>
                                                <html:option value="FI -- Universidad Abo Akademi"></html:option>
                                                <html:option value="FR -- Arts et Metiers ParisTech"></html:option>
                                                <html:option value="FR -- Escuela de Minas de Nantes"></html:option>
                                                <html:option value="FR -- EPF Escuela de Ingenieros"></html:option>
                                                <html:option value="FR -- INSA – Lyon"></html:option>
                                                <html:option value="FR -- TELECOM – SudParis"></html:option>
                                                <html:option value="FR -- Universidad Tecnológica de Compiegne"></html:option>
                                                <html:option value="FR -- Universidad Paris Ouest Nanterre"></html:option>
                                                <html:option value="FR -- Universidad Paris Est Marne la Valle"></html:option>
                                                <html:option value="ITA -- Politécnico de Milano"></html:option>
                                                <html:option value="ITA -- Politécnico de Torino"></html:option>
                                                <html:option value="ITA -- Universidad Degli Studi Di Genova"></html:option>
                                                <html:option value="ITA -- Universidad Degli Studi Di Siena"></html:option>
                                                <html:option value="JPN -- Universidad Tecnológica de Nagaoka"></html:option>
                                                <html:option value="JPN -- Universidad de Tohoku"></html:option>
                                                <html:option value="MX -- ITESM Monterrey"></html:option>
                                                <html:option value="MX --  Universidad Autónoma Metropolitana"></html:option>
                                                <html:option value="MX -- Instituto Tecnológico Superior de Cajeme(ITESCA)"></html:option>
                                                <html:option value="MX -- Universidad Veracruzana"></html:option>
                                                <html:option value="NO -- NTNU-Trondheim"></html:option>
                                                <html:option value="PE -- Universidad San Martín de Porres"></html:option>
                                                <html:option value="PE -- Pontificia Universidad Católica del Perú"></html:option>
                                                <html:option value="PE -- Universidad de Lima"></html:option>
                                                <html:option value="PE -- Universidad del Pacífico"></html:option>
                                                <html:option value="PE --  Universidad Peruana Cayetano Heredia"></html:option>
                                                <html:option value="PA -- Universidad de Panamá"></html:option>
                                                <html:option value="PY -- Universidad Católica de Nuestra Señora de la Asunción"></html:option>
                                                <html:option value="PL -- AGH Universidad de Ciencias y Tecnología"></html:option>
                                                <html:option value="PT -- Universidad Técnica de Lisboa"></html:option>
                                                <html:option value="PRC -- Universidad de Puerto Rico"></html:option>
                                                <html:option value="UK -- Universidad de Ulster"></html:option>
                                                <html:option value="RCH -- Universidad Técnica Checa en Praga (CTU)"></html:option>
                                                <html:option value="SE -- Real Instituto de Estocolmo KTH"></html:option>
                                                <html:option value="SE -- Universidad de Lund"></html:option>
                                                <html:option value="SE -- Universidad de Uppsala"></html:option>
                                                <html:option value="VE -- Universidad Centroccidental Lisandro Alvarado"></html:option>
                                            </html:select>
                                        </td>

                                        <td>
                                            <html:errors property="nombreOpcion2" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td></br> <strong>Fecha Tentativa de  Inicio y Fin, segun Universidad de Destino </strong></td>
                                    </tr>
                                    <tr>
                                        <td>Inicio</td>

                                        <td>
                                            <input type="date" name="fechaIni2" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" />
                                        </td>

                                        <td>
                                            <html:errors name="fechaIni2" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Fin</td>

                                        <td>
                                            <input type="date" name="fechaFin2" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" />
                                        </td>

                                        <td>
                                            <html:errors name="fechaFin2" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br />

                    <div class="nav" style="text-align: center;">
                        <a href="#" onclick="if (document.getElementById('financiamiento').style.display=='none') 
                            hide('archivos'),  hide('datosPersonales'), show('financiamiento'), hide('academico'), hide('opcion'), hide('idiomas'), hide('representante'); else hide('opcion');"> Financiamiento </a>
                    </div>


                    <div id="financiamiento" style="display: none">
                        <div style="width:auto;height:auto;border:6px solid #F0F0F0; background-color: #F0F0F0">
                            <table border="0"  align="center">
                                <tbody>

                                    <tr>
                                        <td> Fuente de Financiamiento:</td>
                                    </tr>
                                    <tr>
                                        <td>

                                            <html:checkbox name="PlanillaUSB" property="fuenteFinanciamiento" value="personal"> Personal/Familiar </html:checkbox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <html:checkbox name="PlanillaUSB" property="fuenteFinanciamiento" value="prestamo"> Bec/Prestamo </html:checkbox>
                                        </td>  
                                    </tr>
                                    <tr>
                                        <td>
                                            <html:checkbox name="PlanillaUSB" property="fuenteFinanciamiento" value="otro">Otro (Especifique)</html:checkbox>
                                        </td> 

                                        <td>
                                            <html:text name="PlanillaUSB" property="descripcion" maxlength="100"  errorStyleClass="error"
                                                       errorKey="org.apache.struts.action.ERROR">
                                            </html:text>
                                        </td>
                                    </tr>
                                <td>
                                    <html:errors property="fuenteFinanciamiento" />
                                </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br />

                    <p style="text-align: center">
                        <html:submit onclick="javascript: return confirm('¿Está seguro que los datos son correctos?')">
                            Guardar Solicitud
                        </html:submit>
                    </p>
                </html:form>
            </div>
        </div>
    </div>
    <br />

    <div class="nav" style="text-align: center;">
        <a href="#" onclick="if (document.getElementById('financiamiento').style.display=='none') 
            hide('archivos'), hide('datosPersonales'), show('idiomas'), hide('financiamiento'), hide('academico'), hide('opcion'), hide('representante'); else hide('opcion');"> Idiomas </a>
    </div>
    <div id="idiomas" style="display: none">
        <h6> Recuerde que debe cargar los idiomas antes de proseguir </h6>
        <div style="width:auto;height:auto;border:6px solid #F0F0F0; background-color: #F0F0F0">
            <div align=center>
                <html:form action="/CargarIdioma" method="post" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="Idiomas" property="nombreusuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>

                    <table border="0"  align="center" style="margin-left: auto;margin-right: auto">
                        <tbody id ="IdioBody">

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

                                    <html:select property="nivelVerbal[0]" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <html:option value=""></html:option>
                                        <html:option value="Basico">Basico</html:option>
                                        <html:option value="Intermedio">Intermedio</html:option>
                                        <html:option value="Avanzado">Avanzado</html:option>
                                    </html:select>
                                </td>

                                <td>Nivel Escrito</td>

                                <td>
                                    <html:select property="nivelEscrito[0]" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
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

                </div>
            </div>
            <p align="center"><html:submit>Cargar Idiomas</html:submit><p>
            </html:form>
    </div>
    <br />

    <div class="nav" style="text-align: center;">
        <a href="#" onclick="if (document.getElementById('financiamiento').style.display=='none') 
            hide('datosplanilla'), hide('datosPersonales'), show('archivos'), hide('financiamiento'), hide('academico'), hide('opcion'), hide('idiomas'), hide('representante'); else hide('opcion');"> Cargar Archivos Adjuntos </a>
    </div>
    <div id="archivos" style="display: none">
        <div style="width:auto;height:auto;border:6px solid #F0F0F0; background-color: #F0F0F0">
            <div align=center>
                <html:form action="/FileUploadAction" method="post" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="FileUploadForm" property="nombreusuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>
                    <div style="width:auto;height:auto;border:6px solid #F0F0F0; background-color: #F0F0F0">
                        <table id="dataTable" width="350px" cellspacing="14px">
                            <tbody id="dataBody">
                                <tr>
                                    <td><INPUT type="checkbox" name="chk[]"/></td>

                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  
                                                <html:file property="theFile[0]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td> 
                                </tr>
                            </tbody>
                        </table>  
                    </div>
                    <input type="button" value="Seleccionar Otro Documento" style="font-size:12px; padding:4px 6px" onclick="addRow('dataBody')"/>
                    <input type="button" value="Eliminar Documentos Seleccionados" style="font-size:12px; padding:4px 6px" onclick="deleteRow('dataTable')"/>

                </div>
            </div>
            <p  align=center>
                <html:submit>Cargar Documentos </html:submit>
            </p>
        </html:form>
    </div>
    <br />

    <div class="nav" style="text-align: center;">
        <a href="#" onclick="if (document.getElementById('financiamiento').style.display=='none') 
            hide('datosplanilla'), hide('datosPersonales'), show('plan'), hide('archivos'), hide('financiamiento'), hide('academico'), hide('opcion'), hide('idiomas'), hide('representante'); else hide('opcion');"> Cargar Plan de Estudio </a>
    </div>
    <div id="plan" style="display: none">
        <div style="width:auto;height:auto;border:6px solid #F0F0F0; background-color: #F0F0F0">
            <div align="center">
                <h6>Toda la informacion de esta tabla es sobre las materias</h6>
                <html:form action="/AccionPlanDeEstudio" method="post" enctype="multipart/form-data">
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

                                <td> Codigo-universidad de destino</td>

                                <td> Nombre-universidad de destino</td>                                

                                <td> Creditos-universidad de destino</td>

                            </tr>

                            <tr>
                                <td><INPUT type="checkbox" name="c[]"/></td>
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
                    <p><html:submit /><p>
                    </html:form>
            </div>
        </div>

    </div>

</html:html>
