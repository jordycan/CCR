/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.dao_clientes.rs;
import static DAO.dao_clientes.st;
import com.controlador.Pagos;
import com.dto.ClientesDTO;
import com.dto.CobroDTO;
import com.modelo.ConexionMySQL;
import com.modelo.Conexionsql;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class dao_ventas {

    public dao_ventas(Connection conn) {
        this.conn = conn;
    }

    Connection conn;
    static Statement st = null;
    static ResultSet rs = null;

    private static final String registrarVenta = "insert into ventas(cod_cliente,nom_completo,fecha,estado,mesPagado,cantidad,adeudo,empleado) values(?,?,?,?,?,?,?,?)";
    private static final String editarPago = "update ventas set fecha=?,mesPagado=?,cantidad=?,estado=?,adeudo=? where id_venta=?";

    public boolean EditarCobro(int id_venta,String mesPagado, Date fecha, int cantidad, String estado, int adeudo) throws SQLException {

        PreparedStatement pst = null;
        pst = conn.prepareStatement(editarPago);
        pst.setDate(1, fecha);
        pst.setString(2, mesPagado);
        pst.setInt(3, cantidad);
        pst.setString(4, estado);
        pst.setInt(5, adeudo);
        pst.setInt(6, id_venta);

        if (pst.executeUpdate() == 1) {
            return true;
        }

        return false;
    }

    public boolean RegistrarVenta(int cod_cliente, String nom_completo, Date fecha, String estado,String mesPagado, int cantidad, int adeudo, String empleado) throws SQLException {

        PreparedStatement pst = null;
        pst = conn.prepareStatement(registrarVenta);
        pst.setInt(1, cod_cliente);
        pst.setString(2, nom_completo);
        pst.setDate(3, fecha);
        pst.setString(4, estado);
        pst.setString(5, mesPagado);
        pst.setInt(6, cantidad);
        pst.setInt(7, adeudo);
        pst.setString(8, empleado);

        if (pst.executeUpdate() == 1) {
            return true;
        }

        return false;
    }

    public static List<CobroDTO> MostrarClientesPendientes() {

        List<CobroDTO> cliente = new ArrayList<CobroDTO>();
        try {
            String query = "select *  FROM ventas where estado='Pendiente'";
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                CobroDTO detalles = new CobroDTO(rs.getInt("id_venta"), rs.getInt("cod_cliente"), rs.getString("nom_completo"), rs.getDate("fecha"), rs.getString("estado"),rs.getString("mesPagado"), rs.getInt("cantidad"), rs.getInt("adeudo"), rs.getString("empleado"));
                cliente.add(detalles);

            }

            return cliente;

        } catch (SQLException ex) {

        }

        return null;

    }
    
     public static List<CobroDTO> MostrarPagosPorUsuario(String empleado, String mes) {

        List<CobroDTO> cliente = new ArrayList<CobroDTO>();
        try {
            String query = "select *  FROM ventas where empleado='"+empleado+"' and month(fecha)="+mes+" order by nom_completo" ;
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                CobroDTO detalles = new CobroDTO(rs.getInt("id_venta"), rs.getInt("cod_cliente"), rs.getString("nom_completo"), rs.getDate("fecha"), rs.getString("estado"),rs.getString("mesPagado"), rs.getInt("cantidad"), rs.getInt("adeudo"), rs.getString("empleado"));
                cliente.add(detalles);

            }

            return cliente;

        } catch (SQLException ex) {

        }

        return null;

    }

    public static List<CobroDTO> MostrarClientesPendientesPorCod(int id_cobro) {

        List<CobroDTO> cliente = new ArrayList<CobroDTO>();
        try {
            String query = "select *  FROM ventas where estado='Pendiente' && id_venta=" + id_cobro;
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                CobroDTO detalles = new CobroDTO(rs.getInt("id_venta"), rs.getInt("cod_cliente"), rs.getString("nom_completo"), rs.getDate("fecha"), rs.getString("estado"),rs.getString("mesPagado"), rs.getInt("cantidad"), rs.getInt("adeudo"), rs.getString("empleado"));
                cliente.add(detalles);

            }

            return cliente;

        } catch (SQLException ex) {

        }

        return null;

    }

    public static List<CobroDTO> adeudo() {

        List<CobroDTO> cliente = new ArrayList<CobroDTO>();
        try {
            String query = "select id_venta,cod_cliente,nom_completo,fecha,mesPagado,sum(adeudo) from ventas where estado='"+"Pendiente' group by nom_completo";
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                CobroDTO detalles = new CobroDTO(rs.getInt("id_venta"), rs.getInt("cod_cliente"), rs.getString("nom_completo"), rs.getDate("fecha"),rs.getString("mesPagado"), rs.getInt("sum(adeudo)"));
                cliente.add(detalles);

            }

            return cliente;

        } catch (SQLException ex) {

        }

        return null;

    }

    public static List<CobroDTO> PagoMes(String mes) {

        List<CobroDTO> cliente = new ArrayList<CobroDTO>();
        try {
            String query = "select id_venta,cod_cliente,nom_completo,fecha,estado,cantidad,mesPagado,adeudo,empleado from ventas where month(fecha)='" + mes + "'";
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                CobroDTO detalles = new CobroDTO(rs.getInt("id_venta"), rs.getInt("cod_cliente"), rs.getString("nom_completo"), rs.getDate("fecha"), rs.getString("estado"),rs.getString("mesPagado"), rs.getInt("cantidad"), rs.getInt("adeudo"), rs.getString("empleado"));
                cliente.add(detalles);

            }

            return cliente;

        } catch (SQLException ex) {

        }

        return null;

    }

    public static List<CobroDTO> PagoNombre(String nombre) {

        List<CobroDTO> cliente = new ArrayList<CobroDTO>();
        try {
            String query = "select id_venta,cod_cliente,nom_completo,fecha,estado,cantidad,mesPagado,adeudo,empleado from ventas where nom_completo='" + nombre + "'";
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                CobroDTO detalles = new CobroDTO(rs.getInt("id_venta"), rs.getInt("cod_cliente"), rs.getString("nom_completo"), rs.getDate("fecha"), rs.getString("estado"),rs.getString("mesPagado"), rs.getInt("cantidad"), rs.getInt("adeudo"), rs.getString("empleado"));
                cliente.add(detalles);

            }

            return cliente;

        } catch (SQLException ex) {

        }

        return null;

    }

    public static List<CobroDTO> PagoRangoFecha(String fecha1,String fecha2) {

        List<CobroDTO> cliente = new ArrayList<CobroDTO>();
        try {
            String query = "select id_venta,cod_cliente,nom_completo,fecha,estado,mesPagado,cantidad,adeudo,empleado from ventas where fecha between '"+fecha1+"' and '"+fecha2+"'";
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                CobroDTO detalles = new CobroDTO(rs.getInt("id_venta"), rs.getInt("cod_cliente"), rs.getString("nom_completo"), rs.getDate("fecha"), rs.getString("estado"),rs.getString("mesPagado"), rs.getInt("cantidad"), rs.getInt("adeudo"), rs.getString("empleado"));
                cliente.add(detalles);

            }

            return cliente;

        } catch (SQLException ex) {

        }

        return null;

    }

        public static void main(String args[]) {

        Connection conn;

        try {
            conn = ConexionMySQL.getConexionUnica("localhost", "Conexiones_Camino_Real", "root", "root");

            dao_ventas dao = new dao_ventas(conn);
            //List<TipoClientesDTO> detalles = dao_clientes.MostrarTipoDeCliente(1);
            String f="2017-09-21";
           SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsed = format.parse(f);
            java.sql.Date fecha = new java.sql.Date(parsed.getTime());
            // System.out.println(detalles.get(0).getTipo_cliente());
            //System.out.println(("Empleado1", "Colonia Nueva", "Pomuch", "981139962"));
                    Pagos pa = new Pagos();
                            int pago=400;
                    int adeudo=pa.adeudo(2, pago);
                    String estado=pa.statusDePago(2, pago);
            System.out.println(dao.RegistrarVenta(0000000002,"Jordy Manuel Can Uitz",fecha,estado,"Diciembre",pago,adeudo,"jordycan"));
        } catch (SQLException ex) {
            Logger.getLogger(dao_usuarios.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(dao_ventas.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
}
