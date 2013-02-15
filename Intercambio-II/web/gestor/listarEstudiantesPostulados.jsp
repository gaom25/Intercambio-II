<%-- 
    Document   : listarUsuario
    Created on : Oct 18, 2012, 12:58:41 AM
    Author     : caponte
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SGI - Listar Usuarios</title>

    <script language="JavaScript">
        function submitForm() { document.ObtenerDatos.submit(); }
    </script>

    <h4>Busqueda Avanzada:</h4>
    <html:form action="AccionBusquedaAvanzada" method="POST" enctype="multipart/form-data" onsubmit="return(this)">
        <table border="0">
            <tbody>
                <tr>
                    <td style="color: black">Indice</td>
                    <td><html:select property="indiceSimbolo">
                            <html:option value=">">Mayor a:</html:option>
                            <html:option value="<">Menor a:</html:option>
                            <html:option value="=">Igual a:</html:option>
                        </html:select>
                    </td>
                    <td>
                        <html:text property="indice"></html:text>
                    </td>
                </tr>
                <tr>
                    <td style="color: black">Carrera</td>
                    <td><html:select property="carrera">
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
                    <td></td>
                <tr>
                    <td style="color: black">Destino</td>
                    <td> <html:select property="destino">
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
                    <td></td>
                </tr>
                <tr>
                    <td style="color: black">Cohorte</td>
                    <td><html:select property="cohorte">
                            <html:option value="01-">2001</html:option>
                            <html:option value="02-">2002</html:option>
                            <html:option value="03-">2003</html:option>
                            <html:option value="04-">2004</html:option>
                            <html:option value="05-">2005</html:option>
                            <html:option value="06-">2006</html:option>
                            <html:option value="07-">2007</html:option>
                            <html:option value="08-">2008</html:option>
                            <html:option value="09-">2009</html:option>
                            <html:option value="10-">2010</html:option>
                            <html:option value="11-">2011</html:option>
                            <html:option value="12-">2012</html:option>
                        </html:select>
                    </td>
                    <td>
                        <html:submit>Buscar</html:submit>
                    </td>
                </tr>
            </tbody>
        </table>
    </html:form>

    <h4>Lista de Usuarios del Sistema:</h4>
    <table style="margin: auto">
        <tr>
            <td width="220px">
                Nombre
            </td>
            <td width="150px" align="center">
                Ver Usuario
            </td>
            <td width="150px" align="center">
                Consultar Solicitud
            </td>
            <td width="150px" align="center">
                Cambiar Estado de la Solicitud
            </td>

        </tr>
    </table>

    <logic:iterate name="usuarios" id="usuarios">
        <table border="0" style="margin: auto">
            <tbody>
                <tr>
                    <td width="220px">
                        <bean:write name="usuarios" property="nombreusuario" />
                    </td>
                    <td align="center" width="150px">
                        <html:form action="/ConsultarUsuario2" onsubmit="return(this)">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <html:image src="images/verDatos.png" styleClass="button" value="" property="" style=""/> 
                        </html:form>
                    </td>
                    <td align="center" width="150px">
                        <html:form action="/GenerarCarpeta" onsubmit="return(this)">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <html:image src="images/archivador.png" style="width:32px;height:32px"  styleClass="button" value="" property="" /> 
                        </html:form>
                    </td>
                    <td>
                        <html:form action="/CambiarEstadoPostulacion"  method="POST" enctype="multipart/form-data" onsubmit="return(this)">

                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <html:image src="images/postulacion.png" styleClass="button" value="" property="" style=""/> 
                            <html:select name="Usuario" property="confirmar">
                                <html:option value="">Nvo Estado</html:option>
                                <html:option value="Aceptado">Tramitando</html:option>
                                <html:option value="En Evaluacion">Aprobado</html:option>
                                <html:option value="Retenido">Rechazado</html:option>
                                <html:option value="Rechazado">Rechazado</html:option>
                            </html:select>
                        </html:form>
                    </td>
                </tr>
            </tbody>
        </table>
    </logic:iterate>
</html>
