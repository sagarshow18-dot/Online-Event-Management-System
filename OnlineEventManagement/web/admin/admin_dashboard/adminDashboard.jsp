
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    /* =========================================================
       DATABASE CONNECTION
       ========================================================= */

    String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    String DB_USER = "system";
    String DB_PASSWORD = "manager";

    int totalUsers = 0;
    int totalManagers = 0;
    int totalEvents = 0;
    int totalBookings = 0;
    int totalAccessories = 0;

    double totalRevenue = 0.0;

    /* Monthly trend data */
    int currentMonthManagers = 0;
    int previousMonthManagers = 0;

    int currentMonthEvents = 0;
    int previousMonthEvents = 0;

    int currentMonthBookings = 0;
    int previousMonthBookings = 0;

    double currentMonthRevenue = 0.0;
    double previousMonthRevenue = 0.0;

    String adminName = "Admin User";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {

        Class.forName("oracle.jdbc.driver.OracleDriver");

        con = DriverManager.getConnection(
                DB_URL,
                DB_USER,
                DB_PASSWORD
        );


        /* =====================================================
           ADMIN NAME
           ===================================================== */

        try {

            ps = con.prepareStatement(
                    "SELECT NAME " +
                    "FROM ADMIN " +
                    "WHERE ROWNUM = 1"
            );

            rs = ps.executeQuery();

            if (rs.next()) {

                String name =
                        rs.getString("NAME");

                if (name != null &&
                    !name.trim().isEmpty()) {

                    adminName = name;
                }
            }

            rs.close();
            ps.close();

        } catch (Exception ignored) {
        }


        /* =====================================================
           TOTAL USERS
           ===================================================== */

        ps = con.prepareStatement(
                "SELECT COUNT(*) FROM EVENT_USERS"
        );

        rs = ps.executeQuery();

        if (rs.next()) {
            totalUsers = rs.getInt(1);
        }

        rs.close();
        ps.close();


        /* =====================================================
           TOTAL EVENT MANAGERS
           ===================================================== */

        ps = con.prepareStatement(
                "SELECT COUNT(*) FROM EVENT_MANAGERS"
        );

        rs = ps.executeQuery();

        if (rs.next()) {
            totalManagers = rs.getInt(1);
        }

        rs.close();
        ps.close();


        /* =====================================================
           TOTAL EVENTS
           ===================================================== */

        ps = con.prepareStatement(
                "SELECT COUNT(*) FROM EVENTS"
        );

        rs = ps.executeQuery();

        if (rs.next()) {
            totalEvents = rs.getInt(1);
        }

        rs.close();
        ps.close();


        /* =====================================================
           TOTAL BOOKINGS
           ===================================================== */

        ps = con.prepareStatement(
                "SELECT COUNT(*) FROM BOOKINGS"
        );

        rs = ps.executeQuery();

        if (rs.next()) {
            totalBookings = rs.getInt(1);
        }

        rs.close();
        ps.close();


        /* =====================================================
           TOTAL REVENUE
           Cancelled bookings excluded
           ===================================================== */

        ps = con.prepareStatement(
                "SELECT NVL(SUM(TOTAL_AMOUNT),0) " +
                "FROM BOOKINGS " +
                "WHERE UPPER(NVL(STATUS,'UNKNOWN')) <> 'CANCELLED'"
        );

        rs = ps.executeQuery();

        if (rs.next()) {
            totalRevenue = rs.getDouble(1);
        }

        rs.close();
        ps.close();


        /* =====================================================
           TOTAL ACCESSORIES
           ===================================================== */

        ps = con.prepareStatement(
                "SELECT COUNT(*) FROM ACCESSORIES"
        );

        rs = ps.executeQuery();

        if (rs.next()) {
            totalAccessories = rs.getInt(1);
        }

        rs.close();
        ps.close();


        /* =====================================================
           EVENT MANAGER MONTHLY TREND
           DATE_ADDED exists in EVENT_MANAGERS
           ===================================================== */

        ps = con.prepareStatement(
                "SELECT " +
                "SUM(CASE " +
                "WHEN DATE_ADDED >= TRUNC(SYSDATE,'MM') " +
                "THEN 1 ELSE 0 END) AS CURRENT_MONTH, " +
                "SUM(CASE " +
                "WHEN DATE_ADDED >= ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) " +
                "AND DATE_ADDED < TRUNC(SYSDATE,'MM') " +
                "THEN 1 ELSE 0 END) AS PREVIOUS_MONTH " +
                "FROM EVENT_MANAGERS"
        );

        rs = ps.executeQuery();

        if (rs.next()) {

            currentMonthManagers =
                    rs.getInt("CURRENT_MONTH");

            previousMonthManagers =
                    rs.getInt("PREVIOUS_MONTH");
        }

        rs.close();
        ps.close();


        /* =====================================================
           EVENT MONTHLY TREND
           EVENT_DATE exists in EVENTS
           ===================================================== */

        ps = con.prepareStatement(
                "SELECT " +
                "SUM(CASE " +
                "WHEN EVENT_DATE >= TRUNC(SYSDATE,'MM') " +
                "THEN 1 ELSE 0 END) AS CURRENT_MONTH, " +
                "SUM(CASE " +
                "WHEN EVENT_DATE >= ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) " +
                "AND EVENT_DATE < TRUNC(SYSDATE,'MM') " +
                "THEN 1 ELSE 0 END) AS PREVIOUS_MONTH " +
                "FROM EVENTS"
        );

        rs = ps.executeQuery();

        if (rs.next()) {

            currentMonthEvents =
                    rs.getInt("CURRENT_MONTH");

            previousMonthEvents =
                    rs.getInt("PREVIOUS_MONTH");
        }

        rs.close();
        ps.close();


        /* =====================================================
           BOOKING MONTHLY TREND
           BOOKING_DATE exists in BOOKINGS
           ===================================================== */

        ps = con.prepareStatement(
                "SELECT " +
                "SUM(CASE " +
                "WHEN BOOKING_DATE >= TRUNC(SYSDATE,'MM') " +
                "THEN 1 ELSE 0 END) AS CURRENT_MONTH, " +
                "SUM(CASE " +
                "WHEN BOOKING_DATE >= ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) " +
                "AND BOOKING_DATE < TRUNC(SYSDATE,'MM') " +
                "THEN 1 ELSE 0 END) AS PREVIOUS_MONTH " +
                "FROM BOOKINGS"
        );

        rs = ps.executeQuery();

        if (rs.next()) {

            currentMonthBookings =
                    rs.getInt("CURRENT_MONTH");

            previousMonthBookings =
                    rs.getInt("PREVIOUS_MONTH");
        }

        rs.close();
        ps.close();


        /* =====================================================
           REVENUE MONTHLY TREND
           ===================================================== */

        ps = con.prepareStatement(
                "SELECT " +
                "NVL(SUM(CASE " +
                "WHEN BOOKING_DATE >= TRUNC(SYSDATE,'MM') " +
                "AND UPPER(NVL(STATUS,'UNKNOWN')) <> 'CANCELLED' " +
                "THEN TOTAL_AMOUNT ELSE 0 END),0) " +
                "AS CURRENT_MONTH, " +
                "NVL(SUM(CASE " +
                "WHEN BOOKING_DATE >= ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) " +
                "AND BOOKING_DATE < TRUNC(SYSDATE,'MM') " +
                "AND UPPER(NVL(STATUS,'UNKNOWN')) <> 'CANCELLED' " +
                "THEN TOTAL_AMOUNT ELSE 0 END),0) " +
                "AS PREVIOUS_MONTH " +
                "FROM BOOKINGS"
        );

        rs = ps.executeQuery();

        if (rs.next()) {

            currentMonthRevenue =
                    rs.getDouble("CURRENT_MONTH");

            previousMonthRevenue =
                    rs.getDouble("PREVIOUS_MONTH");
        }

        rs.close();
        ps.close();


    } catch (Exception e) {

        request.setAttribute(
                "dashboardError",
                e.getMessage()
        );

    } finally {

        try {
            if (rs != null) rs.close();
        } catch (Exception ignored) {
        }

        try {
            if (ps != null) ps.close();
        } catch (Exception ignored) {
        }

        try {
            if (con != null) con.close();
        } catch (Exception ignored) {
        }
    }


    /* =========================================================
       TREND CALCULATION
       ========================================================= */
   
    double managerTrend = 0.0;
    double eventTrend = 0.0;
    double bookingTrend = 0.0;
    double revenueTrend = 0.0;

    
    boolean managerTrendAvailable = false;
    boolean eventTrendAvailable = false;
    boolean bookingTrendAvailable = false;
    boolean revenueTrendAvailable = false;
     
    
   
    if (previousMonthManagers > 0) {

        managerTrend =
                ((double)(currentMonthManagers - previousMonthManagers)
                / previousMonthManagers) * 100.0;

        managerTrendAvailable = true;

    } else if (currentMonthManagers > 0) {

        managerTrend = 100.0;
        managerTrendAvailable = true;
    }


    if (previousMonthEvents > 0) {

        eventTrend =
                ((double)(currentMonthEvents - previousMonthEvents)
                / previousMonthEvents) * 100.0;

        eventTrendAvailable = true;

    } else if (currentMonthEvents > 0) {

        eventTrend = 100.0;
        eventTrendAvailable = true;
    }


    if (previousMonthBookings > 0) {

        bookingTrend =
                ((double)(currentMonthBookings - previousMonthBookings)
                / previousMonthBookings) * 100.0;

        bookingTrendAvailable = true;

    } else if (currentMonthBookings > 0) {

        bookingTrend = 100.0;
        bookingTrendAvailable = true;
    }


    if (previousMonthRevenue > 0) {

        revenueTrend =
                ((currentMonthRevenue - previousMonthRevenue)
                / previousMonthRevenue) * 100.0;

        revenueTrendAvailable = true;

    } else if (currentMonthRevenue > 0) {

        revenueTrend = 100.0;
        revenueTrendAvailable = true;
    }


    String managerTrendText =
            managerTrendAvailable
            ? String.format(
                    "%s%.1f%%",
                    managerTrend >= 0 ? "+" : "",
                    managerTrend
              )
            : "N/A";

    String eventTrendText =
            eventTrendAvailable
            ? String.format(
                    "%s%.1f%%",
                    eventTrend >= 0 ? "+" : "",
                    eventTrend
              )
            : "N/A";

    String bookingTrendText =
            bookingTrendAvailable
            ? String.format(
                    "%s%.1f%%",
                    bookingTrend >= 0 ? "+" : "",
                    bookingTrend
              )
            : "N/A";

    String revenueTrendText =
            revenueTrendAvailable
            ? String.format(
                    "%s%.1f%%",
                    revenueTrend >= 0 ? "+" : "",
                    revenueTrend
              )
            : "N/A";


    String managerTrendColor =
            managerTrendAvailable && managerTrend < 0
            ? "text-error"
            : "text-[#10B981]";

    String eventTrendColor =
            eventTrendAvailable && eventTrend < 0
            ? "text-error"
            : "text-[#10B981]";

    String bookingTrendColor =
            bookingTrendAvailable && bookingTrend < 0
            ? "text-error"
            : "text-[#10B981]";

    String revenueTrendColor =
            revenueTrendAvailable && revenueTrend < 0
            ? "text-error"
            : "text-[#10B981]";


    String managerTrendIcon =
            managerTrendAvailable && managerTrend < 0
            ? "trending_down"
            : "trending_up";

    String eventTrendIcon =
            eventTrendAvailable && eventTrend < 0
            ? "trending_down"
            : "trending_up";

    String bookingTrendIcon =
            bookingTrendAvailable && bookingTrend < 0
            ? "trending_down"
            : "trending_up";

    String revenueTrendIcon =
            revenueTrendAvailable && revenueTrend < 0
            ? "trending_down"
            : "trending_up";
