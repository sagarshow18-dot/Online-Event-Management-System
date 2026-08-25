
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html class="light" lang="en">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Manage Events - EventHub</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;600;700&family=Inter:wght@400;600&family=JetBrains+Mono:wght@400&display=swap" rel="stylesheet"/>
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
                "tertiary-fixed-dim": "#7bd0ff",
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

</head>

<body class="bg-background text-on-background antialiased min-h-screen">

<!-- SideNavBar -->

<nav class="hidden md:flex bg-surface-container-lowest dark:bg-surface-container-lowest fixed left-0 top-0 h-full w-[280px] border-r border-outline-variant dark:border-outline-variant flex-col py-lg px-md z-50">

    <div class="mb-xl flex items-center gap-sm px-md">

        <span class="font-headline-lg text-headline-lg font-bold text-primary dark:text-on-primary-fixed">
            EventHub
        </span>

    </div>


    <div class="flex items-center gap-md px-md mb-xl pb-lg border-b border-outline-variant">

        <img
            alt="Admin User Profile"
            class="w-10 h-10 rounded-full object-cover border border-outline-variant"
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuB0ym0oolELdlc8Qd6aZZgsX6RkLFsNaY-cuePA5_gDnTulu1eLALq9BMJyjhvxGhG1hPITbzsrak1cXqmlIAMlkRIQCQ-vhLjG2BACXjYk0wDbfG_dwI4XuV1wTNVi2w8OpOETFhD6_pkaliIyi4U7cHu9hEzY0Zu_kaFmM7K-k86I02vO0eGo6DQ2mAGBzuNLiN0t84mvhgpT7xn1Z-tEHfKaYuX0-s4Cl8qSGJqN-izsOkb6RlLp9g"/>

        <div>

            <p class="font-body-md text-body-md font-bold text-primary">
                Admin User
            </p>

            <p class="font-body-sm text-body-sm text-on-surface-variant">
                Enterprise Admin
            </p>

        </div>

    </div>


    <ul class="flex-1 space-y-sm">

        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant dark:text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
                href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

                <span class="material-symbols-outlined" data-icon="dashboard">
                    dashboard
                </span>

                <span class="font-body-md text-body-md">
                    Dashboard
                </span>

            </a>

        </li>


        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant dark:text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
                href="<%= request.getContextPath() %>/ManageUsersServlet">

                <span class="material-symbols-outlined" data-icon="group">
                    group
                </span>

                <span class="font-body-md text-body-md">
                    Users
                </span>

            </a>

        </li>


        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant dark:text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
                href="<%= request.getContextPath() %>/ManageEventManagersServlet">

                <span class="material-symbols-outlined" data-icon="badge">
                    badge
                </span>

                <span class="font-body-md text-body-md">
                    Event Managers
                </span>

            </a>

        </li>


        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-primary dark:text-on-primary-fixed font-bold border-r-4 border-primary bg-surface-container-low"
                href="<%= request.getContextPath() %>/ManageEventsServlet">

                <span
                    class="material-symbols-outlined"
                    data-icon="calendar_today"
                    data-weight="fill">

                    calendar_today

                </span>

                <span class="font-body-md text-body-md">
                    Events
                </span>

            </a>

        </li>


        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant dark:text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
                href="<%= request.getContextPath() %>/AccessoriesServlet">

                <span class="material-symbols-outlined" data-icon="inventory_2">
                    inventory_2
                </span>

                <span class="font-body-md text-body-md">
                    Accessories
                </span>

            </a>

        </li>


        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant dark:text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
                href="<%= request.getContextPath() %>/ManageBookingsServlet">

                <span class="material-symbols-outlined" data-icon="confirmation_number">
                    confirmation_number
                </span>

                <span class="font-body-md text-body-md">
                    Bookings
                </span>

            </a>

        </li>


        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant dark:text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
                href="#">

                <span class="material-symbols-outlined" data-icon="assessment">
                    assessment
                </span>

                <span class="font-body-md text-body-md">
                    Reports
                </span>

            </a>

        </li>


        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-DEFAULT text-on-surface-variant dark:text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
                href="<%= request.getContextPath() %>/AdminProfileServlet">

                <span class="material-symbols-outlined" data-icon="account_circle">
                    account_circle
                </span>

                <span class="font-body-md text-body-md">
                    Profile
                </span>

            </a>

        </li>

    </ul>

