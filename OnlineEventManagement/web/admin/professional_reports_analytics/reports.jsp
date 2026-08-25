
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    /*
     * Reports & Analytics
     * Data sources:
     * EVENTS
     * BOOKINGS
     * EVENT_USERS
     * EVENT_MANAGERS
     *
     * No DAO is used, consistent with the Admin module structure.
     */

    String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    String USER = "system";
    String PASSWORD = "manager";

    int totalEvents = 0;
    int totalBookings = 0;
    int totalUsers = 0;

    double totalRevenue = 0.0;

    int confirmedBookings = 0;
    int pendingBookings = 0;
    int cancelledBookings = 0;
    int completedBookings = 0;

    int musicEvents = 0;
    int technologyEvents = 0;
    int sportsEvents = 0;
    int otherEvents = 0;

    String bestMonth = "N/A";
    double averageMonthlyRevenue = 0.0;

    List<Map<String, Object>> monthlyBookings = new ArrayList<>();
    List<Map<String, Object>> monthlyRevenue = new ArrayList<>();
    List<Map<String, Object>> topEvents = new ArrayList<>();
    List<String> managerList = new ArrayList<>();
    List<String> categoryList = new ArrayList<>();

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        con = DriverManager.getConnection(
                URL,
                USER,
                PASSWORD
        );

        /* =========================
           TOTAL EVENTS
           ========================= */
        ps = con.prepareStatement(
                "SELECT COUNT(*) FROM EVENTS"
        );
        rs = ps.executeQuery();

        if (rs.next()) {
            totalEvents = rs.getInt(1);
        }

        rs.close();
        ps.close();


        /* =========================
           TOTAL BOOKINGS
           ========================= */
        ps = con.prepareStatement(
                "SELECT COUNT(*) FROM BOOKINGS"
        );
        rs = ps.executeQuery();

        if (rs.next()) {
            totalBookings = rs.getInt(1);
        }

        rs.close();
        ps.close();


        /* =========================
           TOTAL USERS
           ========================= */
        ps = con.prepareStatement(
                "SELECT COUNT(*) FROM EVENT_USERS"
        );
        rs = ps.executeQuery();

        if (rs.next()) {
            totalUsers = rs.getInt(1);
        }

        rs.close();
        ps.close();


        /* =========================
           TOTAL REVENUE
           ========================= */
        ps = con.prepareStatement(
                "SELECT NVL(SUM(TOTAL_AMOUNT),0) " +
                "FROM BOOKINGS " +
                "WHERE STATUS <> 'CANCELLED' OR STATUS IS NULL"
        );
        rs = ps.executeQuery();

        if (rs.next()) {
            totalRevenue = rs.getDouble(1);
        }

        rs.close();
        ps.close();


        /* =========================
           BOOKING STATUS
           ========================= */
        ps = con.prepareStatement(
                "SELECT UPPER(NVL(STATUS,'UNKNOWN')), COUNT(*) " +
                "FROM BOOKINGS " +
                "GROUP BY UPPER(NVL(STATUS,'UNKNOWN'))"
        );

        rs = ps.executeQuery();

        while (rs.next()) {

            String status = rs.getString(1);
            int count = rs.getInt(2);

            if ("CONFIRMED".equals(status)) {
                confirmedBookings = count;
            } else if ("PENDING".equals(status)) {
                pendingBookings = count;
            } else if ("CANCELLED".equals(status)) {
                cancelledBookings = count;
            } else if ("COMPLETED".equals(status)) {
                completedBookings = count;
            }
        }

        rs.close();
        ps.close();


        /* =========================
           EVENT MANAGERS
           ========================= */
        ps = con.prepareStatement(
                "SELECT DISTINCT NAME " +
                "FROM EVENT_MANAGERS " +
                "WHERE NAME IS NOT NULL " +
                "ORDER BY NAME"
        );

        rs = ps.executeQuery();

        while (rs.next()) {
            managerList.add(rs.getString("NAME"));
        }

        rs.close();
        ps.close();


        /* =========================
           AVAILABLE CATEGORIES
           =========================
           EVENTS does not contain a CATEGORY column.
           Therefore categories cannot be taken from the
           database without inventing data.
        ========================= */

        categoryList.add("All");


        /* =========================
           MONTHLY BOOKINGS
           ========================= */
        ps = con.prepareStatement(
                "SELECT TO_CHAR(BOOKING_DATE,'Mon YYYY') AS MONTH_NAME, " +
                "       COUNT(*) AS BOOKING_COUNT " +
                "FROM BOOKINGS " +
                "WHERE BOOKING_DATE IS NOT NULL " +
                "GROUP BY TO_CHAR(BOOKING_DATE,'Mon YYYY'), " +
                "         TO_CHAR(BOOKING_DATE,'YYYYMM') " +
                "ORDER BY TO_CHAR(BOOKING_DATE,'YYYYMM')"
        );

        rs = ps.executeQuery();

        while (rs.next()) {

            Map<String, Object> item =
                    new HashMap<>();

            item.put(
                    "month",
                    rs.getString("MONTH_NAME")
            );

            item.put(
                    "count",
                    rs.getInt("BOOKING_COUNT")
            );

            monthlyBookings.add(item);
        }

        rs.close();
        ps.close();


        /* =========================
           MONTHLY REVENUE
           ========================= */
        ps = con.prepareStatement(
                "SELECT TO_CHAR(BOOKING_DATE,'Mon YYYY') AS MONTH_NAME, " +
                "       NVL(SUM(TOTAL_AMOUNT),0) AS MONTH_REVENUE " +
                "FROM BOOKINGS " +
                "WHERE BOOKING_DATE IS NOT NULL " +
                "  AND (STATUS <> 'CANCELLED' OR STATUS IS NULL) " +
                "GROUP BY TO_CHAR(BOOKING_DATE,'Mon YYYY'), " +
                "         TO_CHAR(BOOKING_DATE,'YYYYMM') " +
                "ORDER BY TO_CHAR(BOOKING_DATE,'YYYYMM')"
        );

        rs = ps.executeQuery();

        double revenueTotal = 0.0;
        int revenueMonths = 0;
        double bestRevenue = -1.0;

        while (rs.next()) {

            String month =
                    rs.getString("MONTH_NAME");

            double revenue =
                    rs.getDouble("MONTH_REVENUE");

            Map<String, Object> item =
                    new HashMap<>();

            item.put("month", month);
            item.put("revenue", revenue);

            monthlyRevenue.add(item);

            revenueTotal += revenue;
            revenueMonths++;

            if (revenue > bestRevenue) {
                bestRevenue = revenue;
                bestMonth = month;
            }
        }

        if (revenueMonths > 0) {
            averageMonthlyRevenue =
                    revenueTotal / revenueMonths;
        }

        rs.close();
        ps.close();


        /* =========================
           TOP PERFORMING EVENTS
           =========================
           Event category is not available in EVENTS,
           therefore the category column displays N/A.
        ========================= */

        ps = con.prepareStatement(
                "SELECT * FROM (" +
                " SELECT e.EVENT_ID, " +
                "        e.EVENT_NAME, " +
                "        e.CAPACITY, " +
                "        e.STATUS, " +
                "        NVL(SUM(CASE " +
                "            WHEN UPPER(b.STATUS) <> 'CANCELLED' " +
                "                 OR b.STATUS IS NULL " +
                "            THEN NVL(b.QUANTITY,0) " +
                "            ELSE 0 " +
                "        END),0) AS BOOKING_COUNT, " +
                "        NVL(SUM(CASE " +
                "            WHEN UPPER(b.STATUS) <> 'CANCELLED' " +
                "                 OR b.STATUS IS NULL " +
                "            THEN NVL(b.TOTAL_AMOUNT,0) " +
                "            ELSE 0 " +
                "        END),0) AS EVENT_REVENUE " +
                " FROM EVENTS e " +
                " LEFT JOIN BOOKINGS b " +
                "   ON e.EVENT_ID = b.EVENT_ID " +
                " GROUP BY e.EVENT_ID, " +
                "          e.EVENT_NAME, " +
                "          e.CAPACITY, " +
                "          e.STATUS " +
                " ORDER BY BOOKING_COUNT DESC " +
                ") WHERE ROWNUM <= 10"
        );

        rs = ps.executeQuery();

        while (rs.next()) {

            Map<String, Object> item =
                    new HashMap<>();

            int capacity =
                    rs.getInt("CAPACITY");

            int bookingCount =
                    rs.getInt("BOOKING_COUNT");

            double revenue =
                    rs.getDouble("EVENT_REVENUE");

            double occupancy = 0.0;

            if (capacity > 0) {
                occupancy =
                        ((double) bookingCount / capacity) * 100.0;
            }

            item.put(
                    "eventName",
                    rs.getString("EVENT_NAME")
            );

            item.put(
                    "category",
                    "N/A"
            );

            item.put(
                    "bookings",
                    bookingCount
            );

            item.put(
                    "revenue",
                    revenue
            );

            item.put(
                    "capacity",
                    capacity
            );

            item.put(
                    "occupancy",
                    occupancy
            );

            item.put(
                    "status",
                    rs.getString("STATUS")
            );

            topEvents.add(item);
        }

        rs.close();
        ps.close();


        /* =========================
           CATEGORY COUNTS
           =========================
           Since EVENTS has no CATEGORY column, all
           events are represented under "Other".
        ========================= */

        otherEvents = totalEvents;

    } catch (Exception e) {

        request.setAttribute(
                "reportError",
                e.getMessage()
        );

    } finally {

        try {
            if (rs != null) rs.close();
        } catch (Exception ignored) {}

        try {
            if (ps != null) ps.close();
        } catch (Exception ignored) {}

        try {
            if (con != null) con.close();
        } catch (Exception ignored) {}
    }


    int totalStatusBookings =
            confirmedBookings
            + pendingBookings
            + cancelledBookings
            + completedBookings;

    double confirmedPercent = 0;
    double pendingPercent = 0;
    double cancelledPercent = 0;
    double completedPercent = 0;

    if (totalStatusBookings > 0) {

        confirmedPercent =
                ((double) confirmedBookings
                / totalStatusBookings) * 100;

        pendingPercent =
                ((double) pendingBookings
                / totalStatusBookings) * 100;

        cancelledPercent =
                ((double) cancelledBookings
                / totalStatusBookings) * 100;

        completedPercent =
                ((double) completedBookings
                / totalStatusBookings) * 100;
    }


    int maxMonthlyBookings = 1;

    for (Map<String, Object> item : monthlyBookings) {

        int value =
                (Integer) item.get("count");

        if (value > maxMonthlyBookings) {
            maxMonthlyBookings = value;
        }
    }


    double maxMonthlyRevenue = 1.0;

    for (Map<String, Object> item : monthlyRevenue) {

        double value =
                (Double) item.get("revenue");

        if (value > maxMonthlyRevenue) {
            maxMonthlyRevenue = value;
        }
    }
