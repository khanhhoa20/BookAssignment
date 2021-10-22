/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoa.dtos;

import java.io.Serializable;

/**
 *
 * @author PC
 */
public class ProductDTO implements Serializable{
    private String productID;
   private String productName;
  private  int price;
  private  int quantity;
  private  int status;
  private  String image;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String productName, int price, int quantity, int status, String image) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.image = image;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
  
  
}
