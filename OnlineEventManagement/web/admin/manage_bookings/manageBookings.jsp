
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
<head>

<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

<title>EventHub - Manage Bookings</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;600;700&family=Inter:wght@400;600&family=JetBrains+Mono:wght@400&display=swap" rel="stylesheet"/>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>

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
                "secondary-fixed-dim": "#b9c7e0",
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

</style>

</head>

<body class="text-on-surface font-body-md text-body-md antialiased min-h-screen flex flex-col md:flex-row bg-background">


<!-- SideNavBar (Desktop Only) -->

<nav class="hidden md:flex bg-surface-container-lowest fixed left-0 top-0 h-full w-[280px] border-r border-outline-variant flex-col h-full py-lg px-md z-40">

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

            <span class="material-symbols-outlined" data-icon="dashboard">
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

            <span class="material-symbols-outlined" data-icon="group">
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

            <span class="material-symbols-outlined" data-icon="badge">
                badge
            </span>

            <span>
                Event Managers
            </span>

        </a>


        <!-- Events -->


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


        <!-- Accessories -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/AccessoriesServlet">

            <span class="material-symbols-outlined" data-icon="inventory_2">
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
                data-icon="confirmation_number"
                style="font-variation-settings: 'FILL' 1;">

                confirmation_number

            </span>

            <span>
                Bookings
            </span>

        </a>


        <!-- Reports -->

        <!-- Reports -->

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


        <!-- Profile -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/AdminProfileServlet">

            <span class="material-symbols-outlined" data-icon="account_circle">
                account_circle
            </span>

            <span>
                Profile
            </span>

        </a>

    </div>


    <div class="mt-auto pt-lg border-t border-outline-variant flex items-center gap-md">

        <img
            alt="Admin User Profile"
            class="w-10 h-10 rounded-full object-cover border border-outline-variant"
            data-alt="A small, professional circular avatar portrait of an enterprise admin user. Corporate modern aesthetic, high-key lighting, neutral background."
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


<!-- Main Content Area -->

