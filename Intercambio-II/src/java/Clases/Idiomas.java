/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.util.ArrayList;

/**
 *
 * @author gustavo
 */
public class Idiomas extends org.apache.struts.action.ActionForm {

    /*Atributos para la clase Idiomas, donde consta de:
        3 arraylist donde estaran guardados, el nombre del idioma seleccionado,
        * el grado de suficiencia verbal y el grado de suficiencia escrita.
     Ademas se disponen de 3 indices para poder agregar cada formulario a su arraylist
     asociado y en la posicion que concuerden con el resto de los arraylist*/
    
    
    private String idiomaDest;
    private ArrayList listIdio;
    private String nivelVerbal;  
    private ArrayList listVerb;
    private String nivelEscrito;    
    private ArrayList listEscr;
    private String nombreusuario;
    private Integer indexIdi = 0;
    private Integer indexEsc = 0;
    private Integer indexVer = 0;

    public Idiomas() {
        
        /*Se crea un Idioma con los arraylist, limpios y los indices en 0*/
        listEscr = new ArrayList();
        listIdio = new ArrayList();
        listVerb = new ArrayList();
        this.indexEsc = 0;
        this.indexIdi = 0;
        this.indexVer = 0;

    }

    /*Metodos de la clase:
        todos los metodos hacen basicamente los mismo que es obtener los datos
        del formulario, insertarlos en el arraylist asociado, aumentar su indice
        y poner un metodo para obtener el arraylist completo cuando se necesite.
        Ademas de proveer el getter y el setter del nombreusuario asociado al idioma.*/
    
    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public String getIdiomaDest(int index) {
        return this.idiomaDest;
    }

    public void setIdiomaDest(int index, String idioma) {

        this.idiomaDest = idioma;
        setListIdio(idiomaDest);
        this.indexIdi++;
    }

    public ArrayList getListIdioma() {
        return this.listIdio;
    }

    public void setListIdio(String idio) {
        this.listIdio.add(indexIdi, idio);
    }

    public String getNivelVerbal(int index) {
        return this.nivelVerbal;
    }

    public void setNivelVerbal(int index, String verb) {

        this.nivelVerbal = verb;
        setListVerbal(nivelVerbal);
        this.indexVer++;
    }

    public ArrayList getListVerbal() {
        return this.listVerb;
    }

    public void setListVerbal(String verb) {
        this.listVerb.add(indexVer, verb);
    }

    public String getNivelEscrito(int index) {
        return this.nivelEscrito;
    }

    public void setNivelEscrito(int index, String escri) {

        this.nivelEscrito = escri;
        setListEscrito(nivelEscrito);
        this.indexEsc++;
    }

    public ArrayList getListEscrito() {
        return this.listEscr;
    }

    public void setListEscrito(String escri) {
        this.listEscr.add(indexEsc, escri);
    }
}
