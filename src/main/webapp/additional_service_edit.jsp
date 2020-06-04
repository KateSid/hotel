<%@ page import="domain.AdditionalService" %><%--
  Created by IntelliJ IDEA.
  User: ShadWhite
  Date: 18.04.2020
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Изменить сервис</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/forming.css">
</head>
<body>
<main class="container">
<%
    AdditionalService editAditService = (AdditionalService) request.getAttribute("editable");
    if (editAditService!=null){
%>
<form id="form_additional_service_edit" method="post" action="additional_service" class="form-inline">
    <div class="containerform">
        <h5>Редактирование дополнительного сервиса</h5>
        <p>Отредактируйте одно или несколько полей</p>
        <hr>
    <input type=hidden name="id" value="<%=editAditService.getIdAdditionalService()%>">
    <label for="additional_service_edit_cost"><b>Стоимость сервиса</b>  </label>
    <input id="additional_service_edit_cost" type=number name="cost" value="<%=editAditService.getCostAdditionalService()%>">
    <label for="additional_service_edit_name"> <b>Название сервиса</b> </label>
    <input id="additional_service_edit_name" type=text name="name" value="<%=editAditService.getNameAdditionalService()%>">
    <a class="btn btn-primary" href="additional_service" role="button">Назад</a>
    <button type="submit" class="btn btn-warning" name="action" value="Save_edit">Сохранить
    </button>
        </div>
</form>
<%
    }
%>
</main>
</body>
</html>