%>

<!DOCTYPE html>

<html class="h-full bg-surface-container-lowest antialiased" lang="en">

<head>

<meta charset="utf-8">

<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Reports & Analytics | EventHub</title>

<script src="https://cdn.tailwindcss.com/?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@600;700&family=Inter:wght@400;600&family=JetBrains+Mono&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">

<script id="tailwind-config">

tailwind.config = {

darkMode: "class",

theme: {

extend: {

"colors": {

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

"headline-lg": ["32px", {
"lineHeight": "40px",
"letterSpacing": "-0.01em",
"fontWeight": "600"
}],

"title-md": ["20px", {
"lineHeight": "28px",
"fontWeight": "600"
}],

"body-md": ["16px", {
"lineHeight": "24px",
"fontWeight": "400"
}],

"data-mono": ["13px", {
"lineHeight": "18px",
"fontWeight": "400"
}],

"display-lg": ["48px", {
"lineHeight": "56px",
"letterSpacing": "-0.02em",
"fontWeight": "700"
}],

"label-caps": ["12px", {
"lineHeight": "16px",
"letterSpacing": "0.05em",
"fontWeight": "600"
}],

"body-sm": ["14px", {
"lineHeight": "20px",
"fontWeight": "400"
}],

"headline-lg-mobile": ["24px", {
"lineHeight": "32px",
"fontWeight": "600"
}]

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

.filled-icon {

font-variation-settings:
'FILL' 1,
'wght' 400,
'GRAD' 0,
'opsz' 24;

}

</style>

</head>


<body class="bg-surface font-body-md text-on-surface h-full flex overflow-hidden">


<!-- SideNavBar -->

<nav class="hidden md:flex flex-col bg-surface-container-lowest fixed left-0 top-0 h-full w-[280px] border-r border-outline-variant py-lg px-md z-20">

<div class="mb-xl flex items-center gap-sm px-sm">

<span class="material-symbols-outlined text-primary text-[32px]">
hub
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


<ul class="flex flex-col gap-sm flex-1">

<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

<span class="material-symbols-outlined">
dashboard
</span>

<span class="font-body-md text-body-md">
Dashboard
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
href="<%= request.getContextPath() %>/ManageUsersServlet">

<span class="material-symbols-outlined">
group
</span>

<span class="font-body-md text-body-md">
Users
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
href="<%= request.getContextPath() %>/ManageEventManagersServlet">

<span class="material-symbols-outlined">
badge
</span>

<span class="font-body-md text-body-md">
Event Managers
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
href="<%= request.getContextPath() %>/ManageEventsServlet">

<span class="material-symbols-outlined">
calendar_today
</span>

<span class="font-body-md text-body-md">
Events
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
href="<%= request.getContextPath() %>/AccessoriesServlet">

<span class="material-symbols-outlined">
inventory_2
</span>

<span class="font-body-md text-body-md">
Accessories
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md py-sm px-md rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
href="<%= request.getContextPath() %>/ManageBookingsServlet">

<span class="material-symbols-outlined">
confirmation_number
</span>

<span class="font-body-md text-body-md">
Bookings
</span>

</a>

</li>


<li>

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-primary font-bold border-r-4 border-primary bg-surface-container-low"
href="<%= request.getContextPath() %>/reports.jsp">

<span class="material-symbols-outlined filled-icon">
assessment
</span>

<span class="font-body-md text-body-md">
Reports
</span>

</a>

</li>

</ul>


<div class="mt-auto pt-lg border-t border-outline-variant">

<a
class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
href="<%= request.getContextPath() %>/AdminProfileServlet">

<img
alt="Admin User Profile"
class="w-8 h-8 rounded-full object-cover border border-outline-variant"
src="https://lh3.googleusercontent.com/aida-public/AB6AXuAG0jGwQ_0Pwa8W0wSuUUfgipihbtL5PKlP4TLfwp3Xl1OFPTF0RZ6BEusENpOhCSRsNrTXtQsJ6ChzZYimWZu6WmKvSKMGr3axERWQFF0AJ3l4BsTDY_Bp6oWaHw7C2kg8mq7V-Ss7j6BscpcrGBV_4MPpAdUxi95RISIqEAsIUKnZbkonmlU80sRf3r24JpvvTcOWzflHkWOIme-31flN-gRxf_WnkDfbukqlImF6cOIVWVDuFUJ2BQ">

<span class="font-body-md text-body-md">
Profile
</span>

</a>

</div>

</nav>


<!-- Main Content Area -->

<div class="flex-1 flex flex-col md:ml-[280px] h-full overflow-hidden">


<!-- TopNavBar -->

<header class="bg-surface-container-lowest h-16 flex justify-between items-center px-lg border-b border-outline-variant flex-shrink-0 z-10">


<div class="flex-1 max-w-md hidden md:flex items-center bg-surface-container-low rounded-full px-md py-sm border border-outline-variant">

<span class="material-symbols-outlined text-on-surface-variant mr-sm">
search
</span>

<input
id="reportSearch"
class="bg-transparent border-none outline-none text-body-sm font-body-sm w-full text-on-surface placeholder-on-surface-variant focus:ring-0 p-0"
placeholder="Search reports..."
type="text">

</div>


<button
type="button"
onclick="toggleMenu()"
class="md:hidden text-on-surface-variant p-sm rounded-lg hover:bg-surface-container-low">

<span class="material-symbols-outlined">
menu
</span>

</button>


<div class="flex items-center gap-md">

<button
type="button"
onclick="showNotifications()"
class="text-on-surface-variant hover:text-primary transition-colors p-sm rounded-full hover:bg-surface-container-low relative">

<span class="material-symbols-outlined">
notifications
</span>

<span class="absolute top-2 right-2 w-2 h-2 bg-error rounded-full">
</span>

</button>


<button
type="button"
onclick="showSettings()"
class="text-on-surface-variant hover:text-primary transition-colors p-sm rounded-full hover:bg-surface-container-low">

<span class="material-symbols-outlined">
settings
</span>

</button>


<div class="h-6 w-px bg-outline-variant mx-sm">
</div>


<button
type="button"
onclick="logout()"
class="font-label-caps text-label-caps text-secondary hover:text-primary transition-colors flex items-center gap-xs">

Logout

<span class="material-symbols-outlined text-[16px]">
logout
</span>

</button>

</div>

</header>


<!-- Scrollable Canvas -->

<main class="flex-1 overflow-y-auto p-margin-mobile md:p-margin-desktop bg-surface">


<!-- Header Section -->

<div class="flex flex-col mb-xl gap-md">

<div class="flex flex-col md:flex-row justify-between items-start md:items-end gap-md">

<div>

<h2 class="font-headline-lg-mobile md:font-headline-lg text-headline-lg-mobile md:text-headline-lg text-primary mb-sm">
Reports & Analytics
</h2>

<p class="font-body-md text-body-md text-on-surface-variant">
Monitor events, bookings, users, and revenue performance.
</p>

</div>


<div class="flex gap-sm flex-wrap">

<button
type="button"
onclick="exportCSV()"
class="flex items-center gap-xs px-md py-sm border border-outline-variant rounded-lg bg-surface-container-lowest text-on-surface hover:bg-surface-container-low transition-colors font-label-caps text-label-caps">

<span class="material-symbols-outlined text-[18px]">
download
</span>

Export CSV

</button>


<button
type="button"
onclick="exportPDF()"
class="flex items-center gap-xs px-md py-sm border border-outline-variant rounded-lg bg-surface-container-lowest text-on-surface hover:bg-surface-container-low transition-colors font-label-caps text-label-caps">

<span class="material-symbols-outlined text-[18px]">
picture_as_pdf
</span>

Export PDF

</button>


<button
type="button"
onclick="printReport()"
class="flex items-center gap-xs px-md py-sm border border-outline-variant rounded-lg bg-surface-container-lowest text-on-surface hover:bg-surface-container-low transition-colors font-label-caps text-label-caps">

<span class="material-symbols-outlined text-[18px]">
print
</span>

Print Report

</button>

</div>

</div>


<!-- Filters -->

<div class="flex flex-wrap items-center gap-sm mt-md bg-surface-container-lowest p-sm border border-outline-variant rounded-xl">


<select
id="dateFilter"
onchange="applyFilters()"
class="bg-surface-container-low border border-outline-variant text-on-surface font-body-sm rounded-lg pl-sm pr-lg py-xs">

<option value="ALL">
Date Range
</option>

<option value="TODAY">
Today
</option>

<option value="7">
Last 7 Days
</option>

<option value="30">
Last 30 Days
</option>

<option value="90">
Last 3 Months
</option>

<option value="YEAR">
This Year
</option>

</select>


<select
id="managerFilter"
onchange="applyFilters()"
class="bg-surface-container-low border border-outline-variant text-on-surface font-body-sm rounded-lg pl-sm pr-lg py-xs">

<option value="ALL">
Event Manager
</option>

<%
    for (String manager : managerList) {
%>

<option value="<%= manager %>">
<%= manager %>
</option>

<%
    }
%>

</select>


<button
type="button"
onclick="clearFilters()"
class="flex items-center gap-xs px-md py-xs border border-outline-variant rounded-lg bg-surface-container-lowest hover:bg-surface-container-low transition-colors font-label-caps text-label-caps">

<span class="material-symbols-outlined text-[16px]">
filter_alt_off
</span>

Clear Filters

</button>

</div>

</div>


<!-- Key Metrics -->

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-gutter mb-xl">


<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between h-[140px]">

<div class="flex justify-between items-start">

<span class="font-label-caps text-label-caps text-on-surface-variant">
Total Revenue
</span>

<span class="material-symbols-outlined text-secondary bg-surface-container-low p-xs rounded">
currency_rupee
</span>

</div>

<div>

<div class="font-title-md text-title-md text-primary">
₹<%= String.format("%,.2f", totalRevenue) %>
</div>

<div class="text-[12px] text-on-surface-variant mt-xs">
Current database total
</div>

</div>

</div>


<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between h-[140px]">

<div class="flex justify-between items-start">

<span class="font-label-caps text-label-caps text-on-surface-variant">
Total Bookings
</span>

<span class="material-symbols-outlined text-secondary bg-surface-container-low p-xs rounded">
confirmation_number
</span>

</div>

<div>

<div class="font-title-md text-title-md text-primary">
<%= totalBookings %>
</div>

<div class="text-[12px] text-on-surface-variant mt-xs">
All booking records
</div>

</div>

</div>


<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between h-[140px]">

<div class="flex justify-between items-start">

<span class="font-label-caps text-label-caps text-on-surface-variant">
Total Events
</span>

<span class="material-symbols-outlined text-secondary bg-surface-container-low p-xs rounded">
event
</span>

</div>

<div>

<div class="font-title-md text-title-md text-primary">
<%= totalEvents %>
</div>

<div class="text-[12px] text-on-surface-variant mt-xs">
All event records
</div>

</div>

</div>


<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between h-[140px]">

<div class="flex justify-between items-start">

<span class="font-label-caps text-label-caps text-on-surface-variant">
Total Users
</span>

<span class="material-symbols-outlined text-secondary bg-surface-container-low p-xs rounded">
group
</span>

</div>

<div>

<div class="font-title-md text-title-md text-primary">
<%= totalUsers %>
</div>

<div class="text-[12px] text-on-surface-variant mt-xs">
All registered users
</div>

</div>

</div>

</div>


<!-- Booking Trends -->

<div class="grid grid-cols-1 lg:grid-cols-2 gap-gutter mb-xl">


<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg flex flex-col h-[400px]">

<div class="flex justify-between items-center mb-md">

<h3 class="font-title-md text-title-md text-primary">
Booking Trends
</h3>

<div class="text-body-sm text-on-surface-variant">
<%= monthlyBookings.size() %> reporting period(s)
</div>

</div>


<div class="flex-1 relative border-l border-b border-outline-variant mt-sm overflow-hidden">

<div class="absolute inset-0 flex flex-col justify-between pointer-events-none">

<div class="border-t border-outline-variant border-dashed">
</div>

<div class="border-t border-outline-variant border-dashed">
</div>

<div class="border-t border-outline-variant border-dashed">
</div>

<div class="border-t border-outline-variant border-dashed">
</div>

</div>


<svg
class="w-full h-full block"
viewBox="0 0 100 100"
preserveAspectRatio="none">

<polyline
fill="none"
points="<%
    if (!monthlyBookings.isEmpty()) {

        for (int i = 0; i < monthlyBookings.size(); i++) {

            int count =
                    (Integer) monthlyBookings.get(i).get("count");

            double x;

            if (monthlyBookings.size() == 1) {
                x = 50;
            } else {
                x =
                    ((double) i /
                    (monthlyBookings.size() - 1)) * 100;
            }

            double y =
                    100 -
                    (((double) count /
                    maxMonthlyBookings) * 90);

            out.print(String.format(
                    java.util.Locale.US,
                    "%.2f,%.2f ",
                    x,
                    y
            ));
        }

    } else {

        out.print("0,100 100,100");
    }
%>"
stroke="#000000"
stroke-linejoin="round"
stroke-width="2">
</polyline>


<%
    for (int i = 0; i < monthlyBookings.size(); i++) {

        int count =
                (Integer) monthlyBookings.get(i).get("count");

        double x;

        if (monthlyBookings.size() == 1) {
            x = 50;
        } else {
            x =
                ((double) i /
                (monthlyBookings.size() - 1)) * 100;
        }

        double y =
                100 -
                (((double) count /
                maxMonthlyBookings) * 90);
%>

<circle
cx="<%= x %>"
cy="<%= y %>"
fill="#ffffff"
r="1.5"
stroke="#000000"
stroke-width="1">
</circle>

<%
    }
%>

</svg>

</div>


<div class="flex justify-between mt-sm text-[11px] text-on-surface-variant">

<%
    if (!monthlyBookings.isEmpty()) {
%>

<span>
<%= monthlyBookings.get(0).get("month") %>
</span>

<span>
<%= monthlyBookings.get(monthlyBookings.size() - 1).get("month") %>
</span>

<%
    } else {
%>

<span>
No booking history
</span>

<%
    }
%>

</div>

</div>


<!-- Revenue Overview -->

<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg flex flex-col h-[400px]">

<div class="flex justify-between items-center mb-md">

<h3 class="font-title-md text-title-md text-primary">
Revenue Overview
</h3>

<div class="flex gap-sm font-label-caps text-[10px] text-on-surface-variant">

<span>
Total: ₹<%= String.format("%,.2f", totalRevenue) %>
</span>

<span>
Avg: ₹<%= String.format("%,.2f", averageMonthlyRevenue) %>/period
</span>

<span>
Best: <%= bestMonth %>
</span>

</div>

</div>


<div class="flex-1 relative border-l border-b border-outline-variant mt-sm overflow-hidden">


<div class="absolute inset-0 flex items-end justify-around px-2 pb-1 gap-2">

<%
    for (Map<String, Object> item : monthlyRevenue) {

        double revenue =
                (Double) item.get("revenue");

        double height =
                (revenue / maxMonthlyRevenue) * 85;

        if (height < 3 && revenue > 0) {
            height = 3;
        }
%>

<div
title="<%= item.get("month") %>: ₹<%= String.format("%,.2f", revenue) %>"
class="flex-1 max-w-[48px] bg-primary rounded-t"
style="height:<%= height %>%;">
</div>

<%
    }

    if (monthlyRevenue.isEmpty()) {
%>

<div class="text-center text-sm text-on-surface-variant w-full">
No revenue history
</div>

<%
    }
%>

</div>

</div>

</div>

</div>


<!-- Status Analysis -->

<div class="grid grid-cols-1 lg:grid-cols-2 gap-gutter mb-xl">


<!-- Events by Category -->

<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg flex flex-col">

<h3 class="font-title-md text-title-md text-primary mb-lg">
Events by Category
</h3>


<div class="flex items-center justify-center flex-1 py-md">

<div class="relative w-40 h-40 rounded-full border-[16px] border-surface-container-low flex items-center justify-center">

<div class="absolute inset-0 flex flex-col items-center justify-center">

<span class="font-title-md text-primary">
<%= totalEvents %>
</span>

<span class="font-label-caps text-on-surface-variant text-[10px]">
Total
</span>

</div>

</div>

</div>


<div class="grid grid-cols-2 gap-sm mt-md font-body-sm text-[12px]">

<div class="flex justify-between">
<span>Available database categories</span>
<span class="font-data-mono">
N/A
</span>
</div>

<div class="flex justify-between">
<span>Events without category</span>
<span class="font-data-mono">
<%= otherEvents %>
</span>
</div>

</div>

</div>


<!-- Booking Status -->

<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg flex flex-col">

<h3 class="font-title-md text-title-md text-primary mb-lg">
Booking Status
</h3>


<div class="flex items-center justify-center flex-1 py-md">

<div
class="relative w-40 h-40 rounded-full border-[16px] border-surface-container-low flex items-center justify-center">

<div class="absolute inset-0 flex flex-col items-center justify-center">

<span class="font-title-md text-primary">
<%= totalStatusBookings %>
</span>

<span class="font-label-caps text-on-surface-variant text-[10px]">
Bookings
</span>

</div>

</div>

</div>


<div class="grid grid-cols-2 gap-sm mt-md font-body-sm text-[12px]">

<div class="flex justify-between">
<span>Confirmed</span>
<span class="font-data-mono">
<%= confirmedBookings %>
</span>
</div>

<div class="flex justify-between">
<span>Pending</span>
<span class="font-data-mono">
<%= pendingBookings %>
</span>
</div>

<div class="flex justify-between">
<span>Completed</span>
<span class="font-data-mono">
<%= completedBookings %>
</span>
</div>

<div class="flex justify-between">
<span>Cancelled</span>
<span class="font-data-mono">
<%= cancelledBookings %>
</span>
</div>

</div>

</div>

</div>


<!-- Top Performing Events -->

<div class="bg-surface-container-lowest border border-outline-variant rounded-xl overflow-hidden flex flex-col mb-xl">


<div class="p-md border-b border-outline-variant flex justify-between items-center">

<h3 class="font-title-md text-title-md text-primary">
Top Performing Events
</h3>

<a
href="<%= request.getContextPath() %>/ManageEventsServlet"
class="font-label-caps text-label-caps text-secondary hover:text-primary transition-colors">

View All

</a>

</div>


<div class="overflow-x-auto">

<table class="w-full text-left border-collapse whitespace-nowrap">

<thead>

<tr class="bg-surface-container-low font-label-caps text-label-caps text-on-surface-variant border-b border-outline-variant">

<th class="p-sm font-semibold pl-md">
Event
</th>

<th class="p-sm font-semibold">
Category
</th>

<th class="p-sm font-semibold text-right">
Bookings
</th>

<th class="p-sm font-semibold text-right">
Revenue
</th>

<th class="p-sm font-semibold text-right">
Capacity
</th>

<th class="p-sm font-semibold text-right">
Occupancy
</th>

<th class="p-sm font-semibold text-right pr-md">
Status
</th>

</tr>

</thead>


<tbody class="font-body-sm text-body-sm">

<%
    if (!topEvents.isEmpty()) {

        for (Map<String, Object> event : topEvents) {

            int bookings =
                    (Integer) event.get("bookings");

            double revenue =
                    (Double) event.get("revenue");

            int capacity =
                    (Integer) event.get("capacity");

            double occupancy =
                    (Double) event.get("occupancy");

            String status =
                    event.get("status") != null
                    ? event.get("status").toString()
                    : "UNKNOWN";

            String performanceClass;

            if (occupancy >= 80) {
                performanceClass =
                        "bg-tertiary-fixed text-on-tertiary-fixed";
            } else if (occupancy >= 50) {
                performanceClass =
                        "bg-secondary-container text-on-secondary-container";
            } else {
                performanceClass =
                        "bg-surface-container-high text-on-surface-variant";
            }
%>

<tr class="border-b border-surface-container-high hover:bg-surface-bright transition-colors">

<td class="p-sm pl-md font-medium text-primary">
<%= event.get("eventName") %>
</td>

<td class="p-sm">
<%= event.get("category") %>
</td>

<td class="p-sm text-right font-data-mono">
<%= bookings %>
</td>

<td class="p-sm text-right font-data-mono">
₹<%= String.format("%,.2f", revenue) %>
</td>

<td class="p-sm text-right font-data-mono">
<%= capacity %>
</td>

<td class="p-sm text-right font-data-mono">
<%= String.format("%.1f", occupancy) %>%
</td>

<td class="p-sm text-right pr-md">

<span class="px-2 py-1 <%= performanceClass %> rounded text-[11px] font-label-caps">

<%= status %>

</span>

</td>

</tr>

<%
        }

    } else {
%>

<tr>

<td colspan="7" class="p-md text-center text-on-surface-variant">
No event data available.
</td>

</tr>

<%
    }
%>

</tbody>

</table>

</div>

</div>


<!-- Footer -->

<footer class="w-full py-md border-t border-outline-variant mt-xl flex justify-center items-center gap-lg px-lg">

<span class="font-label-caps text-label-caps text-secondary">

© 2026 EventHub Enterprise. All rights reserved.

</span>

<div class="flex gap-md">

<a
class="font-label-caps text-label-caps text-on-surface-variant hover:text-primary transition-colors"
href="#">

Security Policy

</a>

<a
class="font-label-caps text-label-caps text-on-surface-variant hover:text-primary transition-colors"
href="#">

Terms of Service

</a>

<a
class="font-label-caps text-label-caps text-on-surface-variant hover:text-primary transition-colors"
href="#">

Help Center

</a>

</div>

</footer>


</main>

</div>


<script>

function toggleMenu() {
    alert("Mobile navigation is available on the desktop sidebar.");
}

function showNotifications() {
    alert("No new notifications.");
}

function showSettings() {
    alert("Settings are not configured for the Admin module yet.");
}

function logout() {

    if (confirm("Are you sure you want to logout?")) {

        window.location.href =
            "<%= request.getContextPath() %>/admin/admin_login/adminLogin.html";

    }
}


function printReport() {
    window.print();
}


function exportPDF() {

    alert(
        "Use the print dialog and select 'Save as PDF' to export this report."
    );

    window.print();
}


function exportCSV() {

    const rows = [];

    rows.push([
        "Event",
        "Category",
        "Bookings",
        "Revenue",
        "Capacity",
        "Occupancy",
        "Status"
    ]);

    document
        .querySelectorAll("table tbody tr")
        .forEach(function(row) {

            const cells =
                row.querySelectorAll("td");

            if (cells.length === 7) {

                const values = [];

                cells.forEach(function(cell) {

                    values.push(
                        '"' +
                        cell.innerText
                            .replace(/\s+/g, " ")
                            .trim()
                            .replace(/"/g, '""') +
                        '"'
                    );

                });

                rows.push(values);
            }

        });


    const csv =
        rows.map(function(row) {
            return Array.isArray(row)
                ? row.join(",")
                : row;
        }).join("\n");


    const blob =
        new Blob(
            [csv],
            { type: "text/csv;charset=utf-8;" }
        );


    const url =
        URL.createObjectURL(blob);

    const link =
        document.createElement("a");

    link.href = url;
    link.download =
        "eventhub-report.csv";

    document.body.appendChild(link);

    link.click();

    document.body.removeChild(link);

    URL.revokeObjectURL(url);
}


function applyFilters() {

    const manager =
        document.getElementById("managerFilter").value;

    const search =
        document.getElementById("reportSearch").value
            .toLowerCase()
            .trim();


    document
        .querySelectorAll("table tbody tr")
        .forEach(function(row) {

            const text =
                row.innerText.toLowerCase();

            let visible = true;


            if (
                search &&
                !text.includes(search)
            ) {

                visible = false;
            }


            /*
             * The available reports table does not expose
             * manager names because the existing EVENTS schema
             * does not provide a manager-name column in this table.
             * Therefore manager filtering is intentionally applied
             * only when a name is represented in the row.
             */

            if (
                manager !== "ALL" &&
                !text.includes(
                    manager.toLowerCase()
                )
            ) {

                visible = false;
            }


            row.style.display =
                visible ? "" : "none";

        });
}


function clearFilters() {

    document.getElementById("dateFilter").value =
        "ALL";

    document.getElementById("managerFilter").value =
        "ALL";

    document.getElementById("reportSearch").value =
        "";

    applyFilters();
}


/*
 * Search reports from the top search box.
 */
document
    .getElementById("reportSearch")
    .addEventListener(
        "input",
        applyFilters
    );

</script>


</body>
</html>

