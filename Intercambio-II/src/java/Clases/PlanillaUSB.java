/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import com.itextpdf.text.List;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author caponte
 */
public class PlanillaUSB extends org.apache.struts.action.ActionForm {

    // Seccion De Datos Personales
    private String estadoSolicitud;
    private String nombreUsuario;   //nombreUsuario db
    private String periodo;
    private String apellidos;       //apellidos db
    private String nombres;         //nombres db
    private String sexo;            //sexo db
    private String calle;           //db
    private String ciudad;          //db
    private String estado;          //db
    private String codPostal;       //db
    private String telefonoCelular; //db
    private String telefonoCasa;    //db
    private String fax;             //db
    private String email;           //db
    private String fechaNacimiento; //db
    private String nacionalidad;    //db
    private String cedula;          //db estudianteUSB
    private String carnet;          //db estudianteUSB
    private String pasaporte;       //db estudianteUSB
    //Queda pendiente la foto
    //Representantes
    private String apellidoNombresRep;  //db
    private String tlfRep;              //db
    private String emailRep;            //db
    private String relacion;            //db
    private String direccionRep;        //db
    //Programa de Intercambio (Plan estudio)
    private String fechaIni1;       //db
    private String fechaFin1;       //db
    private String nombreOpcion1;   //db
    private String fechaIni2;       //db
    private String fechaFin2;       //db
    private String nombreOpcion2;   //db
    private String idiomaDest;      //db
    private String nivelVerbal;     //db
    private String nivelEscrito;    //db
    private String nombreProg1;     //db
    private String nombreProg2;     //db
    //Informacion Academica 
    private String carrera;         //db
    private String indice;          //db
    private String opcion;          //db
    private int creditosApro;       //db
    private ArrayList<Materias> lista;
    //Area Coordinacion (Postulacion)
    private String fechaSolicitud;          //db      
    private String recomendacion;           //db
    private String comentarioRecomendacion; //db

    // Financiamiento
    private String fuenteFinanciamiento;
    private String descripcion;
    
    public PlanillaUSB() {
        super();
    }

    public String getEstadoSolicitud() {
        return estadoSolicitud;
    }

