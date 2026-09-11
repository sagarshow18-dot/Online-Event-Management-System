<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.event.model.ManagerBean" %>
<%
    ManagerBean manager = (ManagerBean) session.getAttribute("manager");
    if (manager == null) {
        response.sendRedirect("manager_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>EventHub Manager - Profile</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "outline-variant": "#c7c5d4",
                        "tertiary-fixed-dim": "#c3c7cb",
                        "primary-container": "#2e3192",
                        "secondary-fixed": "#c6e7ff",
                        "on-surface": "#0b1c30",
                        "on-error-container": "#93000a",
                        "on-surface-variant": "#464652",
                        "inverse-on-surface": "#eaf1ff",
                        "on-secondary-fixed": "#001e2e",
                        "on-tertiary": "#ffffff",
                        "on-error": "#ffffff",
                        "inverse-surface": "#213145",
                        "surface-container-highest": "#d3e4fe",
                        "primary-fixed": "#e1e0ff",
                        "surface": "#f8f9ff",
                        "error-container": "#ffdad6",
                        "secondary-fixed-dim": "#83cfff",
                        "on-background": "#0b1c30",
                        "tertiary-fixed": "#dfe3e7",
                        "surface-variant": "#d3e4fe",
                        "on-primary": "#ffffff",
                        "surface-container": "#e5eeff",
                        "on-tertiary-container": "#a6aaae",
                        "surface-container-lowest": "#ffffff",
                        "error": "#ba1a1a",
                        "on-tertiary-fixed-variant": "#43474b",
                        "on-primary-container": "#9da1ff",
                        "surface-container-high": "#dce9ff",
                        "on-primary-fixed": "#04006d",
                        "primary-fixed-dim": "#c0c1ff",
                        "surface-bright": "#f8f9ff",
                        "on-primary-fixed-variant": "#373a9b",
                        "surface-dim": "#cbdbf5",
                        "on-secondary-container": "#004867",
                        "surface-container-low": "#eff4ff",
                        "secondary-container": "#2fbcff",
                        "on-secondary": "#ffffff",
                        "outline": "#777683",
                        "background": "#f8f9ff",
                        "on-tertiary-fixed": "#171c1f",
                        "tertiary": "#24292c",
                        "secondary": "#00658d",
                        "primary": "#15157d",
                        "surface-tint": "#4f54b4",
                        "on-secondary-fixed-variant": "#004c6c",
                        "tertiary-container": "#3a3f42",
                        "inverse-primary": "#c0c1ff"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.125rem",
                        "lg": "0.25rem",
                        "xl": "0.5rem",
                        "full": "0.75rem"
                    },
                    "spacing": {
                        "lg": "24px",
                        "container-max": "1280px",
                        "base": "8px",
                        "xl": "32px",
                        "margin-mobile": "16px",
                        "xs": "4px",
                        "gutter": "24px",
                        "sm": "8px",
                        "md": "16px"
                    },
                    "fontFamily": {
                        "body-sm": ["Inter"],
                        "label-caps": ["Inter"],
                        "title-sm": ["Inter"],
                        "display-lg": ["Inter"],
                        "body-md": ["Inter"],
                        "code": ["Inter"],
                        "headline-md": ["Inter"],
                        "display-lg-mobile": ["Inter"]
                    },
                    "fontSize": {
                        "body-sm": ["14px", { "lineHeight": "20px", "fontWeight": "400" }],
                        "label-caps": ["12px", { "lineHeight": "16px", "letterSpacing": "0.05em", "fontWeight": "600" }],
                        "title-sm": ["18px", { "lineHeight": "24px", "fontWeight": "600" }],
                        "display-lg": ["36px", { "lineHeight": "44px", "letterSpacing": "-0.02em", "fontWeight": "700" }],
                        "body-md": ["16px", { "lineHeight": "24px", "fontWeight": "400" }],
                        "code": ["13px", { "lineHeight": "18px", "fontWeight": "400" }],
                        "headline-md": ["24px", { "lineHeight": "32px", "letterSpacing": "-0.01em", "fontWeight": "600" }],
                        "display-lg-mobile": ["28px", { "lineHeight": "34px", "letterSpacing": "-0.02em", "fontWeight": "700" }]
                    }
                }
            }
        }
    </script>
    <style>
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
        .fill-icon { font-variation-settings: 'FILL' 1; }
    </style>
