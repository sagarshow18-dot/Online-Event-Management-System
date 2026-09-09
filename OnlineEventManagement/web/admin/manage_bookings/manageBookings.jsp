
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
<head>

<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

<title>EventHub - Manage Bookings</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;600;700&family=Inter:wght@400;600&family=JetBrains+Mono:wght@400&display=swap"
      rel="stylesheet"/>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
      rel="stylesheet"/>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
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
                "on-secondary": "#ffffff",
                "inverse-surface": "#2d3133",
                "on-background": "#191c1e",
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

            borderRadius: {

                "DEFAULT": "0.125rem",
                "lg": "0.25rem",
                "xl": "0.5rem",
                "full": "0.75rem"
            },

            spacing: {

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

            fontFamily: {

                "headline-lg": [
                    "Hanken Grotesk"
                ],

                "title-md": [
                    "Hanken Grotesk"
                ],

                "body-md": [
                    "Inter"
                ],

                "data-mono": [
                    "JetBrains Mono"
                ],

                "display-lg": [
                    "Hanken Grotesk"
                ],

                "label-caps": [
                    "Inter"
                ],

                "body-sm": [
                    "Inter"
                ],

                "headline-lg-mobile": [
                    "Hanken Grotesk"
                ]
            },

            fontSize: {

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

body {
    background-color: #f7f9fb;
}


/* Hide scrollbar for clean minimal look */

::-webkit-scrollbar {
    width: 8px;
    height: 8px;
}

::-webkit-scrollbar-track {
    background: #f7f9fb;
}

::-webkit-scrollbar-thumb {
    background: #e0e3e5;
    border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
    background: #c6c6cd;
}


/* Mobile sidebar */

#mobileSidebar {

    transform: translateX(-100%);

    transition:
        transform
        0.25s
        ease;

}


#mobileSidebar.mobile-sidebar-open {

    transform: translateX(0);

}


#mobileSidebarOverlay {

    display: none;

}


#mobileSidebarOverlay.mobile-overlay-open {

    display: block;

}

</style>

</head>


<body class="text-on-surface font-body-md text-body-md antialiased min-h-screen flex flex-col md:flex-row bg-background">


<!-- =========================================================
     DESKTOP SIDEBAR
     ========================================================= -->

<nav class="hidden md:flex bg-surface-container-lowest fixed left-0 top-0 h-full w-[280px] border-r border-outline-variant flex-col py-lg px-md z-40">

    <div class="mb-xl">

        <h1 class="font-headline-lg text-headline-lg font-bold text-primary">

            EventHub

        </h1>

        <p class="font-label-caps text-label-caps text-on-surface-variant mt-xs">

            Enterprise Admin

        </p>

    </div>


    <div class="flex-1 overflow-y-auto space-y-sm">


        <!-- Dashboard -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

            <span class="material-symbols-outlined">

                dashboard

            </span>

            <span>

                Dashboard

            </span>

        </a>


        <!-- Users -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/ManageUsersServlet">

            <span class="material-symbols-outlined">

                group

            </span>

            <span>

                Users

            </span>

        </a>


        <!-- Event Managers -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/ManageEventManagersServlet">

            <span class="material-symbols-outlined">

                badge

            </span>

            <span>

                Event Managers

            </span>

        </a>


        <!-- Events -->

        <li class="list-none">

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


        <!-- Accessories -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/AccessoriesServlet">

            <span class="material-symbols-outlined">

                inventory_2

            </span>

            <span>

                Accessories

            </span>

        </a>


        <!-- Bookings - Active -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-primary font-bold border-r-4 border-primary bg-surface-container-low"
            href="<%= request.getContextPath() %>/ManageBookingsServlet">

            <span
                class="material-symbols-outlined"
                style="font-variation-settings:'FILL' 1;">

                confirmation_number

            </span>

            <span>

                Bookings

            </span>

        </a>


        <!-- Reports -->

        <li class="list-none">

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


        <!-- Profile -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/AdminProfileServlet">

            <span class="material-symbols-outlined">

                account_circle

            </span>

            <span>

                Profile

            </span>

        </a>

    </div>


    <!-- Current Admin -->

    <div class="mt-auto pt-lg border-t border-outline-variant flex items-center gap-md">

        <img
            alt="Admin User Profile"
            class="w-10 h-10 rounded-full object-cover border border-outline-variant"
            data-alt="A small, professional circular avatar portrait of an enterprise admin user."
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuB612p_Pm9KQvT4SimjfNJ4tMyHludBIXFw9ScRP6GkFvlQdH6e1s5fVUJzkGQowuBiPHEfcRoR1p7ySEoS5USOo_cNYkc-he5lpHIImcCxpxi1QQMPocc_NN9uNuKZxzQUMOUnoG0t74KxOOt0dwzrVLSIPJenLsKg7MY-VgrlwBWoKA5woy30b4CzasAs5QHch3hOTceULank6wgBmXTVmz3EtCpavxfswyNo4UykWZpSWUfZchWtrw"/>


        <div>

            <p class="font-body-sm text-body-sm font-semibold">

                Admin User

            </p>

            <p class="font-label-caps text-label-caps text-on-surface-variant">

                System Admin

            </p>

        </div>

    </div>