    public void setEstadoSolicitud(String estadoSolicitud) {
        this.estadoSolicitud = estadoSolicitud;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCodPostal() {
        return codPostal;
    }

    public void setCodPostal(String codPostal) {
        this.codPostal = codPostal;
    }

    public String getTelefonoCelular() {
        return telefonoCelular;
    }

    public void setTelefonoCelular(String telefonoCelular) {
        this.telefonoCelular = telefonoCelular;
    }

    public String getTelefonoCasa() {
        return telefonoCasa;
    }

    public void setTelefonoCasa(String telefonoCasa) {
        this.telefonoCasa = telefonoCasa;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getCarnet() {
        return carnet;
    }

    public void setCarnet(String carnet) {
        this.carnet = carnet;
    }

    public String getPasaporte() {
        return pasaporte;
    }

    public void setPasaporte(String pasaporte) {
        this.pasaporte = pasaporte;
    }

    public String getApellidoNombresRep() {
        return apellidoNombresRep;
    }

    public void setApellidoNombresRep(String apellidoNombresRep) {
        this.apellidoNombresRep = apellidoNombresRep;
    }

    public String getTlfRep() {
        return tlfRep;
    }

    public void setTlfRep(String tlfRep) {
        this.tlfRep = tlfRep;
    }

    public String getEmailRep() {
        return emailRep;
    }

    public void setEmailRep(String emailRep) {
        this.emailRep = emailRep;
    }

    public String getRelacion() {
        return relacion;
    }

    public void setRelacion(String relacion) {
        this.relacion = relacion;
    }

    public String getDireccionRep() {
        return direccionRep;
    }

    public void setDireccionRep(String direccionRep) {
        this.direccionRep = direccionRep;
    }

    public String getFechaIni1() {
        return fechaIni1;
    }

    public void setFechaIni1(String fechaIni1) {
        this.fechaIni1 = fechaIni1;
    }

    public String getFechaFin1() {
        return fechaFin1;
    }

    public void setFechaFin1(String fechaFin1) {
        this.fechaFin1 = fechaFin1;
    }

    public String getNombreOpcion1() {
        return nombreOpcion1;
    }

    public void setNombreOpcion1(String nombreOpcion1) {
        this.nombreOpcion1 = nombreOpcion1;
    }

    public String getFechaIni2() {
        return fechaIni2;
    }

    public void setFechaIni2(String fechaIni2) {
        this.fechaIni2 = fechaIni2;
    }

    public String getFechaFin2() {
        return fechaFin2;
    }

    public void setFechaFin2(String fechaFin2) {
        this.fechaFin2 = fechaFin2;
    }

    public String getNombreOpcion2() {
        return nombreOpcion2;
    }

    public void setNombreOpcion2(String nombreOpcion2) {
        this.nombreOpcion2 = nombreOpcion2;
    }

    public String getIdiomaDest() {
        return idiomaDest;
    }

    public void setIdiomaDest(String idiomaDest) {
        this.idiomaDest = idiomaDest;
    }

    public String getNivelVerbal() {
        return nivelVerbal;
    }

    public void setNivelVerbal(String nivelVerbal) {
        this.nivelVerbal = nivelVerbal;
    }

    public String getNivelEscrito() {
        return nivelEscrito;
    }

    public void setNivelEscrito(String nivelEscrito) {
        this.nivelEscrito = nivelEscrito;
    }

    public String getNombreProg1() {
        return nombreProg1;
    }

    public void setNombreProg1(String nombreProg1) {
        this.nombreProg1 = nombreProg1;
    }

    public String getNombreProg2() {
        return nombreProg2;
    }

    public void setNombreProg2(String nombreProg2) {
        this.nombreProg2 = nombreProg2;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getIndice() {
        return indice;
    }

    public void setIndice(String indice) {
        this.indice = indice;
    }

    public String getOpcion() {
        return opcion;
    }

    public void setOpcion(String opcion) {
        this.opcion = opcion;
    }

    public int getCreditosApro() {
        return creditosApro;
    }

    public void setCreditosApro(int creditosApro) {
        this.creditosApro = creditosApro;
    }

    public ArrayList<Materias> getLista() {
        return lista;
    }

    public void setLista(ArrayList<Materias> lista) {
        this.lista = lista;
    }

    public String getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(String fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public String getRecomendacion() {
        return recomendacion;
    }

    public void setRecomendacion(String recomendacion) {
        this.recomendacion = recomendacion;
    }

    public String getComentarioRecomendacion() {
        return comentarioRecomendacion;
    }

    public void setComentarioRecomendacion(String comentarioRecomendacion) {
        this.comentarioRecomendacion = comentarioRecomendacion;
    }

    public Boolean verificarPlanilla(PlanillaUSB P) {


        return true;
    }
    
    public String getFuenteFinanciamiento() {
        return fuenteFinanciamiento;
    }

    public void setFuenteFinanciamiento(String fuenteFinanciamiento) {
        this.fuenteFinanciamiento = fuenteFinanciamiento;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }


    @Override
    public String toString() {
        return "PlanillaUSB{" + "nombreUsuario=" + nombreUsuario + ", periodo=" + periodo + ", apellidos=" + apellidos + ", nombres=" + nombres + ", sexo=" + sexo + ", calle=" + calle + ", ciudad=" + ciudad + ", estado=" + estado + ", CodPostal=" + codPostal + ", telefonoCelular=" + telefonoCelular + ", telefonoCasa=" + telefonoCasa + ", Fax=" + fax + ", email=" + email + ", fechaNacimiento=" + fechaNacimiento + ", nacionalidad=" + nacionalidad + ", cedula=" + cedula + ", carnet=" + carnet + ", pasaporte=" + pasaporte + ", apellidoNombresRep=" + apellidoNombresRep + ", tlfRep=" + tlfRep + ", emailRep=" + emailRep + ", relacion=" + relacion + ", direccionRep=" + direccionRep + ", fechaIni1=" + fechaIni1 + ", fechaFin1=" + fechaFin1 + ", nombreOpcion1=" + nombreOpcion1 + ", fechaIni2=" + fechaIni2 + ", fechaFin2=" + fechaFin2 + ", nombreOpcion2=" + nombreOpcion2 + ", Idiomadest=" + idiomaDest + ", nivelVerbal=" + nivelVerbal + ", nivelEscrito=" + nivelEscrito + ", nombreProg1=" + nombreProg1 + ", nombreProg2=" + nombreProg2 + ", carrera=" + carrera + ", indice=" + indice + ", opcion=" + opcion + ", creditosApro=" + creditosApro + ", lista=" + lista + ", fechaSolicitud=" + fechaSolicitud + ", recomendacion=" + recomendacion + ", comentarioRecomendacion=" + comentarioRecomendacion + '}';
    }
}