</head>
<body class="bg-background dark:bg-[#0b1c30] text-on-background dark:text-white font-body-md min-h-screen flex antialiased">
    
    <!-- SideNavBar -->
    <nav class="bg-surface dark:bg-inverse-surface fixed left-0 top-0 h-full w-60 border-r border-outline-variant dark:border-[#334155] flex flex-col py-md transition-colors duration-200 ease-in-out z-20 hidden md:flex">
        <div class="px-md mb-xl flex items-center gap-sm">
            <span class="material-symbols-outlined text-primary dark:text-primary-fixed text-[32px] fill-icon">event</span>
            <div>
                <h1 class="text-headline-md font-headline-md text-primary dark:text-primary-fixed font-bold">EventHub</h1>
                <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">Management Suite</p>
            </div>
        </div>
        <ul class="flex-1 overflow-y-auto px-sm">
            <li>
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="manager_dashboard.jsp">
                    <span class="material-symbols-outlined mr-sm">dashboard</span> <span class="font-body-md text-body-md">Dashboard</span>
                </a>
            </li>
            <li>
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="manage_events.jsp">
                    <span class="material-symbols-outlined mr-sm">calendar_today</span> <span class="font-body-md text-body-md">My Events</span>
                </a>
            </li>
            <li>
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="add_event.jsp">
                    <span class="material-symbols-outlined mr-sm">add_circle</span> <span class="font-body-md text-body-md">Add Event</span>
                </a>
            </li>
            <li>
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="participants.jsp">
                    <span class="material-symbols-outlined mr-sm">groups</span> <span class="font-body-md text-body-md">Participants</span>
                </a>
            </li>
            <li>
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="manager_bookings.jsp">
                    <span class="material-symbols-outlined mr-sm">confirmation_number</span> <span class="font-body-md text-body-md">Bookings</span>
                </a>
            </li>
            <li>
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="event_accessories.jsp">
                    <span class="material-symbols-outlined mr-sm">inventory_2</span> <span class="font-body-md text-body-md">Event Accessories</span>
                </a>
            </li>
            <li>
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="event_reports.jsp">
                    <span class="material-symbols-outlined mr-sm">analytics</span> <span class="font-body-md text-body-md">Reports</span>
                </a>
            </li>
            <li>
                <a class="flex items-center px-md py-sm mb-xs rounded text-secondary dark:text-secondary-fixed font-bold border-r-4 border-secondary bg-surface-container-high dark:bg-[#1E293B] transition-colors duration-200 ease-in-out" href="manager_profile.jsp">
                    <span class="material-symbols-outlined mr-sm fill-icon">account_circle</span> <span class="font-body-md text-body-md">Profile</span>
                </a>
            </li>
        </ul>
        <div class="mt-auto px-sm pt-md border-t border-outline-variant dark:border-[#334155]">
            <a class="flex items-center px-md py-sm rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-error dark:hover:text-red-400 transition-colors duration-200 ease-in-out" href="LogoutServlet">
                <span class="material-symbols-outlined mr-sm">logout</span> <span class="font-body-md text-body-md">Logout</span>
            </a>
        </div>
    </nav>

    <!-- Main Content Area -->
    <div class="flex-1 md:ml-60 flex flex-col min-h-screen">
        
        <!-- TopAppBar -->
        <header class="bg-surface dark:bg-inverse-surface border-b border-outline-variant dark:border-[#334155] shadow-sm docked full-width top-0 flex justify-between items-center h-16 px-xl transition-all duration-200 sticky z-10 w-full">
            <div class="flex items-center">
                <span class="font-title-sm text-title-sm font-bold text-primary dark:text-primary-fixed mr-lg">EventHub Manager</span>
            </div>
            <div class="flex items-center gap-md">
                <div class="relative hidden sm:block">
                    <input class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] rounded px-md py-xs font-body-sm text-body-sm focus:outline-none focus:border-secondary focus:ring-1 focus:ring-secondary pl-8 dark:text-white transition-all placeholder-on-surface-variant" placeholder="Search..." type="text"/>
                    <span class="material-symbols-outlined absolute left-2 top-1/2 -translate-y-1/2 text-on-surface-variant dark:text-gray-400 text-[18px]">search</span>
                </div>
                
                <!-- DARK MODE BUTTON -->
                <button id="theme-toggle" class="text-on-surface-variant dark:text-white hover:text-secondary dark:hover:text-secondary-fixed transition-all duration-200 flex items-center justify-center w-8 h-8 rounded-full hover:bg-surface-container-low dark:hover:bg-gray-800" title="Toggle Dark Mode">
                    <span id="theme-icon" class="material-symbols-outlined">dark_mode</span>
                </button>

                <a href="manager_notifs.jsp" class="text-on-surface-variant dark:text-white hover:text-secondary dark:hover:text-secondary-fixed transition-all duration-200 flex items-center justify-center p-sm rounded-full hover:bg-surface-container-low dark:hover:bg-gray-800">
                    <span class="material-symbols-outlined">notifications</span>
                </a>
                <a href="manager_settings.jsp" class="text-on-surface-variant dark:text-white hover:text-secondary dark:hover:text-secondary-fixed transition-all duration-200 flex items-center justify-center p-sm rounded-full hover:bg-surface-container-low dark:hover:bg-gray-800">
                    <span class="material-symbols-outlined">settings</span>
                </a>
                
                <%
    String headerPhoto = (String) session.getAttribute("photoPath");
    if (headerPhoto == null || headerPhoto.trim().isEmpty()) {
        headerPhoto = "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&h=100&fit=crop&crop=faces";
    } else if (!headerPhoto.startsWith("http") && !headerPhoto.startsWith("/")) {
        headerPhoto = request.getContextPath() + "/" + headerPhoto;
    }
