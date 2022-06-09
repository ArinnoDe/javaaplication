package br.com.DAO;
    import br.com.model.Avaliation;
    import java.sql.Connection;

import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.sql.SQLException;
    import java.util.ArrayList;


public class avaliationDAO {
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Avaliation> lista = new ArrayList<>();
    
     
     public void cadAvaliation(Avaliation ava) throws ClassNotFoundException{
        
        String sql = "INSERT INTO avaliation (USER_COMMENT, RATE, ID_GAME) VALUES (?,?,?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, ava.getUSER_COMMENT());
            pstm.setInt(2, ava.getRATE());
            pstm.setInt(3, ava.getID_GAME());
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println(ava.getID_GAME());
            System.out.println("Error DAO");
            System.out.println(e);
        }
    }
      public void addAvaliation(int ID_GAME) throws ClassNotFoundException{
        String querry = "UPDATE POOIIDB.GAMES SET MRATE_GAME = (SELECT AVG(RATE) FROM POOIIDB.AVALIATION WHERE ID_GAME = ?) WHERE ID_GAME = ?;";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(querry);
            pstm.setInt(1, ID_GAME); 
            pstm.setInt(2, ID_GAME);
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
  
    }
    
    
    
    
}