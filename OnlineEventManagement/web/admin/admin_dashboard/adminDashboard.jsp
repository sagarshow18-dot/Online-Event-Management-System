
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    int totalUsers = 0;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        Connection con = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:XE",
            "system",
            "manager"
        );

        Statement stmt = con.createStatement();

        ResultSet rs = stmt.executeQuery(
            "SELECT COUNT(*) FROM EVENT_USERS"
        );

        if (rs.next()) {
            totalUsers = rs.getInt(1);
        }

        rs.close();
        stmt.close();
        con.close();

    } catch (Exception e) {
        out.println(e);
    }
%>

<%
    int totalManagers = 0;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        Connection con2 = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:XE",
            "system",
            "manager"
        );

        Statement stmt2 = con2.createStatement();

        ResultSet rs2 = stmt2.executeQuery(
            "SELECT COUNT(*) FROM EVENT_MANAGERS"
        );

        if (rs2.next()) {
            totalManagers = rs2.getInt(1);
        }

        con2.close();

    } catch (Exception e) {
        out.println(e);
    }
%>

<%
    int totalEvents = 0;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        Connection con3 = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:XE",
            "system",
            "manager"
        );

        Statement stmt3 = con3.createStatement();

        ResultSet rs3 = stmt3.executeQuery(
            "SELECT COUNT(*) FROM EVENTS"
        );

        if (rs3.next()) {
            totalEvents = rs3.getInt(1);
        }

        con3.close();

    } catch (Exception e) {
        out.println(e);
    }
%>

<%
    int totalBookings = 0;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        Connection con4 = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:XE",
            "system",
            "manager"
        );

        Statement stmt4 = con4.createStatement();

        ResultSet rs4 = stmt4.executeQuery(
            "SELECT COUNT(*) FROM BOOKINGS"
        );

        if (rs4.next()) {
            totalBookings = rs4.getInt(1);
        }

        rs4.close();
        stmt4.close();
        con4.close();

    } catch (Exception e) {
        out.println(e);
    }
%>

<%
    double totalRevenue = 0;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        Connection con5 = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:XE",
            "system",
            "manager"
        );

        Statement stmt5 = con5.createStatement();

        ResultSet rs5 = stmt5.executeQuery(
            "SELECT NVL(SUM(TOTAL_AMOUNT), 0) FROM BOOKINGS"
        );

        if (rs5.next()) {
            totalRevenue = rs5.getDouble(1);
        }

        rs5.close();
        stmt5.close();
        con5.close();

    } catch (Exception e) {
        out.println(e);
    }
%>

<%
    int totalAccessories = 0;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        Connection con6 = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:XE",
            "system",
            "manager"
        );

        Statement stmt6 = con6.createStatement();

        ResultSet rs6 = stmt6.executeQuery(
            "SELECT COUNT(*) FROM ACCESSORIES"
        );

        if (rs6.next()) {
            totalAccessories = rs6.getInt(1);
        }

        rs6.close();
        stmt6.close();
        con6.close();

    } catch (Exception e) {
        out.println(e);
    }
%>
<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>EventHub Admin Dashboard</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;600;700&amp;family=Inter:wght@400;600&amp;family=JetBrains+Mono:wght@400&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined&amp;display=swap" rel="stylesheet"/>
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
                        "headline-lg": ["32px", { "lineHeight": "40px", "letterSpacing": "-0.01em", "fontWeight": "600" }],
                        "title-md": ["20px", { "lineHeight": "28px", "fontWeight": "600" }],
                        "body-md": ["16px", { "lineHeight": "24px", "fontWeight": "400" }],
                        "data-mono": ["13px", { "lineHeight": "18px", "fontWeight": "400" }],
                        "display-lg": ["48px", { "lineHeight": "56px", "letterSpacing": "-0.02em", "fontWeight": "700" }],
                        "label-caps": ["12px", { "lineHeight": "16px", "letterSpacing": "0.05em", "fontWeight": "600" }],
                        "body-sm": ["14px", { "lineHeight": "20px", "fontWeight": "400" }],
                        "headline-lg-mobile": ["24px", { "lineHeight": "32px", "fontWeight": "600" }]
                    }
                }
            }
        }
    </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
    </style>
