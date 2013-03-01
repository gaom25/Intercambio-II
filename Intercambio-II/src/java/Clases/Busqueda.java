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
    
    private String nombre;
    private String apellido;
    private String carnet;
    private String indice;
    private String indicePonderado;
    private String carrera;
    private String opcion1;
    private String opcion2;
    
    public Busqueda(){
        super();
    }
    
    

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * @return the carnet
     */
    public String getCarnet() {
        return carnet;
    }

    /**
     * @param carnet the carnet to set
     */
    public void setCarnet(String carnet) {
        this.carnet = carnet;
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
     * @return the indicePonderado
     */
    public String getIndicePonderado() {
        return indicePonderado;
    }

    /**
     * @param indicePonderado the indicePonderado to set
     */
    public void setIndicePonderado(String indicePonderado) {
        this.indicePonderado = indicePonderado;
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
     * @return the opcion1
     */
    public String getOpcion1() {
        return opcion1;
    }

    /**
     * @param opcion1 the opcion1 to set
     */
    public void setOpcion1(String opcion1) {
        this.opcion1 = opcion1;
    }

    /**
     * @return the opcion2
     */
    public String getOpcion2() {
        return opcion2;
    }

    /**
     * @param opcion2 the opcion2 to set
     */
    public void setOpcion2(String opcion2) {
        this.opcion2 = opcion2;
    }
    
}