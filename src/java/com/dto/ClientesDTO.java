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
public class ClientesDTO {
    
    private int cod_cliente;
    private String nom_completo;
    private String direccion;
    private String sector;
    private String telefono;
    private int id_tipo;
    private String corte;
    
    public ClientesDTO(int cod_cliente, String nom_completo, String direccion, String sector, String telefono) {
        this.cod_cliente = cod_cliente;
        this.nom_completo = nom_completo;
        this.direccion = direccion;
        this.sector = sector;
        this.telefono = telefono;
    }

    public ClientesDTO(int cod_cliente, String nom_completo, String direccion, String sector, String telefono, int id_tipo, String corte) {
        this.cod_cliente = cod_cliente;
        this.nom_completo = nom_completo;
        this.direccion = direccion;
        this.sector = sector;
        this.telefono = telefono;
        this.id_tipo = id_tipo;
        this.corte = corte;
    }
    
    
    
    public ClientesDTO(int cod_cliente) {
        this.cod_cliente = cod_cliente;
    }

    public ClientesDTO(int cod_cliente, String nom_completo, String direccion, String sector, String telefono, int id_tipo) {
        this.cod_cliente = cod_cliente;
        this.nom_completo = nom_completo;
        this.direccion = direccion;
        this.sector = sector;
        this.telefono = telefono;
        this.id_tipo = id_tipo;
    }
    
    
    

    public int getCod_cliente() {
        return cod_cliente;
    }

    public void setCod_cliente(int cod_cliente) {
        this.cod_cliente = cod_cliente;
    }

    public String getNom_completo() {
        return nom_completo;
    }

    public void setNom_completo(String nom_completo) {
        this.nom_completo = nom_completo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public String getCorte() {
        return corte;
    }

    public void setCorte(String corte) {
        this.corte = corte;
    }
    
    
    
}