</nav>


<!-- =========================================================
     MOBILE SIDEBAR OVERLAY
     ========================================================= -->

<div
    id="mobileSidebarOverlay"
    class="fixed inset-0 bg-black/30 z-[60]"
    onclick="closeMobileSidebar()">
</div>


<!-- =========================================================
     MOBILE SIDEBAR
     ========================================================= -->

<nav
    id="mobileSidebar"
    class="fixed left-0 top-0 h-full w-[280px] bg-surface-container-lowest border-r border-outline-variant z-[70] flex flex-col py-lg px-md md:hidden">

    <div class="flex items-center justify-between mb-xl">

        <div>

            <h1 class="font-headline-lg text-headline-lg font-bold text-primary">

                EventHub

            </h1>

            <p class="font-label-caps text-label-caps text-on-surface-variant mt-xs">

                Enterprise Admin

            </p>

        </div>


        <button
            type="button"
            onclick="closeMobileSidebar()"
            class="p-sm text-on-surface-variant hover:text-primary">

            <span class="material-symbols-outlined">

                close

            </span>

        </button>

    </div>


    <div class="flex-1 space-y-sm">


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low"
            href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

            <span class="material-symbols-outlined">
                dashboard
            </span>

            Dashboard

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low"
            href="<%= request.getContextPath() %>/ManageUsersServlet">

            <span class="material-symbols-outlined">
                group
            </span>

            Users

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low"
            href="<%= request.getContextPath() %>/ManageEventManagersServlet">

            <span class="material-symbols-outlined">
                badge
            </span>

            Event Managers

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low"
            href="<%= request.getContextPath() %>/ManageEventsServlet">

            <span class="material-symbols-outlined">
                calendar_today
            </span>

            Events

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low"
            href="<%= request.getContextPath() %>/AccessoriesServlet">

            <span class="material-symbols-outlined">
                inventory_2
            </span>

            Accessories

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-primary font-bold bg-surface-container-low"
            href="<%= request.getContextPath() %>/ManageBookingsServlet">

            <span class="material-symbols-outlined">

                confirmation_number

            </span>

            Bookings

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low"
            href="<%= request.getContextPath() %>/ReportsServlet">

            <span class="material-symbols-outlined">

                assessment

            </span>

            Reports

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low"
            href="<%= request.getContextPath() %>/AdminProfileServlet">

            <span class="material-symbols-outlined">

                account_circle

            </span>

            Profile

        </a>

    </div>

</nav>


<!-- =========================================================
     MAIN AREA
     ========================================================= -->

