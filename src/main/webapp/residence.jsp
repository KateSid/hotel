<%@ page import="domain.Residence" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="domain.Client" %>
<%@ page import="domain.HotelRoom" %><%--
  Created by IntelliJ IDEA.
  User: ShadWhite
  Date: 14.04.2020
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Занятые комнаты</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<header>
    <jsp:include page="menu.jsp"/>
</header>
<main class="container">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="label label-info">Управление занятыми комнатами</span>
        </div>
    <div class="panel-body">

    <form method="post" action="residence" class="form-inline">
        <p><button class="btn btn-primary" type="submit" name="action" value="New">Добавить комнату клиенту</button></p>
    </form>
    <form method="post" action="residence" style="display:inline;">
        <table class="table table-striped">
            <tr>
                <th>Клиент</th>
                <th>Комната</th>
                <th>Дата заезда</th>
                <th>Дата выезда</th>
                <th></th>
                <th></th>
            </tr>
            <%
                List<Residence> residences = (List<Residence>) request.getAttribute("residences");
                if (residences != null)
                    for (Residence residence : residences) {
            %>
            <tr>
                <td>
                    <p><%=residence.getClient().getFio()+ " "+residence.getClient().getPhone()%>
                    </p>
                </td>
                <td>
                    <p><%=residence.getHotelRoom().getTypeHotelRoom()+" Количество персон"+residence.getHotelRoom().getNumberPersons()%>
                    </p>
                </td>
                <td>
                    <p><%=residence.getResidenceCompositeId().getCheckInDatetime()%>
                    </p>
                </td>
                <td>
                    <p><%=residence.getCheckOutDatetime()%>
                    </p>
                </td>
                <td>
                    <form method="post" action="residence" class="form-inline">
                        <input type="hidden" name="client_id"
                               value=<%=residence.getResidenceCompositeId().getIdClient()%>>
                        <input type="hidden" name="hotel_room_id"
                               value=<%=residence.getResidenceCompositeId().getIdHotelRoom()%>>
                        <input type="hidden" name="inDate"
                               value=<%=residence.getResidenceCompositeId().getCheckInDatetime()%>>
                        <button class="btn btn-info" type="submit" name="action" value="Edit">  Редактировать
                        </button>
                    </form>
                </td>
                <td>
                    <form method="post" action="residence" class="form-inline">
                        <input type="hidden" name="client_id"
                               value=<%=residence.getResidenceCompositeId().getIdClient()%>>
                        <input type="hidden" name="hotel_room_id"
                               value=<%=residence.getResidenceCompositeId().getIdHotelRoom()%>>
                        <input type="hidden" name="inDate"
                               value=<%=residence.getResidenceCompositeId().getCheckInDatetime()%>>
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
    </div>
    </div>
</main>
</body>
</html>
