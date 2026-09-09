
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

<title>Edit Manager - EventHub</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>

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
    font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
}
</style>

</head>

<body class="bg-background text-on-background font-body-md h-screen flex overflow-hidden">

<%
    /*
     * =========================================================
     * ADMIN INFORMATION
     * =========================================================
     */

    String adminName =
            session.getAttribute("adminName") != null
                    ? session.getAttribute("adminName").toString()
                    : "Admin User";


    /*
     * =========================================================
     * MANAGER INFORMATION
     * These values are loaded by EditManagerServlet.
     * =========================================================
     */

    Object managerIdObject =
            request.getAttribute("managerId");

    String managerId =
            managerIdObject != null
                    ? managerIdObject.toString()
                    : "";


    String name =
            request.getAttribute("name") != null
                    ? request.getAttribute("name").toString()
                    : "";


    String email =
            request.getAttribute("email") != null
                    ? request.getAttribute("email").toString()
                    : "";


    String contact =
            request.getAttribute("contact") != null
                    ? request.getAttribute("contact").toString()
                    : "";


    String address =
            request.getAttribute("address") != null
                    ? request.getAttribute("address").toString()
                    : "";


    String status =
            request.getAttribute("status") != null
                    ? request.getAttribute("status").toString()
                    : "INACTIVE";


    java.sql.Date dateAdded =
            (java.sql.Date) request.getAttribute("dateAdded");


    java.sql.Timestamp lastLogin =
            (java.sql.Timestamp) request.getAttribute("lastLogin");


    Object eventsManagedObject =
            request.getAttribute("eventsManaged");


    String eventsManaged =
            eventsManagedObject != null
                    ? eventsManagedObject.toString()
                    : "0";


    boolean active =
            "ACTIVE".equalsIgnoreCase(status);

%>


<!-- =========================================================
     SIDE NAVIGATION
     ========================================================= -->

<aside
    class="bg-surface-container-lowest dark:bg-surface-container-lowest fixed left-0 top-0 h-full w-[280px] border-r border-outline-variant dark:border-outline-variant flex flex-col py-lg px-md z-20 hidden md:flex">


    <div class="mb-xl px-sm">

        <h1 class="font-headline-lg text-headline-lg font-bold text-primary dark:text-on-primary-fixed">
            EventHub
        </h1>

        <p class="font-body-sm text-body-sm text-on-surface-variant">
            Enterprise Admin
        </p>

    </div>


    <nav class="flex flex-col gap-xs flex-1">


        <!-- Dashboard -->

        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

            <span class="material-symbols-outlined">
                dashboard
            </span>

            <span class="font-title-md text-title-md">
                Dashboard
            </span>

        </a>


        <!-- Users -->

        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/ManageUsersServlet">

            <span class="material-symbols-outlined">
                group
            </span>

            <span class="font-title-md text-title-md">
                Users
            </span>

        </a>


        <!-- Event Managers -->

        <a
            class="flex items-center gap-md px-md py-sm rounded text-primary dark:text-on-primary-fixed font-bold border-r-4 border-primary bg-surface-container-low"
            href="<%= request.getContextPath() %>/ManageEventManagersServlet">

            <span class="material-symbols-outlined">
                badge
            </span>

            <span class="font-title-md text-title-md">
                Event Managers
            </span>

        </a>


        <!-- Events -->

        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/ManageEventsServlet">

            <span class="material-symbols-outlined">
                calendar_today
            </span>

            <span class="font-title-md text-title-md">
                Events
            </span>

        </a>


        <!-- Accessories -->

        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/AccessoriesServlet">

            <span class="material-symbols-outlined">
                inventory_2
            </span>

            <span class="font-title-md text-title-md">
                Accessories
            </span>

        </a>


        <!-- Bookings -->

        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/ManageBookingsServlet">

            <span class="material-symbols-outlined">
                confirmation_number
            </span>

            <span class="font-title-md text-title-md">
                Bookings
            </span>

        </a>


        <!-- Reports -->

        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/ReportsServlet">

            <span class="material-symbols-outlined">
                assessment
            </span>

            <span class="font-title-md text-title-md">
                Reports
            </span>

        </a>


        <!-- Profile -->

        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/AdminProfileServlet">

            <span class="material-symbols-outlined">
                account_circle
            </span>

            <span class="font-title-md text-title-md">
                Profile
            </span>

        </a>

    </nav>


    <!-- CURRENT ADMIN -->

    <div class="mt-auto px-sm pt-lg border-t border-outline-variant flex items-center gap-md">

        <div class="w-10 h-10 rounded-full bg-surface-container-high overflow-hidden shrink-0">

            <img
                alt="Admin User Profile"
                class="w-full h-full object-cover"
                src="https://lh3.googleusercontent.com/aida-public/AB6AXuDXbo7iHtHm56FOHVT4C1vUyEUQG-VGONo2CCY-E-WKciOZwQylZ_Jt5gx9MzNPgb9hTl-54QpfG6B05ab4EEPawSl8otvoWweyzhWsbIVyscu_BV2WBs8NQY_1kiHqDVJwZZiDtBoySmJugK47iPei6pL1RA4JsmlrBMd6U9VzGUAdAi38D1K7dAQD_VWFVk_mHGbp-rvHJh8FFHCCfzOrRU1C5VRLkh46QuybtUSlX-tOVS4cGfnrLg"/>

        </div>

        <div class="overflow-hidden">

            <p class="font-body-md text-body-md font-bold truncate">
                <%= adminName %>
            </p>

            <p class="font-label-caps text-label-caps text-on-surface-variant">
                Enterprise Admin
            </p>

        </div>

    </div>

