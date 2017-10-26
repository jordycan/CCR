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
public class TipoClientesDTO {
    
    private int id_tipo;
    private String tipo_cliente;
    private int precio;

    public TipoClientesDTO(String tipo_cliente) {
        this.tipo_cliente = tipo_cliente;
    }

    

    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public String getTipo_cliente() {
        return tipo_cliente;
    }

    public void setTipo_cliente(String tipo_cliente) {
        this.tipo_cliente = tipo_cliente;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }
    
    
}
