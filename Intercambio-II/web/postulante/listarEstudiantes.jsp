<%-- 
    Document   : listarEstudiantes
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
    <title>SGI - Listar Estudiantes</title>

    <script language="JavaScript">
        function submitForm() { document.ObtenerDatos.submit(); }
    </script>

    <h4>Lista de Estudiantes de la Carrera:</h4>
    
     <h3>Busqueda Avanzada</h3>
    
    <html:form action="AccionBusquedaAvanzada" method="POST" enctype="multipart/form-data" onsubmit="return(this)">
        <table border="0">
            <tbody>
            <tr>
                <td>
                    Nombre:
                </td>
                <td>
                    <html:text property="nombre"></html:text>
                </td>
                <td>
                    Apellido:
                </td>
                <td>
                    <html:text property="apellido"></html:text>
                </td>
                <td>
                    Carnet:
                </td>
                <td>
                    <html:text property="carnet"></html:text>
                </td>
                
            </tr>
            <tr>
                <td>
                    Indice:
                </td>
                <td>
                    <html:text property="indice"></html:text>
                </td>
                <td>
                    Indice Ponderado:
                </td>
                <td>
                    <html:text property="indicePonderado"></html:text>
                </td>
                
            </tr>
            </tbody>
        </table>
        <table border="0">
            <tr>
                <td>
                    Carrera:
                </td>
                <td>
                    <html:select property="carrera">
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
                <td>
                    Opcion 1:
                </td>
                <td>
                    <html:select property="opcion1">
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
            </tr>
            <tr>
                <td>
                    Opcion 2:
                </td>
                <td>
                    <html:select property="opcion2">
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
            </tr>
            <tr>
                <td>
                    <html:submit>Buscar</html:submit>
                </td>
            </tr>
            </tbody>
        </table>  
        
    </html:form>
    
    <table style="margin: auto">
        <tr>
            <td width="220px">
                Nombre
            </td>
            <td width="150px" align="center">
                Ver estudiante
            </td>
            <td width="150px" align="center">
                Eliminar Estudiante
            </td>
        </tr>
    </table>
    <logic:iterate name="usuario" id="usuarios">
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
                        <html:form action="/EliminarUsuarioCoord" onsubmit="return(this)">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <a onclick="javascript: return confirm('Seguro Que Deses Elmininar Este Usuario?')">
                                <html:image src="images/trashcan-delete.png" styleClass="button" value="" property="" /> 
                            </a>
                        </html:form>
                    </td>
                </tr>
            </tbody>
        </table>
    </logic:iterate>
</html>
