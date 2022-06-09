<%@page import="br.com.DAO.userDAO"%>
<%@page import="br.com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Login</title>
    </head>
    <body>
    
        
        
        
        
        <form action="login.jsp" method="POST">
            <div class="field">
                <p class="control has-icons-left has-icons-right">
                    <input name="username" class="input" placeholder="Email">
                  <span class="icon is-small is-left">
                    <i class="fas fa-envelope"></i>
                  </span>
                  <span class="icon is-small is-right">
                    <i class="fas fa-check"></i>
                  </span>
                </p>
            </div>
            <div class="field">
                <p class="control has-icons-left">
                    <input name="password" class="input" type="password" placeholder="Password">
                  <span class="icon is-small is-left">
                    <i class="fas fa-lock"></i>
                  </span>
                </p>
            </div>
            
            
            <button type="submit">Login</button>
        </form>
        <%
        userDAO userDAO = new userDAO();
        
        if(userDAO.verifyUser(request.getParameter("username"), request.getParameter("password"))){
            session.setAttribute("user", request.getParameter("username"));
            response.sendRedirect("home.jsp");
            
        }
    System.out.println(userDAO.verifyUser(request.getParameter("username"), request.getParameter("password")));
    
    %>
    </body>
</html>