%>

<!DOCTYPE html>

<html class="light" lang="en">

<head>

<meta charset="utf-8"/>

<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

<title>EventHub Admin Dashboard</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link
href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;600;700&family=Inter:wght@400;600&family=JetBrains+Mono&display=swap"
rel="stylesheet"/>

<link
href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined&display=swap"
rel="stylesheet"/>

<script id="tailwind-config">

tailwind.config = {

    darkMode: "class",

    theme: {

        extend: {

            colors: {

                "on-secondary-fixed-variant": "#3a485c",
                "on-secondary-container": "#57657b",
                "error-container": "#ffdad6",
                "on-tertiary-fixed": "#001e2c",
                "surface-container-low": "#f2f4f6",
                "surface": "#f7f9fb",
                "surface-container-highest": "#e0e3e5",
                "error": "#ba1a1a",
                "secondary": "#515f74",
                "on-error": "#ffffff",
                "inverse-surface": "#2d3133",
                "on-background": "#191c1e",
                "on-primary-fixed-variant": "#3f465c",
                "tertiary": "#000000",
                "outline": "#76777d",
                "on-surface": "#191c1e",
                "surface-variant": "#e0e3e5",
                "tertiary-container": "#001e2c",
                "secondary-container": "#d5e3fd",
                "on-primary-container": "#7c839b",
                "surface-container": "#eceef0",
                "surface-bright": "#f7f9fb",
                "tertiary-fixed-dim": "#7bd0ff",
                "on-tertiary-container": "#008ebf",
                "on-secondary": "#ffffff",
                "tertiary-fixed": "#c4e7ff",
                "inverse-on-surface": "#eff1f3",
                "on-error-container": "#93000a",
                "surface-container-lowest": "#ffffff",
                "on-primary-fixed": "#131b2e",
                "on-surface-variant": "#45464d",
                "surface-tint": "#565e74",
                "outline-variant": "#c6c6cd",
                "primary-fixed-dim": "#bec6e0",
                "surface-dim": "#d8dadc",
                "primary-fixed": "#dae2fd",
                "secondary-fixed": "#d5e3fd",
                "primary-fixed": "#dae2fd",
                "secondary-fixed-dim": "#b9c7e0",
                "on-secondary-fixed": "#0d1c2f",
                "inverse-primary": "#bec6e0",
                "background": "#f7f9fb",
                "on-tertiary": "#ffffff",
                "primary": "#000000",
                "surface-container-high": "#e6e8ea",
                "primary-container": "#131b2e",
                "on-tertiary-fixed-variant": "#004c69"

            },

            "borderRadius": {

                "DEFAULT": "0.125rem",
                "lg": "0.25rem",
                "xl": "0.5rem",
                "full": "0.75rem"

            },

            "spacing": {

                "margin-mobile": "16px",
                "gutter": "24px",
                "base": "4px",
                "margin-desktop": "32px",
                "md": "16px",
                "lg": "24px",
                "sm": "8px",
                "xl": "40px",
                "xs": "4px"

            },

            "fontFamily": {

                "headline-lg": ["Hanken Grotesk"],
                "title-md": ["Hanken Grotesk"],
                "body-md": ["Inter"],
                "data-mono": ["JetBrains Mono"],
                "display-lg": ["Hanken Grotesk"],
                "label-caps": ["Inter"],
                "body-sm": ["Inter"],
                "headline-lg-mobile": ["Hanken Grotesk"]

            },

            "fontSize": {

                "headline-lg": [
                    "32px",
                    {
                        "lineHeight": "40px",
                        "letterSpacing": "-0.01em",
                        "fontWeight": "600"
                    }
                ],

                "title-md": [
                    "20px",
                    {
                        "lineHeight": "28px",
                        "fontWeight": "600"
                    }
                ],

                "body-md": [
                    "16px",
                    {
                        "lineHeight": "24px",
                        "fontWeight": "400"
                    }
                ],

                "data-mono": [
                    "13px",
                    {
                        "lineHeight": "18px",
                        "fontWeight": "400"
                    }
                ],

                "display-lg": [
                    "48px",
                    {
                        "lineHeight": "56px",
                        "letterSpacing": "-0.02em",
                        "fontWeight": "700"
                    }
                ],

                "label-caps": [
                    "12px",
                    {
                        "lineHeight": "16px",
                        "letterSpacing": "0.05em",
                        "fontWeight": "600"
                    }
                ],

                "body-sm": [
                    "14px",
                    {
                        "lineHeight": "20px",
                        "fontWeight": "400"
                    }
                ],

                "headline-lg-mobile": [
                    "24px",
                    {
                        "lineHeight": "32px",
                        "fontWeight": "600"
                    }
                ]

            }
        }
    }
}

