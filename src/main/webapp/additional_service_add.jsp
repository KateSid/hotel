<%--
  Created by IntelliJ IDEA.
  User: ShadWhite
  Date: 18.04.2020
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Добавить дополнительные сервисы</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/forming.css">
</head>
<body>
<main class="container">
    <form id="form_additional_service_add" method = "post" action="additional_service" class="form-inline">
        <div class="containerform">
            <h5>Добавление дополнительного сервиса</h5>
            <p>Заполните поля, чтобы добавить сервис</p>
            <hr>
        <label for="additional_service_add_cost"><b>Стоимость сервиса</b>  </label>
        <input id="additional_service_add_cost" type="number" name="cost" min="1" value="1" placeholder="Введите стоимость" required>
        <label for="additional_service_add_name"> <b>Название сервиса</b></label>
        <input id="additional_service_add_name" type="text" name="name" placeholder="Введите название" required>
            <a class="btn btn-primary" href="additional_service" role="button">Назад</a>
        <button type="submit" class="btn btn-warning" name = "action" value = "Add">Добавить</button>
        </div>
    </form><br>
</main>
</body>
</html>
