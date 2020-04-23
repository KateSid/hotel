<%--
  Created by IntelliJ IDEA.
  User: ShadWhite
  Date: 14.04.2020
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Menu</title>
    <style>
        .topnav {
            background-color: blue;
            overflow: hidden;
        }
        .topnav a {
            float: left;
            color: #f2f2f2;
            text-align: center;
            padding: 18px 18px;
            text-decoration: none;
            font-size: 17px;
        }
        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }
    </style>
</head>
<body class="container">
    <div class="topnav">
        <a  href="http://localhost:8080/cursach/">На главную</a>
        <a  href="client">Клиенты</a>
        <a  href="hotel_room">Комнаты</a>
        <a  href="residence">Занятые комнаты</a>
        <a  href="additional_service">Дополнительные сервисы&ensp;</a>
       <a  href="client_additional_service">Дополнительные сервисы клиентов</a>
    </div>
</body>
</html>
