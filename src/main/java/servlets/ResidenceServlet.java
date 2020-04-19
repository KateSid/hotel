package servlets;

import DAO.ClientDAO;
import DAO.HotelRoomDAO;
import DAO.ResidenceDAO;
import domain.Residence;
import domain.ResidenceCompositeId;
import interfaces.HotelDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/residence")
public class ResidenceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        ResidenceDAO residenceDAO = new ResidenceDAO();
        ClientDAO clientDAO =new ClientDAO();
        HotelRoomDAO hotelRoomDAO = new HotelRoomDAO();
        req.setAttribute("clients",clientDAO.getAll());
        req.setAttribute("hotel_rooms",hotelRoomDAO.getAll());
        req.setAttribute("residences",residenceDAO.getAll());
        req.getRequestDispatcher("residence.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        ResidenceDAO residenceDAO = new ResidenceDAO();


        switch (req.getParameter("action")) {
            case "Add": {
                residenceDAO.save(Long.parseLong(req.getParameter("client_id")) ,
                        Long.parseLong(req.getParameter("hotel_room_id")));
                req.setAttribute("residences", residenceDAO.getAll());
                req.getRequestDispatcher("residence.jsp").forward(req, resp);
                break;
            }
            case "New": {
                ClientDAO clientDAO =new ClientDAO();
                HotelRoomDAO hotelRoomDAO = new HotelRoomDAO();
                req.setAttribute("clients",clientDAO.getAll());
                req.setAttribute("hotel_rooms",hotelRoomDAO.getAll());
                req.getRequestDispatcher("residence_add.jsp").forward(req, resp);
                break;
            }
            case "Edit": {
                ResidenceCompositeId residenceCompositeId=new ResidenceCompositeId();
                residenceCompositeId.setIdClient(Long.parseLong(req.getParameter("client_id")));
                residenceCompositeId.setIdHotelRoom(Long.parseLong(req.getParameter("hotel_room_id")));
                residenceCompositeId.setCheckInDatetime(Date.valueOf(req.getParameter("inDate")));
                req.setAttribute("editable", residenceDAO.getById(residenceCompositeId).get());
                Residence residence = new Residence();
                residence.setResidenceCompositeId(residenceCompositeId);
                residenceDAO.delete(residence);
                ClientDAO clientDAO =new ClientDAO();
                HotelRoomDAO hotelRoomDAO = new HotelRoomDAO();
                req.setAttribute("clients",clientDAO.getAll());
                req.setAttribute("hotel_rooms",hotelRoomDAO.getAll());
                req.setAttribute("residences", residenceDAO.getAll());
                req.getRequestDispatcher("residence_edit.jsp").forward(req, resp);
                break;
            }
            case "Save_edit": {
                ResidenceCompositeId residenceCompositeId=new ResidenceCompositeId();
                residenceCompositeId.setIdClient(Long.parseLong(req.getParameter("client_id")));
                residenceCompositeId.setIdHotelRoom(Long.parseLong(req.getParameter("hotel_room_id")));
                residenceCompositeId.setCheckInDatetime(Date.valueOf(req.getParameter("inDate")));
                Residence residence = new Residence();
                residence.setResidenceCompositeId(residenceCompositeId);
                if (req.getParameter("outDate")!=null){
                    residence.setCheckOutDatetime(Date.valueOf(req.getParameter("outDate")));}
                residenceDAO.saveOrUpdate(residence);
                ClientDAO clientDAO =new ClientDAO();
                HotelRoomDAO hotelRoomDAO = new HotelRoomDAO();
                req.setAttribute("clients",clientDAO.getAll());
                req.setAttribute("hotel_rooms",hotelRoomDAO.getAll());
                req.setAttribute("residences", residenceDAO.getAll());
                req.getRequestDispatcher("residence.jsp").forward(req, resp);
                break;
            }
            case "Delete": {
                ResidenceCompositeId residenceCompositeId=new ResidenceCompositeId();
                residenceCompositeId.setIdClient(Long.parseLong(req.getParameter("client_id")));
                residenceCompositeId.setIdHotelRoom(Long.parseLong(req.getParameter("hotel_room_id")));
                residenceCompositeId.setCheckInDatetime(Date.valueOf(req.getParameter("inDate")));
                Residence residence = new Residence();
                residence.setResidenceCompositeId(residenceCompositeId);
                residenceDAO.delete(residence);
                ClientDAO clientDAO =new ClientDAO();
                HotelRoomDAO hotelRoomDAO = new HotelRoomDAO();
                req.setAttribute("clients",clientDAO.getAll());
                req.setAttribute("hotel_rooms",hotelRoomDAO.getAll());
                req.setAttribute("residences", residenceDAO.getAll());
                req.getRequestDispatcher("residence.jsp").forward(req, resp);
            }
        }

    }
}
