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

        switch (req.getParameter("action")) {
            case "Add": {
                clientAdditionalServiceDAO.save(Long.parseLong(req.getParameter("client_id")) ,
                        Long.parseLong(req.getParameter("additional_service_id")));
                req.setAttribute("client_additional_services",clientAdditionalServiceDAO.getAll());
                req.getRequestDispatcher("client_additional_service.jsp").forward(req, resp);
                break;
            }
            case "New": {
                ClientDAO clientDAO =new ClientDAO();
                AdditionalServiceDAO additionalServiceDAO = new AdditionalServiceDAO();
                req.setAttribute("clients",clientDAO.getAll());
                req.setAttribute("additional_services",additionalServiceDAO.getAll());
                req.getRequestDispatcher("client_additional_service_add.jsp").forward(req, resp);
                break;
            }
            case "Edit": {
                ClientAdditionalServiceCompositeId сompositeId=new ClientAdditionalServiceCompositeId();
                сompositeId.setIdClient(Long.parseLong(req.getParameter("client_id")));
                сompositeId.setIdAdditionalService(Long.parseLong(req.getParameter("additional_service_id")));
                req.setAttribute("editable",clientAdditionalServiceDAO.getById(сompositeId).get() );
                ClientDAO clientDAO =new ClientDAO();
                AdditionalServiceDAO additionalServiceDAO = new AdditionalServiceDAO();
                req.setAttribute("clients",clientDAO.getAll());
                req.setAttribute("additional_services",additionalServiceDAO.getAll());
                req.getRequestDispatcher("client_additional_service_edit.jsp").forward(req, resp);
                break;
            }
            case "Save_edit": {
                ClientAdditionalServiceCompositeId oldCompositeId=new ClientAdditionalServiceCompositeId();
                oldCompositeId.setIdClient(Long.parseLong(req.getParameter("old_client_id")));
                oldCompositeId.setIdAdditionalService(Long.parseLong(req.getParameter("old_additional_service_id")));
                ClientAdditionalService oldClientAdditionalService = clientAdditionalServiceDAO.getById(oldCompositeId).get();
                clientAdditionalServiceDAO.delete(oldClientAdditionalService);
                ClientAdditionalServiceCompositeId сompositeId=new ClientAdditionalServiceCompositeId();
                сompositeId.setIdClient(Long.parseLong(req.getParameter("client_id")));
                сompositeId.setIdAdditionalService(Long.parseLong(req.getParameter("additional_service_id")));
                ClientAdditionalService clientAdditionalService = new ClientAdditionalService();
                clientAdditionalService.setClientAdditionalServiceCompositeId(сompositeId);
                if (req.getParameter("check_date")!=null){
                    clientAdditionalService.setDatetime(Date.valueOf(req.getParameter("check_date")));}
                clientAdditionalServiceDAO.saveOrUpdate(clientAdditionalService);
                req.setAttribute("client_additional_services",clientAdditionalServiceDAO.getAll());
                req.getRequestDispatcher("client_additional_service.jsp").forward(req, resp);
                break;
            }
            case "Delete": {
                ClientAdditionalServiceCompositeId сompositeId=new ClientAdditionalServiceCompositeId();
                сompositeId.setIdClient(Long.parseLong(req.getParameter("client_id")));
                сompositeId.setIdAdditionalService(Long.parseLong(req.getParameter("additional_service_id")));
                ClientAdditionalService clientAdditionalService = new ClientAdditionalService();
                clientAdditionalService.setClientAdditionalServiceCompositeId(сompositeId);
                clientAdditionalServiceDAO.delete(clientAdditionalService);
                req.setAttribute("client_additional_services",clientAdditionalServiceDAO.getAll());
                req.getRequestDispatcher("client_additional_service.jsp").forward(req, resp);
            }
        }
;
    }
}