<div class="flex-1 flex flex-col md:ml-[280px] w-full min-h-screen">


    <!-- =====================================================
         TOP NAVBAR
         ===================================================== -->

    <header
        class="bg-surface-container-lowest fixed top-0 right-0 w-full md:w-[calc(100%-280px)] h-16 border-b border-outline-variant flex justify-between items-center px-lg z-30">


        <!-- Mobile Menu -->

        <button
            type="button"
            onclick="openMobileSidebar()"
            class="md:hidden p-sm text-on-surface-variant hover:text-primary transition-colors">

            <span class="material-symbols-outlined">

                menu

            </span>

        </button>


        <div class="flex-1 flex items-center gap-lg">


            <!-- Search -->

            <div class="hidden md:flex relative w-96">

                <span
                    class="material-symbols-outlined absolute left-sm top-1/2 -translate-y-1/2 text-on-surface-variant">

                    search

                </span>


                <input
                    id="topSearch"
                    oninput="syncTopSearch()"
                    class="w-full bg-surface-container-low border border-outline-variant rounded-DEFAULT py-sm pl-[36px] pr-sm font-body-sm text-body-sm focus:outline-none focus:border-tertiary focus:ring-1 focus:ring-tertiary transition-all text-on-surface placeholder:text-on-surface-variant"
                    placeholder="Search bookings, IDs, or users..."
                    type="text"
                />

            </div>


        </div>


        <div class="flex items-center gap-md">


            <!-- Notifications -->

            <button
                type="button"
                onclick="showNotifications()"
                title="Notifications"
                class="p-xs text-on-surface-variant hover:text-primary transition-colors hover:scale-95">

                <span class="material-symbols-outlined">

                    notifications

                </span>

            </button>


            <!-- Settings -->

            <button
                type="button"
                onclick="openSettings()"
                title="Settings"
                class="p-xs text-on-surface-variant hover:text-primary transition-colors hover:scale-95">

                <span class="material-symbols-outlined">

                    settings

                </span>

            </button>


            <div class="h-6 w-px bg-outline-variant mx-sm hidden md:block">
            </div>


            <!-- Logout -->

            <button
                type="button"
                onclick="logoutAdmin()"
                class="hidden md:block font-label-caps text-label-caps text-on-surface-variant hover:text-primary transition-colors">

                Logout

            </button>

        </div>

    </header>


    <!-- =====================================================
         PAGE CONTENT
         ===================================================== -->

    <main class="flex-1 p-margin-mobile md:p-margin-desktop mt-16 overflow-y-auto">


        <!-- Breadcrumbs & Header -->

        <div class="mb-lg flex flex-col md:flex-row md:items-end justify-between gap-md">


            <div>

                <nav
                    class="flex items-center gap-xs text-on-surface-variant font-label-caps text-label-caps mb-sm">

                    <a
                        class="hover:text-primary transition-colors"
                        href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

                        Home

                    </a>


                    <span class="material-symbols-outlined text-[16px]">

                        chevron_right

                    </span>


                    <span class="text-primary font-semibold">

                        Bookings

                    </span>

                </nav>


                <h2 class="font-headline-lg text-headline-lg md:font-display-lg md:text-display-lg text-primary">

                    Manage Bookings

                </h2>


                <p class="font-body-sm text-body-sm text-on-surface-variant mt-xs max-w-2xl">

                    Overview and management of all event ticket transactions across the platform.

                </p>

            </div>


            <div class="flex gap-sm">


                <!-- Export -->

                <button
                    type="button"
                    onclick="exportBookingsCSV()"
                    class="flex items-center gap-xs px-md py-sm bg-surface-container-lowest border border-outline-variant rounded-DEFAULT font-label-caps text-label-caps hover:bg-surface-container-low transition-colors">

                    <span class="material-symbols-outlined text-[18px]">

                        download

                    </span>

                    Export CSV

                </button>


                <!-- New Booking -->

                <button
                    type="button"
                    onclick="createNewBooking()"
                    class="bg-black text-white px-lg py-2 rounded-lg font-body-sm text-body-sm font-semibold hover:bg-gray-800 transition-colors flex items-center gap-sm shadow-sm">

                    <span class="material-symbols-outlined text-[18px]">

                        add

                    </span>

                    New Booking

                </button>

            </div>

        </div>


        <!-- =====================================================
             STATS
             ===================================================== -->

        <div class="grid grid-cols-1 md:grid-cols-4 gap-md mb-xl">


            <!-- Total -->

            <div class="bg-surface-container-lowest p-md border border-outline-variant rounded-lg">

                <p class="font-label-caps text-label-caps text-on-surface-variant">

                    Total Bookings

                </p>


                <p class="font-headline-lg text-headline-lg mt-sm">

                    <%= request.getAttribute("totalBookings") != null
                        ? request.getAttribute("totalBookings")
                        : 0 %>

                </p>


                <%
                    Object monthlyChangeObj =
                            request.getAttribute("monthlyChange");

                    double monthlyChange = 0.0;

                    if (monthlyChangeObj != null) {

                        monthlyChange =
                                ((Number) monthlyChangeObj).doubleValue();
                    }


                    String changeText;


                    if (monthlyChange > 0) {

                        changeText =
                                "+" +
                                String.format(
                                        "%.1f",
                                        monthlyChange
                                ) +
                                "% this month";

                    } else if (monthlyChange < 0) {

                        changeText =
                                String.format(
                                        "%.1f",
                                        monthlyChange
                                ) +
                                "% this month";

                    } else {

                        changeText =
                                "0.0% this month";
                    }


                    String changeColor =
                            monthlyChange >= 0
                            ? "text-green-700"
                            : "text-error";


                    String trendIcon =
                            monthlyChange >= 0
                            ? "trending_up"
                            : "trending_down";
                %>


                <div
                    class="flex items-center gap-xs mt-xs text-[12px] <%= changeColor %>">

                    <span class="material-symbols-outlined text-[14px]">

                        <%= trendIcon %>

                    </span>


                    <span>

                        <%= changeText %>

                    </span>

                </div>

            </div>


            <!-- Pending -->

            <div class="bg-surface-container-lowest p-md border border-outline-variant rounded-lg">

                <p class="font-label-caps text-label-caps text-on-surface-variant">

                    Pending Approvals

                </p>


                <p class="font-headline-lg text-headline-lg mt-sm">

                    <%= request.getAttribute("pendingBookings") != null
                            ? request.getAttribute("pendingBookings")
                            : 0 %>

                </p>


                <div class="flex items-center gap-xs mt-xs text-[12px] text-amber-700">

                    <span class="material-symbols-outlined text-[14px]">

                        pending_actions

                    </span>

                    <span>

                        Requires attention

                    </span>

                </div>

            </div>


            <!-- Revenue -->

            <div class="bg-surface-container-lowest p-md border border-outline-variant rounded-lg">

                <p class="font-label-caps text-label-caps text-on-surface-variant">

                    Revenue (YTD)

                </p>


                <p class="font-headline-lg text-headline-lg mt-sm">

                    ₹<%= request.getAttribute("totalRevenue") != null
                            ? request.getAttribute("totalRevenue")
                            : "0.00" %>

                </p>

            </div>


            <!-- Quick Action -->

            <div class="bg-surface-container-lowest p-md border border-outline-variant rounded-lg flex flex-col justify-center bg-gradient-to-br from-surface-container-lowest to-surface-container-low">

                <p class="font-label-caps text-label-caps text-on-surface-variant mb-sm">

                    Quick Action

                </p>


                <button
                    type="button"
                    onclick="reviewCancellations()"
                    class="w-full py-sm border border-outline-variant rounded-DEFAULT font-body-sm text-body-sm hover:border-tertiary transition-colors">

                    Review Cancellations

                </button>

            </div>

        </div>


        <!-- =====================================================
             TABLE CARD
             ===================================================== -->

        <div
            class="bg-surface-container-lowest border border-outline-variant rounded-lg overflow-hidden flex flex-col">


            <!-- TOOLBAR -->

            <div
                class="p-md border-b border-outline-variant flex flex-col md:flex-row justify-between items-center gap-md bg-surface">


                <div class="flex items-center gap-sm w-full md:w-auto">


                    <!-- Table search -->

                    <div class="relative flex-1 md:w-64">

                        <span class="material-symbols-outlined absolute left-sm top-1/2 -translate-y-1/2 text-on-surface-variant text-[18px]">

                            search

                        </span>


                        <input
                            id="bookingSearch"
                            oninput="filterBookings()"
                            class="w-full bg-surface-container-lowest border border-outline-variant rounded-DEFAULT py-xs pl-[32px] pr-sm font-body-sm text-body-sm focus:outline-none focus:border-tertiary focus:ring-1 focus:ring-tertiary h-9"
                            placeholder="Filter bookings..."
                            type="text"
                        />

                    </div>

                </div>


                <div
                    class="flex items-center gap-sm w-full md:w-auto overflow-x-auto pb-1 md:pb-0">


                    <!-- Filter button -->

                    <button
                        type="button"
                        onclick="toggleBookingFilter()"
                        class="flex items-center gap-xs px-sm py-xs border border-outline-variant rounded-DEFAULT font-label-caps text-label-caps whitespace-nowrap hover:bg-surface-container-low">

                        <span class="material-symbols-outlined text-[16px]">

                            filter_list

                        </span>

                        Filter

                    </button>


                    <!-- Status -->

                    <select
                        id="statusFilter"
                        onchange="filterBookings()"
                        class="border border-outline-variant rounded-DEFAULT px-sm py-xs font-body-sm text-body-sm bg-surface-container-lowest h-9 focus:outline-none focus:border-tertiary">

                        <option value="ALL">

                            Status: All

                        </option>

                        <option value="CONFIRMED">

                            Confirmed

                        </option>

                        <option value="PENDING">

                            Pending

                        </option>

                        <option value="CANCELLED">

                            Cancelled

                        </option>

                    </select>


                    <!-- Sort -->

                    <select
                        id="sortFilter"
                        onchange="filterBookings()"
                        class="border border-outline-variant rounded-DEFAULT px-sm py-xs font-body-sm text-body-sm bg-surface-container-lowest h-9 focus:outline-none focus:border-tertiary">

                        <option value="NEWEST">

                            Date: Newest

                        </option>

                        <option value="OLDEST">

                            Date: Oldest

                        </option>

                        <option value="HIGH">

                            Amount: High-Low

                        </option>

                        <option value="LOW">

                            Amount: Low-High

                        </option>

                    </select>

                </div>

            </div>


            <!-- FILTER INFO -->

            <div
                id="filterInfo"
                class="hidden px-md py-sm bg-surface-container-low border-b border-outline-variant text-[12px] text-on-surface-variant">

                Filters are active.

                <button
                    type="button"
                    onclick="clearBookingFilters()"
                    class="ml-sm font-semibold text-primary underline">

                    Clear filters

                </button>

            </div>


            <!-- =================================================
                 TABLE
                 ================================================= -->

            <div class="overflow-x-auto">

                <table class="w-full text-left border-collapse">

                    <thead>

                        <tr class="bg-surface-container-low border-b border-outline-variant">

                            <th class="p-sm font-label-caps text-label-caps text-on-surface-variant w-[100px]">

                                Booking ID

                            </th>


                            <th class="p-sm font-label-caps text-label-caps text-on-surface-variant">

                                User Name

                            </th>


                            <th class="p-sm font-label-caps text-label-caps text-on-surface-variant">

                                Event Title

                            </th>


                            <th class="p-sm font-label-caps text-label-caps text-on-surface-variant">

                                Organizer

                            </th>


                            <th class="p-sm font-label-caps text-label-caps text-on-surface-variant">

                                Booking Date

                            </th>


                            <th class="p-sm font-label-caps text-label-caps text-on-surface-variant text-right">

                                Tickets

                            </th>


                            <th class="p-sm font-label-caps text-label-caps text-on-surface-variant text-right">

                                Amount

                            </th>


                            <th class="p-sm font-label-caps text-label-caps text-on-surface-variant text-center">

                                Status

                            </th>


                            <th class="p-sm font-label-caps text-label-caps text-on-surface-variant text-right w-[60px]">

                            </th>

                        </tr>

                    </thead>


                    <tbody
                        id="bookingTableBody"
                        class="font-body-sm text-body-sm">


