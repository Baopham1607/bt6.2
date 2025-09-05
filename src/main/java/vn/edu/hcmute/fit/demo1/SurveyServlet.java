package vn.edu.hcmute.fit.demo1;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/survey")
public class SurveyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");
        String email     = request.getParameter("email");
        String heardFrom = request.getParameter("heardFrom");

        String wantsUpdates = request.getParameter("wantsUpdates");
        if (wantsUpdates == null) {
            wantsUpdates = "No";
        }

        String contactVia = request.getParameter("contactVia");

        // Tạo đối tượng User và đặt vào request
        User user = new User(firstName, lastName, email, heardFrom, wantsUpdates, contactVia);
        request.setAttribute("user", user);

        // Chuyển tiếp đến trang survey.jsp
        String url = "/survey.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}