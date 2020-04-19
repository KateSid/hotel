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
        <form method="post" action="client_additional_service" class="form-inline">
            <button class="btn btn-primary" type="submit" name="action" value="New">Добавить сервис для клиента</button>
        </form>
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
                            <button class="btn btn-info" type="submit" name="action" value="Edit">  Редактировать
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