</script>

<style>

.material-symbols-outlined {

    font-variation-settings:
        'FILL' 0,
        'wght' 400,
        'GRAD' 0,
        'opsz' 24;

}

</style>

</head>


<body class="bg-background text-on-surface font-body-md h-screen overflow-hidden flex">


<!-- SideNavBar -->

<nav
class="bg-surface-container-lowest fixed left-0 top-0 h-full w-[280px] border-r border-outline-variant flex flex-col py-lg px-md z-20 transition-all duration-300 md:translate-x-0 -translate-x-full"
id="sideNav">


<div class="mb-xl flex items-center gap-sm px-sm">

<span class="material-symbols-outlined text-primary text-[32px]">
event
</span>

<div>

<h1 class="font-headline-lg text-headline-lg font-bold text-primary">
EventHub
</h1>

<p class="font-label-caps text-label-caps text-on-surface-variant">
Enterprise Admin
</p>

</div>

</div>


<ul class="flex-1 space-y-sm overflow-y-auto pr-sm">


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-primary font-bold border-l-4 border-primary bg-surface-container-low transition-colors duration-200"
href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

<span
class="material-symbols-outlined"
style="font-variation-settings: 'FILL' 1;">

dashboard

</span>

<span>
Dashboard
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
href="<%= request.getContextPath() %>/ManageUsersServlet">

