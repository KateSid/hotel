<%@ page import="domain.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="domain.AdditionalService" %>
<%@ page import="domain.ClientAdditionalService" %><%--
  Created by IntelliJ IDEA.
  User: ShadWhite
  Date: 14.04.2020
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Дополнительные сервисы использованные клиентом</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/forming.css">
</head>
<body>
    <main class="container">
        <form method="post" action="client_additional_service" class="form-inline">
            <div class="containerform">
                <h5>Добавление использованного сервиса</h5>
                <p>Заполните поля, чтобы добавить использованный сервис</p>
                <hr>
            <label for="client_additional_service_add_client"> <b>Клиент</b> </label>
            <p> <select id="client_additional_service_add_client" name="client_id" required size="1" class="form-control" class="custom-select">
               <option disabled value=""></option>
                <%
                    List<Client> clients = (List<Client>) request.getAttribute("clients");
                    for (Client client : clients) {
                        String info = client.toString();
                %>
                <option value="<%=client.getIdClient()%>"><%=client.getFio()+" "+client.getPhone()%></option>

                <% }
                %>
            </select></p>
            <label for="client_additional_service_add_service"><b>Сервис</b>  </label>
            <p><select id="client_additional_service_add_service"  name="additional_service_id" required size="1" class="form-control" class="custom-select">
                <option disabled value=""></option>
                <%
                    List<AdditionalService> additionalServices = (List<AdditionalService>) request.getAttribute("additional_services");
                    for (AdditionalService additionalService : additionalServices) {
                %>
                <option value="<%=additionalService.getIdAdditionalService()%>"><%=additionalService.getNameAdditionalService()%></option>

                <% }
                %>
            </select></p>
            <a class="btn btn-primary" href="client_additional_service" role="button">Назад</a>
            <button class="btn btn-warning" type="submit" name="action" value="Add">Добавить</button>
        </form>

    </main>
</body>
</html>
