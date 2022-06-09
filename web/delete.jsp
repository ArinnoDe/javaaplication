<%@page import="br.com.DAO.devCompanyDAO"%>
<%@page import="br.com.model.DevCompany"%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.gameDAO"%>
<%@page import="br.com.model.Games"%>


<%
    gameDAO gameDAO = new gameDAO();
    gameDAO.deleteGame(Integer.parseInt(request.getParameter("ID_GAME")));
    response.sendRedirect("home.jsp");
%>