<span class="material-symbols-outlined">
group
</span>

<span>
Users
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
href="<%= request.getContextPath() %>/ManageEventManagersServlet">

<span class="material-symbols-outlined">
badge
</span>

<span>
Event Managers
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
href="<%= request.getContextPath() %>/ManageEventsServlet">

<span class="material-symbols-outlined">
calendar_today
</span>

<span>
Events
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
href="<%= request.getContextPath() %>/AccessoriesServlet">

<span class="material-symbols-outlined">
inventory_2
</span>

<span>
Accessories
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
href="<%= request.getContextPath() %>/ManageBookingsServlet">

<span class="material-symbols-outlined">
confirmation_number
</span>

<span>
Bookings
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
href="<%= request.getContextPath() %>/ReportsServlet">

<span class="material-symbols-outlined">
assessment
</span>

<span>
Reports
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
href="<%= request.getContextPath() %>/AdminProfileServlet">

<span class="material-symbols-outlined">
account_circle
</span>

<span>
Profile
</span>

</a>

</li>

</ul>


<div class="mt-auto pt-lg border-t border-outline-variant">

<div class="flex items-center gap-sm px-sm">

<img
alt="Admin User Profile"
class="w-10 h-10 rounded-full object-cover border border-outline-variant"
src="https://lh3.googleusercontent.com/aida-public/AB6AXuDmWjQlQiPT8Ht2WgZJpB_njmItpaOXp-B1oTvE5Za_BiCmajL8RB-qViARSzD9fLXEA3yrLN0ruKBK7kjRYfmM4YxLuMe7mY3_OK71h91h6MgqKksIekcrnhr1KzVsNf6AI-g-zvikNJ4IRzwtz8zQaIJ-D7z7vRCxAaSLTwkPdf8h-1R08oy5_tJ3dgCI677-sY221NVbD7JlqICG8-2TmtFj9QntD74AL23ddCkEKCLIwNFtjotvPw"/>

