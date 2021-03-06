package servlets;

import DAO.AdditionalServiceDAO;
import domain.AdditionalService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/additional_service")
public class AdditionalServiceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        AdditionalServiceDAO additionalServiceDAO =new AdditionalServiceDAO();
        req.setAttribute("additional_service", additionalServiceDAO.getAll());
        req.getRequestDispatcher("additional_service.jsp").forward(req, resp);
        }
        catch (Exception e){
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            AdditionalServiceDAO additionalServiceDAO = new AdditionalServiceDAO();
            switch (req.getParameter("action")) {
                case "Add": {
                    AdditionalService additionalService = new AdditionalService();
                    additionalService.setCostAdditionalService(Integer.parseInt(req.getParameter("cost")));
                    additionalService.setNameAdditionalService(req.getParameter("name"));
                    additionalServiceDAO.save(additionalService);
                    req.setAttribute("additional_service", additionalServiceDAO.getAll());
                    req.getRequestDispatcher("additional_service.jsp").forward(req, resp);
                    break;
                }
                case "New": {
                    req.getRequestDispatcher("additional_service_add.jsp").forward(req, resp);
                    break;
                }
                case "Edit": {
                    req.setAttribute("editable", additionalServiceDAO.getById(Long.parseLong(req.getParameter("id"))).get());
                    req.getRequestDispatcher("additional_service_edit.jsp").forward(req, resp);
                    break;
                }
                case "Save_edit": {
                    AdditionalService additionalService = additionalServiceDAO.getById(Long.parseLong(req.getParameter("id"))).get();
                    additionalService.setCostAdditionalService(Integer.parseInt(req.getParameter("cost")));
                    additionalService.setNameAdditionalService(req.getParameter("name"));
                    additionalServiceDAO.update(additionalService);
                    req.setAttribute("additional_service", additionalServiceDAO.getAll());
                    req.getRequestDispatcher("additional_service.jsp").forward(req, resp);
                    break;
                }
                case "Delete": {
                    additionalServiceDAO.deleteById(Long.parseLong(req.getParameter("id")));
                    req.setAttribute("additional_service", additionalServiceDAO.getAll());
                    req.getRequestDispatcher("additional_service.jsp").forward(req, resp);
                }
            }
        }
        catch (Exception e){
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }
}
