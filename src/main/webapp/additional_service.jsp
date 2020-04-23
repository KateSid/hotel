<%@ page import="domain.AdditionalService" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ShadWhite
  Date: 14.04.2020
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Дополнительные сервисы</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <jsp:include page="menu.jsp"/>
    </header>
    <main>
            <table class="table table-striped">
                <tr>
                    <th>Стоимость</th>
                    <th>Название</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    List<AdditionalService> additionalServices = (List<AdditionalService>) request.getAttribute("additional_service");
                    if (additionalServices!=null)
                        for (AdditionalService additionalService : additionalServices) {
                %>
                <tr>
                    <td>
                        <p><%=additionalService.getCostAdditionalService()%></p>
                    </td>
                    <td>
                        <p><%=additionalService.getNameAdditionalService()%></p>
                    </td>
                    <td>
                        <form method="post" action="additional_service" class="form-inline">
                            <input type="hidden" name="id" value=<%=additionalService.getIdAdditionalService()%>>
                            <button type="submit" name="action" class="btn btn-info" value="Edit">Редактировать
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method="post" action="additional_service" class="form-inline">
                            <input type="hidden" name="id" value=<%=additionalService.getIdAdditionalService()%>>
                            <button type="submit" name="action" class="btn btn-warning"value="Delete"> Удалить
                            </button>
                        </form>
                    </td>
                </tr >
                <%
                        }
                %>
            </table>
        <form method = "post" action="additional_service" class="form-inline">
            <button type="submit" class="btn btn-primary" name = "action" value = "New">Добавить сервис</button>
        </form>
    </main>
</body>
</html>
