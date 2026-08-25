
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html class="light" lang="en">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Manage Event Managers - EventHub</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@600;700&family=Inter:wght@400;600&family=JetBrains+Mono&display=swap" rel="stylesheet"/>

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
                "on-secondary-fixed": "#0d1c2f",
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
.table-row-hover:hover {
    background-color: #f2f4f6;
}

.material-symbols-outlined {
    font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
}
</style>

</head>

<body class="bg-surface text-on-surface font-body-md antialiased h-screen overflow-hidden flex">

<!-- SideNavBar -->
<nav class="bg-surface-container-lowest fixed left-0 top-0 h-full w-[280px] border-r border-outline-variant flex flex-col py-lg px-md z-20">

    <div class="mb-xl px-sm">

        <h1 class="font-headline-lg text-headline-lg font-bold text-primary">
            EventHub
        </h1>

        <p class="font-label-caps text-label-caps text-on-surface-variant mt-xs">
            Enterprise Admin
        </p>

    </div>

    <ul class="flex-1 space-y-xs">

        <li>
            <a class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
               href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

                <span class="material-symbols-outlined text-[20px]">
                    dashboard
                </span>

                Dashboard
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
            <a class="flex items-center gap-md px-md py-sm rounded-lg text-primary font-bold border-r-4 border-primary bg-surface-container-low/50"
                href="<%= request.getContextPath() %>/ManageEventManagersServlet">

                <span class="material-symbols-outlined text-[20px]">
                    badge
                </span>

                Event Managers
            </a>
        </li>

        <!-- Events - Not connected yet -->

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
            <a class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
                href="<%= request.getContextPath() %>/ManageBookingsServlet">

                <span class="material-symbols-outlined text-[20px]">
                    confirmation_number
                </span>

                Bookings
            </a>
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

        <li>
            <a class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
               href="<%= request.getContextPath() %>/AdminProfileServlet">

                <span class="material-symbols-outlined text-[20px]">
                    account_circle
                </span>

                Profile
            </a>
        </li>

    </ul>

    <div class="mt-auto pt-lg border-t border-outline-variant">

        <div class="flex items-center gap-md px-sm">

            <img
                alt="Admin User Profile"
                class="w-8 h-8 rounded-full object-cover"
                src="https://lh3.googleusercontent.com/aida-public/AB6AXuB7-_ZTDazgxf8FTS4lzGd6BrkFgbTAg5wR58_JkPT-aynBuU0byVu_iE4CQrW9I8aKwJGKrbfjXdnfeO1FK8_2QEPeaM1aorJ1noLkqkI1M0q3jSkPE0Zk5g0asOjUENA9lBQi4f4MosTzDtE6m2Hd6MDHaOnH6AGRnWf4ojjVtpTLL-QITkv5ls2xZDXs9XDM2BDQdOXt-VMZeZNg4TMk8ajA4BwPkO_G8cQOV_grnCqEY_KjrnjRPw"/>

            <div class="flex-1 min-w-0">

                <p class="font-body-sm text-body-sm truncate text-on-surface">
                    Admin User
                </p>

            </div>

        </div>

    </div>

</nav>


<!-- TopNavBar -->
<header class="bg-surface-container-lowest fixed top-0 right-0 w-[calc(100%-280px)] h-16 border-b border-outline-variant flex justify-between items-center px-lg z-10">

    <div class="flex-1 flex items-center">
    </div>

    <div class="flex items-center gap-md">

        <button
            aria-label="notifications"
            class="text-on-surface-variant hover:text-primary transition-colors p-sm rounded-full hover:bg-surface-container-low">

            <span class="material-symbols-outlined">
                notifications
            </span>

        </button>

        <button
            aria-label="settings"
            class="text-on-surface-variant hover:text-primary transition-colors p-sm rounded-full hover:bg-surface-container-low">

            <span class="material-symbols-outlined">
                settings
            </span>

        </button>

        <div class="h-6 w-px bg-outline-variant mx-sm"></div>

        <button class="text-on-surface-variant hover:text-primary transition-colors font-body-sm text-body-sm">
            Logout
        </button>

    </div>

</header>


