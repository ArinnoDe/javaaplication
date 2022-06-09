<%@page import="br.com.DAO.avaliationDAO"%>
<%@page import="br.com.model.Avaliation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AvaliationMT</title>
    </head>
    <body>
        <%
         try{
                Avaliation ava = new Avaliation();
                ava.setUSER_COMMENT(request.getParameter("USER_COMMENT"));
                ava.setRATE(Integer.parseInt(request.getParameter("RATE")));
                ava.setID_GAME(Integer.parseInt(request.getParameter("ID_GAME")));
                
                
                avaliationDAO avaDAO = new avaliationDAO();
                avaDAO.cadAvaliation(ava);
                avaDAO.addAvaliation(Integer.parseInt(request.getParameter("ID_GAME")));
                
            }catch(Exception e){
                out.print("Error"); 
            }
      
        String redirectURL = "/WebApplication1/home.jsp";
        response.sendRedirect(redirectURL);
            
        
        
        
        
        %>
    </body>
</html>
