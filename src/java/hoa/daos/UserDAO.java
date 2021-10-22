/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoa.daos;

import hoa.db.MyConnection;
import hoa.dtos.ProductDTO;
import hoa.dtos.UserDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class UserDAO implements Serializable {

    private Connection conn;
    private PreparedStatement stm;
    private ResultSet rs;

    public UserDAO() {

    }

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public UserDTO checkLogin(String name, String password) throws ClassNotFoundException, SQLException {
        UserDTO dto = null;
        try {
            conn = MyConnection.getConnection();
            
            String sql = "select userID, address, phone, email, roleID from Users where name=? and password=?";
            stm = conn.prepareStatement(sql);
            
            stm.setString(1, name);
            stm.setString(2, password);
            
            rs = stm.executeQuery();
            
            if (rs.next()) {
                String userID=rs.getString("userID");
                String address=rs.getString("address");
                String phone=rs.getString("phone");
                String email=rs.getString("email");
                String roleID=rs.getString("roleID");
                
                dto=new UserDTO(userID, name, address, phone, email, password, roleID);
                
            }
        } finally {
            closeConnection();
        }
        return dto;

    }
  
}
