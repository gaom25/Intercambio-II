<%-- 
    Document   : formularioSolicitudUSB
    Created on : Nov 13, 2012, 10:13:53 AM
    Author     : dreabalbas
    Modified by: Katy
--%>
<%Object var = session.getAttribute("nombreusuario");%>

<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html:html lang="true">


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
                        </tbody>
                    </table>                                    
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
