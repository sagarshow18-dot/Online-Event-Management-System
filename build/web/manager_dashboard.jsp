<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>EventHub Manager - Dashboard</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script id="tailwind-config">
        tailwind.config = { darkMode: "class", theme: { extend: { colors: { "outline-variant": "#c7c5d4", "tertiary-fixed-dim": "#c3c7cb", "primary-container": "#2e3192", "secondary-fixed": "#c6e7ff", "on-surface": "#0b1c30", "on-error-container": "#93000a", "on-surface-variant": "#464652", "inverse-on-surface": "#eaf1ff", "on-secondary-fixed": "#001e2e", "on-tertiary": "#ffffff", "on-error": "#ffffff", "inverse-surface": "#213145", "surface-container-highest": "#d3e4fe", "primary-fixed": "#e1e0ff", "surface": "#f8f9ff", "error-container": "#ffdad6", "secondary-fixed-dim": "#83cfff", "on-background": "#0b1c30", "tertiary-fixed": "#dfe3e7", "surface-variant": "#d3e4fe", "on-primary": "#ffffff", "surface-container": "#e5eeff", "on-tertiary-container": "#a6aaae", "surface-container-lowest": "#ffffff", "error": "#ba1a1a", "on-tertiary-fixed-variant": "#43474b", "on-primary-container": "#9da1ff", "surface-container-high": "#dce9ff", "on-primary-fixed": "#04006d", "primary-fixed-dim": "#c0c1ff", "surface-bright": "#f8f9ff", "on-primary-fixed-variant": "#373a9b", "surface-dim": "#cbdbf5", "on-secondary-container": "#004867", "surface-container-low": "#eff4ff", "secondary-container": "#2fbcff", "on-secondary": "#ffffff", "outline": "#777683", "background": "#f8f9ff", "on-tertiary-fixed": "#171c1f", "tertiary": "#24292c", "secondary": "#00658d", "primary": "#15157d", "surface-tint": "#4f54b4", "on-secondary-fixed-variant": "#004c6c", "tertiary-container": "#3a3f42", "inverse-primary": "#c0c1ff" }, borderRadius: { "DEFAULT": "0.125rem", "lg": "0.25rem", "xl": "0.5rem", "full": "0.75rem" }, spacing: { "lg": "24px", "container-max": "1280px", "base": "8px", "xl": "32px", "margin-mobile": "16px", "xs": "4px", "gutter": "24px", "sm": "8px", "md": "16px" }, fontFamily: { "body-sm": ["Inter"], "label-caps": ["Inter"], "title-sm": ["Inter"], "display-lg": ["Inter"], "body-md": ["Inter"], "code": ["Inter"], "headline-md": ["Inter"], "display-lg-mobile": ["Inter"] }, fontSize: { "body-sm": ["14px", { "lineHeight": "20px", "fontWeight": "400" }], "label-caps": ["12px", { "lineHeight": "16px", "letterSpacing": "0.05em", "fontWeight": "600" }], "title-sm": ["18px", { "lineHeight": "24px", "fontWeight": "600" }], "display-lg": ["36px", { "lineHeight": "44px", "letterSpacing": "-0.02em", "fontWeight": "700" }], "body-md": ["16px", { "lineHeight": "24px", "fontWeight": "400" }], "code": ["13px", { "lineHeight": "18px", "fontWeight": "400" }], "headline-md": ["24px", { "lineHeight": "32px", "letterSpacing": "-0.01em", "fontWeight": "600" }], "display-lg-mobile": ["28px", { "lineHeight": "34px", "letterSpacing": "-0.02em", "fontWeight": "700" }] } } } }
    </script>
    <style>
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
        .material-symbols-outlined[data-weight="fill"] { font-variation-settings: 'FILL' 1; }
    </style>