</nav>


<!-- TopNavBar -->

<header class="hidden md:flex bg-surface-container-lowest dark:bg-surface-container-lowest fixed top-0 right-0 w-[calc(100%-280px)] h-16 border-b border-outline-variant dark:border-outline-variant justify-between items-center px-lg ml-[280px] z-40">

    <div class="flex-1 flex items-center">

        <div class="relative w-full max-w-md hidden lg:block">

            <span class="material-symbols-outlined absolute left-sm top-1/2 -translate-y-1/2 text-on-surface-variant pointer-events-none">
                search
            </span>

            <input
                class="w-full pl-xl pr-sm py-sm bg-surface-container-low border border-outline-variant rounded-DEFAULT font-body-sm text-body-sm text-on-surface focus:outline-none focus:border-tertiary focus:ring-1 focus:ring-tertiary transition-colors placeholder:text-on-surface-variant"
                placeholder="Search events..."
                type="text"/>

        </div>

    </div>


    <div class="flex items-center gap-lg">

        <button class="text-on-surface-variant hover:text-primary transition-colors hover:bg-surface-container-low p-sm rounded-full">

            <span class="material-symbols-outlined" data-icon="notifications">
                notifications
            </span>

        </button>

        <button class="text-on-surface-variant hover:text-primary transition-colors hover:bg-surface-container-low p-sm rounded-full">

            <span class="material-symbols-outlined" data-icon="settings">
                settings
            </span>

        </button>

        <div class="w-px h-6 bg-outline-variant mx-sm">
        </div>

        <button class="font-label-caps text-label-caps text-on-surface-variant hover:text-primary transition-colors flex items-center gap-xs">
            Logout
        </button>

    </div>

</header>


<!-- Main Content Area -->

<main class="pt-24 md:pl-[304px] px-margin-mobile md:px-margin-desktop pb-xl min-h-screen">


    <!-- Page Header -->

    <div class="flex flex-col md:flex-row justify-between items-start md:items-end gap-md mb-lg">

        <div>

            <nav
                aria-label="Breadcrumb"
                class="flex items-center gap-xs font-label-caps text-label-caps text-on-surface-variant mb-sm">

                <a
                    class="hover:text-primary transition-colors"
                    href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

                    Dashboard

                </a>

                <span class="material-symbols-outlined text-[14px]">
                    chevron_right
                </span>

                <span class="text-primary font-bold">
                    Manage Events
                </span>

            </nav>


            <h1 class="font-headline-lg text-headline-lg-mobile md:text-headline-lg text-primary">
                Manage Events
            </h1>

        </div>


        <div class="flex gap-md w-full md:w-auto">

            <button
                type="button"
                class="flex-1 md:flex-none flex items-center justify-center gap-xs px-md py-sm bg-surface-container-lowest border border-outline-variant rounded-DEFAULT font-label-caps text-label-caps text-secondary hover:bg-surface-container-low transition-colors">

                <span class="material-symbols-outlined text-[16px]">
                    filter_list
                </span>

                Filter

            </button>


            <button
                type="button"
                class="flex-1 md:flex-none flex items-center justify-center gap-xs px-md py-sm bg-primary border border-primary rounded-DEFAULT font-label-caps text-label-caps text-on-primary hover:bg-primary-container transition-colors shadow-sm">

                <span class="material-symbols-outlined text-[16px]">
                    add
                </span>

                New Event

            </button>

        </div>

    </div>


    <!-- Data Table Card -->

    <div class="bg-surface-container-lowest border border-outline-variant rounded-lg overflow-hidden">

        <div class="overflow-x-auto">

            <table class="w-full text-left border-collapse">

                <thead>

                    <tr class="bg-surface-container-low border-b border-outline-variant font-label-caps text-label-caps text-on-surface-variant">

                        <th class="p-sm font-semibold whitespace-nowrap pl-md">
                            Event Title
                        </th>

                        <th class="p-sm font-semibold whitespace-nowrap">
                            Organizer
                        </th>

                        <th class="p-sm font-semibold whitespace-nowrap">
                            Date
                        </th>

                        <th class="p-sm font-semibold whitespace-nowrap">
                            Location
                        </th>

                        <th class="p-sm font-semibold whitespace-nowrap text-right">
                            Capacity
                        </th>

                        <th class="p-sm font-semibold whitespace-nowrap text-right">
                            Bookings
                        </th>

                        <th class="p-sm font-semibold whitespace-nowrap text-center">
                            Status
                        </th>

                        <th class="p-sm font-semibold whitespace-nowrap text-right pr-md">
                            Actions
                        </th>

                    </tr>

                </thead>


