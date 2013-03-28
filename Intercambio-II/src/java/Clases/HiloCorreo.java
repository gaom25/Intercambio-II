/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;


import java.util.ArrayList;

/**
 *
 * @author dreabalbas
 */
public class HiloCorreo extends Thread{
    
    private Anuncio anuncio;
    
    public HiloCorreo(Anuncio a){
        super();
        this.anuncio = a;
    }
    
    public void run(){
        
        Correo c = new Correo();
        c.setAsunto(anuncio.getTitulo());
        c.setMensaje(anuncio.getMensaje());
        
        boolean enviado = c.enviarAnuncio(anuncio.getUsuarios());
        
    } 
    
}
