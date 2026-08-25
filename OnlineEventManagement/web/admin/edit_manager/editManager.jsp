
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<!-- SideNavBar -->
<aside class="bg-surface-container-lowest dark:bg-surface-container-lowest fixed left-0 top-0 h-full w-[280px] border-r border-outline-variant dark:border-outline-variant flex flex-col py-lg px-md z-20 hidden md:flex">

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
        <a class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
           href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

            <span class="material-symbols-outlined">dashboard</span>
            <span class="font-title-md text-title-md">Dashboard</span>

        </a>


        <!-- Users -->
        <a class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
           href="<%= request.getContextPath() %>/ManageUsersServlet">

            <span class="material-symbols-outlined">group</span>
            <span class="font-title-md text-title-md">Users</span>

        </a>


        <!-- Event Managers - Active -->
        <a class="flex items-center gap-md px-md py-sm rounded text-primary dark:text-on-primary-fixed font-bold border-r-4 border-primary bg-surface-container-low"
           href="<%= request.getContextPath() %>/ManageEventManagersServlet">

            <span class="material-symbols-outlined">badge</span>
            <span class="font-title-md text-title-md">Event Managers</span>

        </a>


        <!-- Events - Not connected yet -->
        <a class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
           href="#">

            <span class="material-symbols-outlined">calendar_today</span>
            <span class="font-title-md text-title-md">Events</span>

        </a>


        <!-- Accessories  -->
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


        <!-- Bookings - Not connected yet -->
        <a class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
           href="#">

            <span class="material-symbols-outlined">confirmation_number</span>
            <span class="font-title-md text-title-md">Bookings</span>

        </a>


        <!-- Reports - Not connected yet -->
        <a class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
           href="#">

            <span class="material-symbols-outlined">assessment</span>
            <span class="font-title-md text-title-md">Reports</span>

        </a>


        <!-- Profile -->
        <a class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
           href="<%= request.getContextPath() %>/AdminProfileServlet">

            <span class="material-symbols-outlined">account_circle</span>
            <span class="font-title-md text-title-md">Profile</span>

        </a>

    </nav>

    <div class="mt-auto px-sm pt-lg border-t border-outline-variant flex items-center gap-md">

        <div class="w-10 h-10 rounded-full bg-surface-container-high overflow-hidden shrink-0">

            <img
                alt="Admin User Profile"
                class="w-full h-full object-cover"
                src="https://lh3.googleusercontent.com/aida-public/AB6AXuDXbo7iHtHm56FOHVT4C1vUyEUQG-VGONo2CCY-E-WKciOZwQylZ_Jt5gx9MzNPgb9hTl-54QpfG6B05ab4EEPawSl8otvoWweyzhWsbIVyscu_BV2WBs8NQY_1kiHqDVJwZZiDtBoySmJugK47iPei6pL1RA4JsmlrBMd6U9VzGUAdAi38D1K7dAQD_VWFVk_mHGbp-rvHJh8FFHCCfzOrRU1C5VRLkh46QuybtUSlX-tOVS4cGfnrLg"/>

        </div>

        <div class="overflow-hidden">

            <p class="font-body-md text-body-md font-bold truncate">
                Admin User
            </p>

        </div>

    </div>

</aside>

