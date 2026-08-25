
package newpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        AdminDashboardBean bean =
                new AdminDashboardBean();


        // =====================================================
        // MAIN DASHBOARD VALUES
        // =====================================================

        int totalUsers =
                bean.getTotalUsers();
        
        int currentMonthUsers =
        bean.getCurrentMonthUsers();

        int previousMonthUsers =
        bean.getPreviousMonthUsers();

        int totalManagers =
                bean.getTotalEventManagers();

        int totalEvents =
                bean.getTotalEvents();

        int totalBookings =
                bean.getTotalBookings();

        int totalAccessories =
                bean.getTotalAccessories();

        double totalRevenue =
                bean.getTotalRevenue();


        // =====================================================
        // MONTHLY VALUES
        // =====================================================

        int currentMonthManagers =
                bean.getCurrentMonthManagers();

        int previousMonthManagers =
                bean.getPreviousMonthManagers();


        int currentMonthEvents =
                bean.getCurrentMonthEvents();

        int previousMonthEvents =
                bean.getPreviousMonthEvents();


        int currentMonthBookings =
                bean.getCurrentMonthBookings();

        int previousMonthBookings =
                bean.getPreviousMonthBookings();


        double currentMonthRevenue =
                bean.getCurrentMonthRevenue();

        double previousMonthRevenue =
                bean.getPreviousMonthRevenue();


        // =====================================================
        // ADMIN NAME
        // =====================================================

        String adminName =
                bean.getAdminName();


        // =====================================================
        // CALCULATE TRENDS
        // =====================================================

        double userTrend = 0.0;
        double managerTrend = 0.0;
        double eventTrend = 0.0;
        double bookingTrend = 0.0;
        double revenueTrend = 0.0;


        boolean userTrendAvailable = false;
        boolean managerTrendAvailable = false;
        boolean eventTrendAvailable = false;
        boolean bookingTrendAvailable = false;
        boolean revenueTrendAvailable = false;
        
        // -----------------------------------------------------
      // USERS
      // -----------------------------------------------------

       if (previousMonthUsers > 0) {

       userTrend =
            ((double)
            (currentMonthUsers - previousMonthUsers)
            / previousMonthUsers) * 100.0;

          userTrendAvailable = true;

           } else if (currentMonthUsers > 0) {

          userTrend = 100.0;
         userTrendAvailable = true;
         }

        // -----------------------------------------------------
        // MANAGERS
        // -----------------------------------------------------

        if (previousMonthManagers > 0) {

            managerTrend =
                    ((double)
                    (currentMonthManagers -
                     previousMonthManagers)
                    / previousMonthManagers) * 100.0;

            managerTrendAvailable = true;

        } else if (currentMonthManagers > 0) {

            managerTrend = 100.0;
            managerTrendAvailable = true;
        }


        // -----------------------------------------------------
        // EVENTS
        // -----------------------------------------------------

        if (previousMonthEvents > 0) {

            eventTrend =
                    ((double)
                    (currentMonthEvents -
                     previousMonthEvents)
                    / previousMonthEvents) * 100.0;

            eventTrendAvailable = true;

        } else if (currentMonthEvents > 0) {

            eventTrend = 100.0;
            eventTrendAvailable = true;
        }


        // -----------------------------------------------------
        // BOOKINGS
        // -----------------------------------------------------

        if (previousMonthBookings > 0) {

            bookingTrend =
                    ((double)
                    (currentMonthBookings -
                     previousMonthBookings)
                    / previousMonthBookings) * 100.0;

            bookingTrendAvailable = true;

        } else if (currentMonthBookings > 0) {

            bookingTrend = 100.0;
            bookingTrendAvailable = true;
        }


        // -----------------------------------------------------
        // REVENUE
        // -----------------------------------------------------

        if (previousMonthRevenue > 0) {

            revenueTrend =
                    ((currentMonthRevenue -
                     previousMonthRevenue)
                    / previousMonthRevenue) * 100.0;

            revenueTrendAvailable = true;

        } else if (currentMonthRevenue > 0) {

            revenueTrend = 100.0;
            revenueTrendAvailable = true;
        }


        // =====================================================
        // SEND DATA TO JSP
        // =====================================================

        request.setAttribute(
                "totalUsers",
                totalUsers
        );
        
        request.setAttribute(
        "currentMonthUsers",
        currentMonthUsers
);

request.setAttribute(
        "previousMonthUsers",
        previousMonthUsers
);

request.setAttribute(
        "userTrend",
        userTrend
);

request.setAttribute(
        "userTrendAvailable",
        userTrendAvailable
);

        request.setAttribute(
                "totalManagers",
                totalManagers
        );

        request.setAttribute(
                "totalEvents",
                totalEvents
        );

        request.setAttribute(
                "totalBookings",
                totalBookings
        );

        request.setAttribute(
                "totalAccessories",
                totalAccessories
        );

        request.setAttribute(
                "totalRevenue",
                totalRevenue
        );


        request.setAttribute(
                "currentMonthManagers",
                currentMonthManagers
        );

        request.setAttribute(
                "previousMonthManagers",
                previousMonthManagers
        );


        request.setAttribute(
                "currentMonthEvents",
                currentMonthEvents
        );

        request.setAttribute(
                "previousMonthEvents",
                previousMonthEvents
        );


        request.setAttribute(
                "currentMonthBookings",
                currentMonthBookings
        );

        request.setAttribute(
                "previousMonthBookings",
                previousMonthBookings
        );


        request.setAttribute(
                "currentMonthRevenue",
                currentMonthRevenue
        );

        request.setAttribute(
                "previousMonthRevenue",
                previousMonthRevenue
        );


        request.setAttribute(
                "managerTrend",
                managerTrend
        );

        request.setAttribute(
                "eventTrend",
                eventTrend
        );

        request.setAttribute(
                "bookingTrend",
                bookingTrend
        );

        request.setAttribute(
                "revenueTrend",
                revenueTrend
        );


        request.setAttribute(
                "managerTrendAvailable",
                managerTrendAvailable
        );

        request.setAttribute(
                "eventTrendAvailable",
                eventTrendAvailable
        );

        request.setAttribute(
                "bookingTrendAvailable",
                bookingTrendAvailable
        );

        request.setAttribute(
                "revenueTrendAvailable",
                revenueTrendAvailable
        );


        request.setAttribute(
                "adminName",
                adminName
        );


        // =====================================================
        // FORWARD TO DASHBOARD JSP
        // =====================================================

        request.getRequestDispatcher(
                "/admin/admin_dashboard/adminDashboard.jsp"
        ).forward(
                request,
                response
        );
    }


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(
                request,
                response
        );
    }
}

