<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Event Accessories - EventHub</title>
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
                <a class="flex items-center px-md py-sm mb-xs rounded text-secondary dark:text-secondary-fixed font-bold border-r-4 border-secondary dark:border-secondary-fixed bg-surface-container-high dark:bg-[#1E293B] w-full transition-colors duration-200 ease-in-out" href="event_accessories.jsp">
                    <span class="material-symbols-outlined mr-md fill-icon">inventory_2</span>
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
                        <h2 class="font-display-lg text-display-lg text-on-surface dark:text-white mb-xs">Event Accessories</h2>
                        <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">Manage logistics, catering, and equipment allocation for your events.</p>
                    </div>
                    <div class="flex flex-wrap gap-md">
                        <div class="relative w-full md:w-auto">
                            <select class="appearance-none w-full md:w-auto pl-sm pr-xl py-sm rounded border border-outline-variant dark:border-[#334155] focus:border-secondary focus:ring-2 focus:ring-secondary/20 font-body-sm text-body-sm bg-surface-container-lowest dark:bg-[#1E293B] dark:text-white min-w-[160px] transition-colors">
                                <option>All Events</option>
                                <option>Tech Summit 2024</option>
                                <option>Marketing Mixer</option>
                                <option>Design Leadership Workshop</option>
                            </select>
                            <span class="material-symbols-outlined absolute right-sm top-1/2 -translate-y-1/2 text-on-surface-variant dark:text-gray-400 pointer-events-none">arrow_drop_down</span>
                        </div>
                        <button class="w-full md:w-auto bg-[#00ADEF] text-on-primary dark:text-white font-body-sm text-body-sm px-md py-sm rounded flex items-center justify-center gap-xs hover:bg-[#0095CC] transition-colors">
                            <span class="material-symbols-outlined text-[20px]">add</span> Add Accessory
                        </button>
                    </div>
                </div>

                <!-- Data Table -->
                <div class="bg-surface-container-lowest dark:bg-[#1E293B] rounded-lg border border-outline-variant dark:border-[#334155] shadow-[0_1px_3px_rgba(0,0,0,0.1)] overflow-hidden transition-colors duration-200">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse">
                            <thead>
                                <tr class="bg-surface-variant dark:bg-gray-800 border-b border-outline-variant dark:border-[#334155]">
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm">Item Category</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm">Associated Event</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm">Vendor / Supplier</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm">Allocated</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm">Unit Cost</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm">Status</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-300 px-md py-sm text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="font-body-sm text-body-sm text-on-surface dark:text-gray-200 divide-y divide-outline-variant dark:divide-[#334155]">
                                <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors">
                                    <td class="px-md py-sm h-12 flex items-center gap-sm font-semibold">
                                        <div class="w-8 h-8 rounded bg-surface-container-high dark:bg-gray-700 flex items-center justify-center border border-outline-variant dark:border-gray-600">
                                            <span class="material-symbols-outlined text-[18px] text-primary dark:text-primary-fixed">badge</span>
                                        </div>
                                        VIP Badges & Lanyards
                                    </td>
                                    <td class="px-md py-sm">Tech Summit 2024</td>
                                    <td class="px-md py-sm">PrintCo Solutions</td>
                                    <td class="px-md py-sm">500 <span class="text-on-surface-variant dark:text-gray-400">/ 500</span></td>
                                    <td class="px-md py-sm font-code text-code">$2.50</td>
                                    <td class="px-md py-sm">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded-full bg-[#e6f4ea] dark:bg-green-900/30 text-[#137333] dark:text-green-400 font-label-caps text-[10px] font-bold border border-[#137333]/20">READY</span>
                                    </td>
                                    <td class="px-md py-sm text-right">
                                        <button class="text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed transition-colors"><span class="material-symbols-outlined text-lg">edit</span></button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors">
                                    <td class="px-md py-sm h-12 flex items-center gap-sm font-semibold">
                                        <div class="w-8 h-8 rounded bg-surface-container-high dark:bg-gray-700 flex items-center justify-center border border-outline-variant dark:border-gray-600">
                                            <span class="material-symbols-outlined text-[18px] text-primary dark:text-primary-fixed">restaurant</span>
                                        </div>
                                        Catering Packages (Lunch)
                                    </td>
                                    <td class="px-md py-sm">Tech Summit 2024</td>
                                    <td class="px-md py-sm">Valley Catering Inc.</td>
                                    <td class="px-md py-sm">4,500 <span class="text-on-surface-variant dark:text-gray-400">/ 5,000</span></td>
                                    <td class="px-md py-sm font-code text-code">$18.00</td>
                                    <td class="px-md py-sm">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded-full bg-[#fef7e0] dark:bg-yellow-900/30 text-[#b06000] dark:text-yellow-400 font-label-caps text-[10px] font-bold border border-[#b06000]/20">PENDING</span>
                                    </td>
                                    <td class="px-md py-sm text-right">
                                        <button class="text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed transition-colors"><span class="material-symbols-outlined text-lg">edit</span></button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors">
                                    <td class="px-md py-sm h-12 flex items-center gap-sm font-semibold">
                                        <div class="w-8 h-8 rounded bg-surface-container-high dark:bg-gray-700 flex items-center justify-center border border-outline-variant dark:border-gray-600">
                                            <span class="material-symbols-outlined text-[18px] text-primary dark:text-primary-fixed">mic</span>
                                        </div>
                                        Wireless AV Mic Sets
                                    </td>
                                    <td class="px-md py-sm">Design Leadership</td>
                                    <td class="px-md py-sm">SoundStage Rentals</td>
                                    <td class="px-md py-sm">8 <span class="text-on-surface-variant dark:text-gray-400">/ 8</span></td>
                                    <td class="px-md py-sm font-code text-code">$150.00</td>
                                    <td class="px-md py-sm">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded-full bg-[#e6f4ea] dark:bg-green-900/30 text-[#137333] dark:text-green-400 font-label-caps text-[10px] font-bold border border-[#137333]/20">READY</span>
                                    </td>
                                    <td class="px-md py-sm text-right">
                                        <button class="text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed transition-colors"><span class="material-symbols-outlined text-lg">edit</span></button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors">
                                    <td class="px-md py-sm h-12 flex items-center gap-sm font-semibold">
                                        <div class="w-8 h-8 rounded bg-surface-container-high dark:bg-gray-700 flex items-center justify-center border border-outline-variant dark:border-gray-600">
                                            <span class="material-symbols-outlined text-[18px] text-primary dark:text-primary-fixed">chair</span>
                                        </div>
                                        Premium Stage Seating
                                    </td>
                                    <td class="px-md py-sm">Marketing Mixer</td>
                                    <td class="px-md py-sm">EventFurnish LLC</td>
                                    <td class="px-md py-sm">150 <span class="text-on-surface-variant dark:text-gray-400">/ 250</span></td>
                                    <td class="px-md py-sm font-code text-code">$35.00</td>
                                    <td class="px-md py-sm">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded-full bg-[#fce8e6] dark:bg-red-900/30 text-[#c5221f] dark:text-red-400 font-label-caps text-[10px] font-bold border border-[#c5221f]/20">CRITICAL</span>
                                    </td>
                                    <td class="px-md py-sm text-right">
                                        <button class="text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed transition-colors"><span class="material-symbols-outlined text-lg">edit</span></button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors">
                                    <td class="px-md py-sm h-12 flex items-center gap-sm font-semibold">
                                        <div class="w-8 h-8 rounded bg-surface-container-high dark:bg-gray-700 flex items-center justify-center border border-outline-variant dark:border-gray-600">
                                            <span class="material-symbols-outlined text-[18px] text-primary dark:text-primary-fixed">card_giftcard</span>
                                        </div>
                                        Welcome Swag Bags
                                    </td>
                                    <td class="px-md py-sm">Marketing Mixer</td>
                                    <td class="px-md py-sm">PromoMerch Co.</td>
                                    <td class="px-md py-sm">300 <span class="text-on-surface-variant dark:text-gray-400">/ 300</span></td>
                                    <td class="px-md py-sm font-code text-code">$12.50</td>
                                    <td class="px-md py-sm">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded-full bg-[#fef7e0] dark:bg-yellow-900/30 text-[#b06000] dark:text-yellow-400 font-label-caps text-[10px] font-bold border border-[#b06000]/20">PENDING</span>
                                    </td>
                                    <td class="px-md py-sm text-right">
                                        <button class="text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed transition-colors"><span class="material-symbols-outlined text-lg">edit</span></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div class="px-md py-sm border-t border-outline-variant dark:border-[#334155] bg-surface-container-lowest dark:bg-[#1E293B] flex justify-between items-center transition-colors">
                        <span class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">Showing 1 to 5 of 18 accessories</span>
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