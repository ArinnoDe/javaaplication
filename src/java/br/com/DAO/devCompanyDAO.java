 package br.com.DAO;

import br.com.model.DevCompany;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class devCompanyDAO {
    
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<DevCompany> lista = new ArrayList<>();

    
    public void cadDevCompany(DevCompany devCompany) throws ClassNotFoundException{
        
        String sql = "insert into dev_company (NAME_DEV) values (?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, devCompany.getNAME_DEV());
            pstm.execute();
            pstm.close();
        } catch (SQLException e) {
          
            System.out.println(e);
        }
    }
    
    
    public ArrayList<DevCompany> searchDevCompany() throws ClassNotFoundException{
        
        String querry = "select * from dev_company";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(querry);
            
            rs = pstm.executeQuery(querry);
            
            while(rs.next()){
                DevCompany devCompany = new DevCompany();
                devCompany.setNAME_DEV(rs.getString("NAME_DEV"));
                devCompany.setID_DEV(rs.getInt("ID_DEV"));

                lista.add(devCompany);
            }
            pstm.close();
            
        } catch (SQLException e) {
        }
         return lista;
    }
    
    public DevCompany searchDevCompanyByID(int ID_DEV) throws ClassNotFoundException{
        DevCompany devCompany = new DevCompany();
        String querry = "select * from dev_company where ID_DEV = ?";
        con = new ConexaoDAO().conexaoBD();
        
        try {
            pstm = con.prepareStatement(querry);
            pstm.setInt(1, ID_DEV);
            rs = pstm.executeQuery();
            while(rs.next()){
                devCompany.setNAME_DEV(rs.getString("NAME_DEV"));
          
            }
           
            
           
            
            pstm.close();
        }catch(SQLException e ){
            System.out.println("error");
        }
  
    return devCompany;
    }
}