</head>
<body class="bg-background dark:bg-[#0b1c30] text-on-background dark:text-white font-body-md min-h-screen flex antialiased">
    <!-- SideNavBar -->
    <nav class="bg-surface dark:bg-inverse-surface fixed left-0 top-0 h-full w-60 border-r border-outline-variant dark:border-[#334155] flex flex-col py-md transition-colors duration-200 ease-in-out z-20 hidden md:flex">
        <div class="px-md mb-xl flex items-center gap-sm">
            <span class="material-symbols-outlined text-primary dark:text-primary-fixed text-[32px]" style="font-variation-settings: 'FILL' 1;">event</span>
            <div>
                <h1 class="text-headline-md font-headline-md text-primary dark:text-primary-fixed font-bold">EventHub</h1>
                <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">Management Suite</p>
            </div>
        </div>
        <ul class="flex-1 overflow-y-auto px-sm">
            <li><a class="flex items-center px-md py-sm mb-xs rounded text-secondary dark:text-secondary-fixed font-bold border-r-4 border-secondary bg-surface-container-high dark:bg-[#1E293B] transition-colors duration-200 ease-in-out" href="manager_dashboard.jsp"><span class="material-symbols-outlined mr-sm" data-weight="fill">dashboard</span> <span class="font-body-md text-body-md">Dashboard</span></a></li>
            <li><a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="manage_events.jsp"><span class="material-symbols-outlined mr-sm" data-icon="calendar_today">calendar_today</span> <span class="font-body-md text-body-md">My Events</span></a></li>
            <li><a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="add_event.jsp"><span class="material-symbols-outlined mr-sm" data-icon="add_circle">add_circle</span> <span class="font-body-md text-body-md">Add Event</span></a></li>
            <li><a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="participants.jsp"><span class="material-symbols-outlined mr-sm" data-icon="groups">groups</span> <span class="font-body-md text-body-md">Participants</span></a></li>
            <li><a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="manager_bookings.jsp"><span class="material-symbols-outlined mr-sm" data-icon="confirmation_number">confirmation_number</span> <span class="font-body-md text-body-md">Bookings</span></a></li>
            <li><a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="event_accessories.jsp"><span class="material-symbols-outlined mr-sm" data-icon="inventory_2">inventory_2</span> <span class="font-body-md text-body-md">Event Accessories</span></a></li>
            <li><a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="event_reports.jsp"><span class="material-symbols-outlined mr-sm" data-icon="analytics">analytics</span> <span class="font-body-md text-body-md">Reports</span></a></li>
            <li><a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="manager_profile.jsp"><span class="material-symbols-outlined mr-sm" data-icon="account_circle">account_circle</span> <span class="font-body-md text-body-md">Profile</span></a></li>
        </ul>
        <div class="mt-auto px-sm pt-md border-t border-outline-variant dark:border-[#334155]">
            <a class="flex items-center px-md py-sm rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-error dark:hover:text-red-400 transition-colors duration-200 ease-in-out" href="LogoutServlet"><span class="material-symbols-outlined mr-sm" data-icon="logout">logout</span> <span class="font-body-md text-body-md">Logout</span></a>
        </div>
    </nav>

    <!-- Main Content Area -->
    <div class="flex-1 md:ml-60 flex flex-col min-h-screen">
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

        <main class="flex-1 p-lg md:p-xl bg-background dark:bg-[#0b1c30] overflow-y-auto">
            <div class="max-w-container-max mx-auto space-y-xl">
                
                <!-- Header -->
                <div class="flex justify-between items-end">
                    <div>
                        <h2 class="font-display-lg text-display-lg text-on-surface dark:text-white">Dashboard Overview</h2>
                        <p class="font-body-md text-body-md text-on-surface-variant dark:text-gray-400 mt-xs">Here is what's happening across all your events.</p>
                    </div>
                    <a href="add_event.jsp" class="bg-[#00ADEF] text-on-primary dark:text-white font-body-sm text-body-sm font-semibold py-sm px-md rounded hover:bg-secondary dark:hover:bg-[#0095CC] transition-colors flex items-center gap-xs">
                        <span class="material-symbols-outlined text-[18px]">add</span> Create Event
                    </a>
                </div>

                <!-- Stats Bento Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-md">
                    <!-- Stat Card 1 -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] p-lg rounded-xl shadow-[0px_1px_3px_rgba(0,0,0,0.1)] relative overflow-hidden">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase">Total Events</p>
                                <h3 class="font-headline-md text-headline-md text-on-surface dark:text-white mt-1">124</h3>
                            </div>
                            <div class="bg-surface-container-high dark:bg-gray-800 p-2 rounded">
                                <span class="material-symbols-outlined text-secondary dark:text-secondary-fixed" data-weight="fill">event</span>
                            </div>
                        </div>
                        <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400 mt-md"><span class="text-secondary dark:text-secondary-fixed font-bold">+12%</span> from last month</p>
                    </div>
                    
                    <!-- Stat Card 2 -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] p-lg rounded-xl shadow-[0px_1px_3px_rgba(0,0,0,0.1)] relative overflow-hidden">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase">Upcoming Events</p>
                                <h3 class="font-headline-md text-headline-md text-on-surface dark:text-white mt-1">18</h3>
                            </div>
                            <div class="bg-surface-container-high dark:bg-gray-800 p-2 rounded">
                                <span class="material-symbols-outlined text-secondary dark:text-secondary-fixed" data-weight="fill">upcoming</span>
                            </div>
                        </div>
                        <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400 mt-md"><span class="text-secondary dark:text-secondary-fixed font-bold">3</span> in the next 7 days</p>
                    </div>

                    <!-- Stat Card 3 -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] p-lg rounded-xl shadow-[0px_1px_3px_rgba(0,0,0,0.1)] relative overflow-hidden">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase">Total Participants</p>
                                <h3 class="font-headline-md text-headline-md text-on-surface dark:text-white mt-1">8,492</h3>
                            </div>
                            <div class="bg-surface-container-high dark:bg-gray-800 p-2 rounded">
                                <span class="material-symbols-outlined text-secondary dark:text-secondary-fixed" data-weight="fill">group</span>
                            </div>
                        </div>
                        <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400 mt-md"><span class="text-secondary dark:text-secondary-fixed font-bold">+5%</span> from last month</p>
                    </div>

                    <!-- Stat Card 4 -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] p-lg rounded-xl shadow-[0px_1px_3px_rgba(0,0,0,0.1)] relative overflow-hidden">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase">Total Bookings</p>
                                <h3 class="font-headline-md text-headline-md text-on-surface dark:text-white mt-1">3,205</h3>
                            </div>
                            <div class="bg-surface-container-high dark:bg-gray-800 p-2 rounded">
                                <span class="material-symbols-outlined text-secondary dark:text-secondary-fixed" data-weight="fill">confirmation_number</span>
                            </div>
                        </div>
                        <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400 mt-md">94% attendance rate</p>
                    </div>

                    <!-- Stat Card 5 -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] p-lg rounded-xl shadow-[0px_1px_3px_rgba(0,0,0,0.1)] relative overflow-hidden lg:col-span-1 md:col-span-2">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase">Total Revenue</p>
                                <h3 class="font-headline-md text-headline-md text-on-surface dark:text-white mt-1">$412.5K</h3>
                            </div>
                            <div class="bg-surface-container-high dark:bg-gray-800 p-2 rounded">
                                <span class="material-symbols-outlined text-secondary dark:text-secondary-fixed" data-weight="fill">payments</span>
                            </div>
                        </div>
                        <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400 mt-md"><span class="text-secondary dark:text-secondary-fixed font-bold">+22%</span> from last year</p>
                    </div>
                </div>

                <!-- Main Content Grid (2 Columns) -->
                <div class="grid grid-cols-1 xl:grid-cols-3 gap-xl">
                    
                    <!-- Left Column (Wider) -->
                    <div class="xl:col-span-2 space-y-xl">
                        
                        <!-- Upcoming Events (Cards Layout) -->
                        <div class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] rounded-xl shadow-[0px_1px_3px_rgba(0,0,0,0.1)] overflow-hidden">
                            <div class="p-md border-b border-outline-variant dark:border-[#334155] flex justify-between items-center">
                                <h3 class="font-title-sm text-title-sm text-on-surface dark:text-white">Upcoming Events</h3>
                                <a href="manage_events.jsp" class="text-secondary dark:text-secondary-fixed font-body-sm text-body-sm hover:underline">View All</a>
                            </div>
                            <div class="p-md grid grid-cols-1 md:grid-cols-2 gap-md">
                                <!-- Event Card 1 -->
                                <div class="border border-outline-variant dark:border-[#334155] rounded-lg p-md bg-surface dark:bg-[#0b1c30] hover:border-secondary dark:hover:border-secondary-fixed transition-colors cursor-pointer">
                                    <div class="flex justify-between items-start mb-sm">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded text-[10px] font-bold bg-surface-container-high dark:bg-gray-700 text-on-surface dark:text-gray-200">CONFIRMED</span>
                                        <span class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">Oct 24, 2023</span>
                                    </div>
                                    <h4 class="font-title-sm text-title-sm text-on-surface dark:text-white mb-1">Global Tech Summit 2023</h4>
                                    <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400 mb-md flex items-center">
                                        <span class="material-symbols-outlined text-[16px] mr-1">location_on</span> Moscone Center, SF
                                    </p>
                                    <div class="flex justify-between items-center pt-sm border-t border-outline-variant dark:border-[#334155]">
                                        <div class="flex -space-x-2">
                                            <img alt="Attendee" class="w-6 h-6 rounded-full border border-surface dark:border-[#0b1c30] object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuB-YKydGvfAEOUvrDbrmvFbrRF7uOzKIiNNGrDsBrUwo5NFZKwiaO87kBV9VRMt0Xwew6vRnjzNuQFe_4XS2jMtroqmr08C7VjIzVOKceQaMULWr20KryHG6pc7ls5JwYkqxP1MpowemfTECqsW_omPrItJmgsyicN4p8-OGO4wBEPNK2jqeuBz8yG30mxHOejAA7XISiokcqLyX1rTyrt7ZBSBefrxEGOQg6wbWEYhQ0sc2RiYKO0i2A"/>
                                            <img alt="Attendee" class="w-6 h-6 rounded-full border border-surface dark:border-[#0b1c30] object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDcPK3lv_GApzIPu-m6RzMBAaH--DsqmQdEe6WpC_NNT3CGll7QY2NfRHFvato5BlGqu7hUSIogs81YMpjptod8OP7wCeO5SCfwpYqktzDRA36x9lyHCNa3ZHSuNVyFxSTmkxaOJCEb0rj88Z3pDPMOofFxIyRKX40O5OztXbw73BQlzymlK1mjwyAc6cJrJrQuEiZ08Ue0GHIMkIXSdQOFqBcMX4mFHF2plqU8xWwtqi5pO0TyOLsHiQ"/>
                                            <div class="w-6 h-6 rounded-full border border-surface dark:border-[#0b1c30] bg-surface-container-high dark:bg-gray-800 flex items-center justify-center text-[10px] text-on-surface dark:text-gray-200 font-bold">+2k</div>
                                        </div>
                                        <span class="font-label-caps text-label-caps text-secondary dark:text-secondary-fixed">85% BOOKED</span>
                                    </div>
                                </div>
                                <!-- Event Card 2 -->
                                <div class="border border-outline-variant dark:border-[#334155] rounded-lg p-md bg-surface dark:bg-[#0b1c30] hover:border-secondary dark:hover:border-secondary-fixed transition-colors cursor-pointer">
                                    <div class="flex justify-between items-start mb-sm">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded text-[10px] font-bold bg-surface-variant dark:bg-gray-800 text-on-surface-variant dark:text-gray-300 border border-outline-variant dark:border-[#334155]">PLANNING</span>
                                        <span class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">Nov 12, 2023</span>
                                    </div>
                                    <h4 class="font-title-sm text-title-sm text-on-surface dark:text-white mb-1">Leadership Retreat Q4</h4>
                                    <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400 mb-md flex items-center">
                                        <span class="material-symbols-outlined text-[16px] mr-1">location_on</span> Napa Valley Resort
                                    </p>
                                    <div class="flex justify-between items-center pt-sm border-t border-outline-variant dark:border-[#334155]">
                                        <div class="flex -space-x-2">
                                            <div class="w-6 h-6 rounded-full border border-surface dark:border-[#0b1c30] bg-surface-container-high dark:bg-gray-800 flex items-center justify-center text-[10px] text-on-surface dark:text-gray-200 font-bold">150</div>
                                        </div>
                                        <span class="font-label-caps text-label-caps text-outline dark:text-gray-500">INVITE ONLY</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Recent Bookings (Table) -->
                        <div class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] rounded-xl shadow-[0px_1px_3px_rgba(0,0,0,0.1)] overflow-hidden">
                            <div class="p-md border-b border-outline-variant dark:border-[#334155] flex justify-between items-center">
                                <h3 class="font-title-sm text-title-sm text-on-surface dark:text-white">Recent Bookings</h3>
                                <a href="manager_bookings.jsp" class="text-secondary dark:text-secondary-fixed font-body-sm text-body-sm hover:underline">View All</a>
                            </div>
                            <div class="overflow-x-auto">
                                <table class="w-full text-left border-collapse">
                                    <thead>
                                        <tr class="bg-surface-container-low dark:bg-gray-800 border-b border-outline-variant dark:border-[#334155]">
                                            <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400">Booking ID</th>
                                            <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400">Participant Name</th>
                                            <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400">Event</th>
                                            <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400">Date</th>
                                            <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400">Status</th>
                                            <th class="py-3 px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 text-right">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody class="font-body-sm text-body-sm text-on-background dark:text-gray-200 divide-y divide-outline-variant dark:divide-[#334155]">
                                        <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors h-12 group">
                                            <td class="py-2 px-md font-code text-code text-on-surface-variant dark:text-gray-400">#BK-9482</td>
                                            <td class="py-2 px-md font-semibold text-on-surface dark:text-white">Sarah Jenkins</td>
                                            <td class="py-2 px-md text-on-surface-variant dark:text-gray-400">Global Tech Summit</td>
                                            <td class="py-2 px-md text-on-surface-variant dark:text-gray-400">Oct 15, 2023</td>
                                            <td class="py-2 px-md">
                                                <span class="inline-flex items-center px-2 py-0.5 rounded-sm bg-surface-container-high dark:bg-gray-700 text-on-surface dark:text-gray-200 font-label-caps text-label-caps">PAID</span>
                                            </td>
                                            <td class="py-2 px-md text-right">
                                                <button class="text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed font-body-sm transition-colors">View</button>
                                            </td>
                                        </tr>
                                        <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors h-12 group">
                                            <td class="py-2 px-md font-code text-code text-on-surface-variant dark:text-gray-400">#BK-9481</td>
                                            <td class="py-2 px-md font-semibold text-on-surface dark:text-white">Marcus Chen</td>
                                            <td class="py-2 px-md text-on-surface-variant dark:text-gray-400">Global Tech Summit</td>
                                            <td class="py-2 px-md text-on-surface-variant dark:text-gray-400">Oct 15, 2023</td>
                                            <td class="py-2 px-md">
                                                <span class="inline-flex items-center px-2 py-0.5 rounded-sm bg-surface-container-high dark:bg-gray-700 text-on-surface dark:text-gray-200 font-label-caps text-label-caps">PAID</span>
                                            </td>
                                            <td class="py-2 px-md text-right">
                                                <button class="text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed font-body-sm transition-colors">View</button>
                                            </td>
                                        </tr>
                                        <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors h-12 group">
                                            <td class="py-2 px-md font-code text-code text-on-surface-variant dark:text-gray-400">#BK-9480</td>
                                            <td class="py-2 px-md font-semibold text-on-surface dark:text-white">Elena Rodriguez</td>
                                            <td class="py-2 px-md text-on-surface-variant dark:text-gray-400">Leadership Retreat</td>
                                            <td class="py-2 px-md text-on-surface-variant dark:text-gray-400">Oct 14, 2023</td>
                                            <td class="py-2 px-md">
                                                <span class="inline-flex items-center px-2 py-0.5 rounded-sm bg-[#fef7e0] dark:bg-yellow-900/30 text-[#b06000] dark:text-yellow-400 font-label-caps text-label-caps border border-[#b06000]/20">PENDING</span>
                                            </td>
                                            <td class="py-2 px-md text-right">
                                                <button class="text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed font-body-sm transition-colors">View</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Right Column (Narrower) -->
                    <div class="space-y-xl">
                        <!-- Quick Actions Grid -->
                        <div class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] rounded-xl shadow-[0px_1px_3px_rgba(0,0,0,0.1)] p-lg">
                            <h3 class="font-title-sm text-title-sm text-on-surface dark:text-white mb-md">Quick Actions</h3>
                            <div class="grid grid-cols-2 gap-sm">
                                <a href="add_event.jsp" class="flex flex-col items-center justify-center p-sm border border-outline-variant dark:border-[#334155] rounded-lg hover:border-secondary dark:hover:border-secondary-fixed hover:bg-surface-container-low dark:hover:bg-gray-800 transition-colors bg-surface dark:bg-[#0b1c30] text-on-surface-variant dark:text-gray-300 hover:text-secondary dark:hover:text-secondary-fixed h-24">
                                    <span class="material-symbols-outlined mb-1 text-[24px]">add_circle</span>
                                    <span class="font-label-caps text-label-caps text-center">Add Event</span>
                                </a>
                                <a href="manage_events.jsp" class="flex flex-col items-center justify-center p-sm border border-outline-variant dark:border-[#334155] rounded-lg hover:border-secondary dark:hover:border-secondary-fixed hover:bg-surface-container-low dark:hover:bg-gray-800 transition-colors bg-surface dark:bg-[#0b1c30] text-on-surface-variant dark:text-gray-300 hover:text-secondary dark:hover:text-secondary-fixed h-24">
                                    <span class="material-symbols-outlined mb-1 text-[24px]">calendar_today</span>
                                    <span class="font-label-caps text-label-caps text-center">Manage Events</span>
                                </a>
                                <a href="participants.jsp" class="flex flex-col items-center justify-center p-sm border border-outline-variant dark:border-[#334155] rounded-lg hover:border-secondary dark:hover:border-secondary-fixed hover:bg-surface-container-low dark:hover:bg-gray-800 transition-colors bg-surface dark:bg-[#0b1c30] text-on-surface-variant dark:text-gray-300 hover:text-secondary dark:hover:text-secondary-fixed h-24">
                                    <span class="material-symbols-outlined mb-1 text-[24px]">groups</span>
                                    <span class="font-label-caps text-label-caps text-center">Participants</span>
                                </a>
                                <a href="manager_bookings.jsp" class="flex flex-col items-center justify-center p-sm border border-outline-variant dark:border-[#334155] rounded-lg hover:border-secondary dark:hover:border-secondary-fixed hover:bg-surface-container-low dark:hover:bg-gray-800 transition-colors bg-surface dark:bg-[#0b1c30] text-on-surface-variant dark:text-gray-300 hover:text-secondary dark:hover:text-secondary-fixed h-24">
                                    <span class="material-symbols-outlined mb-1 text-[24px]">confirmation_number</span>
                                    <span class="font-label-caps text-label-caps text-center">Bookings</span>
                                </a>
                                <a href="event_accessories.jsp" class="flex flex-col items-center justify-center p-sm border border-outline-variant dark:border-[#334155] rounded-lg hover:border-secondary dark:hover:border-secondary-fixed hover:bg-surface-container-low dark:hover:bg-gray-800 transition-colors bg-surface dark:bg-[#0b1c30] text-on-surface-variant dark:text-gray-300 hover:text-secondary dark:hover:text-secondary-fixed h-24">
                                    <span class="material-symbols-outlined mb-1 text-[24px]">inventory_2</span>
                                    <span class="font-label-caps text-label-caps text-center">Accessories</span>
                                </a>
                                <a href="event_reports.jsp" class="flex flex-col items-center justify-center p-sm border border-outline-variant dark:border-[#334155] rounded-lg hover:border-secondary dark:hover:border-secondary-fixed hover:bg-surface-container-low dark:hover:bg-gray-800 transition-colors bg-surface dark:bg-[#0b1c30] text-on-surface-variant dark:text-gray-300 hover:text-secondary dark:hover:text-secondary-fixed h-24">
                                    <span class="material-symbols-outlined mb-1 text-[24px]">analytics</span>
                                    <span class="font-label-caps text-label-caps text-center">Reports</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Dark Mode JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', () => {
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