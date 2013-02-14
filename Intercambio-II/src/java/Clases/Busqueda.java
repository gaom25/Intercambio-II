/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author brahyam
 */
public class Busqueda extends org.apache.struts.validator.ValidatorForm {
    
    private String indiceSimbolo;
    private String indice;
    private String carrera;
    private String destino;
    private String cohorte;
    
    public Busqueda(){
        super();
    }
    
    @Override
    public String toString() {
        return "Busqueda{ indice=" + indice + ", carrera=" + carrera + ", destino=" + destino + ", cohorte=" + cohorte + ",'}'";
    }

    /**
     * @return the indice
     */
    public String getIndice() {
        return indice;
    }

    /**
     * @param indice the indice to set
     */
    public void setIndice(String indice) {
        this.indice = indice;
    }

    /**
     * @return the carrera
     */
    public String getCarrera() {
        return carrera;
    }

    /**
     * @param carrera the carrera to set
     */
    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    /**
     * @return the destino
     */
    public String getDestino() {
        return destino;
    }

    /**
     * @param destino the destino to set
     */
    public void setDestino(String destino) {
        this.destino = destino;
    }

    /**
     * @return the cohorte
     */
    public String getCohorte() {
        return cohorte;
    }

    /**
     * @param cohorte the cohorte to set
     */
    public void setCohorte(String cohorte) {
        this.cohorte = cohorte;
    }

    /**
     * @return the indiceSimbolo
     */
    public String getIndiceSimbolo() {
        return indiceSimbolo;
    }

    /**
     * @param indiceSimbolo the indiceSimbolo to set
     */
    public void setIndiceSimbolo(String indiceSimbolo) {
        this.indiceSimbolo = indiceSimbolo;
    }
    
}