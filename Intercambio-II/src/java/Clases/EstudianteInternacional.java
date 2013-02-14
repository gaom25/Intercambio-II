/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author dreabalbas
 */
public class EstudianteInternacional extends Estudiante {
    
    private String Institucion;
    private Integer pasaporte;
    private String lenguamaterna;

    public Integer getPasaporte() {
        return pasaporte;
    }

    public void setPasaporte(Integer pasaporte) {
        this.pasaporte = pasaporte;
    }

    public String getLenguamaterna() {
        return lenguamaterna;
    }

    public void setLenguamaterna(String lenguamaterna) {
        this.lenguamaterna = lenguamaterna;
    }
       

    public String getInstitucion() {
        return Institucion;
    }

    public void setInstitucion(String Institucion) {
        this.Institucion = Institucion;
    }
    
}
