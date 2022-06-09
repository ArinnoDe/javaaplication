<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Cadastro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
        <link rel="stylesheet" href="./css/styles.css">
    </head>
    <body style="height: 100vh;width: 100%; display: flex; align-items: center; justify-content: center">
        <form style="width: 55vh" class="box" action="cadastrarDevMT.jsp" method="POST">
            <form class="box">
                <div class="field">
                    <label class="label">Nome da desenvolvedora...</label>
                    <div class="control">
                        <input name="devName" class="input" type="text" placeholder="Nome da Desenvolvedora...">
                    </div>
                    
                </div>
                <button class="button is-primary" type="submit">Cadastrar</button>
            </form>
        </form>
    </body>
</html>
