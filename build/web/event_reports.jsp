<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Event Reports & Analytics - EventHub</title>
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
        .chart-bar { transition: height 0.3s ease; }
        .chart-bar:hover { filter: brightness(0.9); cursor: pointer; }
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
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-tertiary-container hover:text-secondary dark:hover:text-secondary-fixed w-full transition-colors duration-200 ease-in-out" href="manager_bookings.jsp">
                    <span class="material-symbols-outlined mr-md">confirmation_number</span>
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
                <a class="flex items-center px-md py-sm mb-xs rounded text-secondary dark:text-secondary-fixed font-bold border-r-4 border-secondary dark:border-secondary-fixed bg-surface-container-high dark:bg-[#1E293B] w-full transition-colors duration-200 ease-in-out" href="event_reports.jsp">
                    <span class="material-symbols-outlined mr-md fill-icon">analytics</span>
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
        <main class="flex-1 overflow-y-auto p-lg bg-background dark:bg-[#0b1c30] pb-xl transition-colors duration-200">
            <div class="max-w-container-max mx-auto space-y-xl">
                
                <!-- Page Header -->
                <div>
                    <h2 class="font-display-lg text-display-lg text-on-surface dark:text-white mb-xs">Reports & Analytics</h2>
                    <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">Overview of your event performance and key metrics.</p>
                </div>

                <!-- Stats Grid -->
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-lg">
                    <!-- Stat Card 1 -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] p-lg rounded-xl border border-outline-variant dark:border-[#334155] shadow-[0px_1px_3px_rgba(0,0,0,0.1)] relative overflow-hidden group">
                        <div class="flex justify-between items-start mb-sm">
                            <span class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase tracking-wider">Total Events</span>
                            <div class="w-8 h-8 rounded-full bg-surface-container-high dark:bg-gray-800 flex items-center justify-center">
                                <span class="material-symbols-outlined text-secondary dark:text-secondary-fixed" style="font-size: 20px;">event</span>
                            </div>
                        </div>
                        <div class="font-display-lg text-display-lg text-on-surface dark:text-white">124</div>
                        <div class="mt-sm flex items-center text-body-sm text-on-surface-variant dark:text-gray-400">
                            <span class="text-emerald-600 dark:text-emerald-400 font-semibold mr-xs">+12%</span> vs last month
                        </div>
                    </div>
                    
                    <!-- Stat Card 2 -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] p-lg rounded-xl border border-outline-variant dark:border-[#334155] shadow-[0px_1px_3px_rgba(0,0,0,0.1)] relative overflow-hidden group">
                        <div class="flex justify-between items-start mb-sm">
                            <span class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase tracking-wider">Participants</span>
                            <div class="w-8 h-8 rounded-full bg-surface-container-high dark:bg-gray-800 flex items-center justify-center">
                                <span class="material-symbols-outlined text-secondary dark:text-secondary-fixed" style="font-size: 20px;">groups</span>
                            </div>
                        </div>
                        <div class="font-display-lg text-display-lg text-on-surface dark:text-white">8,432</div>
                        <div class="mt-sm flex items-center text-body-sm text-on-surface-variant dark:text-gray-400">
                            <span class="text-emerald-600 dark:text-emerald-400 font-semibold mr-xs">+5.4%</span> vs last month
                        </div>
                    </div>

                    <!-- Stat Card 3 -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] p-lg rounded-xl border border-outline-variant dark:border-[#334155] shadow-[0px_1px_3px_rgba(0,0,0,0.1)] relative overflow-hidden group">
                        <div class="flex justify-between items-start mb-sm">
                            <span class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase tracking-wider">Bookings</span>
                            <div class="w-8 h-8 rounded-full bg-surface-container-high dark:bg-gray-800 flex items-center justify-center">
                                <span class="material-symbols-outlined text-secondary dark:text-secondary-fixed" style="font-size: 20px;">confirmation_number</span>
                            </div>
                        </div>
                        <div class="font-display-lg text-display-lg text-on-surface dark:text-white">1,205</div>
                        <div class="mt-sm flex items-center text-body-sm text-on-surface-variant dark:text-gray-400">
                            <span class="text-rose-600 dark:text-rose-400 font-semibold mr-xs">-2.1%</span> vs last month
                        </div>
                    </div>

                    <!-- Stat Card 4 -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] p-lg rounded-xl border border-outline-variant dark:border-[#334155] shadow-[0px_1px_3px_rgba(0,0,0,0.1)] relative overflow-hidden">
                        <div class="flex justify-between items-start mb-sm">
                            <span class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase tracking-wider">Revenue YTD</span>
                            <div class="w-8 h-8 rounded-full bg-surface-container-high dark:bg-gray-800 flex items-center justify-center">
                                <span class="material-symbols-outlined text-secondary dark:text-secondary-fixed" style="font-size: 20px;">payments</span>
                            </div>
                        </div>
                        <div class="font-display-lg text-display-lg text-on-surface dark:text-white">$142.5k</div>
                        <div class="mt-sm flex items-center text-body-sm text-on-surface-variant dark:text-gray-400">
                            <span class="text-emerald-600 dark:text-emerald-400 font-semibold mr-xs">+18%</span> vs last year
                        </div>
                    </div>
                </div>

                <!-- Main Charts Area -->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-lg">
                    <!-- Bar Chart: Event Performance -->
                    <div class="lg:col-span-2 bg-surface-container-lowest dark:bg-[#1E293B] rounded-xl border border-outline-variant dark:border-[#334155] shadow-[0px_1px_3px_rgba(0,0,0,0.1)] p-lg flex flex-col h-96">
                        <div class="flex justify-between items-center mb-xl">
                            <div>
                                <h3 class="font-title-sm text-title-sm text-on-surface dark:text-white">Event Performance</h3>
                                <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">Attendance across categories</p>
                            </div>
                            <button class="text-secondary dark:text-secondary-fixed font-label-caps text-label-caps uppercase hover:underline">View Details</button>
                        </div>
                        <div class="flex-1 flex items-end justify-around gap-2 mt-auto border-b border-outline-variant dark:border-[#334155] pb-sm pt-xl px-sm relative">
                            <div class="absolute left-0 top-0 h-full flex flex-col justify-between text-label-caps text-on-surface-variant dark:text-gray-400 pr-2 text-right w-8 -ml-4">
                                <span>1k</span><span>500</span><span>0</span>
                            </div>
                            <div class="w-12 bg-surface-container dark:bg-gray-800 rounded-t-sm h-[40%] relative group chart-bar">
                                <div class="absolute inset-x-0 bottom-0 bg-secondary dark:bg-secondary-fixed rounded-t-sm h-full opacity-80 group-hover:opacity-100 transition-opacity"></div>
                                <span class="absolute -bottom-6 left-1/2 -translate-x-1/2 font-label-caps text-on-surface-variant dark:text-gray-400 text-[10px]">Tech</span>
                            </div>
                            <div class="w-12 bg-surface-container dark:bg-gray-800 rounded-t-sm h-[85%] relative group chart-bar">
                                <div class="absolute inset-x-0 bottom-0 bg-primary dark:bg-indigo-400 rounded-t-sm h-full opacity-80 group-hover:opacity-100 transition-opacity"></div>
                                <span class="absolute -bottom-6 left-1/2 -translate-x-1/2 font-label-caps text-on-surface-variant dark:text-gray-400 text-[10px]">Music</span>
                            </div>
                            <div class="w-12 bg-surface-container dark:bg-gray-800 rounded-t-sm h-[30%] relative group chart-bar">
                                <div class="absolute inset-x-0 bottom-0 bg-secondary dark:bg-secondary-fixed rounded-t-sm h-full opacity-80 group-hover:opacity-100 transition-opacity"></div>
                                <span class="absolute -bottom-6 left-1/2 -translate-x-1/2 font-label-caps text-on-surface-variant dark:text-gray-400 text-[10px]">Art</span>
                            </div>
                            <div class="w-12 bg-surface-container dark:bg-gray-800 rounded-t-sm h-[60%] relative group chart-bar">
                                <div class="absolute inset-x-0 bottom-0 bg-secondary dark:bg-secondary-fixed rounded-t-sm h-full opacity-80 group-hover:opacity-100 transition-opacity"></div>
                                <span class="absolute -bottom-6 left-1/2 -translate-x-1/2 font-label-caps text-on-surface-variant dark:text-gray-400 text-[10px]">Food</span>
                            </div>
                            <div class="w-12 bg-surface-container dark:bg-gray-800 rounded-t-sm h-[75%] relative group chart-bar">
                                <div class="absolute inset-x-0 bottom-0 bg-secondary dark:bg-secondary-fixed rounded-t-sm h-full opacity-80 group-hover:opacity-100 transition-opacity"></div>
                                <span class="absolute -bottom-6 left-1/2 -translate-x-1/2 font-label-caps text-on-surface-variant dark:text-gray-400 text-[10px]">Sport</span>
                            </div>
                            <div class="w-12 bg-surface-container dark:bg-gray-800 rounded-t-sm h-[50%] relative group chart-bar">
                                <div class="absolute inset-x-0 bottom-0 bg-secondary dark:bg-secondary-fixed rounded-t-sm h-full opacity-80 group-hover:opacity-100 transition-opacity"></div>
                                <span class="absolute -bottom-6 left-1/2 -translate-x-1/2 font-label-caps text-on-surface-variant dark:text-gray-400 text-[10px]">Biz</span>
                            </div>
                        </div>
                    </div>

                    <!-- Line Chart / Mini Stats: Booking Trends -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] rounded-xl border border-outline-variant dark:border-[#334155] shadow-[0px_1px_3px_rgba(0,0,0,0.1)] p-lg flex flex-col h-96">
                        <div class="mb-md">
                            <h3 class="font-title-sm text-title-sm text-on-surface dark:text-white">Booking Trends</h3>
                            <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">Last 7 days</p>
                        </div>
                        <div class="flex-1 w-full relative bg-surface-container-high/30 dark:bg-gray-800/50 rounded-lg p-sm flex items-end">
                            <svg class="w-full h-full" preserveAspectRatio="none" viewBox="0 0 100 50">
                                <path d="M0,40 C20,35 30,45 50,20 C70,-5 80,30 100,10 L100,50 L0,50 Z" fill="url(#grad)" opacity="0.2"></path>
                                <path d="M0,40 C20,35 30,45 50,20 C70,-5 80,30 100,10" fill="none" stroke="#00ADEF" stroke-width="2" vector-effect="non-scaling-stroke"></path>
                                <circle class="animate-pulse" cx="50" cy="20" fill="#00ADEF" r="3"></circle>
                                <defs>
                                    <linearGradient id="grad" x1="0" x2="0" y1="0" y2="1">
                                        <stop offset="0%" stop-color="#00ADEF"></stop>
                                        <stop offset="100%" stop-color="transparent"></stop>
                                    </linearGradient>
                                </defs>
                            </svg>
                        </div>
                        <div class="mt-md flex justify-between items-center bg-surface dark:bg-gray-800 p-sm rounded border border-outline-variant dark:border-[#334155]">
                            <div>
                                <span class="block font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400">Peak Day</span>
                                <span class="font-title-sm text-title-sm text-on-surface dark:text-white">Thursday</span>
                            </div>
                            <div class="text-right">
                                <span class="block font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400">Volume</span>
                                <span class="font-title-sm text-title-sm text-primary dark:text-primary-fixed">342</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bottom Section: Popular Events List & Action Area -->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-lg pb-xl">
                    
                    <!-- Popular Events List -->
                    <div class="lg:col-span-2 bg-surface-container-lowest dark:bg-[#1E293B] rounded-xl border border-outline-variant dark:border-[#334155] shadow-[0px_1px_3px_rgba(0,0,0,0.1)] overflow-hidden">
                        <div class="p-md border-b border-outline-variant dark:border-[#334155] bg-surface-container-lowest dark:bg-[#1E293B] flex justify-between items-center">
                            <h3 class="font-title-sm text-title-sm text-on-surface dark:text-white">Popular Events</h3>
                            <button class="p-xs hover:bg-surface-container-low dark:hover:bg-gray-700 rounded-full">
                                <span class="material-symbols-outlined text-on-surface-variant dark:text-white">more_vert</span>
                            </button>
                        </div>
                        <div class="overflow-x-auto">
                            <table class="w-full text-left border-collapse">
                                <thead>
                                    <tr class="bg-surface-container-low dark:bg-gray-800 border-b border-outline-variant dark:border-[#334155]">
                                        <th class="py-sm px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase">Event Name</th>
                                        <th class="py-sm px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase">Date</th>
                                        <th class="py-sm px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase">Status</th>
                                        <th class="py-sm px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 uppercase text-right">Revenue</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-outline-variant dark:divide-[#334155]">
                                    <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors h-12">
                                        <td class="py-sm px-md font-body-sm text-on-surface dark:text-white font-semibold">Global Tech Summit 2024</td>
                                        <td class="py-sm px-md font-body-sm text-on-surface-variant dark:text-gray-400">Oct 12-14</td>
                                        <td class="py-sm px-md">
                                            <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-semibold bg-emerald-100 text-emerald-800 border border-emerald-200">Active</span>
                                        </td>
                                        <td class="py-sm px-md font-code text-right text-on-surface dark:text-white">$45,200</td>
                                    </tr>
                                    <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors h-12">
                                        <td class="py-sm px-md font-body-sm text-on-surface dark:text-white font-semibold">City Marathon</td>
                                        <td class="py-sm px-md font-body-sm text-on-surface-variant dark:text-gray-400">Nov 05</td>
                                        <td class="py-sm px-md">
                                            <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-semibold bg-amber-100 text-amber-800 border border-amber-200">Upcoming</span>
                                        </td>
                                        <td class="py-sm px-md font-code text-right text-on-surface dark:text-white">$18,450</td>
                                    </tr>
                                    <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors h-12">
                                        <td class="py-sm px-md font-body-sm text-on-surface dark:text-white font-semibold">Design Leadership Conference</td>
                                        <td class="py-sm px-md font-body-sm text-on-surface-variant dark:text-gray-400">Sep 28</td>
                                        <td class="py-sm px-md">
                                            <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-semibold bg-surface-container-high dark:bg-gray-800 text-on-surface-variant dark:text-gray-300 border border-outline-variant dark:border-gray-600">Completed</span>
                                        </td>
                                        <td class="py-sm px-md font-code text-right text-on-surface dark:text-white">$32,100</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Action / Insight Card -->
                    <div class="bg-surface-container-lowest dark:bg-[#1E293B] rounded-xl border border-outline-variant dark:border-[#334155] shadow-[0px_1px_3px_rgba(0,0,0,0.1)] p-lg flex flex-col justify-center items-center text-center">
                        <div class="w-16 h-16 bg-surface-container-high dark:bg-gray-800 rounded-full flex items-center justify-center mb-md border border-outline-variant dark:border-[#334155]">
                            <span class="material-symbols-outlined text-secondary dark:text-secondary-fixed" style="font-size: 32px;">lightbulb</span>
                        </div>
                        <h4 class="font-title-sm text-title-sm text-on-surface dark:text-white mb-sm">Generate Full Report</h4>
                        <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400 mb-md">Compile all analytics into a comprehensive PDF for stakeholder review.</p>
                        <button class="bg-[#00ADEF] text-on-primary dark:text-white font-title-sm text-title-sm px-md py-sm rounded hover:bg-secondary dark:hover:bg-[#0095CC] transition-colors shadow-sm w-full">
                            Export PDF
                        </button>
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