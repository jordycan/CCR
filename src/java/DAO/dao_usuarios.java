/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import static DAO.dao_clientes.rs;
import static DAO.dao_clientes.st;
import com.dto.UsuariosDTO;
import com.modelo.ConexionMySQL;
import com.modelo.Conexionsql;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class dao_usuarios {
    
    public dao_usuarios(Connection conn) {
        this.conn = conn;
    }
    
    Connection conn;
    
    private static final String sesion="select * from usuarios where tipo_usuario=? and usuario=? and pass=?";
    private static final String insertarUsuario="insert into usuarios (tipo_usuario,usuario,pass) values (?,?,?)";
       
     public boolean autentificacion(int tipo_usuario,String usuario,String pass) throws SQLException{
		
		PreparedStatement pst = null;
		ResultSet re = null;
		
		pst = conn.prepareStatement(sesion);
		pst.setInt(1, tipo_usuario);
		pst.setString(2, usuario);
                pst.setString(3, pass);
		re = pst.executeQuery();
		
		if(re.absolute(1)){
			return true;
		}
		
		return false;
                
	}
     
       public boolean RegistrarUsuario(int tipo, String usuario, String contraseña) throws SQLException {

        PreparedStatement pst = null;
        pst = conn.prepareStatement(insertarUsuario);
      
        pst.setInt(1, tipo);
        pst.setString(2, usuario);
        pst.setString(3, contraseña);

        if (pst.executeUpdate() == 1) {
            return true;
        }

        return false;
    }
       
       public static List<UsuariosDTO> MostrarUsuario(int id) {

        List<UsuariosDTO> usuario = new ArrayList<UsuariosDTO>();
        try {
            String query = "select usuario FROM usuarios where id_usuario="+id;
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                UsuariosDTO detalles = new UsuariosDTO(rs.getString("usuario"));
                usuario.add(detalles);

            }

            return usuario;

        } catch (SQLException ex) {

        }

        return null;

    }
     
     public static void main(String args[]){
          
         
         
//        Connection conn;
//        
//        
//                try {
//            conn = ConexionMySQL.getConexionUnica("localhost", "Conexiones_Camino_Real", "root", "root");
//
//            dao_usuarios dao = new dao_usuarios(conn);
//            System.out.println(dao.RegistrarUsuario(2,"empleado1","empleado1"));
//         
//                    
//                    System.out.println(sql.RegistrarAlumnos(1, "Alumno 1", "Exodoncia", "6", "A",2010,"correo" ));
//                    
//                    
//                
//            
//        } catch (SQLException ex) {
//            Logger.getLogger(dao_usuarios.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
     }
}
