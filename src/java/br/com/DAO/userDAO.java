/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.DAO;

import br.com.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class userDAO {
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
 
        
        
    public boolean verifyUser(String userName, String password) throws ClassNotFoundException{
        boolean isVerify = false;
        String querry = "select * from USERS";
        
        con = new ConexaoDAO().conexaoBD();
       
         
        try{
            pstm = con.prepareStatement(querry);
            rs = pstm.executeQuery(querry);
            
            while(rs.next()){
                
            User user = new User();
            user.setUSER_NAME(rs.getString("USER_NAME"));
            user.setUSER_PASSWORD(rs.getString("USER_PASSWORD"));
            
            if((user.getUSER_NAME().equals(userName) && user.getUSER_PASSWORD().equals(password)) && (user.getUSER_NAME() != null && user.getUSER_PASSWORD() != null) && (!user.getUSER_NAME().isEmpty() && !user.getUSER_PASSWORD().isEmpty()))
                isVerify = true;
            }
        }catch(SQLException e){
            System.out.println(e);
        }

         return isVerify;
     }
    }

