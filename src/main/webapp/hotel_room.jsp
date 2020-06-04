<%@ page import="domain.HotelRoom" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ShadWhite
  Date: 14.04.2020
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="menu.jsp"/>
<html>
<head>
    <title>Комнаты в отеле</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>
    <main>
        <table class="table table-striped">
                <tr>
                    <th>Стоимость</th>
                    <th>Количество персон</th>
                    <th>Тип</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    List<HotelRoom> hotelRooms = (List<HotelRoom>) request.getAttribute("hotelRooms");
                    if (hotelRooms!=null)
                        for (HotelRoom hotelRoom : hotelRooms) {
                %>
                <tr>
                    <td>
                        <p><%=hotelRoom.getCostHotelRoom()%></p>
                    </td>

                    <td>
                        <p><%=hotelRoom.getNumberPersons()%></p>
                    </td>
                    <td>
                        <p><%=hotelRoom.getTypeHotelRoom()%></p>
                    </td>
                    <td>
                        <form method="post" action="hotel_room" class="form-inline">
                            <input type="hidden" name="id" value="<%=hotelRoom.getIdHotelRoom()%>">
                            <button type="submit" name="action" class="btn btn-info" value="Edit">Редактировать
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method="post" action="hotel_room" class="form-inline">
                            <input type="hidden" name="id" value="<%=hotelRoom.getIdHotelRoom()%>">
                            <button type="submit" name="action" class="btn btn-warning"value="Delete"> Удалить
                            </button>
                        </form>
                    </td>

                </tr >
                <%
                        }
                %>
            </table>
        <form method = "post" action="hotel_room" class="form-inline">
            <button type="submit" class="btn btn-primary" name = "action" value = "New">Добавить</button>
        </form>
    </main>
</body>
</html>