</head>
<body class="bg-background text-on-surface font-body-md h-screen overflow-hidden flex">
<!-- SideNavBar -->
<nav class="bg-surface-container-lowest fixed left-0 top-0 h-full w-[280px] border-r border-outline-variant flex flex-col py-lg px-md z-20 transition-all duration-300 md:translate-x-0 -translate-x-full" id="sideNav">

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


    <ul class="flex-1 space-y-sm overflow-y-auto pr-sm custom-scrollbar">


        <!-- Dashboard - Active -->

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


        <!-- Users -->

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


        <!-- Event Managers -->

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


        <!-- Events - Not connected yet -->

        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
                href="#">

                <span class="material-symbols-outlined">
                    calendar_today
                </span>

                <span>
                    Events
                </span>

            </a>

        </li>


        <!-- Accessories - Not connected yet -->

        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
                href="#">

                <span class="material-symbols-outlined">
                    inventory_2
                </span>

                <span>
                    Accessories
                </span>

            </a>

        </li>


        <!-- Bookings - Not connected yet -->

        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
                href="#">

                <span class="material-symbols-outlined">
                    confirmation_number
                </span>

                <span>
                    Bookings
                </span>

            </a>

        </li>


        <!-- Reports - Not connected yet -->

        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
                href="#">

                <span class="material-symbols-outlined">
                    assessment
                </span>

                <span>
                    Reports
                </span>

            </a>

        </li>


        <!-- Profile -->

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


    <!-- Admin User -->

    <div class="mt-auto pt-lg border-t border-outline-variant">

        <div class="flex items-center gap-sm px-sm">

            <img
                alt="Admin User Profile"
                class="w-10 h-10 rounded-full object-cover border border-outline-variant"
                src="https://lh3.googleusercontent.com/aida-public/AB6AXuDmWjQlQiPT8Ht2WgZJpB_njmItpaOXp-B1oTvE5Za_BiCmajL8RB-qViARSzD9fLXEA3yrLN0ruKBK7kjRYfmM4YxLuMe7mY3_OK71h91h6MgqKksIekcrnhr1KzVsNf6AI-g-zvikNJ4IRzwtz8zQaIJ-D7z7vRCxAaSLTwkPdf8h-1R08oy5_tJ3dgCI677-sY221NVbD7JlqICG8-2TmtFj9QntD74AL23ddCkEKCLIwNFtjotvPw"/>

            <div>

                <p class="font-body-sm text-body-sm font-semibold">
                    Jane Doe
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
<header class="bg-surface-container-lowest h-16 border-b border-outline-variant flex justify-between items-center px-lg z-10 shrink-0 w-full"> 
<div class="flex items-center gap-md"> 
<button class="md:hidden text-on-surface-variant hover:text-primary transition-colors" id="mobileMenuBtn"> 
<span class="material-symbols-outlined">menu</span> 
</button> 
<div class="relative hidden sm:flex items-center"> 
<span class="material-symbols-outlined absolute left-sm text-on-surface-variant">search</span> 
<input class="pl-xl pr-md py-xs rounded-full border border-outline-variant bg-surface-container-low focus:border-tertiary focus:ring-2 focus:ring-tertiary-fixed transition-all text-body-sm font-body-sm outline-none w-64" placeholder="Search resources..." type="text"/> 
</div> 
</div> 
<div class="flex items-center gap-lg"> 
<div class="flex gap-sm"> 
<button class="text-on-surface-variant hover:text-primary transition-colors hover:scale-95 active:scale-95 rounded-full p-xs hover:bg-surface-container-low"> 
<span class="material-symbols-outlined">notifications</span> 
</button> 
<button class="text-on-surface-variant hover:text-primary transition-colors hover:scale-95 active:scale-95 rounded-full p-xs hover:bg-surface-container-low"> 
<span class="material-symbols-outlined">settings</span> 
</button> 
</div> 
<button class="font-label-caps text-label-caps text-on-surface-variant hover:text-primary border border-outline-variant px-md py-xs rounded-lg hover:bg-surface-container-low transition-colors"> 
                    Logout 
                </button> 
</div> 
</header> 
<!-- Canvas --> 
<main class="flex-1 overflow-y-auto p-margin-mobile md:p-gutter bg-surface custom-scrollbar"> 
<!-- Breadcrumbs --> 
<div class="mb-md font-label-caps text-label-caps text-on-surface-variant flex items-center gap-xs"> 
<span>EventHub</span> 
<span class="material-symbols-outlined text-[14px]">chevron_right</span> 
<span class="text-primary font-semibold">Dashboard</span> 
</div> 
<!-- Page Title --> 
<div class="mb-lg flex justify-between items-end"> 
<div> 
<h2 class="font-headline-lg text-headline-lg md:text-display-lg md:font-display-lg text-on-surface">Platform Overview</h2> 
<p class="font-body-sm text-body-sm text-on-surface-variant mt-xs">Real-time metrics and recent activity for the EventHub ecosystem.</p> 
</div> 
<button class="hidden sm:flex items-center gap-xs bg-primary text-on-primary px-md py-sm rounded-lg font-label-caps text-label-caps hover:opacity-90 transition-opacity shadow-sm"> 
<span class="material-symbols-outlined text-[18px]">download</span> 
                    Export Report 
                </button> 
