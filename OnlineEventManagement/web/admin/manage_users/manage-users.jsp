
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html class="light" lang="en">
<head>

<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

<title>Manage Users - EventHub</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@600;700&family=Inter:wght@400;600&family=JetBrains+Mono:wght@400&display=swap" rel="stylesheet"/>

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
                "headline-lg": ["Hanken Grotesk"],
                "title-md": ["Hanken Grotesk"],
                "body-md": ["Inter"],
                "data-mono": ["JetBrains Mono"],
                "display-lg": ["Hanken Grotesk"],
                "label-caps": ["Inter"],
                "body-sm": ["Inter"],
                "headline-lg-mobile": ["Hanken Grotesk"]
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
.material-symbols-outlined {
    font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
}

.material-symbols-outlined[data-weight="fill"] {
    font-variation-settings: 'FILL' 1;
}

/* Custom scrollbar for tables */
.table-container::-webkit-scrollbar {
    height: 8px;
    width: 8px;
}

.table-container::-webkit-scrollbar-track {
    background: #f2f4f6;
}

.table-container::-webkit-scrollbar-thumb {
    background: #c6c6cd;
    border-radius: 9999px;
}

.table-container::-webkit-scrollbar-thumb:hover {
    background: #76777d;
}
</style>

</head>

<body class="bg-background text-on-background font-body-md min-h-screen overflow-x-hidden antialiased flex flex-col md:flex-row">

<!-- SideNavBar -->

<nav class="hidden md:flex bg-surface-container-lowest fixed left-0 top-0 h-full w-[280px] border-r border-outline-variant flex-col py-lg px-md z-20">

    <div class="flex items-center gap-sm mb-xl px-sm">

        <span class="material-symbols-outlined text-primary text-[32px]">
            event
        </span>

        <span class="font-headline-lg text-headline-lg font-bold text-primary">
            EventHub
        </span>

    </div>


    <div class="flex items-center gap-md mb-xl px-sm">

        <div class="w-10 h-10 rounded-full overflow-hidden bg-surface-variant flex-shrink-0">

            <img
                alt="Admin User Profile"
                class="w-full h-full object-cover"
                src="https://lh3.googleusercontent.com/aida-public/AB6AXuCZBbefcqGnMmILB3aFlU4bKG419JImIKGtBNkuyelWGLO23H2p31-eX9gTHvxIGsigBOkexzlrD9Wx9h4YglqzUGyteGIGNEtaS9F3Snp3N_JYl59676AghMxYIo_9SkACOF1EWxuqAWSpwgnQdfnqirp_joKJf8DgN9to1_V_nGRMW-NPyDxeZ5JZU6sn6xF_qa1cE3fpgivPiVvQ3NgGubo-BqZyYBVXQxRaGw5ROh5R2Lt41R0CRQ"
            />

        </div>

        <div class="flex flex-col">

            <span class="font-title-md text-title-md text-on-surface truncate max-w-[180px]">
                Jane Doe
            </span>

            <span class="font-label-caps text-label-caps text-on-surface-variant">
                Enterprise Admin
            </span>

        </div>

    </div>


    <div class="flex-1 overflow-y-auto pr-sm flex flex-col gap-xs">

        <!-- Dashboard -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

            <span class="material-symbols-outlined">
                dashboard
            </span>

            <span>
                Dashboard
            </span>

        </a>


        <!-- Active Users -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-lg bg-surface-container-low text-primary font-bold border-r-4 border-primary opacity-80"
            href="<%= request.getContextPath() %>/ManageUsersServlet">

            <span
                class="material-symbols-outlined"
                data-weight="fill">

                group

            </span>

            <span>
                Users
            </span>

        </a>


        <!-- Event Managers -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/ManageEventManagersServlet">

            <span class="material-symbols-outlined">
                badge
            </span>

            <span>
                Event Managers
            </span>

        </a>


        <!-- Events -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="#">

            <span class="material-symbols-outlined">
                calendar_today
            </span>

            <span>
                Events
            </span>

        </a>


        <!-- Accessories -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="#">

            <span class="material-symbols-outlined">
                inventory_2
            </span>

            <span>
                Accessories
            </span>

        </a>


        <!-- Bookings -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="#">

            <span class="material-symbols-outlined">
                confirmation_number
            </span>

            <span>
                Bookings
            </span>

        </a>


        <!-- Reports -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="#">

            <span class="material-symbols-outlined">
                assessment
            </span>

            <span>
                Reports
            </span>

        </a>


        <!-- Profile -->

        <a
            class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/AdminProfileServlet">

            <span class="material-symbols-outlined">
                account_circle
            </span>

            <span>
                Profile
            </span>

        </a>

    </div>

