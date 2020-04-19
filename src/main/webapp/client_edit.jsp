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
</head>
<body>
    <header>
        <jsp:include page="menu.jsp"/>
    </header>
    <main class="container">
        <%
            Client editClient = (Client) request.getAttribute("editable");
            if (editClient!=null){
        %>
        <label for="form_save_edit">Редактирование клиента</label>
        <form id="form_save_edit" method="post" action="client">
            <input type=hidden name="id" value=<%=editClient.getIdClient()%>>
            <label style="margin: 20px">ФИО</label>
            <input type=text name="fio" pattern="[А-Я]{1}[а-я]{1,14} [А-Я]{1}[а-я]{1,14} [А-Я]{1}[а-я]{1,14}|[А-Я]{1}[а-я]{1,14} [А-Я]{1}[а-я]{1,14}" value=<%=editClient.getFio()%>>
            <label style="margin: 20px">Паспорт</label>
            <input type=text name="passport_data" pattern="[0-9]{10}" value=<%=editClient.getPassportData()%>>
            <label style="margin: 20px">Телефон</label>
            <input type=text name="phone" pattern="[0-9]{11}|[+][0-9]{11}" value=<%=editClient.getPhone()%>>
            <button type="submit" name="action" class="btn btn-primary" value="Save_edit">Save edit
            </button>
        </form>
        <%
            }
        %>
    </main>
</body>
</html>
