package servlets;

import DAO.AdditionalServiceDAO;
import DAO.ClientAdditionalServiceDAO;
import DAO.ClientDAO;
import domain.AdditionalService;
import domain.ClientAdditionalService;
import domain.ClientAdditionalServiceCompositeId;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/client_additional_service")
public class ClientAdditionalServiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        ClientAdditionalServiceDAO clientAdditionalServiceDAO = new ClientAdditionalServiceDAO();
        ClientDAO clientDAO =new ClientDAO();
        AdditionalServiceDAO additionalServiceDAO = new AdditionalServiceDAO();
        req.setAttribute("clients",clientDAO.getAll());
        req.setAttribute("additional_services",additionalServiceDAO.getAll());
        req.setAttribute("client_additional_services",clientAdditionalServiceDAO.getAll());
        req.getRequestDispatcher("client_additional_service.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        ClientAdditionalServiceDAO clientAdditionalServiceDAO = new ClientAdditionalServiceDAO();
        ClientAdditionalServiceCompositeId сompositeId=new ClientAdditionalServiceCompositeId();
        сompositeId.setIdClient(Long.parseLong(req.getParameter("client_id")));
        сompositeId.setIdAdditionalService(Long.parseLong(req.getParameter("additional_service_id")));
        switch (req.getParameter("action")) {
            case "Add": {
                clientAdditionalServiceDAO.save(Long.parseLong(req.getParameter("client_id")) ,
                        Long.parseLong(req.getParameter("additional_service_id")));
                break;
            }
            case "Edit": {
                req.setAttribute("editable", clientAdditionalServiceDAO.getById(сompositeId).get());
                break;
            }
            case "Save_edit": {
                ClientAdditionalService clientAdditionalService = new ClientAdditionalService();
                clientAdditionalService.setClientAdditionalServiceCompositeId(сompositeId);
                if (req.getParameter("check_date")!=null){
                    clientAdditionalService.setDatetime(Date.valueOf(req.getParameter("check_date")));}
                clientAdditionalServiceDAO.update(clientAdditionalService);
                break;
            }
            case "Delete": {
                ClientAdditionalService clientAdditionalService = new ClientAdditionalService();
                clientAdditionalService.setClientAdditionalServiceCompositeId(сompositeId);
                clientAdditionalServiceDAO.delete(clientAdditionalService);
            }
        }
        ClientDAO clientDAO =new ClientDAO();
        AdditionalServiceDAO additionalServiceDAO = new AdditionalServiceDAO();
        req.setAttribute("clients",clientDAO.getAll());
        req.setAttribute("additional_services",additionalServiceDAO.getAll());
        req.setAttribute("client_additional_services",clientAdditionalServiceDAO.getAll());
        req.getRequestDispatcher("client_additional_service.jsp").forward(req, resp);
    }
}
