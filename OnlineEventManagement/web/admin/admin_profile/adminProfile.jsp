<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    String adminName =
            request.getAttribute("name") != null
                    ? request.getAttribute("name").toString()
                    : (session.getAttribute("adminName") != null
                        ? session.getAttribute("adminName").toString()
                        : "Admin User");

    String adminEmail =
            request.getAttribute("email") != null
                    ? request.getAttribute("email").toString()
                    : (session.getAttribute("adminEmail") != null
                        ? session.getAttribute("adminEmail").toString()
                        : "");

    String adminContact =
            request.getAttribute("contact") != null
                    ? request.getAttribute("contact").toString()
                    : "";

    String adminAddress =
            request.getAttribute("address") != null
                    ? request.getAttribute("address").toString()
                    : "";

    String adminBio =
            request.getAttribute("bio") != null
                    ? request.getAttribute("bio").toString()
                    : "";

    String profileImage =
            request.getAttribute("profileImage") != null
                    ? request.getAttribute("profileImage").toString()
                    : "";

    boolean active =
            !"INACTIVE".equalsIgnoreCase(
                    request.getAttribute("status") != null
                            ? request.getAttribute("status").toString()
                            : "ACTIVE"
            );

    String imageSource;

    if (profileImage != null && !profileImage.trim().isEmpty()) {
        imageSource =
                request.getContextPath()
                + "/"
                + profileImage;
    } else {
        imageSource =
                "https://via.placeholder.com/300x300.png?text=Admin";
    }
%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

<title>Admin Profile - EventHub</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
    rel="stylesheet"/>

<link
    href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@600;700&family=Inter:wght@400;600&family=JetBrains+Mono&display=swap"
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
                "on-primary": "#ffffff",
                "secondary-fixed-dim": "#b9c7e0",
                "on-secondary-fixed": "#0d1c2f",
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

</style>

</head>

<body class="bg-background text-on-background font-body-md min-h-screen">


<!-- ==============================
     SIDE NAVIGATION
     ============================== -->

<nav class="hidden md:flex bg-surface-container-lowest text-primary fixed left-0 top-0 h-full w-[280px] border-r border-outline-variant flex-col py-lg px-md z-20">

    <div class="mb-xl flex items-center gap-md px-md">

        <img
            id="sidebarProfileImage"
            alt="Admin User Profile"
            class="w-10 h-10 rounded-lg object-cover"
            src="<%= imageSource %>"/>

        <div>

            <h1 class="font-headline-lg text-headline-lg font-bold text-primary">
                EventHub
            </h1>

            <p class="font-label-caps text-label-caps text-on-surface-variant">
                Enterprise Admin
            </p>

        </div>

    </div>


    <div class="flex-1 space-y-sm">

        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

            <span class="material-symbols-outlined">
                dashboard
            </span>

            <span>
                Dashboard
            </span>

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/ManageUsersServlet">

            <span class="material-symbols-outlined">
                group
            </span>

            <span>
                Users
            </span>

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/ManageEventManagersServlet">

            <span class="material-symbols-outlined">
                badge
            </span>

            <span>
                Event Managers
            </span>

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/ManageEventsServlet">

            <span class="material-symbols-outlined">
                calendar_today
            </span>

            <span>
                Events
            </span>

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/AccessoriesServlet">

            <span class="material-symbols-outlined">
                inventory_2
            </span>

            <span>
                Accessories
            </span>

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/ManageBookingsServlet">

            <span class="material-symbols-outlined">
                confirmation_number
            </span>

            <span>
                Bookings
            </span>

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
            href="<%= request.getContextPath() %>/ReportsServlet">

            <span class="material-symbols-outlined">
                assessment
            </span>

            <span>
                Reports
            </span>

        </a>


        <a
            class="flex items-center gap-md px-md py-sm rounded text-primary font-bold border-r-4 border-primary bg-surface-container-low opacity-80"
            href="<%= request.getContextPath() %>/AdminProfileServlet">

            <span
                class="material-symbols-outlined"
                style="font-variation-settings:'FILL' 1;">

                account_circle

            </span>

            <span>
                Profile
            </span>

        </a>

    </div>

</nav>


<!-- ==============================
     TOP NAVIGATION
     ============================== -->

