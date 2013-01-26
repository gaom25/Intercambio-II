/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Date;

/**
 *
 * @author karen
 */
public class Estudiante extends org.apache.struts.validator.ValidatorForm {

    private String nombreUsuario;
    private String apellidoP;
    private String apellidoM;
    private String nombre1;
    private String nombre2;
    private String sexo;
    private String calle;
    private String ciudad;
    private String estado;
    private String cp;
    private String telefonoCelular;
    private String telefonoCasa;
    private String telefonoFax;
    private String email;
    private Date   fechaNacimiento;
    private String nacionalidad;
    private String apellidoNombresRep;
    private String relacion;
    private String direccionRep;
    private String tlfRep;
    private String emailRep;

    // falta la foto y no se como colocarla.
    public Estudiante() {
        super();
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getApellidoP() {
        return apellidoP;
    }

    public void setApellidoP(String apellidoP) {
        this.apellidoP = apellidoP;
    }

    public String getApellidoM() {
        return apellidoM;
    }

    public void setApellidoM(String apellidoM) {
        this.apellidoM = apellidoM;
    }

    public String getNombre1() {
        return nombre1;
    }

    public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
    }

    public String getNombre2() {
        return nombre2;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
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

    public String getCp() {
        return cp;
    }

    public void setCp(String cp) {
        this.cp = cp;
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

    public String getTelefonoFax() {
        return telefonoFax;
    }

    public void setTelefonoFax(String telefonoFax) {
        this.telefonoFax = telefonoFax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }


    public String getApellidoNombresRep() {
        return apellidoNombresRep;
    }

    public void setApellidoNombresRep(String apellidoNombresRep) {
        this.apellidoNombresRep = apellidoNombresRep;
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

    public String getTlfRep() {
        return tlfRep;
    }

    public void setTlfRep(String tldRep) {
        this.tlfRep = tldRep;
    }

    public String getEmailRep() {
        return emailRep;
    }

    public void setEmailRep(String emailRep) {
        this.emailRep = emailRep;
    }
}
