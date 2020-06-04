<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="domain.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="domain.Residence" %>
<%@ page import="java.util.Set" %>
<%@ page import="org.hibernate.Hibernate" %>

<%--
  Created by IntelliJ IDEA.
  User: ShadWhite
  Date: 14.04.2020
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>

<jsp:include page="menu.jsp"/>
<html>
<head>
    <title>Управление клиентами</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>
    <main >
            <table class="table table-striped">
                <tr>
                    <th>Фио</th>
                    <th>Паспортные данные</th>
                    <th>Телефон</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    List<Client> clients = (List<Client>) request.getAttribute("clients");
                    if (clients!=null)
                    for (Client client : clients) {
                %>
                <tr>
                    <td>
                        <p><%=client.getFio()%></p>
                    </td>
                    <td>
                        <p><%=client.getPassportData()%></p>
                    </td>
                    <td>
                        <p><%=client.getPhone()%></p>
                    </td>
                    <td>
                        <form method="post" action="client" class="form-inline">
                            <input type="hidden" name="id" value="<%=client.getIdClient()%>">
                            <button class="btn btn-info" type="submit" name="action" value="Edit">Редактировать
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method="post" action="client" class="form-inline">
                            <input type="hidden" name="id" value="<%=client.getIdClient()%>">
                            <button class="btn btn-warning" type="submit" name="action" value="Delete">Удалить
                            </button>
                        </form>
                    </td>

                </tr >
                <%
                    }
                %>
            </table>
        <form method = "post"  id="form_add" action="client" class="form-inline">
            <button class="btn btn-primary" type="submit" name = "action" value = "New">Добавить нового клиента
            </button>
        </form>
    </main>
</body>
</html>
