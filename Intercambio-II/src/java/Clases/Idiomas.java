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
    private String nivelConversacional;
    private ArrayList listConver;
    private String nombreusuario;
    private Integer indexIdi = 0;
    private Integer indexEsc = 0;
    private Integer indexVer = 0;
    private Integer indexConv = 0;

    public Idiomas() {
        
        /*Se crea un Idioma con los arraylist, limpios y los indices en 0*/
        listEscr = new ArrayList();
        listIdio = new ArrayList();
        listVerb = new ArrayList();
        listConver = new ArrayList();
        this.indexEsc = 0;
        this.indexIdi = 0;
        this.indexVer = 0;
        this.indexConv = 0;

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

    public String getIdiomaDest() {
        return idiomaDest;
    }

    public void setIdiomaDest(String idiomaDest) {
        this.idiomaDest = idiomaDest;
    }

    public ArrayList getListIdio() {
        return listIdio;
    }

    public void setListIdio(ArrayList listIdio) {
        this.listIdio = listIdio;
    }

    public String getNivelVerbal() {
        return nivelVerbal;
    }

    public void setNivelVerbal(String nivelVerbal) {
        this.nivelVerbal = nivelVerbal;
    }

    public ArrayList getListVerb() {
        return listVerb;
    }

    public void setListVerb(ArrayList listVerb) {
        this.listVerb = listVerb;
    }

    public String getNivelEscrito() {
        return nivelEscrito;
    }

    public void setNivelEscrito(String nivelEscrito) {
        this.nivelEscrito = nivelEscrito;
    }

    public ArrayList getListEscr() {
        return listEscr;
    }

    public void setListEscr(ArrayList listEscr) {
        this.listEscr = listEscr;
    }

    public String getNivelConversacional() {
        return nivelConversacional;
    }

    public void setNivelConversacional(String nivelConver) {
        this.nivelConversacional = nivelConver;
        setListConver(nivelConversacional);
        this.indexConv++;
        
    }

    public ArrayList getListConver() {
        return listConver;
    }

    public void setListConver(String Conver) {
        this.listConver.add(indexConv, Conver);
    }

    public Integer getIndexIdi() {
        return indexIdi;
    }

    public void setIndexIdi(Integer indexIdi) {
        this.indexIdi = indexIdi;
    }

    public Integer getIndexEsc() {
        return indexEsc;
    }

    public void setIndexEsc(Integer indexEsc) {
        this.indexEsc = indexEsc;
    }

    public Integer getIndexVer() {
        return indexVer;
    }

    public void setIndexVer(Integer indexVer) {
        this.indexVer = indexVer;
    }
    
     public Integer getIndexConv() {
        return indexConv;
    }

    public void setIndexConv(Integer indexConv) {
        this.indexConv = indexConv;
    }
    
}
