package newpackage;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class AdminDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws ServletException, IOException {

        AdminDashboardBean ob = new AdminDashboardBean();

        int totalUsers = ob.getTotalUsers();

        res.setContentType("text/html");

        PrintWriter pw = res.getWriter();

        pw.println("<html>");
        pw.println("<body>");

        pw.println("<h1>Admin Dashboard</h1>");
        pw.println("<h2>Total Users: " + totalUsers + "</h2>");

        pw.println("</body>");
        pw.println("</html>");
    }
}