%>
                <a href="manager_profile.jsp" class="ml-sm w-8 h-8 rounded-full overflow-hidden border border-outline-variant dark:border-[#334155] hover:border-secondary dark:hover:border-secondary-fixed transition-colors focus:outline-none cursor-pointer shrink-0 block">
                    <img alt="Manager Avatar" class="w-full h-full object-cover" src="<%= headerPhoto %>"/>
                </a>
            </div>
        </header>

        <!-- Canvas -->
        <main class="flex-1 p-lg md:p-xl bg-background dark:bg-[#0b1c30] overflow-y-auto">
            <div class="max-w-container-max mx-auto space-y-xl">
                
                <div class="flex justify-between items-end mb-md">
                    <div>
                        <h2 class="font-display-lg text-display-lg text-on-surface dark:text-white">Manager Profile</h2>
                        <p class="font-body-md text-body-md text-on-surface-variant dark:text-gray-400 mt-xs">Manage your personal information and account settings.</p>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-3 gap-lg">
                    <!-- Profile Identity Card -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] rounded-xl p-lg shadow-[0px_1px_3px_rgba(0,0,0,0.1)] lg:col-span-1 flex flex-col items-center text-center">
                        <div class="relative w-32 h-32 rounded-full overflow-hidden border-4 border-surface-container-high dark:border-[#334155] mb-md group">
                            <img alt="Profile Photo" class="w-full h-full object-cover" src="<%= (manager != null && manager.getPhoto() != null) ? manager.getPhoto() : "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&h=100&fit=crop&crop=faces" %>"/>
                            <div class="absolute inset-0 bg-on-surface/50 hidden group-hover:flex items-center justify-center cursor-pointer transition-opacity">
                                <span class="material-symbols-outlined text-white">photo_camera</span>
                            </div>
                        </div>
                        <h3 class="font-title-sm text-title-sm text-on-surface dark:text-white mb-xs"><%= manager.getName() %></h3>
                        <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400 mb-md">Senior Event Coordinator</p>
                        
                        <div class="flex gap-sm w-full mt-auto pt-md border-t border-outline-variant dark:border-[#334155]">
                            <form action="UpdatePhotoServlet" method="POST" enctype="multipart/form-data" class="w-full">
                                <input type="file" name="profilePhoto" accept="image/*" required class="block w-full text-sm text-on-surface-variant dark:text-gray-400 mb-sm file:mr-4 file:py-2 file:px-4 file:rounded file:border-0 file:text-sm file:font-semibold file:bg-secondary file:text-white hover:file:bg-primary"/>
                                <button type="submit" class="w-full bg-transparent border border-outline-variant dark:border-[#334155] text-primary-container dark:text-primary-fixed font-body-sm text-body-sm font-semibold py-sm rounded hover:bg-surface-container-low dark:hover:bg-gray-800 transition-colors">
                                    Upload Photo
                                </button>
                            </form>
                        </div>
                    </div>

                    <!-- Profile Details Form -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] rounded-xl p-lg shadow-[0px_1px_3px_rgba(0,0,0,0.1)] lg:col-span-2">
                        <div class="flex justify-between items-center mb-md pb-sm border-b border-outline-variant dark:border-[#334155]">
                            <h3 class="font-title-sm text-title-sm text-on-surface dark:text-white">Personal Information</h3>
                            <button class="flex items-center gap-xs text-secondary dark:text-secondary-fixed font-body-sm text-body-sm font-semibold hover:text-primary dark:hover:text-primary-fixed transition-colors" id="editProfileBtn" type="button">
                                <span class="material-symbols-outlined text-[18px]">edit</span> Edit Profile
                            </button>
                        </div>
                        
                        <form action="UpdateProfileServlet" method="POST" class="space-y-md">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-md">
                                <div class="flex flex-col">
                                    <label class="font-body-sm text-body-sm font-bold text-on-surface-variant dark:text-gray-400 mb-xs" for="fullName">Full Name</label>
                                    <input name="name" id="fullName" class="w-full bg-surface-container-lowest dark:bg-[#0b1c30] border border-outline-variant dark:border-[#334155] rounded px-sm py-sm font-body-md text-body-md text-on-surface dark:text-white focus:outline-none focus:border-secondary focus:ring-1 focus:ring-secondary disabled:bg-surface-container-low disabled:dark:bg-[#1E293B] disabled:text-on-surface-variant disabled:dark:text-gray-500 disabled:border-outline-variant/50 disabled:dark:border-[#334155]/50 transition-all" disabled type="text" value="<%= manager.getName() %>"/>
                                </div>
                                <div class="flex flex-col">
                                    <label class="font-body-sm text-body-sm font-bold text-on-surface-variant dark:text-gray-400 mb-xs" for="email">Email Address</label>
                                    <input name="email" id="email" class="w-full bg-surface-container-lowest dark:bg-[#0b1c30] border border-outline-variant dark:border-[#334155] rounded px-sm py-sm font-body-md text-body-md text-on-surface dark:text-white focus:outline-none focus:border-secondary focus:ring-1 focus:ring-secondary disabled:bg-surface-container-low disabled:dark:bg-[#1E293B] disabled:text-on-surface-variant disabled:dark:text-gray-500 disabled:border-outline-variant/50 disabled:dark:border-[#334155]/50 transition-all" disabled type="email" value="<%= manager.getEmail() %>"/>
                                </div>
                                <div class="flex flex-col">
                                    <label class="font-body-sm text-body-sm font-bold text-on-surface-variant dark:text-gray-400 mb-xs" for="contactNumber">Contact Number</label>
                                    <input name="contact" id="contactNumber" class="w-full bg-surface-container-lowest dark:bg-[#0b1c30] border border-outline-variant dark:border-[#334155] rounded px-sm py-sm font-body-md text-body-md text-on-surface dark:text-white focus:outline-none focus:border-secondary focus:ring-1 focus:ring-secondary disabled:bg-surface-container-low disabled:dark:bg-[#1E293B] disabled:text-on-surface-variant disabled:dark:text-gray-500 disabled:border-outline-variant/50 disabled:dark:border-[#334155]/50 transition-all" disabled type="tel" value="<%= manager.getContact() %>"/>
                                </div>
                                <div class="flex flex-col">
                                    <label class="font-body-sm text-body-sm font-bold text-on-surface-variant dark:text-gray-400 mb-xs" for="address">Address</label>
                                    <input name="address" id="address" class="w-full bg-surface-container-lowest dark:bg-[#0b1c30] border border-outline-variant dark:border-[#334155] rounded px-sm py-sm font-body-md text-body-md text-on-surface dark:text-white focus:outline-none focus:border-secondary focus:ring-1 focus:ring-secondary disabled:bg-surface-container-low disabled:dark:bg-[#1E293B] disabled:text-on-surface-variant disabled:dark:text-gray-500 disabled:border-outline-variant/50 disabled:dark:border-[#334155]/50 transition-all" disabled type="text" value="<%= manager.getAddress() %>"/>
                                </div>
                            </div>
                            
                            <!-- Action Buttons -->
                            <div class="hidden flex justify-end gap-sm pt-md border-t border-outline-variant dark:border-[#334155]" id="formActions">
                                <button class="bg-transparent border border-outline-variant dark:border-[#334155] text-primary-container dark:text-primary-fixed font-body-sm text-body-sm font-semibold py-sm px-md rounded hover:bg-surface-container-low dark:hover:bg-gray-800 transition-colors" id="cancelBtn" type="button">
                                    Cancel
                                </button>
                                <button class="bg-[#00ADEF] text-on-primary dark:text-white font-body-sm text-body-sm font-semibold py-sm px-md rounded hover:bg-secondary dark:hover:bg-[#0095CC] transition-colors" type="submit">
                                    Save Changes
                                </button>
                            </div>
                        </form>
                    </div>

                    <!-- Security Section -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] rounded-xl p-lg shadow-[0px_1px_3px_rgba(0,0,0,0.1)] lg:col-span-3">
                        <form action="ChangePasswordServlet" method="POST" class="space-y-md">
                            <div>
                                <h3 class="font-title-sm text-title-sm text-on-surface dark:text-white">Account Security</h3>
                                <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400 mt-xs">Update your password to keep your account secure.</p>
                            </div>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-md">
                                <div class="flex flex-col">
                                    <label class="font-body-sm text-body-sm font-bold text-on-surface-variant dark:text-gray-400 mb-xs">Current Password</label>
                                    <input type="password" name="currentPassword" required class="w-full bg-surface-container-lowest dark:bg-[#0b1c30] border border-outline-variant dark:border-[#334155] rounded px-sm py-sm font-body-md text-body-md text-on-surface dark:text-white focus:outline-none focus:border-secondary"/>
                                </div>
                                <div class="flex flex-col">
                                    <label class="font-body-sm text-body-sm font-bold text-on-surface-variant dark:text-gray-400 mb-xs">New Password</label>
                                    <input type="password" name="newPassword" required class="w-full bg-surface-container-lowest dark:bg-[#0b1c30] border border-outline-variant dark:border-[#334155] rounded px-sm py-sm font-body-md text-body-md text-on-surface dark:text-white focus:outline-none focus:border-secondary"/>
                                </div>
                            </div>
                            <div class="flex justify-end">
                                <button type="submit" class="bg-secondary text-white font-body-sm text-body-sm font-semibold py-sm px-md rounded hover:bg-primary transition-colors flex items-center gap-xs">
                                    <span class="material-symbols-outlined text-[18px]">lock</span> Update Password
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Toggle Script -->
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const editBtn = document.getElementById('editProfileBtn');
            const cancelBtn = document.getElementById('cancelBtn');
            const formActions = document.getElementById('formActions');
            const inputs = document.querySelectorAll('form input, form textarea');

            function toggleEditMode() {
                const isEditing = !formActions.classList.contains('hidden');
                
                if (isEditing) {
                    formActions.classList.add('hidden');
                    inputs.forEach(input => input.disabled = true);
                    editBtn.innerHTML = `<span class="material-symbols-outlined text-[18px]">edit</span> Edit Profile`;
                } else {
                    formActions.classList.remove('hidden');
                    inputs.forEach(input => input.disabled = false);
                    editBtn.innerHTML = `<span class="material-symbols-outlined text-[18px]">close</span> Cancel Editing`;
                }
            }

            if (editBtn) editBtn.addEventListener('click', toggleEditMode);
            if (cancelBtn) cancelBtn.addEventListener('click', toggleEditMode);
            
            // Dark Mode Logic
            const themeToggleBtn = document.getElementById('theme-toggle');
            const themeIcon = document.getElementById('theme-icon');
            const htmlElement = document.documentElement;

            if (localStorage.getItem('theme') === 'dark') {
                htmlElement.classList.add('dark');
                if (themeIcon) themeIcon.textContent = 'light_mode'; 
            }

            if (themeToggleBtn) {
                themeToggleBtn.addEventListener('click', () => {
                    htmlElement.classList.toggle('dark');
                    if (htmlElement.classList.contains('dark')) {
                        localStorage.setItem('theme', 'dark');
                        if (themeIcon) themeIcon.textContent = 'light_mode';
                    } else {
                        localStorage.setItem('theme', 'light');
                        if (themeIcon) themeIcon.textContent = 'dark_mode';
                    }
                });
            }
        });
    </script>
</body>
</html>