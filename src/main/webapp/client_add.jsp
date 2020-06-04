<%--
  Created by IntelliJ IDEA.
  User: ShadWhite
  Date: 18.04.2020
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Добавить нового клиента</title>
    <title>Управление клиентами</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/forming.css">
</head>
<body>
<main class="container">
<form method = "post"  id="form_client_add" action="client">
    <div class="containerform">
        <h5>Добавление нового клиента</h5>
        <p>Заполните поля, чтобы добавить клиента</p>
        <hr>
    <label for="client_add_fio"><b>ФИО</b></label>
    <input id="client_add_fio" type="text"  name="fio" placeholder="Введите ФИО" pattern="[А-Я]{1}[а-я]{1,14} [А-Я]{1}[а-я]{1,14} [А-Я]{1}[а-я]{1,14}|[А-Я]{1}[а-я]{1,14} [А-Я]{1}[а-я]{1,14}" required>
    <label for="client_add_passport"><b>Паспорт</b></label>
    <input id="client_add_passport"type="text" name="passport_data" placeholder="Введите серию и номер паспорта" pattern="[0-9]{10}" required>
    <label for="client_add_phone"><b>Телефон</b></label>
    <input id="client_add_phone" type="text" name="phone" placeholder="Введите телефон" pattern="^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$" required>
        <a class="btn btn-primary" href="client" role="button">Назад</a>
        <button class="btn btn-warning" type="submit" name = "action" value = "Add">Добавить
    </button>
    </div>
</form><br>
</main>
</body>
</html>