</aside>


<!-- =========================================================
     MAIN AREA
     ========================================================= -->

<div class="flex-1 flex flex-col md:ml-[280px] w-full min-w-0">


    <!-- TOP NAVIGATION -->

    <header
        class="bg-surface-container-lowest dark:bg-surface-container-lowest border-b border-outline-variant dark:border-outline-variant h-16 flex justify-between items-center px-lg z-10 shrink-0 sticky top-0">


        <div class="hidden md:flex items-center flex-1">

            <div class="relative w-64">

                <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant">
                    search
                </span>


                <input
                    id="pageSearch"
                    onkeyup="searchPage()"
                    class="w-full bg-surface-container-low border border-transparent rounded-full py-2 pl-10 pr-4 font-body-sm text-body-sm focus:bg-surface focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 transition-all outline-none"
                    placeholder="Search..."
                    type="text"/>

            </div>

        </div>


        <div class="flex items-center gap-sm">


            <!-- NOTIFICATIONS -->

            <button
                type="button"
                onclick="showNotifications()"
                class="p-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low rounded-full transition-colors"
                aria-label="Notifications">

                <span class="material-symbols-outlined">
                    notifications
                </span>

            </button>


            <!-- SETTINGS -->

            <button
                type="button"
                onclick="showSettings()"
                class="p-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low rounded-full transition-colors"
                aria-label="Settings">

                <span class="material-symbols-outlined">
                    settings
                </span>

            </button>


            <div class="h-6 w-px bg-outline-variant mx-2 hidden sm:block">
            </div>


            <!-- LOGOUT -->

            <button
                type="button"
                onclick="logout()"
                class="hidden sm:flex items-center gap-xs px-md py-2 font-body-sm text-body-sm font-semibold text-secondary hover:text-primary transition-colors">

                <span>
                    Logout
                </span>

                <span class="material-symbols-outlined text-[18px]">
                    logout
                </span>

            </button>

        </div>

    </header>


    <!-- =====================================================
         PAGE CONTENT
         ===================================================== -->

    <main
        class="flex-1 overflow-y-auto p-margin-mobile md:p-margin-desktop bg-background">


        <div class="max-w-4xl mx-auto">


            <!-- =================================================
                 EDIT FORM
                 ================================================= -->

            <form
                action="<%= request.getContextPath() %>/EditManagerServlet"
                method="post"
                onsubmit="return validateForm();">


                <input
                    type="hidden"
                    name="managerId"
                    value="<%= managerId %>"/>


                <!-- =================================================
                     HEADER
                     ================================================= -->

                <div class="mb-lg">


                    <nav
                        class="flex items-center gap-xs font-label-caps text-label-caps text-on-surface-variant mb-md">


                        <a
                            class="hover:text-primary transition-colors"
                            href="<%= request.getContextPath() %>/ManageEventManagersServlet">

                            Event Managers

                        </a>


                        <span class="material-symbols-outlined text-[16px]">
                            chevron_right
                        </span>


                        <span class="text-primary">
                            Edit Manager
                        </span>

                    </nav>


                    <div
                        class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-md">


                        <div>

                            <h2
                                class="font-display-lg text-display-lg text-on-background">

                                Edit Manager

                            </h2>


                            <p
                                class="font-body-md text-body-md text-on-surface-variant mt-1">

                                Update details and permissions for
                                <strong><%= name %></strong>.

                            </p>

                        </div>


                        <div class="flex gap-sm">


                            <!-- CANCEL -->

                            <button
                                type="button"
                                onclick="cancelEdit()"
                                class="px-md py-2 border border-outline rounded font-body-sm text-body-sm font-semibold text-on-surface hover:bg-surface-container-low transition-colors">

                                Cancel

                            </button>


                            <!-- SAVE -->

                            <button
                                type="submit"
                                class="bg-black text-white px-lg py-2 rounded-lg font-body-sm text-body-sm font-semibold hover:bg-gray-800 transition-colors flex items-center gap-sm shadow-sm">

                                <span class="material-symbols-outlined text-[18px]">
                                    save
                                </span>

                                Save Changes

                            </button>

                        </div>

                    </div>

                </div>


                <!-- =================================================
                     FORM CONTENT
                     ================================================= -->

                <div class="grid grid-cols-1 lg:grid-cols-3 gap-gutter">


                    <!-- =================================================
                         LEFT COLUMN
                         ================================================= -->

                    <div class="lg:col-span-2 flex flex-col gap-gutter">


                        <!-- BASIC INFORMATION -->

                        <div
                            class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg">


                            <h3
                                class="font-title-md text-title-md mb-md border-b border-outline-variant pb-sm">

                                Basic Information

                            </h3>


                            <div
                                class="flex flex-col sm:flex-row gap-lg mb-lg items-center sm:items-start">


                                <!-- MANAGER IMAGE -->

                                <div class="relative group">

                                    <div
                                        class="w-24 h-24 rounded-full bg-surface-container-high overflow-hidden border-2 border-surface">


                                        <img
                                            alt="Manager Profile"
                                            class="w-full h-full object-cover"
                                            src="https://lh3.googleusercontent.com/aida-public/AB6AXuBYuu9BKNGkDv-7LIwIKpkKYMhw_SzjOhRyhAtMl5XsumSg7etd1Lc3s054fjfsQKeiM9T0pi1avJtR5PMlyhkAlfe7yiNE6nBYkvztBjf47zNSkvjyc8jhKEzC2hJ1IAkZem4YqzzOGTEQGK2zYIrVAG_ALH-R60ubG8lHlXYQ-hx3GbWpBDbKsBVwTb7Cy3DMYU6HnJQ3gjlL_m-GGeZ2khWYN5hq2SDlxvnVIP8CwaHAIiqum2UgBQ"/>

                                    </div>

                                </div>


                                <!-- MANAGER BASIC FIELDS -->

                                <div
                                    class="flex-1 w-full grid grid-cols-1 sm:grid-cols-2 gap-md">


                                    <!-- NAME -->

                                    <div
                                        class="flex flex-col gap-xs sm:col-span-2">


                                        <label
                                            class="font-label-caps text-label-caps text-on-surface-variant">

                                            Full Name

                                        </label>


                                        <input
                                            class="w-full bg-surface-container-lowest border border-outline-variant rounded p-sm font-body-md text-body-md focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 outline-none transition-all"
                                            type="text"
                                            name="name"
                                            value="<%= name %>"
                                            required/>

                                    </div>


                                    <!-- ROLE TITLE -->

                                    <div class="flex flex-col gap-xs">

                                        <label
                                            class="font-label-caps text-label-caps text-on-surface-variant">

                                            Role Title

                                        </label>


                                        <input
                                            class="w-full bg-surface-container-lowest border border-outline-variant rounded p-sm font-body-md text-body-md"
                                            type="text"
                                            value="Event Manager"
                                            readonly/>

                                    </div>


                                    <!-- DEPARTMENT -->

                                    <div class="flex flex-col gap-xs">

                                        <label
                                            class="font-label-caps text-label-caps text-on-surface-variant">

                                            Department

                                        </label>


                                        <input
                                            class="w-full bg-surface-container-lowest border border-outline-variant rounded p-sm font-body-md text-body-md"
                                            type="text"
                                            value="Event Management"
                                            readonly/>

                                    </div>

                                </div>

                            </div>

                        </div>


                        <!-- CONTACT DETAILS -->

                        <div
                            class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg">


                            <h3
                                class="font-title-md text-title-md mb-md border-b border-outline-variant pb-sm">

                                Contact Details

                            </h3>


                            <div
                                class="grid grid-cols-1 sm:grid-cols-2 gap-md">


                                <!-- EMAIL -->

                                <div
                                    class="flex flex-col gap-xs">


                                    <label
                                        class="font-label-caps text-label-caps text-on-surface-variant">

                                        Email Address

                                    </label>


                                    <div class="relative w-full">

                                        <span
                                            class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-[20px]">

                                            mail

                                        </span>


                                        <input
                                            class="w-full bg-surface-container-lowest border border-outline-variant rounded py-sm pl-10 pr-sm font-body-md text-body-md focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 outline-none transition-all"
                                            type="email"
                                            name="email"
                                            value="<%= email %>"
                                            required/>

                                    </div>

                                </div>


                                <!-- CONTACT -->

                                <div
                                    class="flex flex-col gap-xs">


                                    <label
                                        class="font-label-caps text-label-caps text-on-surface-variant">

                                        Phone Number

                                    </label>


                                    <div class="relative w-full">

                                        <span
                                            class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-[20px]">

                                            phone

                                        </span>


                                        <input
                                            class="w-full bg-surface-container-lowest border border-outline-variant rounded py-sm pl-10 pr-sm font-data-mono text-data-mono focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 outline-none transition-all"
                                            type="tel"
                                            name="contact"
                                            value="<%= contact %>"/>

                                    </div>

                                </div>


                                <!-- ADDRESS -->

                                <div
                                    class="flex flex-col gap-xs sm:col-span-2">


                                    <label
                                        class="font-label-caps text-label-caps text-on-surface-variant">

                                        Office Location

                                    </label>


                                    <div class="relative w-full">

                                        <span
                                            class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-[20px]">

                                            location_on

                                        </span>


                                        <input
                                            class="w-full bg-surface-container-lowest border border-outline-variant rounded py-sm pl-10 pr-sm font-body-md text-body-md focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 outline-none transition-all"
                                            type="text"
                                            name="address"
                                            value="<%= address %>"/>

                                    </div>

                                </div>


                            </div>

                        </div>


                        <!-- PASSWORD -->

                        <div
                            class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg">


                            <h3
                                class="font-title-md text-title-md mb-md border-b border-outline-variant pb-sm">

                                Account Password

                            </h3>


                            <div class="flex flex-col gap-xs">


                                <label
                                    class="font-label-caps text-label-caps text-on-surface-variant">

                                    New Password

                                </label>


                                <div class="relative">

                                    <input
                                        type="password"
                                        id="password"
                                        name="password"
                                        placeholder="Leave blank to keep current password"
                                        class="w-full bg-surface-container-lowest border border-outline-variant rounded p-sm pr-10 font-body-md text-body-md focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 outline-none transition-all"/>


                                    <button
                                        type="button"
                                        onclick="togglePassword()"
                                        class="absolute right-2 top-1/2 -translate-y-1/2 text-on-surface-variant hover:text-primary">

                                        <span
                                            id="passwordIcon"
                                            class="material-symbols-outlined text-[20px]">

                                            visibility

                                        </span>

                                    </button>

                                </div>


                                <p
                                    class="font-body-sm text-body-sm text-on-surface-variant">

                                    Leave blank to keep the current password.

                                </p>

                            </div>

                        </div>

                    </div>


                    <!-- =================================================
                         RIGHT COLUMN
                         ================================================= -->

                    <div class="flex flex-col gap-gutter">


                        <!-- ACCOUNT STATUS -->

                        <div
                            class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg">


                            <h3
                                class="font-title-md text-title-md mb-md border-b border-outline-variant pb-sm">

                                Account Status

                            </h3>


                            <div class="flex flex-col gap-md">


                                <div
                                    class="flex items-center justify-between p-sm border border-outline-variant rounded bg-surface-container-low">


                                    <div
                                        class="flex items-center gap-sm">


                                        <div
                                            id="statusDot"
                                            class="w-3 h-3 rounded-full <%= active ? "bg-primary" : "bg-error" %>">
                                        </div>


                                        <span
                                            id="statusText"
                                            class="font-body-sm text-body-sm font-semibold">

                                            <%= active ? "Active" : "Inactive" %>

                                        </span>

                                    </div>


                                    <label
                                        class="relative inline-flex items-center cursor-pointer">


                                        <input
                                            class="sr-only peer"
                                            type="checkbox"
                                            name="status"
                                            value="ACTIVE"
                                            id="statusToggle"
                                            <%= active ? "checked" : "" %>
                                            onchange="updateStatusDisplay()"/>


                                        <div
                                            class="w-9 h-5 bg-outline-variant peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all peer-checked:bg-primary">
                                        </div>

                                    </label>

                                </div>


                                <div
                                    class="bg-surface-container-low p-sm rounded border border-outline-variant">

                                    <p
                                        class="font-body-sm text-body-sm text-on-surface-variant">

                                        Turn the switch off to make this manager inactive.

                                    </p>

                                </div>

                            </div>

                        </div>


                        <!-- SYSTEM DATA -->

                        <div
                            class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg">


                            <h3
                                class="font-title-md text-title-md mb-md border-b border-outline-variant pb-sm">

                                System Data

                            </h3>


                            <dl
                                class="flex flex-col gap-sm font-body-sm text-body-sm">


                                <!-- MANAGER ID -->

                                <div
                                    class="flex justify-between py-xs border-b border-surface-container-highest">

                                    <dt class="text-on-surface-variant">
                                        Manager ID
                                    </dt>

                                    <dd
                                        class="font-data-mono text-data-mono font-medium">

                                        <%= managerId %>

                                    </dd>

                                </div>


                                <!-- DATE ADDED -->

                                <div
                                    class="flex justify-between py-xs border-b border-surface-container-highest">

                                    <dt class="text-on-surface-variant">
                                        Date Added
                                    </dt>

                                    <dd class="font-medium">

                                        <%= dateAdded != null
                                                ? dateAdded
                                                : "Not Available" %>

                                    </dd>

                                </div>


                                <!-- LAST LOGIN -->

                                <div
                                    class="flex justify-between py-xs border-b border-surface-container-highest">

                                    <dt class="text-on-surface-variant">
                                        Last Login
                                    </dt>

                                    <dd class="font-medium">

                                        <%= lastLogin != null
                                                ? lastLogin
                                                : "Not Available" %>

                                    </dd>

                                </div>


                                <!-- EVENTS MANAGED -->

                                <div
                                    class="flex justify-between py-xs">

                                    <dt class="text-on-surface-variant">
                                        Events Managed
                                    </dt>

                                    <dd
                                        class="font-data-mono text-data-mono font-medium">

                                        <%= eventsManaged %>

                                    </dd>

                                </div>

                            </dl>

                        </div>


                        <!-- DANGER ZONE -->

                        <div
                            class="bg-error-container/20 border border-error/30 rounded-xl p-lg mt-auto">


                            <h3
                                class="font-title-md text-title-md text-error mb-sm">

                                Danger Zone

                            </h3>


                            <p
                                class="font-body-sm text-body-sm text-on-surface-variant mb-md">

                                Deactivating will revoke all access immediately.

                            </p>


                            <% if (active) { %>

                            <button
                                type="button"
                                onclick="deactivateManager()"
                                class="w-full px-md py-2 border border-error text-error rounded font-body-sm text-body-sm font-semibold hover:bg-error-container transition-colors">

                                Deactivate Manager

                            </button>

                            <% } else { %>

                            <button
                                type="button"
                                onclick="activateManager()"
                                class="w-full px-md py-2 border border-primary text-primary rounded font-body-sm text-body-sm font-semibold hover:bg-surface-container-low transition-colors">

                                Activate Manager

                            </button>

                            <% } %>

                        </div>

                    </div>

                </div>

            </form>

        </div>

    </main>

