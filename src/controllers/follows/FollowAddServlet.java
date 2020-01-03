package controllers.follows;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Employee;
import models.Follow;
import utils.DBUtil;

/**
 * Servlet implementation class FollowAdd
 */
@WebServlet("/follows/add")
public class FollowAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em= DBUtil.createEntityManager();

        Follow f=new Follow();


        Employee e =(Employee)request.getSession().getAttribute("login_employee");
        f.setFollow_id(e.getId());
        f.setFollowed_id(Integer.parseInt(request.getParameter("employee_id")));

        String fn=request.getParameter("employee_name");

        em.getTransaction().begin();
        em.persist(f);
        em.getTransaction().commit();
        request.getSession().setAttribute("flush", fn+"さんをフォローしました。");
        em.close();





        response.sendRedirect(request.getContextPath()+"/employees/index");
    }

}
