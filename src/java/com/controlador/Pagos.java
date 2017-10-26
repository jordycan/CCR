/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.controlador;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Pagos {
    
    
  
    
    public int adeudo(int tipo,int cantidad){
           int adeudo=0;
           if(tipo==1){
               adeudo=250-cantidad;
           }
           else if(tipo==2){
               adeudo=500-cantidad;
           }
           else if(tipo==3){
               adeudo=1000-cantidad;
           }
            else if(tipo==4){
               adeudo=400-cantidad;
           }
             else if(tipo==5){
               adeudo=350-cantidad;
           }
             else if(tipo==6){
               adeudo=700-cantidad;
           }
           return adeudo;
    }
    
    public  String statusDePago(int tipo,int cantidad){
        String status="";
        if(tipo==1 && cantidad==250){
            status="Pagado";
        }
        else if(tipo==2 && cantidad==500){
            status="Pagado";
        }
        else if(tipo==3 && cantidad==1000){
            status="Pagado";
        }
         else if(tipo==4 && cantidad==400){
            status="Pagado";
        }
          else if(tipo==5 && cantidad==350){
            status="Pagado";
        }
           else if(tipo==6 && cantidad==700){
            status="Pagado";
        }
        else{
            status="Pendiente";
        }
        return status;
    }
    
    public static void main(String args[]){
        Pagos pa = new Pagos();
        System.out.println(pa.adeudo(410, 2));
    }
    
}