<%
    java.util.List<java.util.Map<String, Object>> bookingList =
        (java.util.List<java.util.Map<String, Object>>)
        request.getAttribute("bookingList");


    if (bookingList != null &&
        !bookingList.isEmpty()) {


        for (java.util.Map<String, Object> booking :
             bookingList) {


            int bookingId =
                    (Integer) booking.get("bookingId");


            String userName =
                    booking.get("userName") != null
                    ? booking.get("userName").toString()
                    : "User ID " + booking.get("userId");


            String eventTitle =
                    booking.get("eventTitle") != null
                    ? booking.get("eventTitle").toString()
                    : "Event ID " + booking.get("eventId");


            java.sql.Date bookingDate =
                    (java.sql.Date) booking.get("bookingDate");


            int quantity =
                    (Integer) booking.get("quantity");


            java.math.BigDecimal totalAmount =
                    (java.math.BigDecimal)
                    booking.get("totalAmount");


            String status =
                    booking.get("status") != null
                    ? booking.get("status").toString()
                    : "";


            String organizer =
                    booking.get("organizer") != null
                    ? booking.get("organizer").toString()
                    : "-";


            String statusClass;


            if ("CONFIRMED".equalsIgnoreCase(status)) {

                statusClass =
                    "bg-[#e6f4ea] text-[#137333]";

            } else if ("PENDING".equalsIgnoreCase(status)) {

                statusClass =
                    "bg-[#fef7e0] text-[#b06000]";

            } else {

                statusClass =
                    "bg-[#fce8e6] text-[#c5221f]";
            }
%>


<tr
    class="booking-row border-b border-surface-container-highest hover:bg-surface-container-lowest transition-colors group"

    data-booking-id="<%= bookingId %>"

    data-user="<%= userName.toLowerCase() %>"

    data-event="<%= eventTitle.toLowerCase() %>"

    data-organizer="<%= organizer.toLowerCase() %>"

    data-date="<%= bookingDate != null ? bookingDate.toString() : "" %>"

    data-status="<%= status.toUpperCase() %>"

    data-amount="<%= totalAmount != null ? totalAmount.toPlainString() : "0" %>">


    <!-- Booking ID -->

    <td class="p-sm font-data-mono text-data-mono text-secondary">

        #BK-<%= bookingId %>

    </td>


    <!-- User -->

    <td class="p-sm font-semibold text-primary">

        <%= userName %>

    </td>


    <!-- Event -->

    <td class="p-sm truncate max-w-[200px]">

        <%= eventTitle %>

    </td>


    <!-- Organizer -->

    <td class="p-sm text-on-surface-variant">

        <%= organizer %>

    </td>


    <!-- Date -->

    <td class="p-sm text-on-surface-variant">

        <%= bookingDate != null
                ? bookingDate
                : "-" %>

    </td>


    <!-- Tickets -->

    <td class="p-sm text-right font-data-mono text-data-mono">

        <%= quantity %>

    </td>


    <!-- Amount -->

    <td class="p-sm text-right font-data-mono text-data-mono font-semibold">

        ₹<%= totalAmount != null
                ? totalAmount
                : "0.00" %>

    </td>


    <!-- Status -->

    <td class="p-sm text-center">

        <span
            class="inline-block px-sm py-xs rounded-full <%= statusClass %> font-label-caps text-[10px]">

            <%= status.isEmpty()
                    ? "Unknown"
                    : status %>

        </span>

    </td>


    <!-- Action -->

    <td class="p-sm text-right">

        <div class="flex justify-end">

            <a
                href="<%= request.getContextPath() %>/ManageBookingsServlet?action=cancel&bookingId=<%= bookingId %>"
                onclick="return confirmBookingCancel('<%= bookingId %>');"
                class="text-on-surface-variant hover:text-error opacity-0 group-hover:opacity-100 transition-opacity"
                title="Cancel booking">

                <span class="material-symbols-outlined text-[20px]">

                    more_vert

                </span>

            </a>

        </div>

    </td>

</tr>


<%
        }

    } else {
%>


<tr>

    <td
        colspan="9"
        class="py-8 text-center text-on-surface-variant">

        No bookings found.

    </td>

</tr>


<%
    }
