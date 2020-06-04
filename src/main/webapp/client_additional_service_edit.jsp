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
    <title>Редактировать дополнительные сервисы использованные клиентом</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/forming.css">
</head>
<body>
    <main class="container">
        <%
            ClientAdditionalService editable = (ClientAdditionalService) request.getAttribute("editable");
            if (editable != null) {
        %>
        <form method="post" action="client_additional_service">
            <div class="containerform">
                <h5>Редактирование использованного сервиса</h5>
                <p>Отредактируйте одно или несколько полей</p>
                <hr>
    <label for="client_additional_service_edit_client" ><b>Клиент</b>  </label>
    <p> <select id="client_additional_service_edit_client" name="client_id" required size="1" class="form-control" class="custom-select">
        <option selected value="<%=editable.getClientAdditionalServiceCompositeId().getIdClient()%>"><%=editable.getClient().getFio()+" "+editable.getClient().getPhone()%></option>
        <%
            List<Client> clients = (List<Client>) request.getAttribute("clients");
            for (Client client : clients) {
                String info = client.toString();
        %>
        <option value="<%=client.getIdClient()%>"><%=client.getFio()+" "+client.getPhone()%></option>

        <% }
        %>
    </select></p>
    <label for="client_additional_service_edit_service"><b>Сервис</b></label>
    <p><select id="client_additional_service_edit_service"  name="additional_service_id" required size="1" class="form-control" class="custom-select">
        <option selected value="<%=editable.getClientAdditionalServiceCompositeId().getIdAdditionalService()%>"><%=editable.getAdditionalService().getNameAdditionalService()%></option>
        <%
            List<AdditionalService> additionalServices = (List<AdditionalService>) request.getAttribute("additional_services");
            for (AdditionalService additionalService : additionalServices) {
        %>
        <option value="<%=additionalService.getIdAdditionalService()%>"><%=additionalService.getNameAdditionalService()%></option>

        <% }
        %>
    </select></p>
                <label for="client_additional_service_edit_date"><b>Дата использования</b></label>
            <p><input id="client_additional_service_edit_date"  type="date" class="date-picker-popup" name="check_date"  value=<%=editable.getDatetime()%>>
                </p>
                <input type="hidden" name="old_client_id"
                       value="<%=editable.getClientAdditionalServiceCompositeId().getIdClient()%>">
                <input type="hidden" name="old_additional_service_id"
                       value="<%=editable.getClientAdditionalServiceCompositeId().getIdAdditionalService()%>">
                <a class="btn btn-primary" href="client_additional_service" role="button">Назад</a>
            <button type="submit" class="btn btn-warning" name="action" value="Save_edit">Сохранить
            </button>
        </form>
        <%
            }
        %>

    </main>
</body>
</html>