</nav>


<!-- Mobile Nav Header -->

<header class="md:hidden bg-surface-container-lowest border-b border-outline-variant px-margin-mobile py-sm flex justify-between items-center sticky top-0 z-20">

    <div class="flex items-center gap-sm">

        <span class="material-symbols-outlined text-primary text-[24px]">
            event
        </span>

        <span class="font-title-md text-title-md font-bold text-primary">
            EventHub
        </span>

    </div>

    <button
        type="button"
        class="text-on-surface p-sm rounded-lg hover:bg-surface-container-low">

        <span class="material-symbols-outlined">
            menu
        </span>

    </button>

</header>


<!-- Main Content Wrapper -->

<main class="flex-1 flex flex-col md:ml-[280px] min-h-screen">


    <!-- TopNavBar -->

    <header class="hidden md:flex bg-surface-container-lowest fixed top-0 right-0 w-[calc(100%-280px)] h-16 border-b border-outline-variant justify-between items-center px-lg z-10">

        <div class="flex items-center w-full max-w-md">

            <div class="relative w-full">

                <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant">
                    search
                </span>

                <input
                    class="w-full bg-surface-container-low border border-transparent rounded-full py-2 pl-10 pr-4 text-body-sm font-body-sm text-on-surface placeholder:text-on-surface-variant focus:border-tertiary focus:ring-2 focus:ring-tertiary-fixed-dim focus:outline-none transition-all duration-200"
                    placeholder="Search across EventHub..."
                    type="text"
                />

            </div>

        </div>


        <div class="flex items-center gap-md">

            <button
                type="button"
                class="text-on-surface-variant hover:text-primary transition-colors p-sm rounded-full hover:bg-surface-container-low relative">

                <span class="material-symbols-outlined">
                    notifications
                </span>

                <span class="absolute top-2 right-2 w-2 h-2 bg-error rounded-full border border-surface-container-lowest">
                </span>

            </button>


            <button
                type="button"
                class="text-on-surface-variant hover:text-primary transition-colors p-sm rounded-full hover:bg-surface-container-low">

                <span class="material-symbols-outlined">
                    settings
                </span>

            </button>


            <div class="h-8 w-px bg-outline-variant mx-2"></div>


            <button
                type="button"
                class="text-on-surface-variant hover:text-primary transition-colors font-body-sm text-body-sm flex items-center gap-xs">

                <span>
                    Logout
                </span>

                <span class="material-symbols-outlined text-[18px]">
                    logout
                </span>

            </button>

        </div>

    </header>


    <!-- Page Content -->

    <div class="flex-1 p-margin-mobile md:p-margin-desktop md:pt-[calc(64px+32px)] pt-margin-mobile max-w-[1600px] w-full mx-auto flex flex-col gap-lg">


        <!-- Page Header & Actions -->

        <div class="flex flex-col md:flex-row md:items-end justify-between gap-md">

            <div>

                <nav
                    aria-label="Breadcrumb"
                    class="flex text-label-caps font-label-caps text-on-surface-variant mb-sm">

                    <ol class="inline-flex items-center gap-xs">

                        <li class="inline-flex items-center">

                            <a
                                class="hover:text-primary transition-colors"
                                href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

                                Admin

                            </a>

                        </li>

                        <li>

                            <span class="material-symbols-outlined text-[14px]">
                                chevron_right
                            </span>

                        </li>

                        <li
                            aria-current="page"
                            class="text-on-surface">

                            Manage Users

                        </li>

                    </ol>

                </nav>


                <h1 class="font-display-lg text-headline-lg-mobile md:text-display-lg text-on-surface">
                    User Directory
                </h1>


                <p class="font-body-sm text-body-sm text-on-surface-variant mt-1">
                    Manage platform access, roles, and status for all registered users.
                </p>

            </div>


            <div class="flex items-center gap-sm">

                <button
                    type="button"
                    class="bg-primary text-on-primary px-lg py-2 rounded-lg font-body-sm text-body-sm hover:bg-primary-container transition-colors flex items-center gap-sm shadow-sm">

                    <span class="material-symbols-outlined text-[18px]">
                        person_add
                    </span>

                    Add User

                </button>


                <button
                    type="button"
                    class="border border-outline-variant bg-surface-container-lowest text-on-surface px-md py-2 rounded-lg font-body-sm text-body-sm hover:border-tertiary hover:text-tertiary transition-colors flex items-center gap-sm shadow-sm">

                    <span class="material-symbols-outlined text-[18px]">
                        download
                    </span>

                    Export

                </button>

            </div>

        </div>


        <!-- Filter & Search Bar -->

        <div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-sm flex flex-col sm:flex-row gap-sm items-center">

            <div class="relative w-full sm:max-w-xs flex-1">

                <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-[20px]">
                    search
                </span>

                <input
                    class="w-full bg-surface-container-low border border-transparent rounded-lg py-2 pl-10 pr-4 text-body-sm font-body-sm text-on-surface placeholder:text-on-surface-variant focus:border-tertiary focus:ring-2 focus:ring-tertiary-fixed-dim focus:outline-none transition-all duration-200"
                    placeholder="Search users by name, email..."
                    type="text"
                />

            </div>


            <div class="w-full sm:w-auto flex items-center gap-sm overflow-x-auto pb-1 sm:pb-0">


                <!-- Role Filter -->

                <select
                    class="bg-surface-container-low border border-transparent rounded-lg py-2 pl-3 pr-8 text-body-sm font-body-sm text-on-surface focus:border-tertiary focus:ring-2 focus:ring-tertiary-fixed-dim focus:outline-none transition-all duration-200 appearance-none min-w-[120px]">

                    <option value="">
                        All Roles
                    </option>

                    <option value="admin">
                        Admin
                    </option>

                    <option value="manager">
                        Event Manager
                    </option>

                    <option value="user">
                        Standard User
                    </option>

                </select>


                <!-- Status Filter -->

                <select
                    class="bg-surface-container-low border border-transparent rounded-lg py-2 pl-3 pr-8 text-body-sm font-body-sm text-on-surface focus:border-tertiary focus:ring-2 focus:ring-tertiary-fixed-dim focus:outline-none transition-all duration-200 appearance-none min-w-[120px]">

                    <option value="">
                        All Status
                    </option>

                    <option value="active">
                        Active
                    </option>

                    <option value="blocked">
                        Blocked
                    </option>

                </select>


                <button
                    type="button"
                    class="text-on-surface-variant p-sm rounded-lg hover:bg-surface-container-low hover:text-primary transition-colors flex-shrink-0"
                    title="Advanced Filters">

                    <span class="material-symbols-outlined">
                        tune
                    </span>

                </button>

            </div>

        </div>


        <!-- Data Table -->

        <div class="bg-surface-container-lowest border border-outline-variant rounded-xl overflow-hidden flex flex-col">

            <div class="table-container overflow-x-auto w-full">

                <table class="w-full text-left border-collapse min-w-[900px]">

                    <thead>

                        <tr class="bg-surface-container-low border-b border-outline-variant text-label-caps font-label-caps text-on-surface-variant">

                            <th class="py-3 px-md font-semibold w-12 text-center">

                                <input
                                    class="rounded border-outline-variant text-primary focus:ring-tertiary-fixed-dim"
                                    type="checkbox"
                                />

                            </th>

                            <th class="py-3 px-sm font-semibold">
                                User ID
                            </th>

                            <th class="py-3 px-sm font-semibold">
                                Name
                            </th>

                            <th class="py-3 px-sm font-semibold">
                                Email
                            </th>

                            <th class="py-3 px-sm font-semibold">
                                Contact
                            </th>

                            <th class="py-3 px-sm font-semibold">
                                Reg. Date
                            </th>

                            <th class="py-3 px-sm font-semibold text-center">
                                Status
                            </th>

                            <th class="py-3 px-md font-semibold text-right">
                                Actions
                            </th>

                        </tr>

                    </thead>


                    <tbody class="font-body-sm text-body-sm text-on-surface">