%>


                    </tbody>

                </table>

            </div>


            <!-- =================================================
                 PAGINATION
                 ================================================= -->

            <div
                class="p-md border-t border-outline-variant flex justify-between items-center bg-surface text-on-surface-variant">


                <span
                    id="paginationText"
                    class="font-body-sm text-body-sm">

                    Showing 0 to 0 of 0

                </span>


                <div class="flex gap-xs">


                    <button
                        id="previousPage"
                        type="button"
                        onclick="changeBookingPage(-1)"
                        class="p-xs border border-outline-variant rounded-DEFAULT hover:bg-surface-container-low disabled:opacity-50"
                        disabled>

                        <span class="material-symbols-outlined text-[18px]">

                            chevron_left

                        </span>

                    </button>


                    <button
                        id="bookingPage1"
                        type="button"
                        onclick="goToBookingPage(1)"
                        class="w-8 h-8 flex items-center justify-center border border-outline-variant bg-surface-container-low rounded-DEFAULT font-body-sm font-semibold text-primary">

                        1

                    </button>


                    <button
                        id="bookingPage2"
                        type="button"
                        onclick="goToBookingPage(2)"
                        class="w-8 h-8 flex items-center justify-center border border-outline-variant rounded-DEFAULT hover:bg-surface-container-low font-body-sm">

                        2

                    </button>


                    <button
                        id="bookingPage3"
                        type="button"
                        onclick="goToBookingPage(3)"
                        class="w-8 h-8 flex items-center justify-center border border-outline-variant rounded-DEFAULT hover:bg-surface-container-low font-body-sm">

                        3

                    </button>


                    <span
                        id="paginationDots"
                        class="w-8 h-8 flex items-center justify-center">

                        ...

                    </span>


                    <button
                        id="nextPage"
                        type="button"
                        onclick="changeBookingPage(1)"
                        class="p-xs border border-outline-variant rounded-DEFAULT hover:bg-surface-container-low">

                        <span class="material-symbols-outlined text-[18px]">

                            chevron_right

                        </span>

                    </button>

                </div>

            </div>

        </div>

    </main>


    <!-- =========================================================
         FOOTER
         ========================================================= -->

    <footer
        class="bg-surface-container-lowest w-full py-md border-t border-outline-variant flex justify-center items-center gap-lg px-lg mt-auto z-30">

        <span class="font-headline-lg text-[16px] font-bold text-primary">

            EventHub

        </span>


        <span class="font-label-caps text-label-caps text-secondary">

            © 2026 EventHub Enterprise. All rights reserved.

        </span>


        <div
            class="flex gap-md ml-auto font-label-caps text-label-caps">

            <a
                class="text-on-surface-variant hover:text-primary transition-colors"
                href="#">

                Security Policy

            </a>


            <a
                class="text-on-surface-variant hover:text-primary transition-colors"
                href="#">

                Terms of Service

            </a>


            <a
                class="text-on-surface-variant hover:text-primary transition-colors"
                href="#">

                Help Center

            </a>

        </div>

    </footer>

