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


<html>
<head>
    <title>Управление клиентами</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <jsp:include page="menu.jsp"/>
    </header>
    <main class="container">
        <%--<label for="form_add">Добавить нового клиента</label>
        <form method = "post"  id="form_add" action="client" class="form-inline">
            <label style="margin: 20px">ФИО</label>
            <input type="text" name="fio" placeholder="Введите ФИО" pattern="[А-Я]{1}[а-я]{1,14} [А-Я]{1}[а-я]{1,14} [А-Я]{1}[а-я]{1,14}|[А-Я]{1}[а-я]{1,14} [А-Я]{1}[а-я]{1,14}" required>
            <label style="margin: 20px">Паспорт</label>
            <input type="text" name="passport_data" placeholder="Введите серию и номер паспорта" pattern="[0-9]{10}" required>
            <label style="margin: 20px">Телефон</label>
            <input type="text" name="phone" placeholder="Введите телефон" pattern="[0-9]{11}|[+][0-9]{11}" required>
            <button class="btn btn-primary" type="submit" name = "action" value = "Add">Добавить
                </button>
        </form><br>--%>
            <form method = "post"  id="form_add" action="client" class="form-inline">
                <button class="btn btn-primary" type="submit" name = "action" value = "New">Добавить нового клиента
                </button>
            </form><br>
       <%-- <%
            Client editClient = (Client) request.getAttribute("editable");
            if (editClient!=null){
        %>
        <label for="form_save_edit">Редактирование клиента</label>
        <form id="form_save_edit" method="post" action="client" class="form-inline">
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
        %>--%>
        <form method="post" action="client" class="form-inline">
            <table class="table table-striped">
                <tr>
                    <th>ID клиента</th>
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
                        <p><%=client.getIdClient()%></p>
                    </td>
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
                            <input type="hidden" name="id" value=<%=client.getIdClient()%>>
                            <button class="btn btn-info" type="submit" name="action" value="Edit">Редактировать
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method="post" action="client" class="form-inline">
                            <input type="hidden" name="id" value=<%=client.getIdClient()%>>
                            <button class="btn btn-warning" type="submit" name="action" value="Delete">Удалить
                            </button>
                        </form>
                    </td>

                </tr >
                <%
                    }
                %>
            </table>
        </form>

    </main>
</body>
</html>
