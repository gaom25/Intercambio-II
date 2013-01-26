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
public class EstudianteUSB extends Usuario {
   
    private String apellidos;
    private String carrera;
    private int codigoCarrera;
    private String origen;
    private String cedula;
    private String carnet;
    private String pasaporte;

    public EstudianteUSB(){
        super();
    }

    @Override
    public String toString() {
        return "EstudianteUSB{" + "apellidos=" + apellidos + ", carrera=" + carrera + ", codigoCarrera=" + codigoCarrera + ", origen=" + origen + ", cedula=" + cedula + ", carnet=" + carnet + ", pasaporte=" + pasaporte + '}';
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

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public int getCodigoCarrera() {
        return codigoCarrera;
    }

    public void setCodigoCarrera(int codigoCarrera) {
        this.codigoCarrera = codigoCarrera;
    }
    
    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }
    
    
}
