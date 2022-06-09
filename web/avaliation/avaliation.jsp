<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.gameDAO"%>
<%@page import="br.com.model.Games"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avaliation</title>
    </head>
    <body>
        <form class="box" action="avaliationMT.jsp" method="POST">
                <div class="field">
                    <label class="label">Comentario:</label>
                    <div class="control">
                        <input name="USER_COMMENT" class="input" type="text" placeholder="Eu achei esse jogo...">
                    </div>
                </div>

                <div class="field">
                    <label class="label">Nota:</label>
                    <div class="control">
                        <select name="RATE">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
                
                <div class="field">
                    <label>O Jogo avaliado foi:</label>
                    <select name="ID_GAME">
                        <%
                        try{
                          gameDAO game = new gameDAO();
                           ArrayList<Games> lista = game.searchGame();
                           for (int num = 0; num < lista.size(); num++) {
                                out.print("<option value="+ lista.get(num).getID_GAME() +">"+ lista.get(num).getNAME_GAME() +"</option>");
                                }
                        }
                        catch(Exception e ){
                            out.print(e);
                        }
                        %>
                    </select>
                    
                </div>
                    <button class="button is-primary" type="submit">Cadastrar</button>
          
            </form>
    </body>
</html>
