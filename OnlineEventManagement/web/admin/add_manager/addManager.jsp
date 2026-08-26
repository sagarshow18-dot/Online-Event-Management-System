
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html class="light" lang="en">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Add Manager - EventHub</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>

<link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;600;700&family=Inter:wght@400;600&family=JetBrains+Mono&display=swap" rel="stylesheet"/>

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
    font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
}
</style>

</head>

<body class="bg-background text-on-surface font-body-md antialiased h-screen overflow-hidden flex">

<!-- SideNavBar Component -->
<nav class="hidden md:flex flex-col h-full py-lg px-md bg-surface-container-lowest fixed left-0 top-0 w-[280px] border-r border-outline-variant z-20">

    <div class="flex items-center gap-sm mb-xl px-sm">

        <span class="material-symbols-outlined text-primary text-3xl">
            event_available
        </span>

        <span class="font-headline-lg text-headline-lg font-bold text-primary">
            EventHub
        </span>

    </div>

    <div class="px-sm mb-lg">

        <p class="font-label-caps text-label-caps text-on-surface-variant uppercase">
            Enterprise Admin
        </p>

    </div>

    <ul class="flex flex-col gap-xs flex-1">

        <li>
            <a class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 group"
               href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

                <span class="material-symbols-outlined group-hover:text-primary transition-colors">
                    dashboard
                </span>

                <span class="font-body-md text-body-md">
                    Dashboard
                </span>

            </a>
        </li>

        <li>
            <a class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 group"
               href="#">

                <span class="material-symbols-outlined group-hover:text-primary transition-colors">
                    group
                </span>

                <span class="font-body-md text-body-md">
                    Users
                </span>

            </a>
        </li>

        <li>
            <a class="flex items-center gap-md px-md py-sm rounded-lg bg-surface-container-low text-primary font-bold border-r-4 border-primary group"
               href="<%= request.getContextPath() %>/ManageEventManagersServlet">

                <span class="material-symbols-outlined text-primary">
                    badge
                </span>

                <span class="font-body-md text-body-md opacity-80">
                    Event Managers
                </span>

            </a>
        </li>

        <li>
            <a class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 group"
               href="#">

                <span class="material-symbols-outlined group-hover:text-primary transition-colors">
                    calendar_today
                </span>

                <span class="font-body-md text-body-md">
                    Events
                </span>

            </a>
        </li>

        <li>
            <a class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 group"
               href="#">

                <span class="material-symbols-outlined group-hover:text-primary transition-colors">
                    inventory_2
                </span>

                <span class="font-body-md text-body-md">
                    Accessories
                </span>

            </a>
        </li>

        <li>
            <a class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 group"
               href="#">

                <span class="material-symbols-outlined group-hover:text-primary transition-colors">
                    confirmation_number
                </span>

                <span class="font-body-md text-body-md">
                    Bookings
                </span>

            </a>
        </li>

        <li>
            <a class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 group"
               href="#">

                <span class="material-symbols-outlined group-hover:text-primary transition-colors">
                    assessment
                </span>

                <span class="font-body-md text-body-md">
                    Reports
                </span>

            </a>
        </li>

    </ul>

    <div class="mt-auto">

        <a class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 group border-t border-outline-variant pt-md"
           href="<%= request.getContextPath() %>/AdminProfileServlet">

            <span class="material-symbols-outlined">
                account_circle
            </span>

            <span class="font-body-md text-body-md">
                Profile
            </span>

        </a>

    </div>

</nav>


