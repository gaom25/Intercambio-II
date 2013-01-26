/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author caponte
 */
public class Anuncio extends org.apache.struts.validator.ValidatorForm {

    private String titulo;
    private String mensaje;
    private String DRIC;
    private String decanatos;
    private String coordinaciones;
    private String uniExt;
    private String estUSB;
    private String estExt;

    public Anuncio() {

        titulo = "";
        mensaje= "";
        DRIC= "";
        decanatos= "";
        coordinaciones= "";
        uniExt= "";
        estUSB= "";
        estExt= "";
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getDRIC() {
        return DRIC;
    }

    public void setDRIC(String DRIC) {
        this.DRIC = DRIC;
    }

    public String getDecanatos() {
        return decanatos;
    }

    public void setDecanatos(String decanatos) {
        this.decanatos = decanatos;
    }

    public String getCoordinaciones() {
        return coordinaciones;
    }

    public void setCoordinaciones(String coordinaciones) {
        this.coordinaciones = coordinaciones;
    }

    public String getUniExt() {
        return uniExt;
    }

    public void setUniExt(String uniExt) {
        this.uniExt = uniExt;
    }

    public String getEstUSB() {
        return estUSB;
    }

    public void setEstUSB(String estUSB) {
        this.estUSB = estUSB;
    }

    public String getEstExt() {
        return estExt;
    }

    public void setEstExt(String estExt) {
        this.estExt = estExt;
    }
}
