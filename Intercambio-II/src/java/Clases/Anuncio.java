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
    private String fecha;
    private String[] emails;

    public Anuncio() {

        titulo = "";
        mensaje= "";
        fecha ="";
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

    public String[] getEmails() {
        return emails;
    }

    public void setEmails(String[] emails) {
        this.emails = emails;
    }

     
    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
}