</div> 
<!-- Stats Grid --> 
<div class="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-6 gap-md mb-xl"> 
<!-- Stat Card 1 --> 
<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between"> 
<div class="flex justify-between items-start mb-md"> 
<p class="font-label-caps text-label-caps text-on-surface-variant">Total Users</p> 
<span class="material-symbols-outlined text-on-surface-variant opacity-50">group</span> 
</div> 
<div> 
<p class="font-title-md text-title-md font-bold text-on-surface"><%= totalUsers %></p> 
<div class="flex items-center gap-xs mt-xs text-xs"> 
<span class="material-symbols-outlined text-[#10B981] text-[14px]">trending_up</span> 
<span class="text-[#10B981] font-semibold">+12.5%</span> 
<span class="text-on-surface-variant text-[10px]">vs last mo</span> 
</div> 
</div> 
</div> 
<!-- Stat Card 2 --> 
<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between"> 
<div class="flex justify-between items-start mb-md"> 
<p class="font-label-caps text-label-caps text-on-surface-variant">Event Managers</p> 
<span class="material-symbols-outlined text-on-surface-variant opacity-50">badge</span> 
</div> 
<div> 
<p class="font-title-md text-title-md font-bold text-on-surface"><%= totalManagers %></p>
<div class="flex items-center gap-xs mt-xs text-xs"> 
<span class="material-symbols-outlined text-[#10B981] text-[14px]">trending_up</span> 
<span class="text-[#10B981] font-semibold">+3.2%</span> 
<span class="text-on-surface-variant text-[10px]">vs last mo</span> 
</div> 
</div> 
</div> 
<!-- Stat Card 3 --> 
<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between"> 
<div class="flex justify-between items-start mb-md"> 
<p class="font-label-caps text-label-caps text-on-surface-variant">Total Events</p> 
<span class="material-symbols-outlined text-on-surface-variant opacity-50">calendar_today</span> 
</div> 
<div> 
<p class="font-title-md text-title-md font-bold text-on-surface"><%= totalEvents %></p> 
<div class="flex items-center gap-xs mt-xs text-xs"> 
<span class="material-symbols-outlined text-[#10B981] text-[14px]">trending_up</span> 
<span class="text-[#10B981] font-semibold">+24.1%</span> 
<span class="text-on-surface-variant text-[10px]">vs last mo</span> 
</div> 
</div> 
</div> 
<!-- Stat Card 4 --> 
<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between"> 
<div class="flex justify-between items-start mb-md"> 
<p class="font-label-caps text-label-caps text-on-surface-variant">Total Bookings</p> 
<span class="material-symbols-outlined text-on-surface-variant opacity-50">confirmation_number</span> 
</div> 
<div> 
<p class="font-title-md text-title-md font-bold text-on-surface"><%= totalBookings %></p> 
<div class="flex items-center gap-xs mt-xs text-xs"> 
<span class="material-symbols-outlined text-[#10B981] text-[14px]">trending_up</span> 
<span class="text-[#10B981] font-semibold">+18.7%</span> 
<span class="text-on-surface-variant text-[10px]">vs last mo</span> 
</div> 
</div> 
</div> 
<!-- Stat Card 5 --> 
<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between"> 
<div class="flex justify-between items-start mb-md"> 
<p class="font-label-caps text-label-caps text-on-surface-variant">Total Revenue</p> 
<span class="material-symbols-outlined text-on-surface-variant opacity-50">payments</span> 
</div> 
<div> 
<p class="font-title-md text-title-md font-bold text-on-surface">
    ₹<%= String.format("%.2f", totalRevenue) %>
</p> 
<div class="flex items-center gap-xs mt-xs text-xs"> 
<span class="material-symbols-outlined text-[#10B981] text-[14px]">trending_up</span> 
<span class="text-[#10B981] font-semibold">+8.4%</span> 
<span class="text-on-surface-variant text-[10px]">vs last mo</span> 
</div> 
</div> 
</div> 
<!-- Stat Card 6 --> 
<div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-md flex flex-col justify-between"> 
<div class="flex justify-between items-start mb-md"> 
<p class="font-label-caps text-label-caps text-on-surface-variant">Accessories</p> 
<span class="material-symbols-outlined text-on-surface-variant opacity-50">inventory_2</span> 
</div> 
<div> 
<p class="font-title-md text-title-md font-bold text-on-surface">
    <%= totalAccessories %>
</p> 
<div class="flex items-center gap-xs mt-xs text-xs"> 
<span class="material-symbols-outlined text-error text-[14px]">trending_down</span> 
<span class="text-error font-semibold">-1.2%</span> 
<span class="text-on-surface-variant text-[10px]">vs last mo</span> 
</div> 
</div> 
</div> 
</div> 
</main> 
</div> 
<script> 
        // Simple mobile menu toggle 
        const mobileMenuBtn = document.getElementById('mobileMenuBtn'); 
        const sideNav = document.getElementById('sideNav'); 
 
        mobileMenuBtn.addEventListener('click', () => { 
            if (sideNav.classList.contains('-translate-x-full')) { 
                sideNav.classList.remove('-translate-x-full'); 
            } else { 
                sideNav.classList.add('-translate-x-full'); 
            } 
        }); 
    </script> 
</body></html>