<!-- Main Content Area -->
<div class="flex-1 flex flex-col md:ml-[280px] w-full min-w-0">

    <!-- TopNavBar -->
    <header class="bg-surface-container-lowest dark:bg-surface-container-lowest border-b border-outline-variant dark:border-outline-variant h-16 flex justify-between items-center px-lg z-10 shrink-0 sticky top-0">

        <div class="flex items-center gap-md md:hidden">
            <button class="p-sm text-on-surface-variant hover:bg-surface-container-low rounded-full transition-colors">
                <span class="material-symbols-outlined">menu</span>
            </button>

            <span class="font-headline-lg-mobile text-headline-lg-mobile font-bold text-primary">
                EventHub
            </span>
        </div>

        <div class="hidden md:flex items-center flex-1">

            <div class="relative w-64">
                <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant">
                    search
                </span>

                <input
                    class="w-full bg-surface-container-low border border-transparent rounded-full py-2 pl-10 pr-4 font-body-sm text-body-sm focus:bg-surface focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 transition-all outline-none"
                    placeholder="Search..."
                    type="text"/>
            </div>

        </div>

        <div class="flex items-center gap-sm">

            <button class="p-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low rounded-full transition-colors">
                <span class="material-symbols-outlined">notifications</span>
            </button>

            <button class="p-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low rounded-full transition-colors">
                <span class="material-symbols-outlined">settings</span>
            </button>

            <div class="h-6 w-px bg-outline-variant mx-2 hidden sm:block"></div>

            <button class="hidden sm:flex items-center gap-xs px-md py-2 font-body-sm text-body-sm font-semibold text-secondary hover:text-primary transition-colors">
                <span>Logout</span>
            </button>

            <div class="w-8 h-8 rounded-full bg-surface-container-high overflow-hidden ml-2 sm:hidden cursor-pointer">
                <img
                    alt="Admin Profile"
                    class="w-full h-full object-cover"
                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuAVYv88qOQRhBu94qIFQ4vaOXuS7Qi5wLVr96tzyQ9SzfkAOienIqfm-8PVTWhRMXZMtOobKalASfvRg9E4MJBSiAwxzGkX3Qhtd2kc8DCdRmC_pJWgv3WEmidyH4dvklWLJBchfEBTGtBIVqv-HJDEpjWdg5NIApdGTL-VQ3uQWF4eX7OemvcowLL8BzienhaVxH0axlPxu3CTfxT1WJowrouIuvNHWc_1zbrzkDHzPt1wsnFxevlhDw"/>
            </div>

        </div>

    </header>


    <!-- Canvas -->
    <main class="flex-1 overflow-y-auto p-margin-mobile md:p-margin-desktop bg-background">

        <div class="max-w-4xl mx-auto">

            <!-- FORM START -->
            <form action="<%= request.getContextPath() %>/EditManagerServlet"
                  method="post">

                <input
                    type="hidden"
                    name="managerId"
                    value="<%= request.getAttribute("managerId") != null ? request.getAttribute("managerId") : "" %>"/>


                <!-- Breadcrumbs & Header -->
                <div class="mb-lg">

                    <nav class="flex items-center gap-xs font-label-caps text-label-caps text-on-surface-variant mb-md">

                        <a class="hover:text-primary transition-colors" href="#">
                            Event Managers
                        </a>

                        <span class="material-symbols-outlined text-[16px]">
                            chevron_right
                        </span>

                        <span class="text-primary">
                            Edit Manager
                        </span>

                    </nav>


                    <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-md">

                        <div>

                            <h2 class="font-display-lg text-display-lg text-on-background">
                                Edit Manager
                            </h2>

                            <p class="font-body-md text-body-md text-on-surface-variant mt-1">
                                Update details and permissions for
                                <%= request.getAttribute("name") != null
                                    ? request.getAttribute("name")
                                    : "Event Manager" %>.
                            </p>

                        </div>


                        <div class="flex gap-sm">

                            <button
                                type="button"
                                onclick="window.history.back()"
                                class="px-md py-2 border border-outline rounded font-body-sm text-body-sm font-semibold text-on-surface hover:bg-surface-container-low transition-colors">
                                Cancel
                            </button>

                            <button
                                type="submit"
                                class="px-md py-2 bg-primary text-on-primary rounded font-body-sm text-body-sm font-semibold hover:bg-primary/90 transition-colors shadow-sm">
                                Save Changes
                            </button>

                        </div>

                    </div>

                </div>


                <!-- Form Content -->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-gutter">


                    <!-- Left Column -->
                    <div class="lg:col-span-2 flex flex-col gap-gutter">


                        <!-- Profile Card -->
                        <div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg">

                            <h3 class="font-title-md text-title-md mb-md border-b border-outline-variant pb-sm">
                                Basic Information
                            </h3>


                            <div class="flex flex-col sm:flex-row gap-lg mb-lg items-center sm:items-start">

                                <div class="relative group">

                                    <div class="w-24 h-24 rounded-full bg-surface-container-high overflow-hidden border-2 border-surface">

                                        <img
                                            alt="Manager Profile"
                                            class="w-full h-full object-cover"
                                            src="https://lh3.googleusercontent.com/aida-public/AB6AXuBYuu9BKNGkDv-7LIwIKpkKYMhw_SzjOhRyhAtMl5XsumSg7etd1Lc3s054fjfsQKeiM9T0pi1avJtR5PMlyhkAlfe7yiNE6nBYkvztBjf47zNSkvjyc8jhKEzC2hJ1IAkZem4YqzzOGTEQGK2zYIrVAG_ALH-R60ubG8lHlXYQ-hx3GbWpBDbKsBVwTb7Cy3DMYU6HnJQ3gjlL_m-GGeZ2khWYN5hq2SDlxvnVIP8CwaHAIiqum2UgBQ"/>

                                    </div>

                                    <button
                                        type="button"
                                        class="absolute bottom-0 right-0 p-1.5 bg-surface-container-lowest border border-outline-variant rounded-full text-on-surface-variant hover:text-primary transition-colors shadow-sm">

                                        <span class="material-symbols-outlined text-[18px]">
                                            edit
                                        </span>

                                    </button>

                                </div>


                                <div class="flex-1 w-full grid grid-cols-1 sm:grid-cols-2 gap-md">


                                    <div class="flex flex-col gap-xs sm:col-span-2">

                                        <label class="font-label-caps text-label-caps text-on-surface-variant">
                                            Full Name
                                        </label>

                                        <input
                                            class="w-full bg-surface-container-lowest border border-outline-variant rounded p-sm font-body-md text-body-md focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 outline-none transition-all"
                                            type="text"
                                            name="name"
                                            value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>"
                                            required/>

                                    </div>


                                    <!-- UI-only field -->
                                    <div class="flex flex-col gap-xs">

                                        <label class="font-label-caps text-label-caps text-on-surface-variant">
                                            Role Title
                                        </label>

                                        <input
                                            class="w-full bg-surface-container-lowest border border-outline-variant rounded p-sm font-body-md text-body-md focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 outline-none transition-all"
                                            type="text"
                                            value="Senior Event Director"/>

                                    </div>


                                    <!-- UI-only field -->
                                    <div class="flex flex-col gap-xs">

                                        <label class="font-label-caps text-label-caps text-on-surface-variant">
                                            Department
                                        </label>

                                        <select
                                            class="w-full bg-surface-container-lowest border border-outline-variant rounded p-sm font-body-md text-body-md focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 outline-none transition-all appearance-none">

                                            <option>Corporate Events</option>
                                            <option selected>Exhibitions</option>
                                            <option>Private Functions</option>

                                        </select>

                                    </div>

                                </div>

                            </div>

                        </div>


                        <!-- Contact Details -->
                        <div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg">

                            <h3 class="font-title-md text-title-md mb-md border-b border-outline-variant pb-sm">
                                Contact Details
                            </h3>


                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-md">


                                <div class="flex flex-col gap-xs">

                                    <label class="font-label-caps text-label-caps text-on-surface-variant">
                                        Email Address
                                    </label>

                                    <div class="relative w-full">

                                        <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-[20px]">
                                            mail
                                        </span>

                                        <input
                                            class="w-full bg-surface-container-lowest border border-outline-variant rounded py-sm pl-10 pr-sm font-body-md text-body-md focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 outline-none transition-all"
                                            type="email"
                                            name="email"
                                            value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                                            required/>

                                    </div>

                                </div>


                                <div class="flex flex-col gap-xs">

                                    <label class="font-label-caps text-label-caps text-on-surface-variant">
                                        Phone Number
                                    </label>

                                    <div class="relative w-full">

                                        <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-[20px]">
                                            phone
                                        </span>

                                        <input
                                            class="w-full bg-surface-container-lowest border border-outline-variant rounded py-sm pl-10 pr-sm font-data-mono text-data-mono focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 outline-none transition-all"
                                            type="tel"
                                            name="contact"
                                            value="<%= request.getAttribute("contact") != null ? request.getAttribute("contact") : "" %>"/>

                                    </div>

                                </div>


                                <div class="flex flex-col gap-xs sm:col-span-2">

                                    <label class="font-label-caps text-label-caps text-on-surface-variant">
                                        Office Location
                                    </label>

                                    <div class="relative w-full">

                                        <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-[20px]">
                                            location_on
                                        </span>

                                        <input
                                            class="w-full bg-surface-container-lowest border border-outline-variant rounded py-sm pl-10 pr-sm font-body-md text-body-md focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 outline-none transition-all"
                                            type="text"
                                            name="address"
                                            value="<%= request.getAttribute("address") != null ? request.getAttribute("address") : "" %>"/>

                                    </div>

                                </div>


                            </div>

                        </div>

                    </div>


                    <!-- Right Column -->
                    <div class="flex flex-col gap-gutter">


                        <!-- Account Status -->
                        <div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg">

                            <h3 class="font-title-md text-title-md mb-md border-b border-outline-variant pb-sm">
                                Account Status
                            </h3>


                            <div class="flex flex-col gap-md">


                                <div class="flex items-center justify-between p-sm border border-outline-variant rounded bg-surface-container-low">

                                    <div class="flex items-center gap-sm">

                                        <div class="w-3 h-3 rounded-full bg-primary"></div>

                                        <span class="font-body-sm text-body-sm font-semibold">
                                            Active
                                        </span>

                                    </div>


                                    <label class="relative inline-flex items-center cursor-pointer">

                                        <input
                                            class="sr-only peer"
                                            type="checkbox"
                                            name="status"
                                            value="ACTIVE"
                                            <%= "ACTIVE".equals(request.getAttribute("status")) ? "checked" : "" %> />

                                        <div class="w-9 h-5 bg-outline-variant peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all peer-checked:bg-primary"></div>

                                    </label>

                                </div>


                                <!-- UI-only field -->
                                <div class="flex flex-col gap-xs">

                                    <label class="font-label-caps text-label-caps text-on-surface-variant">
                                        Access Level
                                    </label>

                                    <select
                                        class="w-full bg-surface-container-lowest border border-outline-variant rounded p-sm font-body-md text-body-md focus:border-tertiary focus:ring-2 focus:ring-tertiary/20 outline-none transition-all appearance-none">

                                        <option>Read-Only</option>
                                        <option>Standard Editor</option>
                                        <option selected>Full Admin</option>

                                    </select>

                                </div>

                            </div>

                        </div>


                        <!-- System Metadata -->
                        <div class="bg-surface-container-lowest border border-outline-variant rounded-xl p-lg">

                            <h3 class="font-title-md text-title-md mb-md border-b border-outline-variant pb-sm">
                                System Data
                            </h3>

                            <dl class="flex flex-col gap-sm font-body-sm text-body-sm">

                                <div class="flex justify-between py-xs border-b border-surface-container-highest">

                                    <dt class="text-on-surface-variant">
                                        Manager ID
                                    </dt>

                                    <dd class="font-data-mono text-data-mono font-medium">
                                        <%= request.getAttribute("managerId") != null
                                            ? request.getAttribute("managerId")
                                            : "" %>
                                    </dd>

                                </div>

                                <div class="flex justify-between py-xs border-b border-surface-container-highest">

                                    <dt class="text-on-surface-variant">
                                        Date Added
                                    </dt>

                                    <dd class="font-medium">
                                        Not Available
                                    </dd>

                                </div>

                                <div class="flex justify-between py-xs border-b border-surface-container-highest">

                                    <dt class="text-on-surface-variant">
                                        Last Login
                                    </dt>

                                    <dd class="font-medium">
                                        Not Available
                                    </dd>

                                </div>

                                <div class="flex justify-between py-xs">

                                    <dt class="text-on-surface-variant">
                                        Events Managed
                                    </dt>

                                    <dd class="font-data-mono text-data-mono font-medium">
                                        Not Available
                                    </dd>

                                </div>

                            </dl>

                        </div>


                        <!-- Danger Zone -->
                        <div class="bg-error-container/20 border border-error/30 rounded-xl p-lg mt-auto">

                            <h3 class="font-title-md text-title-md text-error mb-sm">
                                Danger Zone
                            </h3>

                            <p class="font-body-sm text-body-sm text-on-surface-variant mb-md">
                                Deactivating will revoke all access immediately.
                            </p>

                            <button
                                type="button"
                                class="w-full px-md py-2 border border-error text-error rounded font-body-sm text-body-sm font-semibold hover:bg-error-container transition-colors">
                                Deactivate Manager
                            </button>

                        </div>

                    </div>

                </div>

            </form>

        </div>

    </main>

</div>

</body>
</html>

