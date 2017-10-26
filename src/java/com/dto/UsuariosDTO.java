/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dto;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class UsuariosDTO {
    
    private int tipo_usuario;
    private String usuario;
    private String pass;

    public UsuariosDTO(String usuario) {
        this.usuario = usuario;
    }

    
    
    public int getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(int tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    
}