<tbody class="font-body-sm text-body-sm text-on-surface divide-y divide-outline-variant">

<%
    java.util.List<java.util.Map<String, Object>> eventList =
        (java.util.List<java.util.Map<String, Object>>)
        request.getAttribute("eventList");

    if (eventList != null && !eventList.isEmpty()) {

        for (java.util.Map<String, Object> event : eventList) {

            int eventId =
                    (Integer) event.get("eventId");

            String eventName =
                    event.get("eventName") != null
                    ? event.get("eventName").toString()
                    : "";

            String managerName =
                    event.get("managerName") != null
                    ? event.get("managerName").toString()
                    : "Not Assigned";

            java.sql.Date eventDate =
                    (java.sql.Date) event.get("eventDate");

            String location =
                    event.get("location") != null
                    ? event.get("location").toString()
                    : "";

            int capacity =
                    (Integer) event.get("capacity");

            int bookingCount =
                    (Integer) event.get("bookingCount");

            String status =
                    event.get("status") != null
                    ? event.get("status").toString()
                    : "";

            String statusClass;

            if ("APPROVED".equalsIgnoreCase(status)) {

                statusClass =
                    "bg-secondary-container text-on-secondary-container";

            } else if ("PENDING".equalsIgnoreCase(status)) {

                statusClass =
                    "bg-surface-container-high text-on-surface-variant border border-outline-variant";

            } else if ("REJECTED".equalsIgnoreCase(status)) {

                statusClass =
                    "bg-error-container text-on-error-container";

            } else {

                statusClass =
                    "bg-surface-container-high text-on-surface-variant";
            }
%>

<tr class="hover:bg-surface-container-highest transition-colors group">

    <!-- Event Title -->

    <td class="p-sm pl-md">

        <div class="font-semibold text-primary">
            <%= eventName %>
        </div>

    </td>


    <!-- Organizer -->

    <td class="p-sm text-on-surface-variant">
        <%= managerName %>
    </td>


    <!-- Date -->

    <td class="p-sm font-data-mono text-data-mono text-on-surface-variant">

        <%= eventDate != null ? eventDate : "-" %>

    </td>


    <!-- Location -->

    <td class="p-sm text-on-surface-variant truncate max-w-[150px]">

        <%= location %>

    </td>


    <!-- Capacity -->

    <td class="p-sm font-data-mono text-data-mono text-right">

        <%= capacity %>

    </td>


    <!-- Bookings -->

    <td class="p-sm font-data-mono text-data-mono text-right">

        <%= bookingCount %>

    </td>


    <!-- Status -->

    <td class="p-sm text-center">

        <span class="inline-flex items-center px-2 py-0.5 rounded-full text-[11px] font-bold tracking-wide uppercase <%= statusClass %>">

            <%= status.isEmpty() ? "Unknown" : status %>

        </span>

    </td>


    <!-- Actions -->

    <td class="p-sm text-right pr-md">

        <div class="flex items-center justify-end gap-xs opacity-0 group-hover:opacity-100 transition-opacity">


            <!-- View -->

            <a
                class="p-xs text-on-surface-variant hover:text-primary rounded hover:bg-surface-container-low"
                title="View"
                href="<%= request.getContextPath() %>/ManageEventsServlet?action=view&eventId=<%= eventId %>">

                <span class="material-symbols-outlined text-[18px]">
                    visibility
                </span>

            </a>


            <!-- Edit -->

            <a
                class="p-xs text-on-surface-variant hover:text-primary rounded hover:bg-surface-container-low"
                title="Edit"
                href="<%= request.getContextPath() %>/ManageEventsServlet?action=edit&eventId=<%= eventId %>">

                <span class="material-symbols-outlined text-[18px]">
                    edit
                </span>

            </a>


            <% if ("PENDING".equalsIgnoreCase(status)) { %>

                <!-- Approve -->

                <a
                    class="p-xs text-on-surface-variant hover:text-primary rounded hover:bg-surface-container-low"
                    title="Approve"
                    href="<%= request.getContextPath() %>/ManageEventsServlet?action=approve&eventId=<%= eventId %>"
                    onclick="return confirm('Approve this event?');">

                    <span class="material-symbols-outlined text-[18px]">
                        check_circle
                    </span>

                </a>


                <!-- Reject -->

                <a
                    class="p-xs text-on-surface-variant hover:text-error rounded hover:bg-error-container"
                    title="Reject"
                    href="<%= request.getContextPath() %>/ManageEventsServlet?action=reject&eventId=<%= eventId %>"
                    onclick="return confirm('Reject this event?');">

                    <span class="material-symbols-outlined text-[18px]">
                        cancel
                    </span>

                </a>

            <% } %>


            <% if ("REJECTED".equalsIgnoreCase(status)) { %>

                <!-- Delete -->

                <a
                    class="p-xs text-on-surface-variant hover:text-error rounded hover:bg-error-container"
                    title="Delete"
                    href="<%= request.getContextPath() %>/ManageEventsServlet?action=delete&eventId=<%= eventId %>"
                    onclick="return confirm('Are you sure you want to delete this event?');">

                    <span class="material-symbols-outlined text-[18px]">
                        delete
                    </span>

                </a>

            <% } %>

        </div>

    </td>

</tr>

<%
        }

    } else {
%>

<tr>

    <td
        colspan="8"
        class="py-8 text-center text-on-surface-variant">

        No events found.

    </td>

</tr>

<%
    }