<!-- Main Content -->
<main class="ml-[280px] mt-16 flex-1 overflow-y-auto p-margin-desktop bg-surface w-[calc(100%-280px)]">

    <div class="flex justify-between items-center mb-lg">

        <div>

            <nav aria-label="Breadcrumb"
                 class="flex text-on-surface-variant font-label-caps text-label-caps mb-xs">

                <ol class="inline-flex items-center space-x-1 md:space-x-3">

                    <li class="inline-flex items-center">

                        <a class="hover:text-primary transition-colors"
                           href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">
                            Admin
                        </a>

                    </li>

                    <li>

                        <div class="flex items-center">

                            <span class="material-symbols-outlined text-[14px] mx-1">
                                chevron_right
                            </span>

                            <span aria-current="page" class="text-on-surface">
                                Event Managers
                            </span>

                        </div>

                    </li>

                </ol>

            </nav>

            <h2 class="font-display-lg text-display-lg text-primary">
                Manage Event Managers
            </h2>

        </div>


        <a
            href="<%= request.getContextPath() %>/admin/add_manager/addManager.jsp"
            class="bg-primary text-on-primary font-body-sm text-body-sm font-semibold py-2 px-4 rounded-lg flex items-center gap-sm hover:opacity-90 transition-opacity">

            <span class="material-symbols-outlined text-[18px]">
                add
            </span>

            Add Manager

        </a>

    </div>


    <!-- Data Table Container -->
    <div class="bg-surface-container-lowest border border-outline-variant rounded-xl overflow-hidden">


        <!-- Table Header Tools -->
        <div class="p-md border-b border-outline-variant flex justify-between items-center bg-surface-container-lowest">

            <div class="relative w-64">

                <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-[18px]">
                    search
                </span>

                <input
                    class="w-full pl-10 pr-3 py-2 bg-surface border border-outline-variant rounded-lg font-body-sm text-body-sm text-on-surface focus:outline-none focus:border-tertiary focus:ring-1 focus:ring-tertiary transition-colors"
                    placeholder="Search managers..."
                    type="text"/>

            </div>


            <div class="flex gap-sm">

                <button
                    class="px-3 py-1.5 border border-outline-variant rounded-lg font-body-sm text-body-sm text-on-surface-variant flex items-center gap-xs hover:bg-surface-container-low transition-colors">

                    <span class="material-symbols-outlined text-[16px]">
                        filter_list
                    </span>

                    Filter

                </button>

                <button
                    class="px-3 py-1.5 border border-outline-variant rounded-lg font-body-sm text-body-sm text-on-surface-variant flex items-center gap-xs hover:bg-surface-container-low transition-colors">

                    <span class="material-symbols-outlined text-[16px]">
                        download
                    </span>

                    Export

                </button>

            </div>

        </div>


        <!-- Table -->
        <div class="overflow-x-auto">

            <table class="w-full text-left border-collapse">

                <thead class="bg-surface-container border-b border-outline-variant">

                    <tr>

                        <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant whitespace-nowrap">
                            Manager ID
                        </th>

                        <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant whitespace-nowrap">
                            Name
                        </th>

                        <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant whitespace-nowrap">
                            Email
                        </th>

                        <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant whitespace-nowrap">
                            Contact
                        </th>

                        <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant whitespace-nowrap">
                            Status
                        </th>

                        <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant whitespace-nowrap text-right">
                            Events
                        </th>

                        <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant whitespace-nowrap text-right">
                            Actions
                        </th>

                    </tr>

                </thead>


                <tbody class="font-body-sm text-body-sm text-on-surface divide-y divide-outline-variant">

                    <%
                        java.sql.Connection con = null;
                        java.sql.PreparedStatement ps = null;
                        java.sql.ResultSet rs = null;

                        try {

                            Class.forName("oracle.jdbc.driver.OracleDriver");

                            con = java.sql.DriverManager.getConnection(
                                "jdbc:oracle:thin:@localhost:1521:XE",
                                "system",
                                "manager"
                            );

                            String sql =
                                "SELECT MANAGER_ID, NAME, EMAIL, CONTACT, STATUS " +
                                "FROM EVENT_MANAGERS " +
                                "ORDER BY MANAGER_ID";

                            ps = con.prepareStatement(sql);

                            rs = ps.executeQuery();

                            while (rs.next()) {

                                int managerId = rs.getInt("MANAGER_ID");
                                String name = rs.getString("NAME");
                                String email = rs.getString("EMAIL");
                                String contact = rs.getString("CONTACT");
                                String status = rs.getString("STATUS");

                                if (name == null) {
                                    name = "";
                                }

                                if (email == null) {
                                    email = "";
                                }

                                if (contact == null) {
                                    contact = "";
                                }

                                if (status == null) {
                                    status = "";
                                }

                                String initials = "";

                                if (!name.trim().isEmpty()) {

                                    String[] parts = name.trim().split("\\s+");

                                    if (parts.length == 1) {
                                        initials = parts[0].substring(0, 1).toUpperCase();
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
                                    statusClass = "bg-[#e6f4ea] text-[#137333]";
                                    statusText = "Active";
                                } else {
                                    statusClass = "bg-[#fce8e6] text-[#c5221f]";
                                    statusText = status.isEmpty()
                                            ? "Unknown"
                                            : status;
                                }
                    %>

                    <tr class="table-row-hover bg-surface-container-lowest transition-colors">

                        <td class="py-2.5 px-md font-data-mono text-data-mono text-on-surface-variant">
                            <%= managerId %>
                        </td>

                        <td class="py-2.5 px-md font-semibold flex items-center gap-sm">

                            <div class="w-6 h-6 rounded-full bg-primary-container text-on-primary-container flex items-center justify-center font-label-caps text-label-caps">
                                <%= initials %>
                            </div>

                            <%= name %>

                        </td>

                        <td class="py-2.5 px-md text-on-surface-variant">
                            <%= email %>
                        </td>

                        <td class="py-2.5 px-md text-on-surface-variant">
                            <%= contact %>
                        </td>

                        <td class="py-2.5 px-md">

                            <span class="inline-flex items-center px-2 py-0.5 rounded-full text-[11px] font-semibold tracking-wide <%= statusClass %>">
                                <%= statusText %>
                            </span>

                        </td>

                        <td class="py-2.5 px-md font-data-mono text-data-mono text-right text-on-surface-variant">
                            -
                        </td>

                        <td class="py-2.5 px-md text-right">

                            <div class="flex justify-end gap-1">

                                <a
                                    class="p-1 text-on-surface-variant hover:text-primary transition-colors"
                                    title="View"
                                    href="<%= request.getContextPath() %>/EditManagerServlet?managerId=<%= managerId %>">

                                    <span class="material-symbols-outlined text-[18px]">
                                        visibility
                                    </span>

                                </a>


                                <a
                                    class="p-1 text-on-surface-variant hover:text-primary transition-colors"
                                    title="Edit"
                                    href="<%= request.getContextPath() %>/EditManagerServlet?managerId=<%= managerId %>">

                                    <span class="material-symbols-outlined text-[18px]">
                                        edit
                                    </span>

                                </a>


                                <a
                                    class="p-1 text-on-surface-variant hover:text-error transition-colors"
                                    title="Disable"
                                    href="<%= request.getContextPath() %>/EditManagerServlet?managerId=<%= managerId %>&action=disable">

                                    <span class="material-symbols-outlined text-[18px]">
                                        block
                                    </span>

                                </a>


                                <a
                                    class="p-1 text-on-surface-variant hover:text-error transition-colors"
                                    title="Delete"
                                    href="<%= request.getContextPath() %>/EditManagerServlet?managerId=<%= managerId %>&action=delete"
                                    onclick="return confirm('Are you sure you want to delete this manager?');">

                                    <span class="material-symbols-outlined text-[18px]">
                                        delete
                                    </span>

                                </a>

                            </div>

                        </td>

                    </tr>

                    <%
                            }

                        } catch (Exception e) {
                    %>

                    <tr>

                        <td colspan="7" class="py-6 px-md text-center text-error">
                            Error loading managers: <%= e.getMessage() %>
                        </td>

                    </tr>

                    <%
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
                    %>

                </tbody>

            </table>

        </div>


        <!-- Pagination -->
        <div class="p-md border-t border-outline-variant flex justify-between items-center bg-surface-container-lowest">

            <p class="font-body-sm text-body-sm text-on-surface-variant">
                Showing managers from database
            </p>

            <div class="flex items-center gap-sm">

                <button
                    class="p-1 border border-outline-variant rounded text-on-surface-variant hover:bg-surface-container-low disabled:opacity-50"
                    disabled>

                    <span class="material-symbols-outlined text-[18px]">
                        chevron_left
                    </span>

                </button>

                <button
                    class="p-1 border border-outline-variant rounded text-on-surface-variant hover:bg-surface-container-low">

                    <span class="material-symbols-outlined text-[18px]">
                        chevron_right
                    </span>

                </button>

            </div>

        </div>

    </div>


    <!-- Footer -->
    <footer class="mt-xl border-t border-outline-variant py-md flex justify-between items-center text-on-surface-variant font-label-caps text-label-caps">

        <p>
            © 2024 EventHub Enterprise. All rights reserved.
        </p>

        <div class="flex gap-lg">

            <a class="hover:text-primary transition-colors" href="#">
                Security Policy
            </a>

            <a class="hover:text-primary transition-colors" href="#">
                Terms of Service
            </a>

            <a class="hover:text-primary transition-colors" href="#">
                Help Center
            </a>

        </div>

    </footer>

</main>

</body>
</html>