</div>


<!-- =========================================================
     JAVASCRIPT
     ========================================================= -->

<script>


/*
 * =========================================================
 * CANCEL
 * =========================================================
 */

function cancelEdit() {

    window.location.href =
        "<%= request.getContextPath() %>/ManageEventManagersServlet";

}


/*
 * =========================================================
 * FORM VALIDATION
 * =========================================================
 */

function validateForm() {

    const name =
        document.querySelector(
            'input[name="name"]'
        ).value.trim();


    const email =
        document.querySelector(
            'input[name="email"]'
        ).value.trim();


    if (name === "") {

        alert(
            "Please enter the manager name."
        );

        return false;

    }


    if (email === "") {

        alert(
            "Please enter the manager email."
        );

        return false;

    }


    return true;

}


/*
 * =========================================================
 * STATUS DISPLAY
 * =========================================================
 */

function updateStatusDisplay() {

    const toggle =
        document.getElementById(
            "statusToggle"
        );


    const statusText =
        document.getElementById(
            "statusText"
        );


    const statusDot =
        document.getElementById(
            "statusDot"
        );


    if (toggle.checked) {

        statusText.textContent =
            "Active";


        statusDot.classList.remove(
            "bg-error"
        );


        statusDot.classList.add(
            "bg-primary"
        );

    } else {

        statusText.textContent =
            "Inactive";


        statusDot.classList.remove(
            "bg-primary"
        );


        statusDot.classList.add(
            "bg-error"
        );

    }

}