%>

</tbody>



            </table>

        </div>


        <!-- Pagination Footer -->

        <div class="px-md py-sm bg-surface-container-lowest border-t border-outline-variant flex items-center justify-between">

            <span class="font-body-sm text-body-sm text-on-surface-variant">
                Showing 1 to 4 of 24 entries
            </span>

            <div class="flex gap-xs">

                <button
                    type="button"
                    class="p-xs border border-outline-variant rounded hover:bg-surface-container-low transition-colors disabled:opacity-50"
                    disabled>

                    <span class="material-symbols-outlined text-[18px]">
                        chevron_left
                    </span>

                </button>

                <button
                    type="button"
                    class="px-sm py-xs border border-outline-variant rounded bg-surface-container-low font-data-mono text-[13px]">
                    1
                </button>

                <button
                    type="button"
                    class="px-sm py-xs border border-outline-variant rounded hover:bg-surface-container-low transition-colors font-data-mono text-[13px]">
                    2
                </button>

                <button
                    type="button"
                    class="px-sm py-xs border border-outline-variant rounded hover:bg-surface-container-low transition-colors font-data-mono text-[13px]">
                    3
                </button>

                <button
                    type="button"
                    class="p-xs border border-outline-variant rounded hover:bg-surface-container-low transition-colors">

                    <span class="material-symbols-outlined text-[18px]">
                        chevron_right
                    </span>

                </button>

            </div>

        </div>

    </div>

</main>

</body>
</html>

