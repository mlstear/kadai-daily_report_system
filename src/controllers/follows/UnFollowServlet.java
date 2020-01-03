package controllers.follows;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Follow;
import utils.DBUtil;

/**
 * Servlet implementation class UnFollowServlet
 */
@WebServlet("/follows/unfollow")
public class UnFollowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UnFollowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();
        Follow f = em.find(Follow.class, Integer.parseInt(request.getParameter("follow_id")));

        em.getTransaction().begin();
        em.remove(f);
        em.getTransaction().commit();
        request.getSession().setAttribute("flush", "フォローを解除しました。");
        em.close();

        response.sendRedirect(request.getContextPath()+"/employees/index");
    }

}
