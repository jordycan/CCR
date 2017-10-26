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
public class EmpleadoDTO {
        
    private int id_empleado;
    private String nom_completo;
    private String telefono;

    public EmpleadoDTO(int id_empleado, String nom_completo, String telefono) {
        this.id_empleado = id_empleado;
        this.nom_completo = nom_completo;
        this.telefono = telefono;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getNom_completo() {
        return nom_completo;
    }

    public void setNom_completo(String nom_completo) {
        this.nom_completo = nom_completo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
   
   

    
    
    
    
}
