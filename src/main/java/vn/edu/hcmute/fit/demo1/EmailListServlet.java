package vn.edu.hcmute.fit.demo1;

import java.io.IOException;
import java.time.Year;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "join";

        String url = "/index.jsp";

        if ("join".equals(action)) {
            url = "/index.jsp";
        } else if ("add".equals(action)) {
            String firstName = request.getParameter("firstName");
            String lastName  = request.getParameter("lastName");
            String email     = request.getParameter("email");

            User user = new User(firstName, lastName, email);
            request.setAttribute("user", user);

            // Bước 6: set năm hiện tại để JSP dùng EL hiển thị
            int currentYear = Year.now().getValue();
            request.setAttribute("currentYear", currentYear);

            url = "/thanks.jsp";
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