<div>

<p class="font-body-sm text-body-sm font-semibold">
<%= adminName %>
</p>

<p class="font-label-caps text-label-caps text-on-surface-variant">
System Admin
</p>

</div>

</div>

</div>

</nav>


<!-- Main Content Area -->

<div class="flex-1 flex flex-col md:ml-[280px] w-full h-full overflow-hidden relative">


<!-- TopNavBar -->

<header
class="bg-surface-container-lowest h-16 border-b border-outline-variant flex justify-between items-center px-lg z-10 shrink-0 w-full">


<div class="flex items-center gap-md">

<button
class="md:hidden text-on-surface-variant hover:text-primary transition-colors"
id="mobileMenuBtn"
type="button">

<span class="material-symbols-outlined">
menu
</span>

</button>


<div class="relative hidden sm:flex items-center">

<span class="material-symbols-outlined absolute left-sm text-on-surface-variant">
search
</span>

<input
id="dashboardSearch"
class="pl-xl pr-md py-xs rounded-full border border-outline-variant bg-surface-container-low focus:border-tertiary focus:ring-2 focus:ring-tertiary-fixed transition-all text-body-sm font-body-sm outline-none w-64"
placeholder="Search resources..."
type="text"/>

</div>

</div>


<div class="flex items-center gap-lg">


