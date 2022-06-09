<%@page import="br.com.DAO.devCompanyDAO"%>
<%@page import="br.com.model.DevCompany"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POST CAD DEV</title>
    </head>
    <body>
        <%
            try{
                DevCompany devCompany = new DevCompany();
                devCompany.setNAME_DEV(request.getParameter("devName"));
                
                devCompanyDAO devCompanyDAO = new devCompanyDAO();
                devCompanyDAO.cadDevCompany(devCompany);
                
             
            }catch(Exception e){
           
            }
            String redirectURL = "/WebApplication1/home.jsp";
            response.sendRedirect(redirectURL);
        %>
    </body>
</html>
