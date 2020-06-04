<%--
  Created by IntelliJ IDEA.
  User: ShadWhite
  Date: 18.04.2020
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Комнаты в отеле</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/forming.css">
</head>
<body>
<main>
    <form method = "post" action="hotel_room" >
        <div class="containerform">
            <h5>Добавление комнаты</h5>
            <p>Заполните поля, чтобы добавить комнату</p>
            <hr>
            <label for="room_add_cost"> <b>Стоимость комнаты</b> </label>
            <input id ="room_add_cost" type="number" name="cost" min="1" value="1" placeholder="Введите стоимость" required>

            <label for="room_add_number_pers"><b>Количество персон</b></label>
            <input id ="room_add_number_pers" type="number" name="number_pers" min="1" max="20" value="1" placeholder="Введите количество человек" required>

            <label for="room_add_type"> <b>Тип комнаты </b></label>
            <p><select id="room_add_type" name="type" required size="1" class="form-control">
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
            </select></p>

            <a class="btn btn-primary" href="hotel_room" role="button">Назад</a>
            <button type="submit" class="btn btn-warning" name = "action" value = "Add">Добавить</button>
        </div>
    </form>
    </main>
</body>
</html>
