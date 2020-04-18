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
    <title>Дополнителные сервисы использованные клиентом</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <jsp:include page="menu.jsp"/>
    </header>
    <main class="container">
        <p>Управление сервисами клиентов</p>
        <form method="post" action="client_additional_service" class="form-inline">
            <label style="margin: 20px"> Клиент </label>
            <p> <select name="client_id" required size="1" class="form-control" class="custom-select">
               <option disabled value=""></option>
                <%
                    List<Client> clients = (List<Client>) request.getAttribute("clients");
                    for (Client client : clients) {
                        String info = client.toString();
                %>
                <option value=<%=client.getIdClient()%>><%=client.getFio()+" "+client.getPhone()%></option>

                <% }
                %>
            </select></p>
            <label style="margin: 20px"> Сервис </label>
            <p><select name="additional_service_id" required size="1" class="form-control" class="custom-select">
                <option disabled value=""></option>
                <%
                    List<AdditionalService> additionalServices = (List<AdditionalService>) request.getAttribute("additional_services");
                    for (AdditionalService additionalService : additionalServices) {
                %>
                <option value=<%=additionalService.getIdAdditionalService()%>><%=additionalService.getNameAdditionalService()%></option>

                <% }
                %>
            </select></p>
            <button class="btn btn-primary" type="submit" name="action" value="Add">Добавить</button>
        </form>
        <br>
        <%
            ClientAdditionalService editable = (ClientAdditionalService) request.getAttribute("editable");
            if (editable != null) {
        %>
        <label> Изменение даты получения </label>
        <form method="post" action="client_additional_service" class="form-inline">
            <input type="hidden" name="client_id" value=<%=editable.getClientAdditionalServiceCompositeId().getIdClient()%>>
            <input type="hidden" name="additional_service_id" value=<%=editable.getClientAdditionalServiceCompositeId().getIdAdditionalService()%>>
            <input type="date" class="date-picker-popup" name="check_date"  value=<%=editable.getDatetime()%>>
            <button type="submit" class="btn btn-primary" name="action" value="Save_edit">Сохранить
            </button>
        </form>
        <%
            }
        %>
        <form method="post" action="client_additional_service" style="display:inline;">
            <table class="table table-striped">
                <tr>
                    <th>Клиент</th>
                    <th>Сервис</th>
                    <th>Дата</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    List<ClientAdditionalService> clientAdditionalServices = (List<ClientAdditionalService>)
                            request.getAttribute("client_additional_services");
                    if (clientAdditionalServices != null)
                        for (ClientAdditionalService clientAdditionalService : clientAdditionalServices) {
                %>
                <tr>
                    <td>
                        <p><%=clientAdditionalService.getClient().getFio()+" "+clientAdditionalService.getClient().getPhone()%>
                        </p>
                    </td>
                    <td>
                        <p><%=clientAdditionalService.getAdditionalService().getNameAdditionalService()%>
                        </p>
                    </td>
                    <td>
                        <p><%=clientAdditionalService.getDatetime().toString()%>
                        </p>
                    </td>
                    <td>
                        <form method="post" action="client_additional_service" class="form-inline">
                            <input type="hidden" name="client_id"
                                   value=<%=clientAdditionalService.getClientAdditionalServiceCompositeId().getIdClient()%>>
                            <input type="hidden" name="additional_service_id"
                                   value=<%=clientAdditionalService.getClientAdditionalServiceCompositeId().getIdAdditionalService()%>>
                            <button class="btn btn-info" type="submit" name="action" value="Edit">  Изменить дату получения
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method="post" action="client_additional_service" class="form-inline">
                            <input type="hidden" name="client_id"
                                   value=<%=clientAdditionalService.getClientAdditionalServiceCompositeId().getIdClient()%>>
                            <input type="hidden" name="additional_service_id"
                                   value=<%=clientAdditionalService.getClientAdditionalServiceCompositeId().getIdAdditionalService()%>>
                            <button class="btn btn-warning" type="submit" name="action" value="Delete"> Удалить
                            </button>
                        </form>
                    </td>

                </tr>
                <%
                        }
                %>
            </table>
        </form>
    </main>
</body>
</html>
