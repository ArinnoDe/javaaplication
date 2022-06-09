<%@page import="br.com.DAO.devCompanyDAO"%>
<%@page import="br.com.model.DevCompany"%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.gameDAO"%>
<%@page import="br.com.model.Games"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>JorgeDB</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/x-icon" href="https://www.meiahora.com.br/_midias/jpg/2021/04/06/700x470/1_seu_jorge4-21617825.jpg">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
        <link rel="stylesheet" href="./css/styles.css">


    </head>


    <body>
        <%
        if((String)session.getAttribute("user") == null){
            response.sendRedirect("login.jsp");
        };
        
        %>
        
        
        
        <section id="menu-navbar">
            <nav class="navbar is-dark" role="navigation" aria-label="main navigation">
                <div class="navbar-brand">
                    <a class="navbar-item">
                        <img src="./images/logo.png">
                    </a>
                </div>
                <div class="navbar-menu">
                    <div class="navbar-end">
                        <a class="navbar-item" href="/WebApplication1/dev/cadastro_dev.jsp">Cad Dev</a>
                        <a class="navbar-item" href="/WebApplication1/game/cadastro_game.jsp">Cad Game</a>
                        <a class="navbar-item" href="/WebApplication1/avaliation/avaliation.jsp">Avaliation</a>
                    </div>
                </div>
            </nav>
        </section>


        <section id="articles">

            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Desenvolvedora</th>
                        <th>Nota</th>
                        <th>Action</th>
                    
                        
                    </tr>
                </thead>
                <tbody>
            <%
            
                                try{
                                    gameDAO game = new gameDAO();
                                    devCompanyDAO devCompanyDAO = new devCompanyDAO();
                                    ArrayList<Games> gamesList = game.searchGame();
                                    for (int num = 0; num < gamesList.size(); num++) {
            %>
            <tr>
                <td>
                    <%out.print(gamesList.get(num).getID_GAME());%>
                </td>
                <td>
                    <%out.print(gamesList.get(num).getNAME_GAME());%>
                </td>
                <td>
                    <%out.print(devCompanyDAO.searchDevCompanyByID(gamesList.get(num).getID_DEV()).getNAME_DEV());%>
                </td>
                <td>
                  <%out.print(gamesList.get(num).getMRATE_GAME());%>
                </td>
                
                <td style="display: flex;">
                    <form action="delete.jsp" method="POST" style=" margin-right: 10px; ">
                        
                        <button name="ID_GAME" value="<%out.print(gamesList.get(num).getID_GAME());%>" class="button is-danger is-small">DELETE</button>
                    </form>
                    <form action="update.jsp" method="POST">
                        <button name="ID_GAME" value="<%out.print(gamesList.get(num).getID_GAME());%>" class="button is-info is-small">UPDATE</button>
                    </form>
                </td>
               

            </tr>
            
            <%}}catch(Exception e){
                System.out.println(e);

                                }%>
                </tbody>
            </table>
            
            
            
            
            
            
            
            
            
            







        </section>



    </body>
</html>