</div>


<!-- =========================================================
     JAVASCRIPT
     ========================================================= -->

<script>


/* =========================================================
   VARIABLES
   ========================================================= */

let currentBookingPage = 1;

const bookingsPerPage = 10;

let currentBookingSearch = "";

let currentBookingStatus = "ALL";

let currentBookingSort = "NEWEST";


/* =========================================================
   MOBILE SIDEBAR
   ========================================================= */

function openMobileSidebar() {

    const sidebar =
        document.getElementById(
            "mobileSidebar"
        );

    const overlay =
        document.getElementById(
            "mobileSidebarOverlay"
        );


    sidebar.classList.add(
        "mobile-sidebar-open"
    );


    overlay.classList.add(
        "mobile-overlay-open"
    );
}


function closeMobileSidebar() {

    const sidebar =
        document.getElementById(
            "mobileSidebar"
        );

    const overlay =
        document.getElementById(
            "mobileSidebarOverlay"
        );


    sidebar.classList.remove(
        "mobile-sidebar-open"
    );


    overlay.classList.remove(
        "mobile-overlay-open"
    );
}


/* =========================================================
   TOP SEARCH → TABLE SEARCH
   ========================================================= */

function syncTopSearch() {

    const topSearch =
        document.getElementById(
            "topSearch"
        );


    const tableSearch =
        document.getElementById(
            "bookingSearch"
        );


    tableSearch.value =
        topSearch.value;


    currentBookingSearch =
        topSearch.value
            .toLowerCase()
            .trim();


    currentBookingPage =
        1;


    renderBookings();
}


/* =========================================================
   TABLE SEARCH
   ========================================================= */

function filterBookings() {

    const searchInput =
        document.getElementById(
            "bookingSearch"
        );


    const statusInput =
        document.getElementById(
            "statusFilter"
        );


    const sortInput =
        document.getElementById(
            "sortFilter"
        );


    currentBookingSearch =
        searchInput.value
            .toLowerCase()
            .trim();


    currentBookingStatus =
        statusInput.value
            .toUpperCase();


    currentBookingSort =
        sortInput.value;


    currentBookingPage =
        1;


    renderBookings();
}


/* =========================================================
   FILTER BUTTON
   ========================================================= */

function toggleBookingFilter() {

    const filterInfo =
        document.getElementById(
            "filterInfo"
        );


    filterInfo.classList.toggle(
        "hidden"
    );
}


/* =========================================================
   GET ROWS
   ========================================================= */

