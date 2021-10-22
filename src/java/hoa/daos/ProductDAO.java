/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoa.daos;

import hoa.db.MyConnection;
import hoa.dtos.ProductDTO;
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
public class ProductDAO {
     private Connection conn;
    private PreparedStatement stm;
    private ResultSet rs;

    public ProductDAO() {

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
  public List<ProductDTO> getAllBook() throws SQLException, ClassNotFoundException{
        List<ProductDTO> list=null;
        try {
            conn=MyConnection.getConnection();
            
            String sql="select productID, productName, price, quantity, image from Product where status=1";
            stm=conn.prepareStatement(sql);
            
            rs=stm.executeQuery();
            
            list= new ArrayList();                    
            while(rs.next()){
                String productID=rs.getString("productID");
                String productName=rs.getString("productName");
                int price=rs.getInt("price");
                int quantity=rs.getInt("quantity");
                String image=rs.getString("image");
                int status=1;
                list.add(new ProductDTO(productID, productName, price, quantity, status, image));
                
            }
        } finally {
            closeConnection();
        }
        return list;
    }
  
    public List<ProductDTO> search(String search) throws SQLException, ClassNotFoundException{
        List<ProductDTO> list=null;
        try {
            conn=MyConnection.getConnection();
            
            String sql="select productID, productName, price, quantity, image from Product where status=1 and productName like ?";
            stm=conn.prepareStatement(sql);
            
            stm.setString(1, "%"+search+"%");
            
            rs=stm.executeQuery();
            list=new ArrayList<>();
            
            while(rs.next()){
                String productID=rs.getString("productID");
                String productName=rs.getString("productName");
                int price=rs.getInt("price");
                int quantity=rs.getInt("quantity");
                String image=rs.getString("image");
                int status=1;
                list.add(new ProductDTO(productID, productName, price, quantity, status, image));
            }
        } finally {
            closeConnection();
        }
        return list;
    }
    public boolean insert(ProductDTO dto) throws SQLException, ClassNotFoundException{
      boolean check =true;
        try {
            conn=MyConnection.getConnection();
            
            String sql="insert into Product(productID, productName, price, quantity, image, status) values(?,?,?,?,?,?)";
            stm=conn.prepareStatement(sql);
            
            stm.setString(1, dto.getProductID());
            stm.setString(2, dto.getProductName());
            stm.setInt(3, dto.getPrice());
            stm.setInt(4, dto.getQuantity());
            stm.setString(5, dto.getImage());
            stm.setInt(6, dto.getStatus());
            
           check=stm.executeUpdate()!=0?true:false;
            
            
        } finally {
            closeConnection();
        }
        return check;
    }
    public boolean delete(String id) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = MyConnection.getConnection();

            String sql = "update Product set status=0 where productID=?";
            stm = conn.prepareStatement(sql);
            
            stm.setString(1, id);
            

            check = stm.executeUpdate() != 0 ? true : false;
        } finally {
            closeConnection();
        }
        return check;
    }
}
