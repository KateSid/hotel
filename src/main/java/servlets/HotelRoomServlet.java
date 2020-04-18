package servlets;

import DAO.HotelRoomDAO;
import domain.HotelRoom;
import domain.TypeHotelRoom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/hotel_room")
public class HotelRoomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HotelRoomDAO hotelRoomDao = new HotelRoomDAO();
        req.setAttribute("hotelRooms",  hotelRoomDao.getAll());
        req.getRequestDispatcher("hotel_room.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HotelRoomDAO hotelRoomDao = new HotelRoomDAO();
        switch (req.getParameter("action")) {
            case "Add": {
                HotelRoom hotelRoom = new HotelRoom();
                hotelRoom.setCostHotelRoom(Integer.parseInt(req.getParameter("cost")));
                hotelRoom.setNumberPersons(Integer.parseInt(req.getParameter("number_pers")));
                hotelRoom.setTypeHotelRoom(TypeHotelRoom.valueOf(req.getParameter("type")));
                hotelRoomDao.save(hotelRoom);
                break;
            }
            case "Edit": {
                req.setAttribute("editable", hotelRoomDao.getById(Long.parseLong(req.getParameter("id"))).get());
                break;
            }
            case "Save_edit": {
                HotelRoom hotelRoom = hotelRoomDao.getById(Long.parseLong(req.getParameter("id"))).get();
                hotelRoom.setCostHotelRoom(Integer.parseInt(req.getParameter("cost")));
                hotelRoom.setNumberPersons(Integer.parseInt(req.getParameter("number_pers")));
                hotelRoom.setTypeHotelRoom(TypeHotelRoom.valueOf(req.getParameter("type")));
                hotelRoomDao.update(hotelRoom);
                break;
            }
            case "Delete": {
                hotelRoomDao.deleteById(Long.parseLong(req.getParameter("id")));
            }
        }
        req.setAttribute("hotelRooms", hotelRoomDao.getAll());
        req.getRequestDispatcher("hotel_room.jsp").forward(req, resp);
    }
}