<div class="flex gap-sm">

<button
type="button"
id="notificationBtn"
class="text-on-surface-variant hover:text-primary transition-colors hover:scale-95 active:scale-95 rounded-full p-xs hover:bg-surface-container-low">

<span class="material-symbols-outlined">
notifications
</span>

</button>


<button
type="button"
id="settingsBtn"
class="text-on-surface-variant hover:text-primary transition-colors hover:scale-95 active:scale-95 rounded-full p-xs hover:bg-surface-container-low">

<span class="material-symbols-outlined">
settings
</span>

</button>

</div>


<button
type="button"
id="logoutBtn"
class="font-label-caps text-label-caps text-on-surface-variant hover:text-primary border border-outline-variant px-md py-xs rounded-lg hover:bg-surface-container-low transition-colors">

Logout

</button>

</div>

</header>


<!-- Canvas -->

<main
class="flex-1 overflow-y-auto p-margin-mobile md:p-gutter bg-surface">


<!-- Breadcrumbs -->

<div class="mb-md font-label-caps text-label-caps text-on-surface-variant flex items-center gap-xs">

<span>
EventHub
</span>

<span class="material-symbols-outlined text-[14px]">
chevron_right
</span>

<span class="text-primary font-semibold">
Dashboard
</span>

</div>


<!-- Page Title -->

<div class="mb-lg flex justify-between items-end">

<div>

<h2 class="font-headline-lg text-headline-lg md:text-display-lg md:font-display-lg text-on-surface">
Platform Overview
</h2>

<p class="font-body-sm text-body-sm text-on-surface-variant mt-xs">
Real-time metrics and recent activity for the EventHub ecosystem.
</p>

</div>


<button
type="button"
id="exportReportBtn"
class="hidden sm:flex items-center gap-xs bg-primary text-on-primary px-md py-sm rounded-lg font-label-caps text-label-caps hover:opacity-90 transition-opacity shadow-sm">

<span class="material-symbols-outlined text-[18px]">
download
</span>

Export Report

</button>

</div>


<!-- Stats Grid -->

<div class="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-6 gap-md mb-xl">


<!-- Total Users -->

<div
class="dashboard-card bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between">

<div class="flex justify-between items-start mb-md">

<p class="font-label-caps text-label-caps text-on-surface-variant">
Total Users
</p>

<span class="material-symbols-outlined text-on-surface-variant opacity-50">
group
</span>

</div>

<div>

<p class="font-title-md text-title-md font-bold text-on-surface">
<%= totalUsers %>
</p>

<%
    double userTrend =
            request.getAttribute("userTrend") != null
            ? (Double) request.getAttribute("userTrend")
            : 0.0;

    boolean userTrendAvailable =
            request.getAttribute("userTrendAvailable") != null
            && (Boolean) request.getAttribute("userTrendAvailable");

    String userTrendText =
            userTrendAvailable
            ? String.format(
                    "%s%.1f%%",
                    userTrend >= 0 ? "+" : "",
                    userTrend
              )
            : "N/A";

    String userTrendColor =
            userTrendAvailable && userTrend < 0
            ? "text-error"
            : "text-[#10B981]";

    String userTrendIcon =
            userTrendAvailable && userTrend < 0
            ? "trending_down"
            : "trending_up";
%>

<div class="flex items-center gap-xs mt-xs text-xs">

    <span class="material-symbols-outlined <%= userTrendColor %> text-[14px]">
        <%= userTrendIcon %>
    </span>

    <span class="<%= userTrendColor %> font-semibold">
        <%= userTrendText %>
    </span>

    <span class="text-on-surface-variant text-[10px]">
        vs last mo
    </span>

</div>

</div>

</div>


<!-- Event Managers -->

<div
class="dashboard-card bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between">

<div class="flex justify-between items-start mb-md">

