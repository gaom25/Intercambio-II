/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBMS;

import Clases.*;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.jstl.sql.Result;
import java.util.Iterator;

/**
 *
 * @author gustavo
 */
public class DBMS {

    static private Connection conexion;

    protected DBMS() {
    }
    static private DBMS instance = null;

    static public DBMS getInstance() {
        if (null == DBMS.instance) {
            DBMS.instance = new DBMS();
        }
        conectar();
        return DBMS.instance;
    }

    public static boolean conectar() {
        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/dycicle",
                    "postgres",
                    "postgres");
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    /* Esta funcion se utiliza cuando un usuario inicia sesion
     * para verificar que su nombre y contrasena sean correctos
     * 
     */

    public Usuario consultarUsuario(Usuario u) {

        PreparedStatement psConsultar = null;
        try{
            
            psConsultar = conexion.prepareStatement("SELECT * FROM \"dycicle\".usuario"
                + " WHERE nombreusuario = ? AND contrasena = ?");
            
            psConsultar.setString(1, u.getNombreusuario());
            psConsultar.setString(2, u.getContrasena());
            System.out.println(psConsultar.toString());
            ResultSet rs = psConsultar.executeQuery();
            while (rs.next()) {

                u.setPrivilegio(rs.getInt("privilegio"));
                if (u.getPrivilegio() == 5 || u.getPrivilegio() == 6) {
                    Usuario aux = obtenerEstadoSolicitud(u);
                    u.setConfirmar(aux.getConfirmar());
                }
                u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("email"));
                return u;
            }
            
        }catch (SQLException ex) {
            Logger.getLogger(DBMS.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        /*String sqlquery = "SELECT * FROM \"dycicle\".usuario"
                + " WHERE nombreusuario ='" + u.getNombreusuario() + "' " + " AND "
                + "contrasena ='" + u.getContrasena() + "'";
        System.out.println(sqlquery);
        try {

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {

                u.setPrivilegio(rs.getInt("privilegio"));
                if (u.getPrivilegio() == 5 || u.getPrivilegio() == 6) {
                    Usuario aux = obtenerEstadoSolicitud(u);
                    u.setConfirmar(aux.getConfirmar());
                }
                u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("email"));
                return u;
            }


        } catch (SQLException ex) {
            Logger.getLogger(DBMS.class.getName()).log(Level.SEVERE, null, ex);
        }*/

        u.setNombreusuario(null);

        return u;
    }

    public Usuario consultarPreregistro(Usuario u) {

        PreparedStatement psConsultar = null;
        
        try{
            psConsultar = conexion.prepareStatement("SELECT * FROM \"dycicle\".preregistro"
                + " WHERE nombreusuario = ?");
            psConsultar.setString(1, u.getNombreusuario());
            System.out.println(psConsultar.toString());
            ResultSet rs = psConsultar.executeQuery();
            while (rs.next()) {
                u.setNombre(rs.getString("nombre"));
                return u;
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(DBMS.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        /*String sqlquery = "SELECT * FROM \"dycicle\".preregistro"
                + " WHERE nombreusuario ='" + u.getNombreusuario() + "'";
        try {

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                u.setNombre(rs.getString("nombre"));
                return u;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DBMS.class.getName()).log(Level.SEVERE, null, ex);
        }*/

        u.setNombreusuario(null);
        return u;
    }

    public Boolean agregarUsuario(Usuario u) {
        
        PreparedStatement psAgregar = null;
        
        try{
            psAgregar = conexion.prepareStatement("INSERT INTO \"dycicle\".usuario VALUES (?,?,?,?,?);");
            psAgregar.setString(1, u.getNombreusuario());
            psAgregar.setString(2, u.getEmail());
            psAgregar.setInt(3, u.getPrivilegio());
            psAgregar.setString(4, u.getNombre());
            psAgregar.setString(5, u.getContrasena());
            System.out.println(psAgregar.toString());
            Integer i = psAgregar.executeUpdate();
            return i > 0;
        
        } catch (SQLException ex){
            ex.printStackTrace();
        }
        
        /*try {
            String sqlquery = "INSERT INTO \"dycicle\".usuario VALUES ('" + u.getNombreusuario()
                    + "', '" + u.getEmail() + "', '" + u.getPrivilegio()
                    + "', '" + u.getNombre() + "','" + u.getContrasena() + "');";
            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }*/
        return false;
    }

    public Boolean eliminarUsuario(Usuario u) {
        try {

            String nombreusuario = u.getNombreusuario();
            String sqlquery = "SELECT privilegio FROM \"dycicle\".usuario"
                    + " WHERE nombreusuario = '" + nombreusuario + "'";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            boolean prox = rs.next();
            int privilegio = rs.getInt("privilegio");

            if (privilegio == 2) {
                sqlquery = "DELETE FROM \"dycicle\".gestor WHERE nombreusuario = '"
                        + nombreusuario + "'";
            } else if (privilegio == 3 || privilegio == 4) {
                sqlquery = "DELETE FROM \"dycicle\".postulante WHERE nombreusuario = '"
                        + nombreusuario + "'";
            } else if (privilegio == 5) {
                /*Eliminio de la tabla financiamiento*/
                sqlquery = "DELETE FROM \"dycicle\".financiamiento WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                Integer i = stmt.executeUpdate(sqlquery);
                /*Eliminio de la tabla antecedente*/
                sqlquery = "DELETE FROM \"dycicle\".antecedenteacademico WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                /*Eliminio de la tabla idiomas*/
                sqlquery = "DELETE FROM \"dycicle\".idiomas WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                /*Eliminio de la tabla representante*/
                sqlquery = "DELETE FROM \"dycicle\".representante WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                /*Eliminio de la tabla archivos*/
                sqlquery = "DELETE FROM \"dycicle\".archivosestudiante WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                /*Eliminio de la tabla planestudio*/
                sqlquery = "DELETE FROM \"dycicle\".planestudio WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                /*Eliminio de la tabla estudianteusb*/
                sqlquery = "DELETE FROM \"dycicle\".estudianteusb WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                /*Se deja el sql para que sea eliminado despues*/
                sqlquery = "DELETE FROM \"dycicle\".estudiante WHERE nombreusuario = '"
                        + nombreusuario + "'";
            } else if (privilegio == 6) {
                /*Eliminio de la tabla antecedente*/
                sqlquery = "DELETE FROM \"dycicle\".antecedenteacademico WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                Integer i = stmt.executeUpdate(sqlquery);
                /*Eliminio de la tabla idiomas*/
                sqlquery = "DELETE FROM \"dycicle\".idiomas WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                /*Eliminio de la tabla representante*/
                sqlquery = "DELETE FROM \"dycicle\".representante WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                /*Eliminio de la tabla archivos*/
                sqlquery = "DELETE FROM \"dycicle\".archivosestudiante WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                /*Eliminio de la tabla planestudio*/
                sqlquery = "DELETE FROM \"dycicle\".planestudio WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);

                sqlquery = "DELETE FROM \"dycicle\".estudianteinternacional WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                sqlquery = "DELETE FROM \"dycicle\".estudiante WHERE nombreusuario = '"
                        + nombreusuario + "'";
            }

            stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);

            sqlquery = "DELETE FROM \"dycicle\".usuario" + " WHERE nombreusuario = '"
                    + nombreusuario + "'";
            stmt = conexion.createStatement();
            i = stmt.executeUpdate(sqlquery);

            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean agregarGestor(Usuario g) {
        PreparedStatement psAgregar = null;
        
        try{
            psAgregar = conexion.prepareStatement("INSERT INTO \"dycicle\".gestor VALUES (?,?);");
            psAgregar.setString(1, g.getNombreusuario());
            psAgregar.setString(2, g.getNombreusuario());
            System.out.println(psAgregar.toString());
            Integer i = psAgregar.executeUpdate();
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        /*try {
            String sqlquery = "INSERT INTO \"dycicle\".gestor VALUES ('" + g.getNombreusuario()
                    + "', '" + g.getNombre() + "');";
            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }*/
        return false;
    }

    public boolean agregarCoordUSB(Postulante p) {
        PreparedStatement psAgregar = null;
        try{
            psAgregar = conexion.prepareStatement("INSERT INTO \"dycicle\".postulante VALUES (?,?,?, 'null',?);");
            psAgregar.setString(1, p.getNombreusuario());
            psAgregar.setString(2, p.getCodigo());
            psAgregar.setString(3, p.getTipo());
            psAgregar.setString(4, p.getNombreCarrera());;
            System.out.println(psAgregar.toString());
            Integer i = psAgregar.executeUpdate();
            return i > 0;
        
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        /*try {
            String sqlquery = "INSERT INTO \"dycicle\".postulante VALUES ('" + p.getNombreusuario()
                    + "', '" + p.getCodigo() + "', '" + p.getTipo() + "', 'null', '"
                    + p.getNombreCarrera() + "');";
            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }*/
        return false;
    }

    public boolean agregarUniExt(Postulante p) {
        
        PreparedStatement psAgregar = null;
        
        try{
            psAgregar = conexion.prepareStatement("INSERT INTO \"dycicle\".postulante VALUES (?,?,?,?, 'null');");
            psAgregar.setString(1, p.getNombreusuario());
            psAgregar.setString(2, p.getNombreUniExt());
            psAgregar.setString(3, p.getTipo());
            psAgregar.setString(4, p.getNombreUniExt());
            System.out.println(psAgregar.toString());
            Integer i = psAgregar.executeUpdate();
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        /*try {
            String sqlquery = "INSERT INTO \"dycicle\".postulante VALUES ('" + p.getNombreusuario()
                    + "', '" + p.getNombreUniExt() + "', '" + p.getTipo() + "',  '" + p.getNombreUniExt()
                    + "', 'null');";
            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }*/
        return false;
    }

    /*
     * Esta funcion es la de agregar estudiante desde el administrador
     */
    public boolean agregarEstudianteUSB(EstudianteUSB e) {
        /*
         * este va a tener rollback
         */
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        PreparedStatement ps4 = null;
        PreparedStatement ps5 = null;
        try {
            conexion.setAutoCommit(false);
            ps1 = conexion.prepareStatement("SELECT nombrecarrera,codigo FROM \"dycicle\".postulante where "
                    + "nombreusuario =?;");
            ps1.setString(1, e.getCarrera());
            ResultSet rs = ps1.executeQuery();
            conexion.commit();
            
            while (rs.next()) {
                e.setCodCarrera(rs.getString("codigo"));
                e.setCarrera(rs.getString("nombrecarrera"));
            }
            
            ps2 = conexion.prepareStatement("INSERT INTO \"dycicle\".estudiante VALUES (" 
                    + "?, '" + "null" + "',?,?,?,?,?,?,"
                    + " 'null','null', 'null',  'null', 'null', 'null', 'null', "
                    + " 'null', 'null', 'null',?, '2012-11-27 23:43:11.080','null','null');");
            ps2.setString(1, e.getNombreusuario());
            ps2.setString(2, e.getpNombre());
            ps2.setString(3, e.getsNombre());
            ps2.setString(4, e.getpApellido());
            ps2.setString(5, e.getsApellido());
            ps2.setString(6, e.getCarrera());
            ps2.setString(7, e.getCodCarrera());
            ps2.setString(8, e.getEmail());
            
            ps3 = conexion.prepareStatement("INSERT INTO \"dycicle\".estudianteUSB VALUES("
                    +" ?,  'null' ,?);");
            ps3.setString(1, e.getNombreusuario());
            ps3.setString(2, e.getCarnet());
            
            ps4 = conexion.prepareStatement("INSERT INTO \"dycicle\".AntecedenteAcademico VALUES ("
                    +"?, '1.0000', '1.0000','null','null',?, "
                    + "'opcion', '0', '0000', '0', 'null', 'null');");
            
           ps4.setString(1, e.getNombreusuario());
           ps4.setString(2, e.getCarrera());
           
           ps5 = conexion.prepareStatement("INSERT INTO \"dycicle\".Postulacion VALUES ("
                    +"?, 'En evaluacion', 'recomendacion', 'comentario');");
           ps5.setString(1, e.getNombreusuario());
           
           
           /*ejecuciones*/
           
           Integer i = ps2.executeUpdate();
           conexion.commit();
           Integer j = ps3.executeUpdate();
           conexion.commit();
           Integer k = ps4.executeUpdate();
           conexion.commit();
           Integer l = ps5.executeUpdate();
           conexion.commit();
           
           /*volvemos a como estabamos*/
           conexion.setAutoCommit(true);
           
            /*String sqlquerycod = "SELECT nombrecarrera,codigo FROM \"dycicle\".postulante where "
                    + "nombreusuario ='" + e.getCarrera() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquerycod);

            while (rs.next()) {
                e.setCodCarrera(rs.getString("codigo"));
                e.setCarrera(rs.getString("nombrecarrera"));
            }

            // Insercion dentro de la tabla estudiante
            String sqlquery1 = "INSERT INTO \"dycicle\".estudiante VALUES ('" + e.getNombreusuario()
                    + "', '" + "null" + "', '" + e.getpNombre()
                    + "', '" + e.getsNombre() + "', '" + e.getpApellido()
                    + "', '" + e.getsApellido() + "', '" + e.getCarrera()
                    + "', '" + e.getCodCarrera() + "', 'null','null', 'null',  'null', 'null', 'null', 'null', "
                    + " 'null', 'null', 'null', '" + e.getEmail() + "', '2012-11-27 23:43:11.080','null','null');";

            // la fecha de nacimiento colocada es temporal, se coloca para que no de error la insercion.
            // La direccion de la foto tambien es temporal.

            //Insercion dentro de la tabla estudianteUSB
            String sqlquery2 = "INSERT INTO \"dycicle\".estudianteUSB VALUES('" + e.getNombreusuario()
                    + "',  'null' , '" + e.getCarnet() + "');";

            String sqlqueryAntecedente = "INSERT INTO \"dycicle\".AntecedenteAcademico VALUES ('"
                    + e.getNombreusuario() + "', "
                    + "'1.0000', "
                    + "'1.0000', "
                    + "'null','null', "
                    + "'" + e.getCarrera() + "', "
                    + "'opcion', '0', '0000', '0', 'null', 'null');";

            String sqlqueryPostulacion = "INSERT INTO \"dycicle\".Postulacion VALUES ('"
                    + e.getNombreusuario() + "', "
                    + "'En evaluacion', "
                    + "'recomendacion', "
                    + "'comentario');";

            Integer i = stmt.executeUpdate(sqlquery1);
            Integer j = stmt.executeUpdate(sqlquery2);
            Integer k = stmt.executeUpdate(sqlqueryAntecedente);
            Integer l = stmt.executeUpdate(sqlqueryPostulacion);*/

           
            return i > 0 && j > 0 && k > 0 && l > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            try{
                System.out.println("haciendo rollback");
                conexion.rollback();
            }catch(SQLException excep){
                System.out.println("No se pudo hacer rollback");
                        
            }
        /*Cerramos las conexiones*/
        }
        try{
            if(ps1 != null){
                ps1.close();
            }
            if(ps2 != null){
                ps2.close();
            }
            if(ps3 != null){
                ps3.close();
            }
            if(ps4 != null){
                ps4.close();
            }
            if(ps5 != null){
                ps5.close();
            }
            conexion.setAutoCommit(true);
        }catch(SQLException excep){
            System.out.println("No se cerro la conexion");
            try{
                conexion.setAutoCommit(true);
            }catch(SQLException excep2){
                System.out.println("fuuuuuuuuuuu");
            }
        }
        
        return false;
    }

    /*
     * Esta funcion es la de agregar estudiante desde el administrador
     */
    public boolean agregarEstudianteExt(EstudianteInternacional e) {
        try {

            // Insercion dentro de la tabla estudiante
            String sqlquery1 = "INSERT INTO \"dycicle\".estudiante VALUES ('" + e.getNombreusuario()
                    + "', '" + "null" + "', '" + e.getpNombre()
                    + "', '" + e.getsNombre() + "', '" + e.getpApellido()
                    + "', '" + e.getsApellido() + "', 'null', '0000', 'null','null', 'null',  'null', 'null', 'null', 'null', "
                    + " 'null', 'null', 'null', '" + e.getEmail() + "', '2012-11-27 23:43:11.080','null','null');";

            // la fecha de nacimiento colocada es temporal, se coloca para que no de error la insercion.
            // La direccion de la foto tambien es temporal.

            //Insercion dentro de la tabla estudianteInternacional
            String sqlquery2 = "INSERT INTO \"dycicle\".estudianteInternacional VALUES('" + e.getNombreusuario()
                    + "', '" + e.getPasaporte() + "', 'null', 'null', 'null', 'No');";

            //Insercion dentro de la tabla AntecedenteAcademico
            String sqlqueryAntecedente = "INSERT INTO \"dycicle\".AntecedenteAcademico VALUES ('"
                    + e.getNombreusuario() + "', "
                    + "'1.0000', '0.0000', 'null','null', 'null', "
                    + "'opcion', '0','0000' , '0', 'null', 'null');";

            String sqlqueryPostulacion = "INSERT INTO \"dycicle\".Postulacion VALUES ('"
                    + e.getNombreusuario() + "', "
                    + "'En evaluacion', "
                    + "'recomendacion', "
                    + "'comentario');";

            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery1);
            Integer j = stmt.executeUpdate(sqlquery2);
            Integer k = stmt.executeUpdate(sqlqueryAntecedente);
            Integer l = stmt.executeUpdate(sqlqueryPostulacion);

            return i > 0 && j > 0 && k > 0 && l > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Boolean preRegistroUsuario(Usuario u) {
        try {


            String confirmacion = "SELECT * FROM \"dycicle\".usuario"
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(confirmacion);
            if (rs.next()) {
                return false;
            } else {

                String sqlquery = "INSERT INTO \"dycicle\".preregistro VALUES ('" + u.getNombreusuario()
                        + "', '" + u.getEmail() + "', '"
                        + u.getNombre() + "','" + u.getContrasena() + "');";
                stmt = conexion.createStatement();
                Integer i = stmt.executeUpdate(sqlquery);
                return i > 0;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    
    
    /*AL aceptar el pre-registro no deberia hacerle el inserte a las demas tablas tambien???*/
    public Boolean aceptarPreregistro(Usuario u) {
        PreparedStatement psAceptar = null;
        try {
            
             Usuario user = consultarPreregistro(u);
            user.setPrivilegio(u.getPrivilegio());
            
            psAceptar = conexion.prepareStatement("INSERT INTO \"dycicle\".usuario VALUES (?,?,?,?,?);");
            psAceptar.setString(1, user.getNombreusuario());
            psAceptar.setString(2, user.getEmail());
            psAceptar.setInt(3, user.getPrivilegio());
            psAceptar.setString(4, user.getNombre());
            psAceptar.setString(5, user.getContrasena());
            System.out.println(psAceptar.toString());
            Integer i = psAceptar.executeUpdate();
            eliminarPreregistro(u);
            return i > 0;
            
           /*String sqlquery = "INSERT INTO \"dycicle\".usuario VALUES ('" + user.getNombreusuario()
                    + "','" + user.getEmail() + "','" + user.getPrivilegio() + "','" + user.getNombre()
                    + "','" + user.getContrasena() + "'); ";
            Statement stmt = conexion.createStatement();

            Integer i = stmt.executeUpdate(sqlquery);*/
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Boolean eliminarPreregistro(Usuario u) {
        PreparedStatement psEliminar = null;
        
        try {
            
            psEliminar = conexion.prepareStatement("DELETE FROM \"dycicle\".preregistro WHERE nombreusuario = ?");
            /*String sqlquery = "DELETE FROM \"dycicle\".preregistro" + " WHERE nombreusuario = '"
                    + u.getNombreusuario() + "'";
            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);*/
            psEliminar.setString(1, u.getNombreusuario());
            Integer i = psEliminar.executeUpdate();
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Boolean modificarUsuario(Usuario u) {
        PreparedStatement psModificar = null;
        try {
            psModificar = conexion.prepareStatement("UPDATE \"dycicle\".usuario SET email= ?, nombre= ?, privilegio= ?"
                    + "WHERE nombreusuario =? ");
            psModificar.setString(1, u.getEmail());
            psModificar.setString(2, u.getNombre());
            psModificar.setInt(3, u.getPrivilegio());
            psModificar.setString(4, u.getNombreusuario());
            /*String sqlquery = "UPDATE \"dycicle\".usuario SET email='" + u.getEmail()
                    + "', nombre='" + u.getNombre()
                    + "', privilegio='" + u.getPrivilegio()
                    + "' WHERE nombreusuario = '"
                    + u.getNombreusuario() + "'";
            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);*/
            Integer i = psModificar.executeUpdate();
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Usuario obtenerEstadoSolicitud(Usuario u) {
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT estadopostulacion FROM \"dycicle\".POSTULACION WHERE nombreusuario = ?");
            ps.setString(1, u.getNombreusuario());
            /*String sqlquery = "SELECT estadopostulacion"
                    + " FROM \"dycicle\".POSTULACION"
                    + " WHERE nombreusuario = '" + u.getNombreusuario() + "'";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);*/
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                u.setConfirmar(rs.getString("estadopostulacion"));
            }

            return u;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Boolean cambiarEstadoSolicitud(Usuario u) {
        PreparedStatement ps = null;
        try {
            
            ps = conexion.prepareStatement("UPDATE \"dycicle\".POSTULACION SET estadopostulacion = ? "
                    + "WHERE nombreusuario = ?");
            ps.setString(1, u.getConfirmar());
            ps.setString(2, u.getNombreusuario());
            /*String sqlquery = "UPDATE \"dycicle\".POSTULACION SET estadopostulacion ='"
                    + u.getConfirmar()
                    + "' WHERE nombreusuario = '"
                    + u.getNombreusuario() + "'";

            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);*/
            Integer i = ps.executeUpdate();

            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Boolean modificarPerfil(Usuario u) {
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("UPDATE \"dycicle\".usuario SET contrasena = ?"
                    +", email= ?, nombre= ? , privilegio= ?  WHERE nombreusuario = ?");
            ps.setString(1, u.getConfirmar());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getNombre());
            ps.setInt(4, u.getPrivilegio());
            ps.setString(5, u.getNombreusuario());
            /*String sqlquery = "UPDATE \"dycicle\".usuario SET contrasena ='" + u.getConfirmar()
                    + "', email='" + u.getEmail()
                    + "', nombre='" + u.getNombre()
                    + "', privilegio='" + u.getPrivilegio()
                    + "' WHERE nombreusuario = '"
                    + u.getNombreusuario() + "'";

            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);*/
            Integer i = ps.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Usuario> listarUsuarios() {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".usuario");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setNombreusuario(rs.getString("nombreusuario"));
                u.setEmail(rs.getString("email"));
                usrs.add(u);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }

    public ArrayList<String> listarDocumentos(Usuario u) throws SQLException {

        ArrayList<String> archivos = new ArrayList<String>(0);
        try{
            PreparedStatement ps = null;
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".archivosestudiante WHERE nombreusuario= ?;");
            ps.setString(1, u.getNombreusuario());
        /*String sqlquery = "SELECT * FROM \"dycicle\".archivosestudiante WHERE nombreusuario='"
                + u.getNombreusuario() + "';";

        Statement stmt = conexion.createStatement();
        ResultSet rs = stmt.executeQuery(sqlquery);*/
            ResultSet rs = ps.executeQuery();
        String p = null;
        

        while (rs.next()) {
            p = rs.getString("direccion");
        }
        if (p == null) {
            return null;
        } else {

            File dir = new File(p);
            for (File child : dir.listFiles()) {
                String tmp;

                tmp = child.getAbsolutePath();
                archivos.add(tmp);
            }
        }

        return archivos;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return archivos;
    }

    public ArrayList<Usuario> listarEstudiantesPostulados() {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        PreparedStatement ps = null;

        try {
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".estudiante NATURAL JOIN \"dycicle\".postulacion");
            /*String sqlquery = "SELECT * FROM \"dycicle\".estudiante NATURAL JOIN \"dycicle\".postulacion";
            Statement stmt = conexion.createStatement();*/
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setNombreusuario(rs.getString("nombreusuario"));
                u.setEmail(rs.getString("email"));
                u.setConfirmar(rs.getString("estadopostulacion"));
                usrs.add(u);
            };


            /* sqlquery = "SELECT * FROM \"dycicle\".planillausb WHERE nombreusuario='"
             + u.getNombreusuario()+ "'";

             stmt = conexion.createStatement();
             System.out.println(sqlquery);
             rs = stmt.executeQuery(sqlquery);
             while (rs.next()) {
             u.setNombreusuario(rs.getString("nombreusuario"));
             u.setConfirmar(rs.getString("estadoPostulacion"));
             usrs.add(u);
             }*/

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }

    public ArrayList<Usuario> listarEstudiantes(Usuario u) {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);

        try {

            //Acomodar Query para que me devuelva los estudiantes con la misma carrera
            //que el que lo invoca
            String sqlquery = "SELECT * FROM \"dycicle\".estudiante WHERE "
                    + "carrera = '" + u.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                Usuario t = new Usuario();
                t.setNombreusuario(rs.getString("nombreusuario"));
                usrs.add(t);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }

    public ArrayList<Usuario> listarPreregistro() {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".preregistro");
            /*String sqlquery = "SELECT * FROM \"dycicle\".preregistro";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);*/
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setNombreusuario(rs.getString("nombreusuario"));
                u.setEmail(rs.getString("email"));
                usrs.add(u);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }

    public ArrayList<Usuario> listarIdiomas(Usuario u) {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);

        try {

            //  Acomodar Query para que me devuelva los estudiantes con la misma carrera
            //  que el que lo invoca
            String sqlquery = "SELECT * FROM \"dycicle\".idiomas WHERE "
                    + "nombreusuario = '" + u.getNombreusuario() + "'";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Usuario t = new Usuario();
                t.setNombre(rs.getString("nombreidioma"));
                t.setConfirmar(rs.getString("nivelverbal"));
                t.setEmail(rs.getString("nivelescrito"));

                usrs.add(t);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }

    public Usuario obtenerDatos(Usuario u) {

        Usuario datos = new Usuario();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".usuario"
                    + " WHERE nombreusuario = ?");
            ps.setString(1, u.getNombreusuario());
            /*String sqlquery = "SELECT * FROM \"dycicle\".usuario"
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "'";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);*/
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                datos.setNombre(rs.getString("nombre"));
                datos.setNombreusuario(rs.getString("nombreusuario"));
                datos.setEmail(rs.getString("email"));
                datos.setPrivilegio(rs.getInt("privilegio"));
                datos.setContrasena(rs.getString("contrasena"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return datos;
    }

    public Boolean agregarPlanillaUSB(PlanillaUSB p) {
        try {

            String sqlqueryEstudiante = "UPDATE \"dycicle\".estudiante SET "
                    + "PrimerNombre = '" + p.getNombre1() + "', "
                    + "SegundoNombre = '" + p.getNombre2() + "', "
                    + "PrimerApellido = '" + p.getApellido1() + "',"
                    + "SegundoApellido = '" + p.getApellido2() + "',"
                    + "Carrera = '" + p.getCarrera() + "', "
                    + "CodCarrera = '" + p.getCodCarrera() + "', "
                    + "Sexo = '" + p.getSexo() + "', "
                    + "Urbanizacion = '" + p.getUrbanizacion() + "', "
                    + "Calle = '" + p.getCalle() + "', "
                    + "Edificio = '" + p.getEdificio() + "', "
                    + "Apartamento = '" + p.getApartamento() + "', "
                    + "Ciudad = '" + p.getCiudad() + "', "
                    + "Estado = '" + p.getEstado() + "', "
                    + "CodPostal = '" + p.getCodPostal() + "', "
                    + "TelefonoCel = '" + p.getTelefonoCelular() + "', "
                    + "TelefonoCasa = '" + p.getTelefonoCasa() + "', "
                    + "Fax = '" + p.getFax() + "', "
                    + "Email = '" + p.getEmail() + "', "
                    + "FechaNac = '" + p.getFechaNacimiento() + "', "
                    + "Nacionalidad = '" + p.getNacionalidad() + "';";
            //$$$$$$$$$$$$$$$$$
            // Falta la foto!!
            //$$$$$$$$$$$$$$$$$


            String sqlqueryEstudianteUSB = "UPDATE \"dycicle\".estudianteUSB SET "
                    + "Cedula = '" + p.getCedula() + "',"
                    + "Carnet = '" + p.getCarnet() + "';";

            //Verificamos si el estudiante tiene algun representante ya creado
            String sqlqueryRep = "SELECT nombreusuario FROM \"dycicle\".representante WHERE"
                    + " nombreusuario='" + p.getNombreUsuario() + "';";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlqueryRep);

            String sqlqueryRepresentante;
            if (rs.next()) {
                sqlqueryRepresentante = "UPDATE \"dycicle\".Representante SET "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "',"
                        + "pNombre = '" + p.getNombreRep1() + "', "
                        + "sNombre = '" + p.getNombreRep2() + "', "
                        + "pApellido = '" + p.getApellidoRep1() + "', "
                        + "sApellido = '" + p.getApellidoRep2() + "', "
                        + "TelefonoCel= '" + p.getCelRep() + "', "
                        + "TelefonoHab= '" + p.getTlfRepCasa() + "', "
                        + "EmailRep= '" + p.getEmailRep() + "', "
                        + "TipoRelacion= '" + p.getRelacion() + "', "
                        + "Direccion = '" + p.getDireccionRep() + "';";
            } else {

                // Datos del representante
                sqlqueryRepresentante = "INSERT INTO \"dycicle\".Representante VALUES ("
                        + "'" + p.getNombreUsuario() + "', "
                        + "'" + p.getNombreRep1() + "', "
                        + "'" + p.getNombreRep2() + "', "
                        + "'" + p.getApellidoRep1() + "', "
                        + "'" + p.getApellidoRep2() + "', "
                        + "'" + p.getCelRep() + "', "
                        + "'" + p.getTlfRepCasa() + "', "
                        + "'" + p.getEmailRep() + "', "
                        + "'" + p.getRelacion() + "', "
                        + "'" + p.getDireccionRep() + "');";
            }

            //Antecedentes Academicos
            String sqlqueryAntecedente = "UPDATE \"dycicle\".AntecedenteAcademico SET "
                    + "Indice = '" + p.getIndice() + "', "
                    + "IndicePonderado = '" + p.getIndicePon() + "', "
                    + "Decanato = '" + p.getDecanato() + "', "
                    + "AreaDeEstudio = '" + p.getAreaEstud() + "', "
                    + "Carrera = '" + p.getCarrera() + "', "
                    + "Opcion = '" + p.getOpcion() + "', "
                    + "CredAprob= '" + p.getCreditosApro() + "';";

            // Opciones de uni de intercambios
            String sqlqueryUni1 = "INSERT INTO \"dycicle\".Universidades VALUES ("
                    + "'" + p.getNombreUsuario() + "', "
                    + "'1', "                           //Prioridad 
                    + "'" + p.getNombreOpcion1() + "', "
                    + "'" + p.getPaisOpcion1() + "', "
                    + "'" + p.getProgramaOpcion1() + "', "
                    + "'" + p.getNombreProgramaOpcion1() + "', "
                    + "'" + p.getMesFechaIni1() + "', "
                    + "'" + p.getAnoFechaIni1() + "', "
                    + "'" + p.getMesFechaFin1() + "', "
                    + "'" + p.getAnoFechaFin1() + "', "
                    + "'" + p.getDuracionProgramaOpcion1() + "');";

            String sqlqueryUni2 = "INSERT INTO \"dycicle\".Universidades VALUES ("
                    + "'" + p.getNombreUsuario() + "', "
                    + "'2', "                           //Prioridad
                    + "'" + p.getNombreOpcion2() + "', "
                    + "'" + p.getPaisOpcion2() + "', "
                    + "'" + p.getProgramaOpcion2() + "', "
                    + "'" + p.getNombreProgramaOpcion2() + "', "
                    + "'" + p.getMesFechaIni2() + "', "
                    + "'" + p.getAnoFechaIni2() + "', "
                    + "'" + p.getMesFechaFin2() + "', "
                    + "'" + p.getAnoFechaFin2() + "', "
                    + "'" + p.getDuracionProgramaOpcion2() + "');";


            String sqlqueryFinanciamiento = "INSERT INTO \"dycicle\".Financiamiento VALUES ("
                    + "'" + p.getNombreUsuario() + "', "
                    + "'" + p.getFuenteFinanciamiento() + "', "
                    + "'" + p.getDescripcion1() + "', "
                    + "'" + p.getAyudaEc() + "', "
                    + "'" + p.getDescripcion2() + "');";

            stmt = conexion.createStatement();


            Integer i = stmt.executeUpdate(sqlqueryEstudiante);
            Integer j = stmt.executeUpdate(sqlqueryEstudianteUSB);
            Integer k = stmt.executeUpdate(sqlqueryRepresentante);
            Integer l = stmt.executeUpdate(sqlqueryAntecedente);
            Integer m = stmt.executeUpdate(sqlqueryUni1);
            Integer n = stmt.executeUpdate(sqlqueryUni2);
            Integer o = stmt.executeUpdate(sqlqueryFinanciamiento);

            return ((i > 0) && (j > 0) && (k > 0) && (l > 0) && (m > 0) && (n > 0) && (o > 0));

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Boolean agregarPlanillaExt(PlanillaExt p) {
        try {

            String sqlqueryEstudiante = "UPDATE \"dycicle\".estudiante SET "
                    + "PrimerNombre = '" + p.getNombre1() + "', "
                    + "SegundoNombre = '" + p.getNombre2() + "', "
                    + "PrimerApellido = '" + p.getApellido1() + "',"
                    + "SegundoApellido = '" + p.getApellido2() + "',"
                    + "Sexo = '" + p.getSexo() + "', "
                    + "Calle = '" + p.getCalle() + "', "
                    + "Edificio = '" + p.getEdificio() + "', "
                    + "Apartamento = '" + p.getApartamento() + "', "
                    + "Ciudad = '" + p.getCiudad() + "', "
                    + "Estado = '" + p.getEstado() + "', "
                    + "CodPostal = '" + p.getCodPostal() + "', "
                    + "TelefonoCel = '" + p.getTelefonoCelular() + "', "
                    + "TelefonoCasa = '" + p.getTelefonoCasa() + "', "
                    + "FechaNac = '" + p.getFechaNacimiento() + "', "
                    + "Nacionalidad = '" + p.getNacionalidad() + "';";
            //$$$$$$$$$$$$$$$$$
            // Falta la foto!!
            //$$$$$$$$$$$$$$$$$


            String sqlqueryEstudianteExt = "UPDATE \"dycicle\".estudianteInternacional SET "
                    + "Pasaporte = '" + p.getPasaporte() + "',"
                    //+ "LenguaMaterna = '" + p.getLenguaMaterna() + "',"
                    + "PaisOrigen = '" + p.getPaisOrigen() + "',"
                    + "UniOrigen = '" + p.getNombreUniOrigen() + "';";

            // Datos del representante
            String sqlqueryRepresentante = "INSERT INTO \"dycicle\".Representante VALUES ("
                    + "'" + p.getNombreUsuario() + "', "
                    + "'" + p.getNombreRep1() + "', "
                    + "'" + p.getNombreRep2() + "', "
                    + "'" + p.getApellidoRep1() + "', "
                    + "'" + p.getApellidoRep2() + "', "
                    + "'" + p.getCelRep() + "', "
                    + "'" + p.getTlfRepCasa() + "', "
                    + "'" + p.getEmailRep() + "', "
                    + "'" + p.getRelacion() + "', "
                    + "'" + p.getDireccionRep() + "');";

            //Antecedentes Academicos
            String sqlqueryAntecedente = "UPDATE \"dycicle\".AntecedenteAcademico SET "
                    + "AreaDeEstudio = '" + p.getAreaEstud() + "', "
                    + "Carrera = '" + p.getCarrera() + "', "
                    + "AnioIngreso = '" + p.getAnioIngreso() + "', "
                    + "AniosAprob= '" + p.getAniosAprobados() + "', "
                    + "CoordMovilidad='" + p.getNombreCoordMovilidad() + "', "
                    + "CoordAcademico='" + p.getNombreCoordAcademico() + "';";

            // Opciones de uni de intercambios
            String sqlqueryUni1 = "INSERT INTO \"dycicle\".Universidades VALUES ("
                    + "'" + p.getNombreUsuario() + "', "
                    + "'1', "                           //Prioridad
                    + "'Universidad Simon Bolivar', "
                    + "'Venezuela', "
                    + "'" + p.getPrograma() + "', "
                    + "'" + p.getNombrePrograma() + "', "
                    + "'null', 'null', 'null', 'null', "
                    + "'" + p.getDuracionPrograma() + "');";


            Statement stmt = conexion.createStatement();


            Integer i = stmt.executeUpdate(sqlqueryEstudiante);
            Integer j = stmt.executeUpdate(sqlqueryEstudianteExt);
            Integer k = stmt.executeUpdate(sqlqueryRepresentante);
            Integer l = stmt.executeUpdate(sqlqueryAntecedente);
            Integer m = stmt.executeUpdate(sqlqueryUni1);

            return ((i > 0) && (j > 0) && (k > 0) && (l > 0) && (m > 0));

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    
    /*NetBeans me dice que no es usado*/
    private ArrayList<Idiomas> obtenerIdiomas(Usuario u) {

        ArrayList<Idiomas> idims = new ArrayList<Idiomas>();

        try {
            String sqlquery = "SELECT * FROM \"dycicle\".idiomas "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Idiomas t = new Idiomas();
                t.setIdiomaDest(rs.getString("nombreidioma"));
                t.setNivelVerbal(rs.getString("nivelverbal"));
                t.setNivelEscrito(rs.getString("nivelescrito"));
                t.setNivelConversacional(rs.getString("niveleconversacional"));

                idims.add(t);
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return idims;

    }

    
    /*NetBeans me dice que no es usado*/
    private ArrayList<Materias> obtenerMaterias(Usuario u) {

        ArrayList<Materias> matems = new ArrayList<Materias>();

        try {
            String sqlquery = "SELECT * FROM \"dycicle\".planestudio "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Materias t = new Materias();
                t.setDenominacionUSB(rs.getString("materiausb"));
                t.setCodigoUSB(rs.getString("codigousb"));
                t.setCreditosUSB(rs.getString("creditousb"));
                t.setDenominacionExt(rs.getString("materiauniv"));
                t.setCodigoExt(rs.getString("codigouniv"));
                t.setCreditosExt(rs.getString("creditouniv"));

                matems.add(t);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return matems;

    }

    public PlanillaUSB obtenerPlanillaUSB(Usuario u) {

        PlanillaUSB datos = new PlanillaUSB();

        try {

            String sqlquery = "SELECT * FROM \"dycicle\".estudiante NATURAL JOIN "
                    + "\"dycicle\".estudianteusb NATURAL JOIN "
                    + " \"dycicle\".AntecedenteAcademico NATURAL JOIN "
                    + "\"dycicle\".Financiamiento "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            
            sqlquery = "SELECT * FROM \"dycicle\".representante "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";
            
            stmt = conexion.createStatement();
            ResultSet rs2 = stmt.executeQuery(sqlquery);
            rs2.next(); //Informacion del representante
            
            sqlquery = "SELECT * FROM \"dycicle\".universidades "
                    + "WHERE nombreusuario = '" + u.getNombreusuario() + "' "
                    + "ORDER BY prioridad;";
            
            stmt = conexion.createStatement();
            ResultSet rs3 = stmt.executeQuery(sqlquery);
            rs3.next(); //Informacion de la primera opcion de universidad

            boolean primeraUni = rs.next();
            datos.setNombreUsuario(rs.getString("NombreUsuario"));
            datos.setApellido1(rs.getString("PrimerApellido"));
            datos.setApellido2(rs.getString("SegundoApellido"));
            datos.setNombre1(rs.getString("PrimerNombre"));
            datos.setNombre2(rs.getString("SegundoNombre"));
            datos.setCedula(rs.getString("Cedula"));
            datos.setCarnet(rs.getString("Carnet"));
            datos.setSexo(rs.getString("Sexo"));
            datos.setUrbanizacion(rs.getString("Urbanizacion"));
            datos.setCalle(rs.getString("Calle"));
            datos.setEdificio(rs.getString("Edificio"));
            datos.setApartamento(rs.getString("Apartamento"));
            datos.setCiudad(rs.getString("Ciudad"));
            datos.setEstado(rs.getString("Estado"));
            datos.setCodPostal(rs.getString("CodPostal"));
            datos.setTelefonoCasa(rs.getString("TelefonoCasa"));
            datos.setTelefonoCelular(rs.getString("TelefonoCel"));
            datos.setFax(rs.getString("Fax"));
            datos.setEmail(rs.getString("Email"));
            datos.setFechaNacimiento(rs.getString("FechaNac"));
            datos.setNacionalidad(rs.getString("Nacionalidad"));
            datos.setApellidoRep1(rs2.getString("pApellido"));
            datos.setApellidoRep2(rs2.getString("sApellido"));
            datos.setNombreRep1(rs2.getString("pNombre"));
            datos.setNombreRep2(rs2.getString("sNombre"));
            datos.setCelRep(rs2.getString("TelefonoCel"));
            datos.setTlfRepCasa(rs2.getString("TelefonoHab"));
            datos.setEmailRep(rs2.getString("EmailRep"));
            datos.setRelacion(rs2.getString("TipoRelacion"));
            datos.setDireccionRep(rs2.getString("Direccion"));
            datos.setIndice(rs.getString("Indice"));
            datos.setIndicePon(rs.getString("IndicePonderado"));
            datos.setDecanato(rs.getString("Decanato"));
            datos.setAreaEstud(rs.getString("AreaDeEstudio"));
            datos.setCarrera(rs.getString("Carrera"));
            datos.setCodCarrera(rs.getString("CodCarrera"));
            datos.setOpcion(rs.getString("Opcion"));
            datos.setCreditosApro(rs.getInt("CredAprob"));
            datos.setFuenteFinanciamiento(rs.getString("PpalFuente"));
            datos.setAyudaEc(rs.getString("TieneBecaDe"));
            datos.setDescripcion1(rs.getString("DescrFuente"));
            datos.setDescripcion2(rs.getString("DescrBeca"));
            datos.setProgramaOpcion1(rs3.getString("TipoPrograma"));
            datos.setNombreProgramaOpcion1(rs3.getString("NombrePrograma"));
            datos.setDuracionProgramaOpcion1(rs3.getString("Duracion"));
            datos.setPaisOpcion1(rs3.getString("Pais"));
            datos.setNombreOpcion1(rs3.getString("NombreUni"));
            datos.setMesFechaIni1(rs3.getString("MesFechaIni"));
            datos.setAnoFechaIni1(rs3.getString("AnioFechaIni"));
            datos.setMesFechaFin1(rs3.getString("MesFechaFin"));
            datos.setAnoFechaFin1(rs3.getString("AnioFechaFin"));

            boolean segundaUni = rs3.next();
            datos.setProgramaOpcion2(rs3.getString("TipoPrograma"));
            datos.setNombreProgramaOpcion2(rs3.getString("NombrePrograma"));
            datos.setDuracionProgramaOpcion2(rs3.getString("Duracion"));
            datos.setPaisOpcion2(rs3.getString("Pais"));
            datos.setNombreOpcion2(rs3.getString("NombreUni"));
            datos.setMesFechaIni2(rs3.getString("MesFechaIni"));
            datos.setAnoFechaIni2(rs3.getString("AnioFechaIni"));
            datos.setMesFechaFin2(rs3.getString("MesFechaFin"));
            datos.setAnoFechaFin2(rs3.getString("AnioFechaFin"));


        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return datos;
    }

    public PlanillaExt obtenerPlanillaExt(Usuario u) {

        PlanillaExt datos = new PlanillaExt();

        try {

            String sqlquery = "SELECT * FROM \"dycicle\".estudiante NATURAL JOIN "
                    + "\"dycicle\".estudianteinternacional NATURAL JOIN "
                    + "\"dycicle\".Universidades "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            sqlquery = "SELECT * FROM \"dycicle\".representante "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";
            
            stmt = conexion.createStatement();
            ResultSet rs2 = stmt.executeQuery(sqlquery);
            rs2.next();
            
            sqlquery = "SELECT * FROM \"dycicle\".antecedenteacademico "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";
            
            stmt = conexion.createStatement();
            ResultSet rs3 = stmt.executeQuery(sqlquery);
            rs3.next();
            
            boolean primeraUni = rs.next();

            datos.setNombreUsuario(rs.getString("NombreUsuario"));
            datos.setApellido1(rs.getString("PrimerApellido"));
            datos.setApellido2(rs.getString("SegundoApellido"));
            datos.setNombre1(rs.getString("PrimerNombre"));
            datos.setNombre2(rs.getString("SegundoNombre"));
            datos.setSexo(rs.getString("Sexo"));
            datos.setPasaporte(rs.getString("Pasaporte"));
            datos.setCalle(rs.getString("Calle"));
            datos.setEdificio(rs.getString("Edificio"));
            datos.setApartamento(rs.getString("Apartamento"));
            datos.setCiudad(rs.getString("Ciudad"));
            datos.setEstado(rs.getString("Estado"));
            datos.setCodPostal(rs.getString("CodPostal"));
            datos.setTelefonoCasa(rs.getString("TelefonoCasa"));
            datos.setTelefonoCelular(rs.getString("TelefonoCel"));
            datos.setEmail(rs.getString("Email"));
            datos.setFechaNacimiento(rs.getString("FechaNac"));
            datos.setNacionalidad(rs.getString("Nacionalidad"));
            datos.setApellidoRep1(rs2.getString("pApellido"));
            datos.setApellidoRep2(rs2.getString("sApellido"));
            datos.setNombreRep1(rs2.getString("pNombre"));
            datos.setNombreRep2(rs2.getString("sNombre"));
            datos.setCelRep(rs2.getString("TelefonoCel"));
            datos.setTlfRepCasa(rs2.getString("TelefonoHab"));
            datos.setEmailRep(rs2.getString("EmailRep"));
            datos.setRelacion(rs2.getString("TipoRelacion"));
            datos.setDireccionRep(rs2.getString("Direccion"));
            datos.setAreaEstud(rs3.getString("AreaDeEstudio"));
            datos.setCarrera(rs3.getString("Carrera"));
            datos.setAnioIngreso(rs3.getInt("AnioIngreso"));
            datos.setAniosAprobados(rs3.getInt("AniosAprob"));
            datos.setPrograma(rs.getString("TipoPrograma"));
            datos.setNombrePrograma(rs.getString("NombrePrograma"));
            datos.setDuracionPrograma(rs.getString("Duracion"));
            datos.setPaisOrigen(rs.getString("PaisOrigen"));
            datos.setNombreCoordAcademico(rs3.getString("CoordAcademico"));
            datos.setNombreCoordMovilidad(rs3.getString("CoordMovilidad"));
            datos.setNombreUniOrigen(rs.getString("UniOrigen"));

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return datos;
    }

    public Boolean modificarPlanillaUSB(PlanillaUSB p) {

        try {
            String sqlquery = "UPDATE \"dycicle\".planillaUSB SET"
                    + " nombreusuario='" + p.getNombreUsuario() // Nombre de usuario.
                    // Datos personales
                    + "', periodo='" + p.getPeriodo()
                    + "', cedula='" + p.getCedula()
                    + "', carnet='" + p.getCarnet()
                    + "', nombre1='" + p.getNombre1()
                    + "', nombre2='" + p.getNombre2()
                    + "', apellido1='" + p.getApellido1()
                    + "', apellido2='" + p.getApellido2()
                    + "', sexo='" + p.getSexo()
                    + "', calle='" + p.getCalle()
                    + "', ciudad='" + p.getCiudad()
                    + "', estado='" + p.getEstado()
                    + "', codpostal='" + p.getCodPostal()
                    + "', telefonocel='" + p.getTelefonoCelular()
                    + "', telefonocasa='" + p.getTelefonoCasa()
                    + "', fax='" + p.getFax()
                    + "', email='" + p.getEmail()
                    + "', fechanac='" + p.getFechaNacimiento() //Fecha nacimiento
                    + "', nacionalidad='" + p.getNacionalidad()
                    //$$$$$$$$$$$$$$$$$
                    // Falta la foto!!
                    //$$$$$$$$$$$$$$$$$
                    // Datos del representante
                    + "', telefono='" + p.getCelRep()
                    + "', emailrep='" + p.getEmailRep()
                    + "', tiporelacion='" + p.getRelacion()
                    + "', direccion='" + p.getDireccionRep()
                    //Antecedentes Academicos
                    + "', indice='" + p.getIndice()
                    + "', carrera='" + p.getCarrera()
                    + "', opcion='" + p.getNombreOpcion2()
                    + "', credaprob='" + p.getCreditosApro()
                    // Plan de estudio"
                    + "', universidad1='" + p.getNombreOpcion1()
                    + "', universidad2='" + p.getNombreOpcion2()
                    + "', idioma='" + p.getIdiomaDest()
                    + "', nivelverbal='" + p.getNivelVerbal()
                    + "', nivelescrito='" + p.getNivelEscrito()
                    + "', nombreprog1='" + p.getNombreProg1()
                    // Financiamiento
                    + "', financiamiento='" + p.getFuenteFinanciamiento()
                    + "', descripcion1='" + p.getDescripcion1()
                    + "'  WHERE nombreusuario='" + p.getNombreUsuario()
                    + "' AND periodo='" + p.getPeriodo() + "'";

            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);

            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Anuncio> consultarAnuncios(){
        
        ArrayList<Anuncio> anuncios = new ArrayList<Anuncio>();
        
        try{
            String sqlquery = "SELECT nombre,fecha FROM \"dycicle\".noticias "
                    + "ORDER BY fecha ;";
            
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            Anuncio a = new Anuncio();
           
            while (rs.next()){
                a.setTitulo(rs.getString("nombre"));
                a.setFecha(rs.getString("fecha"));
                
                anuncios.add(a);
            }
        
        } catch (SQLException ex){
            ex.printStackTrace();
        }
        
        return anuncios;
    }

    public int obtenerNumeroPlanilla() {

        try {
            String sqlquery = "SELECT * FROM \"dycicle\".nroPlanillaUSB";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                int numero = rs.getInt("privilegio");
                numero++;
                sqlquery = "UPDATE \"dycicle\".nroPlanillaUSB SET nro='" + numero + "'";
                stmt = conexion.createStatement();
                Integer i = stmt.executeUpdate(sqlquery);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return 1;
    }

    public String[] existeEmail(String email) {

        String[] info = new String[3];
        PreparedStatement ps = null;

        try {
            ps = conexion.prepareStatement("SELECT nombreusuario, contrasena, email "
                    + "FROM \"dycicle\".usuario WHERE email = ?");
            ps.setString(1, email);
            /*String sqlquery = "SELECT nombreusuario, contrasena, email "
                    + "FROM \"dycicle\".usuario"
                    + " WHERE email = '" + email + "'";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);*/
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                for (int i = 0; i < 1; i++) {

                    info[0] = rs.getString("nombreusuario");
                    info[1] = rs.getString("contrasena");
                    info[2] = rs.getString("email");

                }

            } else {
                return null;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return info;

    }

    public String[] existeUsuario(String usuario) {

        String[] info = new String[3];
        PreparedStatement ps = null;

        try {
            ps = conexion.prepareStatement("SELECT nombreusuario, contrasena, email "
                    + "FROM \"dycicle\".usuario WHERE nombreusuario = ?");
            ps.setString(1, usuario);
            /*String sqlquery = "SELECT nombreusuario, contrasena, email "
                    + "FROM \"dycicle\".usuario"
                    + " WHERE nombreusuario = '" + usuario + "'";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);*/
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                for (int i = 0; i < 1; i++) {

                    info[0] = rs.getString("nombreusuario");
                    info[1] = rs.getString("contrasena");
                    info[2] = rs.getString("email");
                }

            } else {
                return null;
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return info;

    }

    public String[] getInfoPostulante(String usuario) {

        String info[] = new String[4];
    PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT Tipo, Codigo, NombreUniExt, NombreCarrera "
                    + "FROM \"dycicle\".postulante WHERE nombreusuario = ?");
            ps.setString(1, usuario);
            /*String sqlquery = "SELECT Tipo, Codigo, NombreUniExt, NombreCarrera "
                    + "FROM \"dycicle\".postulante"
                    + " WHERE nombreusuario = '" + usuario + "'";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);*/
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                for (int i = 0; i < 1; i++) {

                    info[0] = rs.getString("tipo");
                    info[1] = rs.getString("codigo");
                    info[2] = rs.getString("nombreuniext");
                    info[3] = rs.getString("nombrecarrera");
                }

            } else {
                return null;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return info;
    }

    public EstudianteUSB obtenerDatosUSB(Usuario u) {

        EstudianteUSB datos = new EstudianteUSB();
        PreparedStatement ps = null;

        try {
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".estudianteusb"
                    + " WHERE nombreusuario =?");
            ps.setString(1, u.getNombreusuario());
            /*String sqlquery = "SELECT * FROM \"dycicle\".estudianteusb"
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "'";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);*/
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                datos.setNombreusuario(rs.getString("nombreusuario"));
                datos.setCarnet(rs.getString("carnet"));
                datos.setCedula(rs.getString("cedula"));

            }

            return datos;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean InsertarPath(String path, Usuario user) {
        try {

            EstudianteUSB usuario = obtenerDatosUSB(user);
            
            PreparedStatement ps = null;
            ps = conexion.prepareStatement("INSERT INTO \"dycicle\".archivosestudiante"
                    +"VALUES(?,?,?,'la','2');");
            ps.setString(1, user.getNombreusuario());
            ps.setString(2, usuario.getNombre());
            ps.setString(3, path);

            String sqlquery = "INSERT INTO \"dycicle\".archivosestudiante VALUES("
                    + "'" + user.getNombreusuario() + "','" + usuario.getNombre()
                    + "','" + path
                    + "','la','2');";

            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;

    }

    public boolean InsertarIdioma(Idiomas idioma) {


        try {

            String sqlquery = "SELECT nombreusuario FROM \"dycicle\".estudianteInternacional WHERE"
                    + " nombreusuario='" + idioma.getNombreusuario() + "';";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            if (rs.next()) {
                sqlquery = "UPDATE \"dycicle\".estudianteInternacional SET "
                        + "LenguaMaterna = '" + idioma.getLenguaMaterna() + "',"
                        + "CursoEspaniol = '" + idioma.getTomarCursoDeEspaniol() + "';";
                stmt = conexion.createStatement();
                Integer i = stmt.executeUpdate(sqlquery);
            }

            ArrayList escri = idioma.getListEscrito();
            ArrayList ver = idioma.getListVerbal();
            ArrayList idio = idioma.getListIdioma();
            ArrayList conver = idioma.getListConversacional();
            for (int i = 0; i < idio.size(); i++) {
                sqlquery = "INSERT INTO \"dycicle\".idiomas VALUES("
                        + "'" + idioma.getNombreusuario() + "','" + idio.get(i) + "','"
                        + ver.get(i) + "','" + escri.get(i) + "','" + conver.get(i) + "');";
                stmt = conexion.createStatement();
                Integer j = stmt.executeUpdate(sqlquery);
            }
            return true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;

    }

    /**
     * Este metodo es para insertar el plan de estudio de los estudiantes
     * USBistas que estan aplicando
     */
    public boolean InsertarPlan(PlanDeEstudio plan) {
        PreparedStatement ps = null;
        try {
            
            
            ArrayList codusb = plan.getListCodigoUSB();
            ArrayList coduniv = plan.getListCodigoUniv();
            ArrayList creusb = plan.getListCreditoUSB();
            ArrayList creuniv = plan.getListCreditoUniv();
            ArrayList nomusb = plan.getListMateriaUSB();
            ArrayList nomuniv = plan.getListMateriaUniv();
            String nombre = plan.getNombreUsuario();
            for (int i = 0; i < codusb.size(); i++) {
                ps = conexion.prepareStatement("INSERT INTO \"dycicle\".planestudio"+
                    "VALUES(?,?,?,?,?,?,?);");
                ps.setString(1, nombre);
                ps.setString(2, (String)codusb.get(i));
                ps.setString(3, (String)nomusb.get(i));
                ps.setInt(4, (Integer)creusb.get(i));
                ps.setString(5, (String)coduniv.get(i));
                ps.setString(6, (String)nomuniv.get(i));
                ps.setInt(7, (Integer)creuniv.get(i));
                /*String sqlquery = "INSERT INTO \"dycicle\".planestudio VALUES("
                        + "'" + nombre
                        + "','" + codusb.get(i)
                        + "','" + nomusb.get(i)
                        + "','" + creusb.get(i)
                        + "','" + coduniv.get(i)
                        + "','" + nomuniv.get(i)
                        + "','" + creuniv.get(i)
                        + "');";
                Statement stmt = conexion.createStatement();
                Integer j = stmt.executeUpdate(sqlquery);*/
                Integer j = ps.executeUpdate();

            }
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;

    }

    /* Esta funcion es para insertar el plan de estudio de los estudiantes extranjeros*/
    public boolean InsertarPlan(PlanExtranjero plan) {

        try {
            PreparedStatement ps = null;
            ArrayList codusb = plan.getListCodigoUSB();
            ArrayList creusb = plan.getListCreditoUSB();
            ArrayList nomusb = plan.getListMateriaUSB();
            String nombre = plan.getNombreUsuario();
            for (int i = 0; i < codusb.size(); i++) {
                ps = conexion.prepareStatement("INSERT INTO \"dycicle\".planestudio"+
                        "VALUES(?,?,?,?,'1', '1', '1');");
                ps.setString(1, nombre);
                ps.setString(2, (String)codusb.get(i));
                ps.setString(3, (String)nomusb.get(i));
                ps.setInt(4, (Integer)creusb.get(i));
                /*String sqlquery = "INSERT INTO \"dycicle\".planestudio VALUES("
                        + "'" + nombre
                        + "','" + codusb.get(i)
                        + "','" + nomusb.get(i)
                        + "','" + creusb.get(i)
                        + "','1', '1', '1');";
                Statement stmt = conexion.createStatement();
                Integer j = stmt.executeUpdate(sqlquery);*/
                Integer j = ps.executeUpdate();

            }

            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Usuario> listarBusquedaAvanzada(Busqueda busqueda) {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        String sqlqueryu="";
        String query2 = "";
        boolean iniciado = false;

        if (!busqueda.getNombre().equalsIgnoreCase("")) {
            query2 += "PrimerNombre='" + busqueda.getNombre() + "'";
            iniciado = true;


        }

        if (!busqueda.getApellido().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "PrimerApellido='" + busqueda.getApellido() + "'";
            iniciado = true;

        }


        if (!busqueda.getCarnet().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "Carnet='" + busqueda.getCarnet() + "'";
            iniciado = true;

        }

        if (!busqueda.getIndice().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "Indice " + busqueda.getIndice();
            iniciado = true;
        }


        if (!busqueda.getIndicePonderado().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "IndicePonderado " + busqueda.getIndicePonderado();
            iniciado = true;
        }

        if (!busqueda.getCarrera().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "Carrera='" + busqueda.getCarrera() + "'";
            iniciado = true;
        }
        
        if (!busqueda.getOpcion1().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            sqlqueryu+= "NATURAL JOIN \"dycicle\".universidades ";
            query2 += "NombreUni='" + busqueda.getOpcion1() + "'";
            iniciado = true;
        }

        if (!busqueda.getOpcion2().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            sqlqueryu+= "NATURAL JOIN \"dycicle\".universidades ";
            query2 += "NombreUni='" + busqueda.getOpcion2() + "'";
            iniciado = true;
        }
        
        if (iniciado) {
            try {
                        String sqlquery = "SELECT * FROM \"dycicle\".estudiante NATURAL JOIN "
                        + "\"dycicle\".postulacion NATURAL JOIN "
                        + "\"dycicle\".estudianteusb NATURAL JOIN "
                        + "\"dycicle\".antecedenteacademico ";

                        sqlquery+=sqlqueryu;
                        sqlquery += "WHERE " + query2;

                        sqlquery += ";";
                        Statement stmt = conexion.createStatement();
                        ResultSet rs = stmt.executeQuery(sqlquery);

                        while (rs.next()) {
                            Usuario u = new Usuario();
                            u.setNombreusuario(rs.getString("nombreusuario"));
                            u.setEmail(rs.getString("email"));
                            u.setConfirmar(rs.getString("estadopostulacion"));
                            usrs.add(u);
                        };
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
               return usrs;
            }

        try {
            String sqlquery = "SELECT * FROM \"dycicle\".estudiante NATURAL JOIN"
                    + " \"dycicle\".postulacion";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setNombreusuario(rs.getString("nombreusuario"));
                u.setEmail(rs.getString("email"));
                u.setConfirmar(rs.getString("estadopostulacion"));
                usrs.add(u);
            };

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;



    }

    public String getPrivilegioUsuario(String nombreUsuario) {
        String result = null;
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT privilegio FROM \"dycicle\".usuario WHERE"
                    + " nombreusuario=?;");
            ps.setString(1, nombreUsuario);
            /*String sqlQuery = "SELECT privilegio FROM \"dycicle\".usuario WHERE"
                    + " nombreusuario='" + nombreUsuario + "';";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlQuery);*/
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getString("privilegio");
            }
        } catch (SQLException ex) {
        }
        return result;
    }

    public boolean Comentar(Usuario u) {
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("UPDATE \"dycicle\".estudiante SET"
                    +"comentario= ? WHERE nombreusuario = ?");
            ps.setString(1, u.getConfirmar());
            ps.setString(2, u.getNombreusuario());
            /*String sqlquery = "UPDATE \"dycicle\".estudiante SET comentario='" + u.getConfirmar()
                    + "' WHERE nombreusuario = '"
                    + u.getNombreusuario() + "'";
            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);*/
            Integer i = ps.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
        }
        return true;
    }
}
