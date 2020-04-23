<%@ page import="domain.Client" %><%--
  Created by IntelliJ IDEA.
  User: ShadWhite
  Date: 18.04.2020
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редактирование клиента</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>

        input[type=text]{
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        input[type=text]:focus {
            background-color: #ddd;
            outline: none;
        }

        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

        /* Add padding to container elements */
        .containerform {
            margin-top: 20px;
            padding: 16px;
            width: 400px;
            margin-right: auto;
            margin-left: auto;
            border:1px solid #ccc;
        }

    </style>
</head>
<body>
<%--    <header>
        <jsp:include page="menu.jsp"/>
    </header>--%>
    <main class="container">
        <%
            Client editClient = (Client) request.getAttribute("editable");
            if (editClient!=null){
        %>
        <form id="form_client_edit" method="post" action="client">
            <div class="containerform">
                <h5>Редактирование клиента</h5>
                <p>Заполните поля, чтобы отредактировать запись о клиенте</p>
                <hr>
            <input type=hidden name="id" value=<%=editClient.getIdClient()%>>
            <label for="client_edit_fio"><b>ФИО</b></label>
            <input id="client_edit_fio" type=text name="fio" pattern="[А-Я]{1}[а-я]{1,14} [А-Я]{1}[а-я]{1,14} [А-Я]{1}[а-я]{1,14}|[А-Я]{1}[а-я]{1,14} [А-Я]{1}[а-я]{1,14}" value=<%=editClient.getFio()%>>
            <label for="client_edit_passport"><b>Паспор</b>т</label>
            <input id="client_edit_passport" type=text name="passport_data" pattern="[0-9]{10}" value=<%=editClient.getPassportData()%>>
            <label for="client_edit_phone"><b>Телефон</b></label>
            <input id="client_edit_phone" type=text name="phone" pattern="[0-9]{11}|[+][0-9]{11}" value=<%=editClient.getPhone()%>>
                <a class="btn btn-primary" href="client" role="button">Назад</a>
                <button type="submit" name="action" class="btn btn-warning" value="Save_edit">Сохранить
            </button>
            </div>
        </form>
        <%
            }
        %>
    </main>
</body>
</html>