<p class="font-label-caps text-label-caps text-on-surface-variant">
Event Managers
</p>

<span class="material-symbols-outlined text-on-surface-variant opacity-50">
badge
</span>

</div>

<div>

<p class="font-title-md text-title-md font-bold text-on-surface">
<%= totalManagers %>
</p>

<div class="flex items-center gap-xs mt-xs text-xs">

<span class="material-symbols-outlined <%= managerTrendColor %> text-[14px]">
<%= managerTrendIcon %>
</span>

<span class="<%= managerTrendColor %> font-semibold">
<%= managerTrendText %>
</span>

<span class="text-on-surface-variant text-[10px]">
vs last mo
</span>

</div>

</div>

</div>


<!-- Total Events -->

<div
class="dashboard-card bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between">

<div class="flex justify-between items-start mb-md">

<p class="font-label-caps text-label-caps text-on-surface-variant">
Total Events
</p>

<span class="material-symbols-outlined text-on-surface-variant opacity-50">
calendar_today
</span>

</div>

<div>

<p class="font-title-md text-title-md font-bold text-on-surface">
<%= totalEvents %>
</p>

<div class="flex items-center gap-xs mt-xs text-xs">

<span class="material-symbols-outlined <%= eventTrendColor %> text-[14px]">
<%= eventTrendIcon %>
</span>

<span class="<%= eventTrendColor %> font-semibold">
<%= eventTrendText %>
</span>

<span class="text-on-surface-variant text-[10px]">
vs last mo
</span>

</div>

</div>

</div>


<!-- Total Bookings -->

<div
class="dashboard-card bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between">

<div class="flex justify-between items-start mb-md">

<p class="font-label-caps text-label-caps text-on-surface-variant">
Total Bookings
</p>

<span class="material-symbols-outlined text-on-surface-variant opacity-50">
confirmation_number
</span>

</div>

<div>

<p class="font-title-md text-title-md font-bold text-on-surface">
<%= totalBookings %>
</p>

<div class="flex items-center gap-xs mt-xs text-xs">

<span class="material-symbols-outlined <%= bookingTrendColor %> text-[14px]">
<%= bookingTrendIcon %>
</span>

<span class="<%= bookingTrendColor %> font-semibold">
<%= bookingTrendText %>
</span>

<span class="text-on-surface-variant text-[10px]">
vs last mo
</span>

</div>

</div>

</div>


<!-- Revenue -->

<div
class="dashboard-card bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between">

<div class="flex justify-between items-start mb-md">

<p class="font-label-caps text-label-caps text-on-surface-variant">
Total Revenue
</p>

<span class="material-symbols-outlined text-on-surface-variant opacity-50">
payments
</span>

</div>

<div>

<p class="font-title-md text-title-md font-bold text-on-surface">
₹<%= String.format("%,.2f", totalRevenue) %>
</p>

<div class="flex items-center gap-xs mt-xs text-xs">

<span class="material-symbols-outlined <%= revenueTrendColor %> text-[14px]">
<%= revenueTrendIcon %>
</span>

<span class="<%= revenueTrendColor %> font-semibold">
<%= revenueTrendText %>
</span>

<span class="text-on-surface-variant text-[10px]">
vs last mo
</span>

</div>

</div>

</div>


<!-- Accessories -->

<div
class="dashboard-card bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between">

<div class="flex justify-between items-start mb-md">

<p class="font-label-caps text-label-caps text-on-surface-variant">
Accessories
</p>

<span class="material-symbols-outlined text-on-surface-variant opacity-50">
inventory_2
</span>

</div>

<div>

<p class="font-title-md text-title-md font-bold text-on-surface">
<%= totalAccessories %>
</p>

<div class="flex items-center gap-xs mt-xs text-xs">

<span class="text-on-surface-variant text-[10px]">
Date trend unavailable
</span>

</div>

</div>

</div>

</div>

</main>

</div>


<script>

