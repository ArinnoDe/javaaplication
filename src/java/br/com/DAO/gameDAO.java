/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.DAO;
    import br.com.model.Games;
    import java.sql.Connection;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.sql.SQLException;
    import java.util.ArrayList;



public class gameDAO {
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Games> lista = new ArrayList<>();
    
     public void cadGame(Games games) throws ClassNotFoundException{
        
        String sql = "INSERT INTO games (NAME_GAME, SUMARY_GAME, ID_DEV) VALUES (?,?,?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, games.getNAME_GAME());
            pstm.setString(2, games.getSUMARY_GAME());
            pstm.setInt(3, games.getID_DEV());
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println("Error DAO");
            System.out.println(e);
        }
    }
     public ArrayList<Games> searchGame() throws ClassNotFoundException{
        String querry = "select * from games";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(querry);
            rs = pstm.executeQuery(querry);
            
            while(rs.next()){
                Games games = new Games();
                games.setNAME_GAME(rs.getString("NAME_GAME"));
                games.setSUMARY_GAME(rs.getString("SUMARY_GAME"));
                games.setID_GAME(rs.getInt("ID_GAME"));
                games.setID_DEV(rs.getInt("ID_DEV"));
                games.setMRATE_GAME(rs.getFloat("MRATE_GAME"));

                lista.add(games);
            }
            pstm.close();
            
        } catch (SQLException e) {
        }
         return lista;
    }
    
    public void deleteGame(int ID_GAME) throws ClassNotFoundException{
     String sql = "DELETE FROM GAMES WHERE ID_GAME = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, ID_GAME);
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println("Error DAO");
            System.out.println(e);
        }
    }
    
      public void updateGame(Games games) throws ClassNotFoundException{
        
        String sql = "UPDATE GAMES SET NAME_GAME = ?, SUMARY_GAME = ?, ID_DEV = ? WHERE ID_GAME = ?";
        con = new ConexaoDAO().conexaoBD();
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, games.getNAME_GAME());
            pstm.setString(2, games.getSUMARY_GAME());
            pstm.setInt(3, games.getID_DEV());
            pstm.setInt(4, games.getID_GAME());
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println("Error DAO");
            System.out.println(e);
        }
    }
    }
    
    