<div class="flex-1 flex flex-col md:ml-[280px] w-full min-h-screen">


    <!-- TopNavBar -->

    <header class="bg-surface-container-lowest fixed top-0 right-0 w-full md:w-[calc(100%-280px)] h-16 border-b border-outline-variant flex justify-between items-center px-lg z-30">


        <!-- Mobile Menu Button -->

        <button
            type="button"
            class="md:hidden p-sm text-on-surface-variant hover:text-primary transition-colors">

            <span class="material-symbols-outlined">
                menu
            </span>

        </button>


        <div class="flex-1 flex items-center gap-lg">


            <!-- Mobile Brand -->

            <h1 class="md:hidden font-headline-lg-mobile text-headline-lg-mobile font-bold text-primary">
                EventHub
            </h1>


            <!-- Search Bar -->

            <div class="hidden md:flex relative w-96">

                <span class="material-symbols-outlined absolute left-sm top-1/2 -translate-y-1/2 text-on-surface-variant">
                    search
                </span>

                <input
                    class="w-full bg-surface-container-low border border-outline-variant rounded-DEFAULT py-sm pl-[36px] pr-sm font-body-sm text-body-sm focus:outline-none focus:border-tertiary focus:ring-2 focus:ring-tertiary-fixed transition-all text-on-surface placeholder:text-on-surface-variant"
                    placeholder="Search bookings, IDs, or users..."
                    type="text"
                />

            </div>

        </div>


        <div class="flex items-center gap-md">

            <button
                type="button"
                class="p-xs text-on-surface-variant hover:text-primary transition-colors hover:scale-95">

                <span class="material-symbols-outlined" data-icon="notifications">
                    notifications
                </span>

            </button>


            <button
                type="button"
                class="p-xs text-on-surface-variant hover:text-primary transition-colors hover:scale-95">

                <span class="material-symbols-outlined" data-icon="settings">
                    settings
                </span>

            </button>


            <div class="h-6 w-px bg-outline-variant mx-sm hidden md:block">
            </div>


            <button
                type="button"
                class="hidden md:block font-label-caps text-label-caps text-on-surface-variant hover:text-primary transition-colors">

                Logout

            </button>

        </div>

    </header>


    <!-- Page Content -->

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

                <button
                    type="button"
                    class="flex items-center gap-xs px-md py-sm bg-surface-container-lowest border border-outline-variant rounded-DEFAULT font-label-caps text-label-caps hover:bg-surface-container-low transition-colors">

                    <span class="material-symbols-outlined text-[18px]">
                        download
                    </span>

                    Export CSV

                </button>


                <button
                    type="button"
                    class="flex items-center gap-xs px-md py-sm bg-primary text-on-primary rounded-DEFAULT font-label-caps text-label-caps hover:bg-on-primary-fixed-variant transition-colors shadow-sm">

                    <span class="material-symbols-outlined text-[18px]">
                        add
                    </span>

                    New Booking

                </button>

            </div>

        </div>


        <!-- Bento Grid Stats -->

        <div class="grid grid-cols-1 md:grid-cols-4 gap-md mb-xl">


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
                "+" + String.format("%.1f", monthlyChange)
                + "% this month";

    } else if (monthlyChange < 0) {

        changeText =
                String.format("%.1f", monthlyChange)
                + "% this month";

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

<div class="flex items-center gap-xs mt-xs text-[12px] <%= changeColor %>">

    <span class="material-symbols-outlined text-[14px]">
        <%= trendIcon %>
    </span>

    <span>
        <%= changeText %>
    </span>

</div>

            </div>


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


            <div class="bg-surface-container-lowest p-md border border-outline-variant rounded-lg flex flex-col justify-center bg-gradient-to-br from-surface-container-lowest to-surface-container-low">

                <p class="font-label-caps text-label-caps text-on-surface-variant mb-sm">
                    Quick Action
                </p>

                <button
                    type="button"
                    class="w-full py-sm border border-outline-variant rounded-DEFAULT font-body-sm text-body-sm hover:border-tertiary transition-colors">

                    Review Cancellations

                </button>

            </div>

        </div>


        <!-- Data Table Section -->

        <div class="bg-surface-container-lowest border border-outline-variant rounded-lg overflow-hidden flex flex-col">


            <!-- Toolbar -->

            <div class="p-md border-b border-outline-variant flex flex-col md:flex-row justify-between items-center gap-md bg-surface">


                <div class="flex items-center gap-sm w-full md:w-auto">

                    <div class="relative flex-1 md:w-64">

                        <span class="material-symbols-outlined absolute left-sm top-1/2 -translate-y-1/2 text-on-surface-variant text-[18px]">
                            search
                        </span>

                        <input
                            class="w-full bg-surface-container-lowest border border-outline-variant rounded-DEFAULT py-xs pl-[32px] pr-sm font-body-sm text-body-sm focus:outline-none focus:border-tertiary focus:ring-1 focus:ring-tertiary h-9"
                            placeholder="Filter bookings..."
                            type="text"
                        />

                    </div>

                </div>


                <div class="flex items-center gap-sm w-full md:w-auto overflow-x-auto pb-1 md:pb-0 hide-scrollbar">


                    <button
                        type="button"
                        class="flex items-center gap-xs px-sm py-xs border border-outline-variant rounded-DEFAULT font-label-caps text-label-caps whitespace-nowrap hover:bg-surface-container-low">

                        <span class="material-symbols-outlined text-[16px]">
                            filter_list
                        </span>

                        Filter

                    </button>


                    <select
                        class="border border-outline-variant rounded-DEFAULT px-sm py-xs font-body-sm text-body-sm bg-surface-container-lowest h-9 focus:outline-none focus:border-tertiary">

                        <option>
                            Status: All
                        </option>

                        <option>
                            Confirmed
                        </option>

                        <option>
                            Pending
                        </option>

                        <option>
                            Cancelled
                        </option>

                    </select>


                    <select
                        class="border border-outline-variant rounded-DEFAULT px-sm py-xs font-body-sm text-body-sm bg-surface-container-lowest h-9 focus:outline-none focus:border-tertiary">

                        <option>
                            Date: Newest
                        </option>

                        <option>
                            Date: Oldest
                        </option>

                        <option>
                            Amount: High-Low
                        </option>

                    </select>

                </div>

            </div>


            <!-- Table -->

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


                   <tbody class="font-body-sm text-body-sm">

<%
    java.util.List<java.util.Map<String, Object>> bookingList =
        (java.util.List<java.util.Map<String, Object>>)
        request.getAttribute("bookingList");

    if (bookingList != null && !bookingList.isEmpty()) {

        for (java.util.Map<String, Object> booking : bookingList) {

            int bookingId = (Integer) booking.get("bookingId");

            String userName = booking.get("userName") != null
                    ? booking.get("userName").toString()
                    : "User ID " + booking.get("userId");

            String eventTitle = booking.get("eventTitle") != null
                    ? booking.get("eventTitle").toString()
                    : "Event ID " + booking.get("eventId");

            java.sql.Date bookingDate =
                    (java.sql.Date) booking.get("bookingDate");

            int quantity = (Integer) booking.get("quantity");

            java.math.BigDecimal totalAmount =
                    (java.math.BigDecimal) booking.get("totalAmount");

            String status = booking.get("status") != null
                    ? booking.get("status").toString()
                    : "";

            String statusClass;

            if ("CONFIRMED".equalsIgnoreCase(status)) {
                statusClass =
                    "bg-[#e6f4ea] text-[#137333]";
            }
            else if ("PENDING".equalsIgnoreCase(status)) {
                statusClass =
                    "bg-[#fef7e0] text-[#b06000]";
            }
            else {
                statusClass =
                    "bg-[#fce8e6] text-[#c5221f]";
            }
%>

<tr class="border-b border-surface-container-highest hover:bg-surface-container-lowest transition-colors group">

    <!-- Booking ID -->
    <td class="p-sm font-data-mono text-data-mono text-secondary">
        #BK-<%= bookingId %>
    </td>

    <!-- User Name -->
    <td class="p-sm font-semibold text-primary">
        <%= userName %>
    </td>

    <!-- Event Title -->
    <td class="p-sm truncate max-w-[200px]">
        <%= eventTitle %>
    </td>

    <!-- Organizer -->
    <td class="p-sm text-on-surface-variant">
        -
    </td>

    <!-- Booking Date -->
    <td class="p-sm text-on-surface-variant">
        <%= bookingDate != null ? bookingDate : "-" %>
    </td>

    <!-- Tickets -->
    <td class="p-sm text-right font-data-mono text-data-mono">
        <%= quantity %>
    </td>

    <!-- Amount -->
    <td class="p-sm text-right font-data-mono text-data-mono font-semibold">
        ₹<%= totalAmount != null ? totalAmount : "0.00" %>
    </td>

    <!-- Status -->
    <td class="p-sm text-center">

        <span class="inline-block px-sm py-xs rounded-full <%= statusClass %> font-label-caps text-[10px]">
            <%= status.isEmpty() ? "Unknown" : status %>
        </span>

    </td>

    <!-- Action -->
    <td class="p-sm text-right">

        <div class="flex justify-end">

            <a
                href="<%= request.getContextPath() %>/ManageBookingsServlet?action=cancel&bookingId=<%= bookingId %>"
                onclick="return confirm('Are you sure you want to cancel this booking?');"
                class="text-on-surface-variant hover:text-error opacity-0 group-hover:opacity-100 transition-opacity">

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


            <!-- Pagination -->

            <div class="p-md border-t border-outline-variant flex justify-between items-center bg-surface text-on-surface-variant">

                <span class="font-body-sm text-body-sm">
                    Showing 1 to 5 of 24,592
                </span>

                <div class="flex gap-xs">

                    <button
                        type="button"
                        class="p-xs border border-outline-variant rounded-DEFAULT hover:bg-surface-container-low disabled:opacity-50"
                        disabled>

                        <span class="material-symbols-outlined text-[18px]">
                            chevron_left
                        </span>

                    </button>

                    <button
                        type="button"
                        class="w-8 h-8 flex items-center justify-center border border-outline-variant bg-surface-container-low rounded-DEFAULT font-body-sm font-semibold text-primary">

                        1

                    </button>

                    <button
                        type="button"
                        class="w-8 h-8 flex items-center justify-center border border-outline-variant rounded-DEFAULT hover:bg-surface-container-low font-body-sm">

                        2

                    </button>

                    <button
                        type="button"
                        class="w-8 h-8 flex items-center justify-center border border-outline-variant rounded-DEFAULT hover:bg-surface-container-low font-body-sm">

                        3

                    </button>

                    <span class="w-8 h-8 flex items-center justify-center">
                        ...
                    </span>

                    <button
                        type="button"
                        class="p-xs border border-outline-variant rounded-DEFAULT hover:bg-surface-container-low">

                        <span class="material-symbols-outlined text-[18px]">
                            chevron_right
                        </span>

                    </button>

                </div>

            </div>

        </div>

    </main>


    <!-- Footer -->

    <footer class="bg-surface-container-lowest w-full py-md border-t border-outline-variant flex justify-center items-center gap-lg px-lg mt-auto z-30">

        <span class="font-headline-lg text-[16px] font-bold text-primary">
            EventHub
        </span>

        <span class="font-label-caps text-label-caps text-secondary">
            © 2024 EventHub Enterprise. All rights reserved.
        </span>

        <div class="flex gap-md ml-auto font-label-caps text-label-caps">

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

</body>
</html>

