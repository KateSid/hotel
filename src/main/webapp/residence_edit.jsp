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
    <link rel="stylesheet" type="text/css" href="css/forming.css">
</head>
<body>
<main>
    <%
        Residence editResidence = (Residence) request.getAttribute("editable");
        if (editResidence != null) {
    %>
    <form method="post" action="residence" class="form-inline" >
        <div class="containerform">
            <h5>Редактирование занятой комнаты</h5>
            <p>Заполните поля, чтобы отредактировать запись о занятой комнате</p>
            <hr>
        <label for = "residence_edit_client"> <b>Клиент</b> </label>
           <p><select id="residence_edit_client" name="client_id" required size="1" class="form-control" class="custom-select">
               <option selected value="<%=editResidence.getResidenceCompositeId().getIdClient()%>"><%=editResidence.getClient().getFio()+" "+editResidence.getClient().getPhone()%></option>
               <%
                   List<Client> clients = (List<Client>) request.getAttribute("clients");
                   for (Client client : clients) {
               %>
               <option value="<%=client.getIdClient()%>"><%=client.getFio()+" "+client.getPhone()%></option>

               <% }
               %>
           </select></p>
           <label for="residence_edit_room"><b>Комната</b>  </label>
           <p><select id = "residence_edit_room" name="hotel_room_id" required size="1" class="form-control" class="custom-select">
               <option selected value="<%=editResidence.getResidenceCompositeId().getIdHotelRoom()%>"><%=editResidence.getHotelRoom().getTypeHotelRoom()+" Количество персон "+editResidence.getHotelRoom().getNumberPersons()%></option>
               <%
                   List<HotelRoom> hotelRooms = (List<HotelRoom>) request.getAttribute("hotel_rooms");
                   for (HotelRoom hotelRoom : hotelRooms) {
               %>
               <option value="<%=hotelRoom.getIdHotelRoom()%>"><%=hotelRoom.getTypeHotelRoom()+" Количество персон "+hotelRoom.getNumberPersons()%></option>

               <% }
               %>
           </select></p>
            <label for="residence_edit_indate"><b>Дата въезда</b>  </label>
        <p><input id="residence_edit_indate" type="date" class="date-picker-popup" name="inDate" min=<%=editResidence.getResidenceCompositeId().getCheckInDatetime()%> value=<%=editResidence.getResidenceCompositeId().getCheckInDatetime()%>>
            </p>
            <label for="residence_edit_outdate"><b>Дата выезда</b>  </label>
            <p><input id="residence_edit_outdate"  type="date" class="date-picker-popup" name="outDate" style="margin-right: 20px" min=<%=editResidence.getResidenceCompositeId().getCheckInDatetime().toString()%> >
                <input type="hidden" name="old_client_id"
                       value="<%=editResidence.getResidenceCompositeId().getIdClient()%>">
                <input type="hidden" name="old_hotel_room_id"
                       value="<%=editResidence.getResidenceCompositeId().getIdHotelRoom()%>">
                <input type="hidden" name="old_inDate"
                       value="<%=editResidence.getResidenceCompositeId().getCheckInDatetime()%>">
            </p><a class="btn btn-primary" href="residence" role="button">Назад</a>
            <button type="submit" class="btn btn-warning" name="action" value="Save_edit">Сохранить
        </button>
        </div>
    </form>
    <%
        }
    %>


    </div>
    </div>
</main>
</body>
</html>