<header class="hidden md:flex bg-surface-container-lowest text-primary fixed top-0 right-0 w-[calc(100%-280px)] h-16 border-b border-outline-variant justify-between items-center px-lg z-10">

    <div class="flex items-center gap-md w-1/3">

        <div class="relative w-full">

            <span class="material-symbols-outlined absolute left-sm top-1/2 -translate-y-1/2 text-on-surface-variant">
                search
            </span>

            <input
                id="profileSearch"
                onkeyup="searchProfile()"
                class="w-full bg-surface-container-low border border-outline-variant rounded py-sm pl-xl pr-sm text-body-sm font-body-sm focus:border-tertiary focus:ring-1 focus:ring-tertiary outline-none transition-all"
                placeholder="Search..."
                type="text"/>

        </div>

    </div>


    <div class="flex items-center gap-lg">

        <button
            type="button"
            onclick="showNotifications()"
            aria-label="Notifications"
            title="Notifications"
            class="text-on-surface-variant hover:text-primary transition-colors flex items-center justify-center p-xs">

            <span class="material-symbols-outlined">
                notifications
            </span>

        </button>


        <button
            type="button"
            onclick="showSettings()"
            aria-label="Settings"
            title="Settings"
            class="text-on-surface-variant hover:text-primary transition-colors flex items-center justify-center p-xs">

            <span class="material-symbols-outlined">
                settings
            </span>

        </button>


        <div class="h-8 w-px bg-outline-variant">
        </div>


        <button
            type="button"
            onclick="logoutAdmin()"
            class="text-on-surface-variant hover:text-primary transition-colors font-label-caps text-label-caps flex items-center gap-xs">

            <span class="material-symbols-outlined text-[18px]">
                logout
            </span>

            Logout

        </button>


        <img
            id="topProfileImage"
            alt="Admin Profile"
            class="w-8 h-8 rounded-full border border-outline-variant object-cover"
            src="<%= imageSource %>"/>

    </div>

</header>


<!-- ==============================
     MAIN CONTENT
     ============================== -->

