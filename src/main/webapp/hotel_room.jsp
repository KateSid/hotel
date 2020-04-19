<%@ page import="domain.HotelRoom" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ShadWhite
  Date: 14.04.2020
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Комнаты в отеле</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <jsp:include page="menu.jsp"/>
    </header>
    <main class="container">
        <p>Управление комнатами</p>
        <form method = "post" action="hotel_room" class="form-inline">
            <button type="submit" class="btn btn-primary" name = "action" value = "New">Добавить</button>
        </form>
        <%--<form method = "post" action="hotel_room" class="form-inline">
            <label style="margin: 20px"> Стоимость комнаты </label>
            <input type="number" name="cost" min="1" value="1" placeholder="Введите стоимость" required>
            <label style="margin: 20px"> Количество персон</label>
            <input type="number" name="number_pers" min="1" max="20" value="1" placeholder="Введите количество человек" required>
            <label style="margin: 20px"> Тип комнаты </label>
            <select name="type" required size="1" class="form-control">
                <option value="JUNIORSUITE">JUNIORSUITE</option>
                <option value="SUITE">SUITE</option>
                <option value="DELUXE">DELUXE</option>
                <option value="DUPLEX">DUPLEX</option>
                <option value="FAMILYROOM">FAMILYROOM</option>
                <option value="STUDIO">STUDIO</option>
                <option value="STANDART">STANDART</option>
                <option value="APARTAMENT">APARTAMENT</option>
                <option value="HONEYMOON">HONEYMOON</option>
                <option value="VILLA">VILLA</option>
            </select>
            <button type="submit" class="btn btn-primary" name = "action" value = "Add">Добавить</button>
        </form><br>--%>
        <%--<%
            HotelRoom editable = (HotelRoom) request.getAttribute("editable");
            if (editable!=null){
        %>
        <form method="post" action="hotel_room" class="form-inline">
            <input type=hidden name="id" value=<%=editable.getIdHotelRoom()%>>
            <label style="margin: 20px"> Стоимость комнаты </label>
            <input type=number name="cost" min="1" value=<%=editable.getCostHotelRoom()%>>
            <label style="margin: 20px"> Количество персон</label>
            <input type=number name="number_pers" min="1" max="20" value=<%=editable.getNumberPersons()%>>
            <label style="margin: 20px"> Тип комнаты </label>
            <select name="type" required size="1" class="form-control">
                <option value=<%=editable.getTypeHotelRoom().toString()%>><%=editable.getTypeHotelRoom().toString()%></option>
                <option value="JUNIORSUITE">JUNIORSUITE</option>
                <option value="SUITE">SUITE</option>
                <option value="DELUXE">DELUXE</option>
                <option value="DUPLEX">DUPLEX</option>
                <option value="FAMILYROOM">FAMILYROOM</option>
                <option value="STUDIO">STUDIO</option>
                <option value="STANDART">STANDART</option>
                <option value="APARTAMENT">APARTAMENT</option>
                <option value="HONEYMOON">HONEYMOON</option>
                <option value="VILLA">VILLA</option>
            </select>
            <button type="submit" class="btn btn-warning" name="action" value="Save_edit">Сохранить
            </button>
        </form>
        <%
            }
        %>--%>
        <form method="post" action="hotel_room" class="form-inline">
            <table class="table table-striped">
                <tr>
                    <th>ID комнаты</th>
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
                        <p><%=hotelRoom.getIdHotelRoom()%></p>
                    </td>
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
                            <input type="hidden" name="id" value=<%=hotelRoom.getIdHotelRoom()%>>
                            <button type="submit" name="action" class="btn btn-info" value="Edit">Редактировать
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method="post" action="hotel_room" class="form-inline">
                            <input type="hidden" name="id" value=<%=hotelRoom.getIdHotelRoom()%>>
                            <button type="submit" name="action" class="btn btn-primary"value="Delete"> Delete
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
