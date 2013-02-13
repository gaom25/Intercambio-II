<%-- 
    Document   : formularioSolicitudUSB
    Created on : Nov 13, 2012, 10:13:53 AM
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

    <!-- LLENAR EL FORMULARIO DE DATOS -->
    
    <div class="nav" style="text-align: center;">
        <a href="#" onclick=" if (true) show('datosplanilla'), hide('archivos')"> Llenar Formulario de Datos </a>
    </div>
    
    <div id="datosplanilla" style="display: none">
        <div style="width:auto;height:auto;border:6px solid #F0F0F0; background-color: #F0F0F0">
            <div align=center>

                <html:form action="/LlenarPlanilla_EstUSB"  method="POST" enctype="multipart/form-data" onsubmit="return(this)">
                    <p hidden="true"><html:text name="PlanillaUSB" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>

                        <table border="0"  align="center">
                            <tbody>
                                <tr>
                                    <td> <br/> <strong>Datos Personales</strong></td>
                                </tr>
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
                    <table border="0"  align="center">
                        <tbody>
                        <br>
                            <tr>
                                <td> <strong>Programa y Lapso de Estudio de Intercambio</strong></td>
                            </tr>
                            
                            <tr>
                                <td> Opción 1:</td>
                            </tr>
                            
                            <tr>
                                <td> País Destino:</td>
                                <td>
                                    <html:select  property="paisOpcion1">
                                        <html:option value="Seleccione"></html:option>
                                        <html:option value="Alemania"></html:option>
                                        <html:option value="Argentina"></html:option>
                                        <html:option value="Bélgica"></html:option>
                                        <html:option value="Bogota"></html:option>
                                        <html:option value="Brasil"></html:option>
                                        <html:option value="Canada"></html:option>
                                        <html:option value="Colombia"></html:option>
                                        <html:option value="Chile"></html:option>
                                        <html:option value="Costa Rica"></html:option>
                                        <html:option value="España"></html:option>
                                        <html:option value="Estados Unidos"></html:option>
                                        <html:option value="Finlandia"></html:option>
                                        <html:option value="Francia"></html:option>
                                        <html:option value="Italia"></html:option>
                                        <html:option value="Japón"></html:option>
                                        <html:option value="México"></html:option>
                                        <html:option value="Noruega"></html:option>
                                        <html:option value="Perú"></html:option>
                                        <html:option value="Panamá"></html:option>
                                        <html:option value="Puerto Rico"></html:option>
                                    </html:select>
                                </td>
                                <td>
                                    <html:errors property="paisOpcion1" />
                                </td>
                            </tr>
                            <tr>
                                <td> Nombre Universidad de Destino:</td>
                                <td>
                                    <html:select  property="nombreOpcion1">
                                        <html:option value="Seleccione"></html:option>
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
                                        <html:option value="EC -- Escuela Superior Politécnica del Litoral"></html:option>    
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
                                        <html:option value="MX -- Universidad Autónoma Metropolitana"></html:option>
                                        <html:option value="MX -- Instituto Tecnológico Superior de Cajeme(ITESCA)"></html:option>
                                        <html:option value="MX -- Universidad Veracruzana"></html:option>
                                        <html:option value="NO -- NTNU-Trondheim"></html:option>
                                        <html:option value="PE -- Universidad San Martín de Porres"></html:option>
                                        <html:option value="PE -- Pontificia Universidad Católica del Perú"></html:option>
                                        <html:option value="PE -- Universidad de Lima"></html:option>
                                        <html:option value="PE -- Universidad del Pacífico"></html:option>
                                        <html:option value="PE -- Universidad Peruana Cayetano Heredia"></html:option>
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
                                <td> Nombre de Programa: </td>
                                <td>
                                    <html:select  property="nombreProgramaOpcion1">
                                        <html:option value="Seleccione"></html:option>
                                        <html:option value="Convenios Bilaterales"></html:option>
                                        <html:option value="Programa Red"></html:option>
                                        <html:option value="Programa Movilidad Estudiantil (CINDA)"></html:option>
                                    </html:select>
                                </td>
                                <td>
                                    <html:errors property="nombreProgramaOpcion1" />
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
                                <td>      </td>
                            </tr>
                            
                            <tr>
                                <td> Opción 2:</td>
                            </tr>


                            <tr>
                                <td> País Destino:</td>
                                <td>
                                    <html:select  property="paisOpcion2">
                                        <html:option value="Seleccione"></html:option>
                                        <html:option value="Alemania"></html:option>
                                        <html:option value="Argentina"></html:option>
                                        <html:option value="Bélgica"></html:option>
                                        <html:option value="Bogota"></html:option>
                                        <html:option value="Brasil"></html:option>
                                        <html:option value="Canada"></html:option>
                                        <html:option value="Colombia"></html:option>
                                        <html:option value="Chile"></html:option>
                                        <html:option value="Costa Rica"></html:option>
                                        <html:option value="España"></html:option>
                                        <html:option value="Estados Unidos"></html:option>
                                        <html:option value="Finlandia"></html:option>
                                        <html:option value="Francia"></html:option>
                                        <html:option value="Italia"></html:option>
                                        <html:option value="Japón"></html:option>
                                        <html:option value="México"></html:option>
                                        <html:option value="Noruega"></html:option>
                                        <html:option value="Perú"></html:option>
                                        <html:option value="Panamá"></html:option>
                                        <html:option value="Puerto Rico"></html:option>
                                    </html:select>
                                </td>
                                <td>
                                    <html:errors property="paisOpcion2" />
                                </td>
                            </tr>
                            <tr>
                                <td> Nombre Universidad de Destino:</td>
                                <td>
                                    <html:select  property="nombreOpcion2">
                                        <html:option value="Seleccione"></html:option>
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
                                        <html:option value="EC -- Escuela Superior Politécnica del Litoral"></html:option>    
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
                                        <html:option value="MX -- Universidad Autónoma Metropolitana"></html:option>
                                        <html:option value="MX -- Instituto Tecnológico Superior de Cajeme(ITESCA)"></html:option>
                                        <html:option value="MX -- Universidad Veracruzana"></html:option>
                                        <html:option value="NO -- NTNU-Trondheim"></html:option>
                                        <html:option value="PE -- Universidad San Martín de Porres"></html:option>
                                        <html:option value="PE -- Pontificia Universidad Católica del Perú"></html:option>
                                        <html:option value="PE -- Universidad de Lima"></html:option>
                                        <html:option value="PE -- Universidad del Pacífico"></html:option>
                                        <html:option value="PE -- Universidad Peruana Cayetano Heredia"></html:option>
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
                                <td>
                                    <html:errors property="programaOpcion2" />
                                </td>
                            </tr>                            
                            <tr>
                                <td> Nombre de Programa: </td>
                                <td>
                                    <html:select  property="nombreProgramaOpcion2">
                                        <html:option value="Seleccione"></html:option>
                                        <html:option value="Convenios Bilaterales"></html:option>
                                        <html:option value="Programa Red"></html:option>
                                        <html:option value="Programa Movilidad Estudiantil (CINDA)"></html:option>
                                    </html:select>
                                </td>
                                <td>
                                    <html:errors property="nombreProgramaOpcion2" />
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
                                <td>
                                    <html:errors property="mesFechaIni2" />
                                    <html:errors property="anoFechaIni2" />
                                </td>
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
                                <td>
                                    <html:errors property="mesFechaFin2" />
                                    <html:errors property="anoFechaFin2" />
                                </td>
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
                            <tr>
                                <td> <br/> <strong>Información Académica</strong></td>
                            </tr>                            
                            <tr>
                                <td> Decanato:</td>
                                <td><html:select name="PlanillaUSB" property="decanato">
                                        <html:option value="Seleccione"></html:option>
                                        <html:option value="Dec. Estudios Profesionales"></html:option>
                                    </html:select>
                                </td>
                            </tr>

                            <tr>
                                <td> Área de Estudio:</td>
                                <td><html:select name="PlanillaUSB" property="areaEstud">
                                        <html:option value="Seleccione"></html:option>
                                    </html:select>
                                </td>
                            </tr>
                            
                            <tr>
                                <td> Carrera:</td>
                                <td><html:select name="PlanillaUSB" property="carrera">
                                        <html:option value="Seleccione"></html:option>
                                        <html:option value="Administración del Turismo"></html:option>
                                        <html:option value="Administración Hotelera"></html:option>
                                        <html:option value="Administración del Transporte"></html:option>
                                        <html:option value="Administración Aduanera"></html:option>                                        
                                        <html:option value="Arquitectura"></html:option>
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
                                        <html:option value="Licenciatura en Quimica"></html:option>
                                        <html:option value="Licenciatura en Matematicas"></html:option>
                                        <html:option value="Licenciatura en Fisica"></html:option>
                                        <html:option value="Licenciatura en Biologia"></html:option>                                        
                                        <html:option value="Mantenimiento Aeronautico"></html:option>
                                        <html:option value="Organizacion Empresarial"></html:option>                                        
                                        <html:option value="Tecnología  Electrica"></html:option>
                                        <html:option value="Tecnología  Electronica"></html:option>
                                        <html:option value="Tecnologia Mecanica"></html:option>
                                        <html:option value="Urbanismo"></html:option>                                        
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

                            <tr>
                                <td> Índice Académico Ponderado: </td>

                                <td>
                                    <html:text name="PlanillaUSB" property="indicePon" maxlength="60"  errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:errors property="indicePon" />
                                </td>
                            </tr>

                <tr>
                <td> Plan de Estudio: </td>
                <td>
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

                                <td> Codigo-Univ. Destino</td>

                                <td> Nombre-Univ. Destino</td>                                

                                <td> Creditos-Univ. Destino</td>

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
                    </html:form>
                </td>
                </tr>

                <tr>
                    <td> <br/> <strong>Fuente de Financiamiento</strong></td>
                </tr> 
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
                <td> ¿Recibe Algún Tipo de Ayuda Económica?: </td>
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
                <tr>
                    <td><br/> <strong>Conocimiento de Idiomas</strong></td>
                </tr>  
                    <tr>
                        <td> Idioma a Emplear en Univ. Destino </td>
                        <td>
                            <html:text name="PlanillaUSB" property="idiomaDest" maxlength="60"  errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR">
                            </html:text>
                        </td>
                        <td>
                            <html:errors property="idiomaDest" />
                        </td>
                    </tr>
                <tr>
                <td> Nivel Verbal: </td>
                    <td><html:select name="PlanillaUSB" property="nivelVerbal">
                            <html:option value="Seleccione"></html:option>
                            <html:option value="Básico"></html:option>
                            <html:option value="Medio"></html:option>
                            <html:option value="Avanzado"></html:option>
                        </html:select>              
                    </td>
                </tr>  
                <tr>
                <td> Nivel Escrito: </td>
                    <td><html:select name="PlanillaUSB" property="nivelEscrito">
                            <html:option value="Seleccione"></html:option>
                            <html:option value="Básico"></html:option>
                            <html:option value="Medio"></html:option>
                            <html:option value="Avanzado"></html:option>
                        </html:select>              
                    </td>
                </tr>                
                <tr>
                    <td> <br/> <strong>Datos en Caso de Emergencia</strong></td>
                </tr>     
                    <tr>
                        <td> Primer Apellido: </td>
                        <td>
                            <html:text name="PlanillaUSB" property="apellidoRep1" maxlength="80"  errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR">
                            </html:text>
                        </td>
                    </tr>                     
                    <tr>
                        <td> Segundo Apellido: </td>
                        <td>
                            <html:text name="PlanillaUSB" property="apellidoRep2" maxlength="80"  errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR">
                            </html:text>
                        </td>
                    </tr>                                     
                    <tr>
                        <td> Primer Nombre: </td>
                        <td>
                            <html:text name="PlanillaUSB" property="nombreRep1" maxlength="80"  errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR">
                            </html:text>
                        </td>
                    </tr>
                    <tr>
                        <td> Segundo Nombre: </td>
                        <td>
                            <html:text name="PlanillaUSB" property="nombreRep2" maxlength="80"  errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR">
                            </html:text>
                        </td>
                    </tr> 
                    <tr>
                        <td> Teléfono: </td>
                        <td>
                            <html:text name="PlanillaUSB" property="tlfRep" maxlength="80"  errorStyleClass="error"
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
        <a href="#" onclick=" if (true) hide('datosplanilla'), show('archivos')"> Cargar Archivos Adjuntos </a>
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


</html:html>
