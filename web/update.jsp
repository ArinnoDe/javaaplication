<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.devCompanyDAO"%>
<%@page import="br.com.model.DevCompany"%>
<%@page import="br.com.DAO.gameDAO"%>
<%@page import="br.com.model.Games"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Cadastro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
        <link rel="stylesheet" href="./css/styles.css">
    </head>
    <body>
        
            
            <form class="box" action="updateMT.jsp" method="POST">
                <div class="field">
                    <h1 >UPDATE DO GAME <%out.print(request.getParameter("ID_GAME"));%></h1>
                    <label class="label">Nome do jogo...</label>
                    <div class="control">
                        <input name="NAME_GAME" class="input" type="text" placeholder="Nome do jogo...">
                    </div>
                </div>

                <div class="field">
                    <label class="label">Sinopse</label>
                    <div class="control">
                        <input name="SUMARY_GAME" class="input" type="text" placeholder="Sinopse do jogo">
                    </div>
                </div>
                
                <div class="field">
                    <label>Desenvolvedora</label>
                    <select name="ID_DEV">
                        <%
                        try{
                           devCompanyDAO devCompany = new devCompanyDAO();
                           ArrayList<DevCompany> lista = devCompany.searchDevCompany();
                           for (int num = 0; num < lista.size(); num++) {
                                out.print("<option value="+ lista.get(num).getID_DEV() +">"+ lista.get(num).getNAME_DEV() +"</option>");
                                }
                        }
                        catch(Exception e ){
                            out.print(e);
                        }
                        %>
                    </select>
                    
                </div>
                    <button name="ID_GAME" value="<%out.print(request.getParameter("ID_GAME"));%>" class="button is-primary" type="submit">Cadastrar</button>
          
            </form>
    </body>
</html>