function getAllBookingRows() {

    return Array.from(
        document.querySelectorAll(
            ".booking-row"
        )
    );
}


/* =========================================================
   FILTER + SORT
   ========================================================= */

function getFilteredBookingRows() {

    let rows =
        getAllBookingRows();


    rows =
        rows.filter(
            function(row) {

                const searchText =
                    (
                        row.dataset.bookingId +
                        " " +
                        row.dataset.user +
                        " " +
                        row.dataset.event +
                        " " +
                        row.dataset.organizer
                    ).toLowerCase();


                const status =
                    (
                        row.dataset.status ||
                        ""
                    ).toUpperCase();


                const matchesSearch =
                    currentBookingSearch === "" ||
                    searchText.includes(
                        currentBookingSearch
                    );


                const matchesStatus =
                    currentBookingStatus === "ALL" ||
                    status === currentBookingStatus;


                return (
                    matchesSearch &&
                    matchesStatus
                );
            }
        );


    /* SORT */

    rows.sort(
        function(a, b) {

            if (
                currentBookingSort ===
                "HIGH"
            ) {

                return (
                    parseFloat(
                        b.dataset.amount
                    ) -
                    parseFloat(
                        a.dataset.amount
                    )
                );
            }


            if (
                currentBookingSort ===
                "LOW"
            ) {

                return (
                    parseFloat(
                        a.dataset.amount
                    ) -
                    parseFloat(
                        b.dataset.amount
                    )
                );
            }


            const dateA =
                new Date(
                    a.dataset.date ||
                    "1970-01-01"
                );


            const dateB =
                new Date(
                    b.dataset.date ||
                    "1970-01-01"
                );


            if (
                currentBookingSort ===
                "OLDEST"
            ) {

                return (
                    dateA - dateB
                );
            }


            return (
                dateB - dateA
            );
        }
    );


    return rows;
}


/* =========================================================
   RENDER BOOKINGS
   ========================================================= */

function renderBookings() {

    const allRows =
        getAllBookingRows();


    const filteredRows =
        getFilteredBookingRows();


    const totalPages =
        Math.max(
            1,
            Math.ceil(
                filteredRows.length /
                bookingsPerPage
            )
        );


    if (
        currentBookingPage >
        totalPages
    ) {

        currentBookingPage =
            totalPages;
    }


    allRows.forEach(
        function(row) {

            row.style.display =
                "none";
        }
    );


    const start =
        (
            currentBookingPage - 1
        ) *
        bookingsPerPage;


    const end =
        start +
        bookingsPerPage;


    filteredRows
        .slice(
            start,
            end
        )
        .forEach(
            function(row) {

                row.style.display =
                    "";
            }
        );


    updateBookingPagination(
        filteredRows.length,
        totalPages,
        start,
        end
    );
}


/* =========================================================
   PAGINATION
   ========================================================= */

function updateBookingPagination(
    totalItems,
    totalPages,
    start,
    end
) {

    const previous =
        document.getElementById(
            "previousPage"
        );


    const next =
        document.getElementById(
            "nextPage"
        );


    previous.disabled =
        currentBookingPage <= 1;


    next.disabled =
        currentBookingPage >= totalPages;


    const pageButtons = [
        document.getElementById(
            "bookingPage1"
        ),
        document.getElementById(
            "bookingPage2"
        ),
        document.getElementById(
            "bookingPage3"
        )
    ];


    pageButtons.forEach(
        function(button, index) {

            const page =
                index + 1;


            if (
                page <= totalPages
            ) {

                button.style.display =
                    "flex";

            } else {

                button.style.display =
                    "none";
            }


            button.classList.remove(
                "bg-surface-container-low",
                "font-semibold",
                "text-primary"
            );


            if (
                page ===
                currentBookingPage
            ) {

                button.classList.add(
                    "bg-surface-container-low",
                    "font-semibold",
                    "text-primary"
                );
            }
        }
    );


    const dots =
        document.getElementById(
            "paginationDots"
        );


    dots.style.display =
        totalPages > 3
            ? "flex"
            : "none";


    let from = 0;

    let to = 0;


    if (
        totalItems > 0
    ) {

        from =
            start + 1;


        to =
            Math.min(
                end,
                totalItems
            );
    }


    document.getElementById(
        "paginationText"
    ).textContent =
        "Showing " +
        from +
        " to " +
        to +
        " of " +
        totalItems;
}


/* =========================================================
   PAGE CHANGE
   ========================================================= */

function changeBookingPage(
    direction
) {

    const filteredRows =
        getFilteredBookingRows();


    const totalPages =
        Math.max(
            1,
            Math.ceil(
                filteredRows.length /
                bookingsPerPage
            )
        );


    currentBookingPage +=
        direction;


    if (
        currentBookingPage < 1
    ) {

        currentBookingPage =
            1;
    }


    if (
        currentBookingPage >
        totalPages
    ) {

        currentBookingPage =
            totalPages;
    }


    renderBookings();
}


