<%@ page import="domain.Client" %>
<%@ page import="domain.HotelRoom" %>
<%@ page import="java.util.List" %>
<%--
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
    <link rel="stylesheet" type="text/css" href="css/forming.css">
</head>
<body>
<main class="container">
    <form id ="form_residence_add" method="post" action="residence" >
        <div class="containerform">
            <h5>Добавление занятой комнаты</h5>
            <p>Заполните поля, чтобы занять комнату</p>
            <hr>
        <label for="residence_add_client"><b>Клиент</b></label>
            <p><select id="residence_add_client" name="client_id" required size="1" class="form-control" class="custom-select">
                <option disabled value=""></option>
                <%
                    List<Client> clients = (List<Client>) request.getAttribute("clients");
                    for (Client client : clients) {
                %>
                <option value="<%=client.getIdClient()%>"><%=client.getFio()+" "+client.getPhone()%></option>

        <% }
        %>
            </select></p>
        <label for="residence_add_room"><b>Комната</b></label>
            <p><select id="residence_add_room" name="hotel_room_id" required size="1" class="form-control" class="custom-select">
                <option disabled value=""></option>
                <%
                    List<HotelRoom> hotelRooms = (List<HotelRoom>) request.getAttribute("hotel_rooms");
                    for (HotelRoom hotelRoom : hotelRooms) {
                %>
                <option value="<%=hotelRoom.getIdHotelRoom()%>"><%=hotelRoom.getTypeHotelRoom()+" Количество персон "+hotelRoom.getNumberPersons()%></option>

        <% }
        %>
        </select></p>
            <a class="btn btn-primary" href="residence" role="button">Назад</a>
        <button class="btn btn-warning" type="submit" name="action" value="Add">Добавить</button>

        </div>
    </form>
</main>
</body>
</html>