<!-- Main Content Area Wrapper -->
<div class="flex-1 flex flex-col md:ml-[280px] h-full overflow-hidden">

    <!-- TopNavBar Component -->
    <header class="bg-surface-container-lowest fixed top-0 right-0 w-full md:w-[calc(100%-280px)] h-16 border-b border-outline-variant flex justify-between items-center px-lg z-10">

        <!-- Mobile Menu Toggle & Brand -->
        <div class="flex md:hidden items-center gap-sm">

            <button
                type="button"
                class="text-on-surface p-sm rounded-lg hover:bg-surface-container-low transition-colors">

                <span class="material-symbols-outlined">
                    menu
                </span>

            </button>

            <span class="font-headline-lg-mobile text-headline-lg-mobile font-bold text-primary">
                EventHub
            </span>

        </div>


        <!-- Search Bar -->
        <div class="hidden md:flex flex-1 max-w-md">

            <div class="relative w-full">

                <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-sm">
                    search
                </span>

                <input
                    class="w-full bg-surface-container-low border-none rounded-full py-2 pl-10 pr-4 font-body-sm text-body-sm focus:ring-1 focus:ring-primary focus:bg-surface transition-all"
                    placeholder="Search across platform..."
                    type="text"/>

            </div>

        </div>


        <!-- Trailing Actions -->
        <div class="flex items-center gap-md">

            <button
                type="button"
                class="text-on-surface-variant hover:text-primary transition-colors p-sm rounded-full hover:bg-surface-container-low active:scale-95">

                <span class="material-symbols-outlined">
                    notifications
                </span>

            </button>

            <button
                type="button"
                class="text-on-surface-variant hover:text-primary transition-colors p-sm rounded-full hover:bg-surface-container-low active:scale-95">

                <span class="material-symbols-outlined">
                    settings
                </span>

            </button>

            <div class="h-6 w-px bg-outline-variant mx-sm"></div>

            <button
                type="button"
                class="font-label-caps text-label-caps text-secondary border border-outline-variant px-md py-1.5 rounded-lg hover:bg-surface-container-low transition-colors flex items-center gap-xs">

                <span class="material-symbols-outlined text-[16px]">
                    logout
                </span>

                Logout

            </button>

        </div>

    </header>


    <!-- Main Canvas -->
    <main class="flex-1 overflow-y-auto bg-surface pt-16 p-margin-mobile md:p-gutter">

        <!-- Page Header -->
        <div class="mb-gutter">

            <nav aria-label="Breadcrumb"
                 class="flex text-on-surface-variant font-label-caps text-label-caps mb-sm">

                <ol class="inline-flex items-center gap-xs">

                    <li class="inline-flex items-center">

                        <a class="hover:text-primary transition-colors"
                           href="<%= request.getContextPath() %>/ManageEventManagersServlet">
                            Event Managers
                        </a>

                    </li>

                    <li>

                        <span class="material-symbols-outlined text-[14px]">
                            chevron_right
                        </span>

                    </li>

                    <li aria-current="page">

                        <span class="text-primary font-bold">
                            Add Manager
                        </span>

                    </li>

                </ol>

            </nav>


            <h1 class="font-headline-lg text-headline-lg md:font-display-lg md:text-display-lg text-on-surface">
                Add Manager
            </h1>

            <p class="font-body-md text-body-md text-on-surface-variant mt-xs">
                Provision a new event manager account with initial access controls.
            </p>

        </div>


        <!-- Form Container -->
        <div class="max-w-4xl mx-auto">

            <form
                class="bg-surface-container-lowest border border-outline-variant rounded-xl overflow-hidden"
                action="<%= request.getContextPath() %>/AddManagerServlet"
                method="post">

                <div class="p-gutter grid grid-cols-1 md:grid-cols-2 gap-gutter">


                    <!-- Form Section: Personal Info -->
                    <div class="md:col-span-2 border-b border-outline-variant pb-md mb-md">

                        <h2 class="font-title-md text-title-md text-on-surface mb-sm flex items-center gap-sm">

                            <span class="material-symbols-outlined text-primary">
                                person
                            </span>

                            Manager Details

                        </h2>

                    </div>


                    <!-- Name Field -->
                    <div class="flex flex-col gap-xs">

                        <label
                            class="font-label-caps text-label-caps text-on-surface"
                            for="fullName">

                            Full Name

                        </label>

                        <input
                            class="w-full border border-outline-variant rounded-lg px-sm py-2 font-body-md text-body-md bg-surface-container-lowest focus:outline-none focus:border-tertiary focus:ring-1 focus:ring-tertiary transition-all"
                            id="fullName"
                            name="name"
                            placeholder="Jane Doe"
                            type="text"
                            required/>

                    </div>


                    <!-- Contact Field -->
                    <div class="flex flex-col gap-xs">

                        <label
                            class="font-label-caps text-label-caps text-on-surface"
                            for="contactNumber">

                            Contact Number

                        </label>

                        <input
                            class="w-full border border-outline-variant rounded-lg px-sm py-2 font-body-md text-body-md bg-surface-container-lowest focus:outline-none focus:border-tertiary focus:ring-1 focus:ring-tertiary transition-all"
                            id="contactNumber"
                            name="contact"
                            placeholder="+91 9876543210"
                            type="tel"
                            required/>

                    </div>


                    <!-- Email Field -->
                    <div class="flex flex-col gap-xs md:col-span-2">

                        <label
                            class="font-label-caps text-label-caps text-on-surface"
                            for="emailAddress">

                            Email Address

                        </label>

                        <input
                            class="w-full border border-outline-variant rounded-lg px-sm py-2 font-body-md text-body-md bg-surface-container-lowest focus:outline-none focus:border-tertiary focus:ring-1 focus:ring-tertiary transition-all"
                            id="emailAddress"
                            name="email"
                            placeholder="jane.doe@eventhub.com"
                            type="email"
                            required/>

                    </div>


                    <!-- Address Field -->
                    <div class="flex flex-col gap-xs md:col-span-2">

                        <label
                            class="font-label-caps text-label-caps text-on-surface"
                            for="address">

                            Office Address

                        </label>

                        <input
                            class="w-full border border-outline-variant rounded-lg px-sm py-2 font-body-md text-body-md bg-surface-container-lowest focus:outline-none focus:border-tertiary focus:ring-1 focus:ring-tertiary transition-all"
                            id="address"
                            name="address"
                            placeholder="Enter office address"
                            type="text"
                            required/>

                    </div>


                    <!-- Form Section: Security & Access -->
                    <div class="md:col-span-2 border-b border-outline-variant pb-md mb-md mt-sm">

                        <h2 class="font-title-md text-title-md text-on-surface mb-sm flex items-center gap-sm">

                            <span class="material-symbols-outlined text-primary">
                                shield_person
                            </span>

                            Security &amp; Access

                        </h2>

                    </div>


                    <!-- Password Field -->
                    <div class="flex flex-col gap-xs">

                        <label
                            class="font-label-caps text-label-caps text-on-surface"
                            for="tempPassword">

                            Temporary Password

                        </label>

                        <div class="relative">

                            <input
                                class="w-full border border-outline-variant rounded-lg px-sm py-2 pr-10 font-data-mono text-data-mono bg-surface-container-lowest focus:outline-none focus:border-tertiary focus:ring-1 focus:ring-tertiary transition-all"
                                id="tempPassword"
                                name="password"
                                placeholder="••••••••••••"
                                type="password"
                                minlength="12"
                                required/>

                            <button
                                type="button"
                                onclick="togglePassword()"
                                class="absolute right-2 top-1/2 -translate-y-1/2 text-on-surface-variant hover:text-primary transition-colors">

                                <span
                                    id="passwordIcon"
                                    class="material-symbols-outlined text-sm">
                                    visibility_off
                                </span>

                            </button>

                        </div>

                        <p class="font-body-sm text-body-sm text-on-surface-variant text-[12px] mt-1">
                            Must be at least 12 characters.
                        </p>

                    </div>


                    <!-- Initial Status Field -->
                    <div class="flex flex-col gap-xs">

                        <label
                            class="font-label-caps text-label-caps text-on-surface"
                            for="initialStatus">

                            Initial Status

                        </label>

                        <div class="relative">

                            <select
                                class="w-full appearance-none border border-outline-variant rounded-lg px-sm py-2 font-body-md text-body-md bg-surface-container-lowest focus:outline-none focus:border-tertiary focus:ring-1 focus:ring-tertiary transition-all text-on-surface"
                                id="initialStatus"
                                name="status"
                                required>

                                <option value="ACTIVE">
                                    Active
                                </option>

                                <option value="INACTIVE">
                                    Inactive
                                </option>

                            </select>

                            <span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 text-on-surface-variant pointer-events-none">
                                expand_more
                            </span>

                        </div>

                    </div>

                </div>


                <!-- Form Actions -->
                <div class="bg-surface-container p-gutter border-t border-outline-variant flex justify-end gap-md">

                    <button
                        type="button"
                        onclick="window.history.back()"
                        class="px-lg py-2 font-label-caps text-label-caps font-bold text-secondary border border-outline-variant rounded-lg hover:bg-surface-container-low transition-colors">

                        Cancel

                    </button>


                    <button
                        class="bg-black text-white px-lg py-2 rounded-lg font-body-sm text-body-sm font-semibold hover:bg-gray-800 transition-colors flex items-center gap-sm shadow-sm"
                        type="submit">

                        <span class="material-symbols-outlined text-[16px]">
                            add_circle
                        </span>

                        Create Manager

                    </button>

                </div>

            </form>

        </div>

    </main>

</div>


<script>
function togglePassword() {

    const passwordInput = document.getElementById("tempPassword");
    const passwordIcon = document.getElementById("passwordIcon");

    if (passwordInput.type === "password") {

        passwordInput.type = "text";
        passwordIcon.textContent = "visibility";

    } else {

        passwordInput.type = "password";
        passwordIcon.textContent = "visibility_off";

    }
}
</script>

</body>
</html>

