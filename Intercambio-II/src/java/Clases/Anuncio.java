/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.util.ArrayList;

/**
 *
 * @author caponte
 */
public class Anuncio extends org.apache.struts.validator.ValidatorForm {

    private String titulo;
    private String mensaje;
    private String fecha;
    private ArrayList usuarios;

    public Anuncio() {

        titulo = "";
        mensaje= "";
        fecha ="";
        usuarios = new ArrayList<Usuario>();
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

     public ArrayList getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(ArrayList usuarios) {
        this.usuarios = usuarios;
    }
    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
}
