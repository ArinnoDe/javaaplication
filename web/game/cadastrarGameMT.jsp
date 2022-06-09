<%@page import="br.com.DAO.gameDAO"%>
<%@page import="br.com.model.Games"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                Games games = new Games();
                games.setNAME_GAME(request.getParameter("NAME_GAME"));
                games.setSUMARY_GAME(request.getParameter("SUMARY_GAME"));
                games.setID_DEV(Integer.parseInt(request.getParameter("ID_DEV")));
                
                
                gameDAO gamesDAO = new gameDAO();
                gamesDAO.cadGame(games);
                
                
            }catch(Exception e){
                
            }
             String redirectURL = "/WebApplication1/home.jsp";
            response.sendRedirect(redirectURL);
        
        
        
        %>
    </body>
</html>