<main class="md:ml-[280px] pt-16 min-h-screen flex flex-col p-margin-desktop gap-gutter">

    <div class="mb-md">

        <nav class="font-label-caps text-label-caps text-on-surface-variant mb-xs flex items-center gap-xs">

            <span>
                EventHub
            </span>

            <span class="material-symbols-outlined text-[12px]">
                chevron_right
            </span>

            <span>
                Admin
            </span>

            <span class="material-symbols-outlined text-[12px]">
                chevron_right
            </span>

            <span class="text-primary font-bold">
                Profile Settings
            </span>

        </nav>


        <h2 class="font-headline-lg text-headline-lg font-bold">
            Administrator Profile
        </h2>

    </div>


    <div class="grid grid-cols-1 lg:grid-cols-12 gap-gutter items-start">


        <!-- LEFT COLUMN -->

        <div class="lg:col-span-4 flex flex-col gap-gutter">


            <!-- PROFILE CARD -->

            <div class="bg-surface-container-lowest border border-outline-variant rounded-lg p-lg flex flex-col items-center text-center">


                <div class="relative mb-md">


                    <img
                        id="mainProfileImage"
                        alt="Admin Avatar Large"
                        class="w-32 h-32 rounded-full border border-outline-variant object-cover"
                        src="<%= imageSource %>"/>


                    <button
                        type="button"
                        onclick="document.getElementById('profileImageInput').click()"
                        class="absolute bottom-0 right-0 bg-surface-container-lowest border border-outline-variant text-primary rounded-full p-xs hover:bg-surface-container-low transition-colors shadow-sm"
                        title="Change profile image">

                        <span class="material-symbols-outlined text-[16px]">
                            edit
                        </span>

                    </button>


                </div>


                <h3 class="font-title-md text-title-md font-bold mb-xs">

                    <%= adminName %>

                </h3>


                <p class="font-body-sm text-body-sm text-on-surface-variant mb-md">

                    Chief Operations Administrator

                </p>


                <div class="w-full h-px bg-outline-variant mb-md">
                </div>


                <div class="w-full text-left font-body-sm text-body-sm space-y-sm">


                    <div class="flex items-center gap-sm text-on-surface-variant">

                        <span class="material-symbols-outlined text-[18px]">
                            mail
                        </span>

                        <span class="font-data-mono text-data-mono">
                            <%= adminEmail %>
                        </span>

                    </div>


                    <div class="flex items-center gap-sm text-on-surface-variant">

                        <span class="material-symbols-outlined text-[18px]">
                            phone
                        </span>

                        <span class="font-data-mono text-data-mono">
                            <%= adminContact %>
                        </span>

                    </div>


                    <div class="flex items-center gap-sm text-on-surface-variant">

                        <span class="material-symbols-outlined text-[18px]">
                            location_on
                        </span>

                        <span>
                            <%= adminAddress %>
                        </span>

                    </div>


                    <div class="mt-lg w-full flex items-center justify-between bg-surface-container-low p-sm rounded border border-outline-variant">

                        <span class="font-label-caps text-label-caps text-on-surface-variant">
                            Account Status
                        </span>


                        <div class="flex items-center gap-xs px-sm py-xs bg-secondary-container text-on-secondary-container rounded-full">

                            <div class="w-2 h-2 rounded-full <%= active ? "bg-[#008ebf]" : "bg-error" %>">
                            </div>

                            <span
                                class="font-label-caps text-label-caps"
                                style="font-size:10px;">

                                <%= active ? "Active" : "Inactive" %>

                            </span>

                        </div>

                    </div>


                </div>

            </div>


        </div>


        <!-- RIGHT COLUMN -->

        <div class="lg:col-span-8 flex flex-col gap-gutter">


            <!-- EDIT PROFILE -->

            <div class="bg-surface-container-lowest border border-outline-variant rounded-lg p-lg">

                <h3 class="font-title-md text-title-md font-bold mb-md border-b border-outline-variant pb-xs">
                    Edit Profile Information
                </h3>


                <form
                    id="profileForm"
                    class="space-y-md"
                    action="<%= request.getContextPath() %>/AdminProfileServlet"
                    method="post"
                    enctype="multipart/form-data">


                    <input
                        type="hidden"
                        name="action"
                        value="updateProfile"/>


                    <input
                        type="hidden"
                        name="adminId"
                        value="<%= session.getAttribute("adminId") != null ? session.getAttribute("adminId") : "" %>"/>


                    <!-- Hidden Image Input -->

                    <input
                        type="file"
                        id="profileImageInput"
                        name="profileImage"
                        accept="image/*"
                        class="hidden"
                        onchange="previewProfileImage(event)"/>


                    <div class="grid grid-cols-1 md:grid-cols-2 gap-md">


                        <div class="flex flex-col gap-xs">

                            <label class="font-label-caps text-label-caps text-on-surface-variant">
                                Name
                            </label>

                            <input
                                class="w-full bg-surface border border-outline-variant rounded px-sm py-sm text-body-sm font-body-sm focus:border-tertiary focus:ring-1 focus:ring-tertiary outline-none transition-all"
                                type="text"
                                name="name"
                                value="<%= adminName %>"
                                required/>

                        </div>

                    </div>


                    <div class="grid grid-cols-1 md:grid-cols-2 gap-md">


                        <div class="flex flex-col gap-xs">

                            <label class="font-label-caps text-label-caps text-on-surface-variant">
                                Email Address
                            </label>

                            <input
                                class="w-full bg-surface border border-outline-variant rounded px-sm py-sm text-body-sm font-body-sm focus:border-tertiary focus:ring-1 focus:ring-tertiary outline-none transition-all"
                                type="email"
                                name="email"
                                value="<%= adminEmail %>"
                                required/>

                        </div>


                        <div class="flex flex-col gap-xs">

                            <label class="font-label-caps text-label-caps text-on-surface-variant">
                                Contact Number
                            </label>

                            <input
                                class="w-full bg-surface border border-outline-variant rounded px-sm py-sm text-body-sm font-body-sm focus:border-tertiary focus:ring-1 focus:ring-tertiary outline-none transition-all"
                                type="tel"
                                name="contact"
                                value="<%= adminContact %>"/>

                        </div>

                    </div>


                    <div class="flex flex-col gap-xs">

                        <label class="font-label-caps text-label-caps text-on-surface-variant">
                            Address
                        </label>

                        <input
                            class="w-full bg-surface border border-outline-variant rounded px-sm py-sm text-body-sm font-body-sm focus:border-tertiary focus:ring-1 focus:ring-tertiary outline-none transition-all"
                            type="text"
                            name="address"
                            value="<%= adminAddress %>"
                            placeholder="Enter your address"/>

                    </div>


                    <div class="flex flex-col gap-xs">

                        <label class="font-label-caps text-label-caps text-on-surface-variant">
                            Bio
                        </label>

                        <textarea
                            class="w-full bg-surface border border-outline-variant rounded px-sm py-sm text-body-sm font-body-sm focus:border-tertiary focus:ring-1 focus:ring-tertiary outline-none transition-all resize-none"
                            name="bio"
                            rows="3"><%= adminBio %></textarea>

                    </div>


                    <!-- ACTION BUTTONS -->

                    <div class="flex justify-end gap-md mt-sm">

                        <button
                            type="button"
                            onclick="resetProfileForm()"
                            class="px-lg py-sm font-body-sm text-body-sm font-bold text-tertiary border border-outline-variant bg-surface-container-lowest rounded hover:bg-surface-container-low transition-colors duration-200">

                            Cancel

                        </button>


                        <button
                            type="submit"
                            class="bg-black text-white px-lg py-2 rounded-lg font-body-sm text-body-sm font-semibold hover:bg-gray-800 transition-colors flex items-center gap-sm shadow-sm">

                            <span class="material-symbols-outlined text-[18px]">
                                save
                            </span>

                            Save Changes

                        </button>

                    </div>


                </form>

            </div>


            <!-- CHANGE PASSWORD -->

            <div class="bg-surface-container-lowest border border-outline-variant rounded-lg p-lg">

                <h3 class="font-title-md text-title-md font-bold mb-md border-b border-outline-variant pb-xs">
                    Security &amp; Password
                </h3>


                <form
                    id="passwordForm"
                    class="space-y-md"
                    action="<%= request.getContextPath() %>/AdminProfileServlet"
                    method="post">


                    <input
                        type="hidden"
                        name="action"
                        value="changePassword"/>


                    <div class="flex flex-col gap-xs w-full md:w-1/2">

                        <label class="font-label-caps text-label-caps text-on-surface-variant">
                            Current Password
                        </label>

                        <div class="relative">

                            <input
                                id="currentPassword"
                                name="currentPassword"
                                class="w-full bg-surface border border-outline-variant rounded px-sm py-sm text-body-sm font-body-sm focus:border-tertiary focus:ring-1 focus:ring-tertiary outline-none transition-all pr-xl"
                                placeholder="••••••••"
                                type="password"/>

                            <span
                                class="material-symbols-outlined absolute right-sm top-1/2 -translate-y-1/2 text-on-surface-variant cursor-pointer hover:text-primary text-[18px]"
                                onclick="togglePassword('currentPassword', this)">

                                visibility

                            </span>

                        </div>

                    </div>


                    <div class="grid grid-cols-1 md:grid-cols-2 gap-md">


                        <div class="flex flex-col gap-xs">

                            <label class="font-label-caps text-label-caps text-on-surface-variant">
                                New Password
                            </label>

                            <div class="relative">

                                <input
                                    id="newPassword"
                                    name="newPassword"
                                    class="w-full bg-surface border border-outline-variant rounded px-sm py-sm text-body-sm font-body-sm focus:border-tertiary focus:ring-1 focus:ring-tertiary outline-none transition-all pr-xl"
                                    type="password"/>

                                <span
                                    class="material-symbols-outlined absolute right-sm top-1/2 -translate-y-1/2 text-on-surface-variant cursor-pointer hover:text-primary text-[18px]"
                                    onclick="togglePassword('newPassword', this)">

                                    visibility

                                </span>

                            </div>

                        </div>


                        <div class="flex flex-col gap-xs">

                            <label class="font-label-caps text-label-caps text-on-surface-variant">
                                Confirm New Password
                            </label>

                            <div class="relative">

                                <input
                                    id="confirmPassword"
                                    name="confirmPassword"
                                    class="w-full bg-surface border border-outline-variant rounded px-sm py-sm text-body-sm font-body-sm focus:border-tertiary focus:ring-1 focus:ring-tertiary outline-none transition-all pr-xl"
                                    type="password"/>

                                <span
                                    class="material-symbols-outlined absolute right-sm top-1/2 -translate-y-1/2 text-on-surface-variant cursor-pointer hover:text-primary text-[18px]"
                                    onclick="togglePassword('confirmPassword', this)">

                                    visibility

                                </span>

                            </div>

                        </div>

                    </div>


                    <p class="font-body-sm text-body-sm text-on-surface-variant text-xs mt-xs">

                        Password must be at least 12 characters long and include a mix of uppercase, lowercase, numbers, and symbols to meet enterprise security standards.

                    </p>


                    <div class="flex justify-end gap-md mt-sm">


                        <button
                            type="reset"
                            class="px-lg py-sm font-body-sm text-body-sm font-bold text-tertiary border border-outline-variant bg-surface-container-lowest rounded hover:bg-surface-container-low transition-colors duration-200">

                            Cancel

                        </button>


                        <button
                            type="submit"
                            class="bg-black text-white px-lg py-2 rounded-lg font-body-sm text-body-sm font-semibold hover:bg-gray-800 transition-colors flex items-center gap-sm shadow-sm">

                            <span class="material-symbols-outlined text-[18px]">
                                lock
                            </span>

                            Change Password

                        </button>


                    </div>

                </form>

            </div>


        </div>

    </div>

</main>


<!-- ==============================
     JAVASCRIPT
     ============================== -->

<script>

function togglePassword(inputId, icon) {

    const input =
        document.getElementById(inputId);

    if (input.type === "password") {

        input.type = "text";

        icon.textContent =
            "visibility_off";

    } else {

        input.type = "password";

        icon.textContent =
            "visibility";

    }
}


/*
 * PROFILE IMAGE PREVIEW
 */

function previewProfileImage(event) {

    const file =
        event.target.files[0];

    if (!file) {
        return;
    }

    if (!file.type.startsWith("image/")) {

        alert("Please select a valid image file.");

        event.target.value = "";

        return;
    }

    const reader =
        new FileReader();

    reader.onload =
        function(e) {

            document.getElementById(
                "mainProfileImage"
            ).src = e.target.result;

            document.getElementById(
                "sidebarProfileImage"
            ).src = e.target.result;

            document.getElementById(
                "topProfileImage"
            ).src = e.target.result;

        };

    reader.readAsDataURL(file);
}


/*
 * PROFILE FORM CANCEL
 */

function resetProfileForm() {

    window.location.reload();

}


/*
 * SEARCH
 */

function searchProfile() {

    const value =
        document.getElementById(
            "profileSearch"
        ).value
        .toLowerCase()
        .trim();

    if (value === "") {
        return;
    }

    if (
        value.includes("user")
        ||
        value.includes("users")
    ) {

        window.location.href =
            "<%= request.getContextPath() %>/ManageUsersServlet";

        return;
    }

    if (
        value.includes("manager")
        ||
        value.includes("event manager")
    ) {

        window.location.href =
            "<%= request.getContextPath() %>/ManageEventManagersServlet";

        return;
    }

    if (value.includes("event")) {

        window.location.href =
            "<%= request.getContextPath() %>/ManageEventsServlet";

        return;
    }

    if (value.includes("accessor")) {

        window.location.href =
            "<%= request.getContextPath() %>/AccessoriesServlet";

        return;
    }

    if (value.includes("booking")) {

        window.location.href =
            "<%= request.getContextPath() %>/ManageBookingsServlet";

        return;
    }

    if (value.includes("report")) {

        window.location.href =
            "<%= request.getContextPath() %>/ReportsServlet";

        return;
    }

    if (value.includes("profile")) {

        return;
    }
}


/*
 * NOTIFICATIONS
 */

function showNotifications() {

    alert(
        "No new notifications."
    );

}


/*
 * SETTINGS
 */

function openSettings() {

    window.location.href =
        "<%= request.getContextPath() %>/AdminProfileServlet";
}


/*
 * LOGOUT
 */

function logoutAdmin() {

    if (
        confirm(
            "Are you sure you want to logout?"
        )
    ) {

        window.location.href =
            "<%= request.getContextPath() %>/AdminLogoutServlet";

    }

}


/*
 * PASSWORD VALIDATION
 */

document
    .getElementById("passwordForm")
    .addEventListener("submit", function(event) {

        const currentPassword =
            document.getElementById(
                "currentPassword"
            ).value;

        const newPassword =
            document.getElementById(
                "newPassword"
            ).value;

        const confirmPassword =
            document.getElementById(
                "confirmPassword"
            ).value;


        if (
            currentPassword.trim() === ""
            ||
            newPassword.trim() === ""
            ||
            confirmPassword.trim() === ""
        ) {

            alert(
                "Please fill all password fields."
            );

            event.preventDefault();

            return;
        }


        if (
            newPassword !==
            confirmPassword
        ) {

            alert(
                "New password and confirm password do not match."
            );

            event.preventDefault();

            return;
        }


        if (newPassword.length < 12) {

            alert(
                "Password must be at least 12 characters long."
            );

            event.preventDefault();

            return;
        }


        const hasUppercase =
            /[A-Z]/.test(newPassword);

        const hasLowercase =
            /[a-z]/.test(newPassword);

        const hasNumber =
            /[0-9]/.test(newPassword);

        const hasSymbol =
            /[^A-Za-z0-9]/.test(newPassword);


        if (
            !hasUppercase
            ||
            !hasLowercase
            ||
            !hasNumber
            ||
            !hasSymbol
        ) {

            alert(
                "Password must contain uppercase, lowercase, number and symbol."
            );

            event.preventDefault();

        }

    });

</script>

</body>

</html>