<%
    java.util.List<java.util.Map<String, Object>> userList =
        (java.util.List<java.util.Map<String, Object>>)
        request.getAttribute("userList");

    if (userList != null && !userList.isEmpty()) {

        for (java.util.Map<String, Object> user : userList) {

            int userId = (Integer) user.get("userId");

            String name = user.get("name") != null
                    ? user.get("name").toString()
                    : "";

            String email = user.get("email") != null
                    ? user.get("email").toString()
                    : "";

            String contact = user.get("contact") != null
                    ? user.get("contact").toString()
                    : "";

            String status = user.get("status") != null
                    ? user.get("status").toString()
                    : "";

            String initials = "";

            if (!name.trim().isEmpty()) {

                String[] parts = name.trim().split("\\s+");

                if (parts.length == 1) {

                    initials = parts[0]
                            .substring(0, 1)
                            .toUpperCase();

                } else {

                    initials =
                        (parts[0].substring(0, 1)
                        + parts[parts.length - 1].substring(0, 1))
                        .toUpperCase();
                }
            }

            boolean active =
                    "ACTIVE".equalsIgnoreCase(status);

            String statusClass;
            String statusText;

            if (active) {

                statusClass =
                    "bg-[#e6f4ea] text-[#137333]";

                statusText = "Active";

            } else {

                statusClass =
                    "bg-[#fce8e6] text-[#c5221f]";

                statusText =
                    status.isEmpty()
                    ? "Unknown"
                    : status;
            }
%>

<tr class="border-b border-outline-variant hover:bg-surface-bright transition-colors">

    <td class="py-2 px-md text-center">

        <input
            class="rounded border-outline-variant text-primary focus:ring-tertiary-fixed-dim"
            type="checkbox"/>

    </td>


    <td class="py-2 px-sm font-data-mono text-data-mono text-on-surface-variant">

        <%= userId %>

    </td>


    <td class="py-2 px-sm">

        <div class="flex items-center gap-sm">

            <div class="w-8 h-8 rounded-full bg-secondary-container text-on-secondary-container flex items-center justify-center font-bold text-xs uppercase">

                <%= initials %>

            </div>

            <span class="font-semibold">

                <%= name %>

            </span>

        </div>

    </td>


    <td class="py-2 px-sm text-on-surface-variant">

        <%= email %>

    </td>


    <td class="py-2 px-sm font-data-mono text-data-mono text-on-surface-variant">

        <%= contact %>

    </td>


    <td class="py-2 px-sm text-on-surface-variant">

        -

    </td>


    <td class="py-2 px-sm text-center">

        <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-semibold <%= statusClass %>">

            <%= statusText %>

        </span>

    </td>


    <td class="py-2 px-md">

        <div class="flex items-center justify-end gap-xs">


            <!-- View -->

            <a
                class="p-1 text-on-surface-variant hover:text-primary hover:bg-surface-container-low rounded transition-colors"
                title="View"
                href="#">

                <span class="material-symbols-outlined text-[18px]">
                    visibility
                </span>

            </a>


            <!-- Edit -->

            <a
                class="p-1 text-on-surface-variant hover:text-primary hover:bg-surface-container-low rounded transition-colors"
                title="Edit"
                href="#">

                <span class="material-symbols-outlined text-[18px]">
                    edit
                </span>

            </a>


            <!-- Block / Unblock -->

            <% if (active) { %>

            <a
                href="<%= request.getContextPath() %>/ManageUsersServlet?action=block&userId=<%= userId %>"
                onclick="return confirm('Are you sure you want to block this user?');"
                class="p-1 text-on-surface-variant hover:text-error hover:bg-error-container rounded transition-colors"
                title="Block">

                <span class="material-symbols-outlined text-[18px]">
                    block
                </span>

            </a>

            <% } else { %>

            <a
                href="<%= request.getContextPath() %>/ManageUsersServlet?action=unblock&userId=<%= userId %>"
                class="p-1 text-on-surface-variant hover:text-primary hover:bg-surface-container-low rounded transition-colors"
                title="Unblock">

                <span class="material-symbols-outlined text-[18px]">
                    lock_open
                </span>

            </a>

            <% } %>


            <!-- Delete -->

            <a
                href="<%= request.getContextPath() %>/ManageUsersServlet?action=delete&userId=<%= userId %>"
                onclick="return confirm('Are you sure you want to delete this user?');"
                class="p-1 text-on-surface-variant hover:text-error hover:bg-error-container rounded transition-colors"
                title="Delete">

                <span class="material-symbols-outlined text-[18px]">
                    delete
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
        colspan="8"
        class="py-8 text-center text-on-surface-variant">

        No users found.

    </td>

</tr>

<%
    }
%>

                    </tbody>

                </table>

            </div>


            <!-- Pagination -->

            <div class="border-t border-outline-variant bg-surface-container-lowest p-sm flex items-center justify-between">

                <div class="text-body-sm font-body-sm text-on-surface-variant">

                    Showing

                    <span class="font-semibold text-on-surface">
                        <%= userList != null ? userList.size() : 0 %>
                    </span>

                    users

                </div>


                <div class="flex items-center gap-xs">

                    <button
                        type="button"
                        class="p-1 rounded-md border border-outline-variant text-on-surface-variant hover:bg-surface-container-low hover:text-primary transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                        disabled>

                        <span class="material-symbols-outlined text-[20px]">
                            chevron_left
                        </span>

                    </button>


                    <button
                        type="button"
                        class="w-8 h-8 rounded-md bg-primary text-on-primary font-semibold text-sm flex items-center justify-center">

                        1

                    </button>


                    <button
                        type="button"
                        class="p-1 rounded-md border border-outline-variant text-on-surface-variant hover:bg-surface-container-low hover:text-primary transition-colors">

                        <span class="material-symbols-outlined text-[20px]">
                            chevron_right
                        </span>

                    </button>

                </div>

            </div>

        </div>

    </div>

</main>

</body>
</html>