/* =========================================================
   SPECIFIC PAGE
   ========================================================= */

function goToBookingPage(
    page
) {

    const filteredRows =
        getFilteredBookingRows();


    const totalPages =
        Math.max(
            1,
            Math.ceil(
                filteredRows.length /
                bookingsPerPage
            )
        );


    if (
        page > totalPages
    ) {

        return;
    }


    currentBookingPage =
        page;


    renderBookings();
}


/* =========================================================
   CLEAR FILTERS
   ========================================================= */

function clearBookingFilters() {

    document.getElementById(
        "bookingSearch"
    ).value = "";


    document.getElementById(
        "topSearch"
    ).value = "";


    document.getElementById(
        "statusFilter"
    ).value = "ALL";


    document.getElementById(
        "sortFilter"
    ).value = "NEWEST";


    currentBookingSearch =
        "";


    currentBookingStatus =
        "ALL";


    currentBookingSort =
        "NEWEST";


    currentBookingPage =
        1;


    renderBookings();
}


/* =========================================================
   REVIEW CANCELLATIONS
   ========================================================= */

function reviewCancellations() {

    document.getElementById(
        "statusFilter"
    ).value =
        "CANCELLED";


    currentBookingStatus =
        "CANCELLED";


    currentBookingPage =
        1;


    document.getElementById(
        "filterInfo"
    ).classList.remove(
        "hidden"
    );


    renderBookings();
}


/* =========================================================
   CANCEL CONFIRMATION
   ========================================================= */

function confirmBookingCancel(
    bookingId
) {

    return confirm(
        "Are you sure you want to cancel booking #BK-" +
        bookingId +
        "?"
    );
}


/* =========================================================
   EXPORT CSV
   ========================================================= */

function exportBookingsCSV() {

    const rows =
        getFilteredBookingRows();


    if (
        rows.length === 0
    ) {

        alert(
            "There are no bookings to export."
        );

        return;
    }


    let csv =
        "Booking ID,User Name,Event Title,Organizer,Booking Date,Tickets,Amount,Status\n";


    rows.forEach(
        function(row) {

            const cells =
                row.querySelectorAll(
                    "td"
                );


            if (
                cells.length < 9
            ) {

                return;
            }


            const bookingId =
                cells[0].innerText
                    .trim();


            const user =
                cells[1].innerText
                    .trim();


            const event =
                cells[2].innerText
                    .trim();


            const organizer =
                cells[3].innerText
                    .trim();


            const date =
                cells[4].innerText
                    .trim();


            const tickets =
                cells[5].innerText
                    .trim();


            const amount =
                cells[6].innerText
                    .trim();


            const status =
                cells[7].innerText
                    .trim();


            csv +=
                csvEscape(bookingId) +
                "," +
                csvEscape(user) +
                "," +
                csvEscape(event) +
                "," +
                csvEscape(organizer) +
                "," +
                csvEscape(date) +
                "," +
                csvEscape(tickets) +
                "," +
                csvEscape(amount) +
                "," +
                csvEscape(status) +
                "\n";
        }
    );


    const blob =
        new Blob(
            [csv],
            {
                type:
                    "text/csv;charset=utf-8;"
            }
        );


    const url =
        URL.createObjectURL(
            blob
        );


    const link =
        document.createElement(
            "a"
        );


    link.href =
        url;


    link.download =
        "eventhub-bookings.csv";


    document.body.appendChild(
        link
    );


    link.click();


    document.body.removeChild(
        link
    );


    URL.revokeObjectURL(
        url
    );
}


/* =========================================================
   CSV ESCAPE
   ========================================================= */

function csvEscape(
    value
) {

    return '"' +
        String(value)
            .replace(
                /"/g,
                '""'
            ) +
        '"';
}


/* =========================================================
   NEW BOOKING
   ========================================================= */

function createNewBooking() {

    /*
     * Change this path only if your actual
     * Add Booking JSP is located elsewhere.
     */

    window.location.href =
        "<%= request.getContextPath() %>/admin/add_booking/addBooking.jsp";
}


/* =========================================================
   NOTIFICATIONS
   ========================================================= */

function showNotifications() {

    alert(
        "No new booking notifications."
    );
}


/* =========================================================
   SETTINGS
   ========================================================= */

function openSettings() {

    window.location.href =
        "<%= request.getContextPath() %>/AdminProfileServlet";
}


/* =========================================================
   LOGOUT
   ========================================================= */

function logoutAdmin() {

    if (
        !confirm(
            "Are you sure you want to logout?"
        )
    ) {

        return;
    }


    /*
     * Uses your existing login page.
     *
     * A dedicated LogoutServlet can later be used
     * to invalidate the session completely.
     */

    window.location.href =
        "<%= request.getContextPath() %>/admin/admin_login/adminLogin.html";
}


/* =========================================================
   INITIALIZATION
   ========================================================= */

document.addEventListener(
    "DOMContentLoaded",
    function() {

        renderBookings();

    }
);

</script>


</body>
</html>