/*
 * =========================================================
 * DEACTIVATE
 * =========================================================
 */

function deactivateManager() {

    if (
        !confirm(
            "Are you sure you want to deactivate this manager?"
        )
    ) {

        return;

    }


    window.location.href =
        "<%= request.getContextPath() %>/EditManagerServlet"
        + "?action=disable"
        + "&managerId=<%= managerId %>";

}


/*
 * =========================================================
 * ACTIVATE
 * =========================================================
 */

function activateManager() {

    if (
        !confirm(
            "Do you want to activate this manager?"
        )
    ) {

        return;

    }


    window.location.href =
        "<%= request.getContextPath() %>/EditManagerServlet"
        + "?action=enable"
        + "&managerId=<%= managerId %>";

}


/*
 * =========================================================
 * PASSWORD VISIBILITY
 * =========================================================
 */

function togglePassword() {

    const password =
        document.getElementById(
            "password"
        );


    const icon =
        document.getElementById(
            "passwordIcon"
        );


    if (
        password.type === "password"
    ) {

        password.type =
            "text";

        icon.textContent =
            "visibility_off";

    } else {

        password.type =
            "password";

        icon.textContent =
            "visibility";

    }

}


/*
 * =========================================================
 * SEARCH
 * =========================================================
 */

function searchPage() {

    const value =
        document.getElementById(
            "pageSearch"
        ).value
        .toLowerCase()
        .trim();


    if (value.includes("manager")) {

        window.location.href =
            "<%= request.getContextPath() %>/ManageEventManagersServlet";

    }

}


/*
 * =========================================================
 * NOTIFICATIONS
 * =========================================================
 */

function showNotifications() {

    alert(
        "No new notifications."
    );

}


/*
 * =========================================================
 * SETTINGS
 * =========================================================
 */

function showSettings() {

    alert(
        "Settings are not configured yet."
    );

}


/*
 * =========================================================
 * LOGOUT
 * =========================================================
 */

function logout() {

    if (
        confirm(
            "Are you sure you want to logout?"
        )
    ) {

        window.location.href =
            "<%= request.getContextPath() %>/admin/admin_login/adminLogin.html";

    }

}


/*
 * =========================================================
 * INITIALIZATION
 * =========================================================
 */

document.addEventListener(
    "DOMContentLoaded",
    function() {

        updateStatusDisplay();

    }
);

</script>


</body>

</html>

