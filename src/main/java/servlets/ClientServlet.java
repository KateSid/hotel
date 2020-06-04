package servlets;

import DAO.AdditionalServiceDAO;
import DAO.ClientDAO;
import DAO.HotelRoomDAO;
import DAO.ResidenceDAO;
import domain.Client;
import domain.Residence;
import domain.ResidenceCompositeId;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/client")
public class ClientServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            ClientDAO clientDAO = new ClientDAO();
            req.setAttribute("clients", clientDAO.getAll());
            req.getRequestDispatcher("client.jsp").forward(req, resp);
        } catch (Exception e) {
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            ClientDAO clientDAO = new ClientDAO();
            switch (req.getParameter("action")) {
                case "Add": {
                    Client client = new Client();
                    client.setFio(req.getParameter("fio"));
                    client.setPassportData(req.getParameter("passport_data"));
                    client.setPhone(req.getParameter("phone"));
                    clientDAO.save(client);
                    req.setAttribute("clients", clientDAO.getAll());
                    req.getRequestDispatcher("client.jsp").forward(req, resp);
                    break;
                }
                case "New": {
                    req.getRequestDispatcher("client_add.jsp").forward(req, resp);
                    break;
                }
                case "Edit": {
                    req.setAttribute("editable", clientDAO.getById(Long.parseLong(req.getParameter("id"))).get());
                    req.getRequestDispatcher("client_edit.jsp").forward(req, resp);
                    break;
                }
                case "Save_edit": {
                    Client client = clientDAO.getById(Long.parseLong(req.getParameter("id"))).get();
                    client.setFio(req.getParameter("fio"));
                    client.setPassportData(req.getParameter("passport_data"));
                    client.setPhone(req.getParameter("phone"));
                    clientDAO.update(client);
                    req.setAttribute("clients", clientDAO.getAll());
                    req.getRequestDispatcher("client.jsp").forward(req, resp);
                    break;
                }
                case "Delete": {
                    clientDAO.deleteById(Long.parseLong(req.getParameter("id")));
                    req.setAttribute("clients", clientDAO.getAll());
                    req.getRequestDispatcher("client.jsp").forward(req, resp);
                    break;
                }
            }
        } catch (Exception e) {
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }
}
