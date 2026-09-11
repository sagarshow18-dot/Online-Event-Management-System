<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Bookings - EventHub Manager</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
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
                        "DEFAULT": "0.125rem", "lg": "0.25rem", "xl": "0.5rem", "full": "0.75rem"
                    },
                    "spacing": {
                        "lg": "24px", "container-max": "1280px", "base": "8px", "xl": "32px", "margin-mobile": "16px", "xs": "4px", "gutter": "24px", "sm": "8px", "md": "16px"
                    },
                    "fontFamily": {
                        "body-sm": ["Inter"], "label-caps": ["Inter"], "title-sm": ["Inter"], "display-lg": ["Inter"], "body-md": ["Inter"], "code": ["Inter"], "headline-md": ["Inter"], "display-lg-mobile": ["Inter"]
                    },
                    "fontSize": {
                        "body-sm": ["14px", {"lineHeight": "20px", "fontWeight": "400"}],
                        "label-caps": ["12px", {"lineHeight": "16px", "letterSpacing": "0.05em", "fontWeight": "600"}],
                        "title-sm": ["18px", {"lineHeight": "24px", "fontWeight": "600"}],
                        "display-lg": ["36px", {"lineHeight": "44px", "letterSpacing": "-0.02em", "fontWeight": "700"}],
                        "body-md": ["16px", {"lineHeight": "24px", "fontWeight": "400"}],
                        "code": ["13px", {"lineHeight": "18px", "fontWeight": "400"}],
                        "headline-md": ["24px", {"lineHeight": "32px", "letterSpacing": "-0.01em", "fontWeight": "600"}],
                        "display-lg-mobile": ["28px", {"lineHeight": "34px", "letterSpacing": "-0.02em", "fontWeight": "700"}]
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
<body class="bg-background dark:bg-[#0b1c30] text-on-background dark:text-white font-body-md h-screen overflow-hidden flex antialiased">
    
    <!-- SideNavBar -->
    <nav class="bg-surface dark:bg-inverse-surface fixed left-0 top-0 h-full w-60 border-r border-outline-variant dark:border-[#334155] flex flex-col py-md transition-colors duration-200 ease-in-out z-20 hidden md:flex">
        <div class="px-md pb-xl">
            <h1 class="font-headline-md text-headline-md text-primary dark:text-primary-fixed mb-xs font-bold">EventHub</h1>
            <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">Management Suite</p>
        </div>
        <ul class="flex-1 overflow-y-auto w-full px-sm">
            <li class="w-full">
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-tertiary-container hover:text-secondary dark:hover:text-secondary-fixed w-full transition-colors duration-200 ease-in-out" href="manager_dashboard.jsp">
                    <span class="material-symbols-outlined mr-md">dashboard</span>
                    <span class="font-body-md text-body-md">Dashboard</span>
                </a>
            </li>
            <li class="w-full">
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-tertiary-container hover:text-secondary dark:hover:text-secondary-fixed w-full transition-colors duration-200 ease-in-out" href="manage_events.jsp">
                    <span class="material-symbols-outlined mr-md">calendar_today</span>
                    <span class="font-body-md text-body-md">My Events</span>
                </a>
            </li>
            <li class="w-full">
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-tertiary-container hover:text-secondary dark:hover:text-secondary-fixed w-full transition-colors duration-200 ease-in-out" href="add_event.jsp">
                    <span class="material-symbols-outlined mr-md">add_circle</span>
                    <span class="font-body-md text-body-md">Add Event</span>
                </a>
            </li>
            <li class="w-full">
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-tertiary-container hover:text-secondary dark:hover:text-secondary-fixed w-full transition-colors duration-200 ease-in-out" href="participants.jsp">
                    <span class="material-symbols-outlined mr-md">groups</span>
                    <span class="font-body-md text-body-md">Participants</span>
                </a>
            </li>
            <li class="w-full">
                <a class="flex items-center px-md py-sm mb-xs rounded text-secondary dark:text-secondary-fixed font-bold border-r-4 border-secondary dark:border-secondary-fixed bg-surface-container-high dark:bg-[#1E293B] w-full transition-colors duration-200 ease-in-out" href="manager_bookings.jsp">
                    <span class="material-symbols-outlined mr-md fill-icon">confirmation_number</span>
                    <span class="font-body-md text-body-md">Bookings</span>
                </a>
            </li>
            <li class="w-full">
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-tertiary-container hover:text-secondary dark:hover:text-secondary-fixed w-full transition-colors duration-200 ease-in-out" href="event_accessories.jsp">
                    <span class="material-symbols-outlined mr-md">inventory_2</span>
                    <span class="font-body-md text-body-md">Event Accessories</span>
                </a>
            </li>
            <li class="w-full">
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-tertiary-container hover:text-secondary dark:hover:text-secondary-fixed w-full transition-colors duration-200 ease-in-out" href="event_reports.jsp">
                    <span class="material-symbols-outlined mr-md">analytics</span>
                    <span class="font-body-md text-body-md">Reports</span>
                </a>
            </li>
            <li class="w-full">
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-tertiary-container hover:text-secondary dark:hover:text-secondary-fixed w-full transition-colors duration-200 ease-in-out" href="manager_profile.jsp">
                    <span class="material-symbols-outlined mr-md">account_circle</span>
                    <span class="font-body-md text-body-md">Profile</span>
                </a>
            </li>
        </ul>
        <div class="mt-auto px-sm pt-md border-t border-outline-variant dark:border-[#334155]">
            <a class="flex items-center px-md py-sm rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-tertiary-container hover:text-error dark:hover:text-red-400 w-full transition-colors duration-200 ease-in-out" href="LogoutServlet">
                <span class="material-symbols-outlined mr-md">logout</span>
                <span class="font-body-md text-body-md">Logout</span>
            </a>
        </div>
    </nav>

    <!-- Main Content Wrapper -->
    <div class="flex-1 flex flex-col md:ml-60 w-full md:w-[calc(100%-240px)] h-screen overflow-hidden">
        
        <!-- TopAppBar -->
        <header class="bg-surface dark:bg-inverse-surface docked full-width top-0 border-b border-outline-variant dark:border-[#334155] shadow-sm flex justify-between items-center h-16 px-xl z-10 sticky transition-colors duration-200">
            <div class="flex items-center md:hidden">
                <button class="text-on-surface-variant dark:text-white p-sm rounded hover:bg-surface-container-low dark:hover:bg-gray-800">
                    <span class="material-symbols-outlined">menu</span>
                </button>
            </div>
            <div class="font-headline-md text-headline-md text-primary dark:text-primary-fixed font-bold hidden md:block">EventHub Manager</div>
            <div class="flex items-center gap-md">
                <div class="relative hidden sm:block">
                    <span class="material-symbols-outlined absolute left-sm top-1/2 -translate-y-1/2 text-on-surface-variant dark:text-gray-400">search</span>
                    <input class="pl-xl pr-sm py-sm rounded border border-outline-variant dark:border-[#334155] focus:border-secondary focus:ring-2 focus:ring-secondary/20 font-body-sm text-body-sm w-64 bg-surface-container-lowest dark:bg-[#1E293B] dark:text-white transition-all placeholder-on-surface-variant" placeholder="Search..." type="text"/>
                </div>
                
                <!-- DARK MODE BUTTON -->
                <button id="theme-toggle" class="text-on-surface-variant dark:text-white hover:text-secondary dark:hover:text-secondary-fixed transition-all duration-200 flex items-center justify-center p-sm rounded-full hover:bg-surface-container-low dark:hover:bg-gray-800" title="Toggle Dark Mode">
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

        <!-- Main Canvas -->
        <main class="flex-1 overflow-y-auto p-lg bg-surface dark:bg-[#0b1c30] pb-xl transition-colors duration-200">
            <div class="max-w-container-max mx-auto space-y-xl">
                
                <!-- Page Header & Controls -->
                <div class="flex flex-col md:flex-row justify-between items-start md:items-end gap-md">
                    <div>
                        <h2 class="font-display-lg text-display-lg text-on-surface dark:text-white mb-xs">Bookings Management</h2>
                        <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">View and manage all participant bookings across your events.</p>
                    </div>
                    <div class="flex flex-wrap gap-md">
                        <button class="px-md py-sm rounded border border-outline-variant dark:border-[#334155] text-primary-container dark:text-primary-fixed font-title-sm text-title-sm hover:bg-surface-container-low dark:hover:bg-gray-800 transition-colors flex items-center gap-xs">
                            <span class="material-symbols-outlined text-[20px]">download</span> Export CSV
                        </button>
                        <button class="w-full md:w-auto bg-[#00ADEF] text-on-primary dark:text-white font-body-sm text-body-sm px-md py-sm rounded flex items-center justify-center gap-xs hover:bg-[#0095CC] transition-colors">
                            <span class="material-symbols-outlined text-[20px]">add</span> Manual Booking
                        </button>
                    </div>
                </div>

                <!-- Filters & Controls -->
                <div class="bg-surface-container-lowest dark:bg-[#1E293B] p-md rounded-xl border border-outline-variant dark:border-[#334155] shadow-[0px_1px_3px_rgba(0,0,0,0.1)] flex flex-col md:flex-row gap-md items-center justify-between">
                    <div class="flex flex-wrap gap-md w-full md:w-auto">
                        <div class="flex flex-col gap-xs w-full sm:w-auto">
                            <label class="font-body-sm text-body-sm font-bold text-on-surface-variant dark:text-gray-400">Event</label>
                            <select class="bg-surface dark:bg-[#0b1c30] border border-outline-variant dark:border-[#334155] rounded px-sm py-sm focus:border-secondary focus:ring-2 focus:ring-secondary/20 font-body-sm text-body-sm dark:text-white min-w-[200px]">
                                <option>All Events</option>
                                <option>Tech Innovators Summit 2024</option>
                                <option>Global Marketing Expo</option>
                                <option>Design Leadership Workshop</option>
                            </select>
                        </div>
                        <div class="flex flex-col gap-xs w-full sm:w-auto">
                            <label class="font-body-sm text-body-sm font-bold text-on-surface-variant dark:text-gray-400">Status</label>
                            <select class="bg-surface dark:bg-[#0b1c30] border border-outline-variant dark:border-[#334155] rounded px-sm py-sm focus:border-secondary focus:ring-2 focus:ring-secondary/20 font-body-sm text-body-sm dark:text-white min-w-[150px]">
                                <option>All Statuses</option>
                                <option>Confirmed</option>
                                <option>Pending</option>
                                <option>Cancelled</option>
                            </select>
                        </div>
                        <div class="flex flex-col gap-xs w-full sm:w-auto">
                            <label class="font-body-sm text-body-sm font-bold text-on-surface-variant dark:text-gray-400">Date Range</label>
                            <input class="bg-surface dark:bg-[#0b1c30] border border-outline-variant dark:border-[#334155] rounded px-sm py-sm focus:border-secondary focus:ring-2 focus:ring-secondary/20 font-body-sm text-body-sm dark:text-white" type="date"/>
                        </div>
                    </div>
                </div>

                <!-- Data Table -->
                <div class="bg-surface-container-lowest dark:bg-[#1E293B] rounded-lg border border-outline-variant dark:border-[#334155] shadow-[0_1px_3px_rgba(0,0,0,0.1)] overflow-hidden transition-colors duration-200">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse min-w-[900px]">
                            <thead>
                                <tr class="bg-surface-variant dark:bg-gray-800 border-b border-outline-variant dark:border-[#334155]">
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm w-24">Booking ID</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm">User</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm">Event</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm w-32">Booking Date</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm w-24 text-center">Tickets</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm w-24 text-right">Amount</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm w-32 text-center">Status</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm w-16 text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody class="font-body-sm text-body-sm text-on-surface dark:text-gray-200 divide-y divide-outline-variant dark:divide-[#334155]">
                                <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors h-12">
                                    <td class="px-md py-sm font-code text-code text-on-surface-variant dark:text-gray-400">#BK-7829</td>
                                    <td class="px-md py-sm">
                                        <div class="font-title-sm text-title-sm text-on-surface dark:text-white">Eleanor Richards</div>
                                        <div class="text-on-surface-variant dark:text-gray-400 text-[12px]">eleanor.r@company.com</div>
                                    </td>
                                    <td class="px-md py-sm text-on-surface-variant dark:text-gray-400">Tech Innovators Summit 2024</td>
                                    <td class="px-md py-sm text-on-surface-variant dark:text-gray-400">Oct 24, 2023</td>
                                    <td class="px-md py-sm text-center">2</td>
                                    <td class="px-md py-sm text-right font-code text-code dark:text-white">$598.00</td>
                                    <td class="px-md py-sm text-center">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded-full bg-[#e6f4ea] dark:bg-green-900/30 text-[#137333] dark:text-green-400 font-label-caps text-[10px] font-bold border border-[#137333]/20">CONFIRMED</span>
                                    </td>
                                    <td class="px-md py-sm text-center">
                                        <button class="text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed transition-colors p-xs rounded hover:bg-surface-container-low dark:hover:bg-gray-600" title="View Details">
                                            <span class="material-symbols-outlined text-[20px]">more_vert</span>
                                        </button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors h-12">
                                    <td class="px-md py-sm font-code text-code text-on-surface-variant dark:text-gray-400">#BK-7830</td>
                                    <td class="px-md py-sm">
                                        <div class="font-title-sm text-title-sm text-on-surface dark:text-white">Marcus Thorne</div>
                                        <div class="text-on-surface-variant dark:text-gray-400 text-[12px]">m.thorne@designco.net</div>
                                    </td>
                                    <td class="px-md py-sm text-on-surface-variant dark:text-gray-400">Design Leadership Workshop</td>
                                    <td class="px-md py-sm text-on-surface-variant dark:text-gray-400">Oct 24, 2023</td>
                                    <td class="px-md py-sm text-center">1</td>
                                    <td class="px-md py-sm text-right font-code text-code dark:text-white">$149.00</td>
                                    <td class="px-md py-sm text-center">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded-full bg-[#e6f4ea] dark:bg-green-900/30 text-[#137333] dark:text-green-400 font-label-caps text-[10px] font-bold border border-[#137333]/20">CONFIRMED</span>
                                    </td>
                                    <td class="px-md py-sm text-center">
                                        <button class="text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed transition-colors p-xs rounded hover:bg-surface-container-low dark:hover:bg-gray-600" title="View Details">
                                            <span class="material-symbols-outlined text-[20px]">more_vert</span>
                                        </button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors h-12">
                                    <td class="px-md py-sm font-code text-code text-on-surface-variant dark:text-gray-400">#BK-7831</td>
                                    <td class="px-md py-sm">
                                        <div class="font-title-sm text-title-sm text-on-surface dark:text-white">Sophia Patel</div>
                                        <div class="text-on-surface-variant dark:text-gray-400 text-[12px]">spatel99@gmail.com</div>
                                    </td>
                                    <td class="px-md py-sm text-on-surface-variant dark:text-gray-400">Global Marketing Expo</td>
                                    <td class="px-md py-sm text-on-surface-variant dark:text-gray-400">Oct 23, 2023</td>
                                    <td class="px-md py-sm text-center">4</td>
                                    <td class="px-md py-sm text-right font-code text-code dark:text-white">$1,196.00</td>
                                    <td class="px-md py-sm text-center">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded-full bg-[#fef7e0] dark:bg-yellow-900/30 text-[#b06000] dark:text-yellow-400 font-label-caps text-[10px] font-bold border border-[#b06000]/20">PENDING</span>
                                    </td>
                                    <td class="px-md py-sm text-center">
                                        <button class="text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed transition-colors p-xs rounded hover:bg-surface-container-low dark:hover:bg-gray-600" title="View Details">
                                            <span class="material-symbols-outlined text-[20px]">more_vert</span>
                                        </button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors h-12">
                                    <td class="px-md py-sm font-code text-code text-on-surface-variant dark:text-gray-400">#BK-7832</td>
                                    <td class="px-md py-sm">
                                        <div class="font-title-sm text-title-sm text-on-surface dark:text-white">David Chen</div>
                                        <div class="text-on-surface-variant dark:text-gray-400 text-[12px]">david.chen@startup.io</div>
                                    </td>
                                    <td class="px-md py-sm text-on-surface-variant dark:text-gray-400">Tech Innovators Summit 2024</td>
                                    <td class="px-md py-sm text-on-surface-variant dark:text-gray-400">Oct 23, 2023</td>
                                    <td class="px-md py-sm text-center">1</td>
                                    <td class="px-md py-sm text-right font-code text-code dark:text-white">$299.00</td>
                                    <td class="px-md py-sm text-center">
                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full bg-[#fce8e6] dark:bg-red-900/30 text-[#c5221f] dark:text-red-400 font-label-caps text-[10px] font-bold border border-[#c5221f]/20">CANCELLED</span>
                                    </td>
                                    <td class="px-md py-sm text-center">
                                        <button class="text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed transition-colors p-xs rounded hover:bg-surface-container-low dark:hover:bg-gray-600" title="View Details">
                                            <span class="material-symbols-outlined text-[20px]">more_vert</span>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div class="px-md py-sm border-t border-outline-variant dark:border-[#334155] bg-surface-container-lowest dark:bg-[#1E293B] flex justify-between items-center transition-colors">
                        <span class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">Showing 1 to 4 of 142 bookings</span>
                        <div class="flex gap-xs">
                            <button class="w-8 h-8 flex items-center justify-center rounded border border-outline-variant dark:border-[#334155] text-on-surface-variant dark:text-gray-400 hover:bg-surface-container-low dark:hover:bg-gray-700 disabled:opacity-50 transition-colors" disabled="">
                                <span class="material-symbols-outlined text-sm">chevron_left</span>
                            </button>
                            <button class="w-8 h-8 flex items-center justify-center rounded border border-outline-variant dark:border-[#00ADEF] bg-secondary dark:bg-[#00ADEF] text-on-secondary dark:text-white font-body-sm text-body-sm transition-colors">1</button>
                            <button class="w-8 h-8 flex items-center justify-center rounded border border-outline-variant dark:border-[#334155] text-on-surface-variant dark:text-gray-400 hover:bg-surface-container-low dark:hover:bg-gray-700 font-body-sm text-body-sm transition-colors">2</button>
                            <button class="w-8 h-8 flex items-center justify-center rounded border border-outline-variant dark:border-[#334155] text-on-surface-variant dark:text-gray-400 hover:bg-surface-container-low dark:hover:bg-gray-700 transition-colors">
                                <span class="material-symbols-outlined text-sm">chevron_right</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Dark Mode JavaScript -->
    <script>
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
    </script>
</body>
</html>