document.addEventListener("DOMContentLoaded", function () {


    /* =====================================================
       MOBILE MENU
       ===================================================== */

    const mobileMenuBtn =
        document.getElementById("mobileMenuBtn");

    const sideNav =
        document.getElementById("sideNav");

    if (mobileMenuBtn && sideNav) {

        mobileMenuBtn.addEventListener(
            "click",
            function () {

                sideNav.classList.toggle(
                    "-translate-x-full"
                );

            }
        );
    }


    /* =====================================================
       NOTIFICATIONS
       ===================================================== */

    const notificationBtn =
        document.getElementById("notificationBtn");

    if (notificationBtn) {

        notificationBtn.addEventListener(
            "click",
            function () {

                alert(
                    "Notifications are not configured yet."
                );

            }
        );
    }


    /* =====================================================
       SETTINGS
       ===================================================== */

    const settingsBtn =
        document.getElementById("settingsBtn");

    if (settingsBtn) {

        settingsBtn.addEventListener(
            "click",
            function () {

                alert(
                    "Settings are not configured yet."
                );

            }
        );
    }


    /* =====================================================
       LOGOUT
       ===================================================== */

    const logoutBtn =
        document.getElementById("logoutBtn");

    if (logoutBtn) {

        logoutBtn.addEventListener(
            "click",
            function () {

                const confirmLogout =
                    confirm(
                        "Are you sure you want to logout?"
                    );

                if (confirmLogout) {

                    window.location.href =
                        "<%= request.getContextPath() %>/admin/admin_login/adminLogin.html";

                }

            }
        );
    }


    /* =====================================================
       DASHBOARD SEARCH
       ===================================================== */

    const dashboardSearch =
        document.getElementById("dashboardSearch");

    const cards =
        document.querySelectorAll(
            ".dashboard-card"
        );

    if (dashboardSearch) {

        dashboardSearch.addEventListener(
            "input",
            function () {

                const query =
                    dashboardSearch.value
                        .toLowerCase()
                        .trim();

                cards.forEach(function (card) {

                    const cardText =
                        card.innerText.toLowerCase();

                    if (
                        query === "" ||
                        cardText.includes(query)
                    ) {

                        card.style.display = "";

                    } else {

                        card.style.display = "none";

                    }

                });

            }
        );
    }


    /* =====================================================
       EXPORT DASHBOARD REPORT
       ===================================================== */

    const exportReportBtn =
        document.getElementById("exportReportBtn");

    if (exportReportBtn) {

        exportReportBtn.addEventListener(
            "click",
            function () {

                const rows = [];

                rows.push([
                    "Metric",
                    "Value",
                    "Current Month",
                    "Previous Month"
                ]);

                rows.push([
                    "Total Users",
                    "<%= totalUsers %>",
                    "N/A",
                    "N/A"
                ]);

                rows.push([
                    "Event Managers",
                    "<%= totalManagers %>",
                    "<%= currentMonthManagers %>",
                    "<%= previousMonthManagers %>"
                ]);

                rows.push([
                    "Total Events",
                    "<%= totalEvents %>",
                    "<%= currentMonthEvents %>",
                    "<%= previousMonthEvents %>"
                ]);

                rows.push([
                    "Total Bookings",
                    "<%= totalBookings %>",
                    "<%= currentMonthBookings %>",
                    "<%= previousMonthBookings %>"
                ]);

                rows.push([
                    "Total Revenue",
                    "₹<%= String.format("%.2f", totalRevenue) %>",
                    "₹<%= String.format("%.2f", currentMonthRevenue) %>",
                    "₹<%= String.format("%.2f", previousMonthRevenue) %>"
                ]);

                rows.push([
                    "Accessories",
                    "<%= totalAccessories %>",
                    "N/A",
                    "N/A"
                ]);


                const csv =
                    rows.map(function (row) {

                        return row.map(function (value) {

                            return '"' +
                                String(value)
                                    .replace(/"/g, '""') +
                                '"';

                        }).join(",");

                    }).join("\n");


                const blob =
                    new Blob(
                        [csv],
                        {
                            type:
                                "text/csv;charset=utf-8;"
                        }
                    );


                const url =
                    URL.createObjectURL(blob);


                const link =
                    document.createElement("a");

                link.href = url;

                link.download =
                    "eventhub-dashboard-report.csv";


                document.body.appendChild(link);

                link.click();

                document.body.removeChild(link);

                URL.revokeObjectURL(url);

            }
        );
    }

});

</script>

</body>
</html>

