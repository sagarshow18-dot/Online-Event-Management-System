<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.event.model.EventBean, com.event.dao.EventDAO" %>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Manage Events - EventHub</title>
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
            <li><a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="manager_dashboard.jsp"><span class="material-symbols-outlined mr-sm" data-icon="dashboard">dashboard</span> <span class="font-body-md text-body-md">Dashboard</span></a></li>
            <li><a class="flex items-center px-md py-sm mb-xs rounded text-secondary dark:text-secondary-fixed font-bold border-r-4 border-secondary bg-surface-container-high dark:bg-[#1E293B] transition-colors duration-200 ease-in-out" href="manage_events.jsp"><span class="material-symbols-outlined mr-sm" data-weight="fill">calendar_today</span> <span class="font-body-md text-body-md">My Events</span></a></li>
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
            <div class="max-w-container-max mx-auto">
                
                <!-- Page Header & Filters -->
                <div class="flex flex-col md:flex-row justify-between items-start md:items-end mb-xl gap-md">
                    <div>
                        <h2 class="font-display-lg text-display-lg text-on-surface dark:text-white">Manage Events</h2>
                        <p class="font-body-md text-body-md text-on-surface-variant dark:text-gray-400 mt-xs">View and manage all upcoming, active, and completed events.</p>
                    </div>
                    <div class="flex flex-wrap items-center gap-sm w-full md:w-auto">
                        <!-- Mobile Search -->
                        <div class="relative lg:hidden flex-1">
                            <input class="w-full bg-surface dark:bg-[#0b1c30] border border-outline-variant dark:border-[#334155] rounded px-sm py-sm font-body-md text-body-md text-on-surface dark:text-white focus:outline-none focus:border-secondary focus:ring-1 focus:ring-secondary transition-all pl-8" placeholder="Search..." type="text"/>
                            <span class="material-symbols-outlined absolute left-2 top-1/2 -translate-y-1/2 text-on-surface-variant dark:text-gray-400 text-[18px]">search</span>
                        </div>
                        
                        <!-- Filter Dropdown -->
                        <div class="relative">
                            <select class="appearance-none bg-surface dark:bg-[#0b1c30] border border-outline-variant dark:border-[#334155] rounded px-sm py-sm pr-10 font-body-md text-body-md text-on-surface dark:text-white focus:outline-none focus:border-secondary focus:ring-1 focus:ring-secondary transition-all cursor-pointer min-w-[150px]">
                                <option value="all">All Statuses</option>
                                <option value="upcoming">Upcoming</option>
                                <option value="active">Active</option>
                                <option value="completed">Completed</option>
                                <option value="cancelled">Cancelled</option>
                            </select>
                            <span class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none text-on-surface-variant dark:text-gray-400 text-[18px]">expand_more</span>
                        </div>
                        
                        <!-- Add Event Button -->
                        <a href="add_event.jsp" class="bg-[#00ADEF] text-on-primary dark:text-white font-body-sm text-body-sm font-semibold py-sm px-md rounded hover:bg-secondary dark:hover:bg-[#0095CC] transition-colors flex items-center gap-xs">
                            <span class="material-symbols-outlined text-[18px]">add</span> New Event
                        </a>
                    </div>
                </div>

                <!-- Data Table Card -->
                <div class="bg-surface-container-lowest dark:bg-[#1E293B] border border-outline-variant dark:border-[#334155] rounded-xl overflow-hidden shadow-[0px_1px_3px_rgba(0,0,0,0.1)]">
                    <div class="overflow-x-auto w-full">
                        <table class="w-full text-left border-collapse min-w-[800px]">
                            <thead>
                                <tr class="bg-surface-container-low dark:bg-gray-800 border-b border-outline-variant dark:border-[#334155]">
                                    <th class="py-sm px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 w-[300px]">Event</th>
                                    <th class="py-sm px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400">Date</th>
                                    <th class="py-sm px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400">Location</th>
                                    <th class="py-sm px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 text-right">Capacity</th>
                                    <th class="py-sm px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400">Status</th>
                                    <th class="py-sm px-md font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-outline-variant dark:divide-[#334155]">
                                
                                <%-- START DYNAMIC JAVA LOOP --%>
                                <%
                                    EventDAO dao = new EventDAO();
                                    List<EventBean> events = dao.getAllEvents();
                                    if (events != null && !events.isEmpty()) {
                                        for (EventBean eb : events) {
                                %>
                                <tr class="hover:bg-surface-container-low dark:hover:bg-gray-700/50 transition-colors h-16 group">
                                    <td class="py-sm px-md">
                                        <div class="flex items-center gap-sm">
                                            <div class="w-10 h-10 rounded overflow-hidden border border-outline-variant dark:border-[#334155] flex-shrink-0 bg-surface-container-high dark:bg-gray-800 flex items-center justify-center">
                                                <span class="material-symbols-outlined text-outline dark:text-gray-400">event</span>
                                            </div>
                                            <div>
                                                <p class="font-title-sm text-title-sm text-on-surface dark:text-white"><%= eb.getEventName() %></p>
                                                <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400 mt-0.5">ID: EVT-<%= eb.getEventId() %></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="py-sm px-md">
                                        <p class="font-body-md text-body-md text-on-surface dark:text-white"><%= eb.getEventDate() %></p>
                                        <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400"><%= eb.getEventTime() != null ? eb.getEventTime() : "" %></p>
                                    </td>
                                    <td class="py-sm px-md">
                                        <div class="flex items-center gap-xs font-body-md text-body-md text-on-surface dark:text-white">
                                            <span class="material-symbols-outlined text-[18px] text-on-surface-variant dark:text-gray-400">location_on</span>
                                            <span><%= eb.getLocation() %></span>
                                        </div>
                                    </td>
                                    <td class="py-sm px-md text-right">
                                        <p class="font-body-md text-body-md font-bold text-on-surface dark:text-white"><%= eb.getCapacity() %></p>
                                    </td>
                                    <td class="py-sm px-md">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded-sm bg-surface-container-high dark:bg-gray-700 text-on-surface dark:text-gray-200 font-label-caps text-label-caps uppercase"><%= eb.getStatus() != null ? eb.getStatus() : "ACTIVE" %></span>
                                    </td>
                                    <td class="py-sm px-md text-right">
                                        <div class="flex justify-end gap-xs opacity-0 group-hover:opacity-100 transition-opacity">
                                            <a href="event_details_manager.jsp?id=<%= eb.getEventId() %>" class="p-1 rounded text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed hover:bg-surface-container dark:hover:bg-gray-600 transition-colors inline-block" title="View">
                                                <span class="material-symbols-outlined text-[20px]">visibility</span>
                                            </a>
                                            <a href="edit_event.jsp?id=<%= eb.getEventId() %>" class="p-1 rounded text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed hover:bg-surface-container dark:hover:bg-gray-600 transition-colors inline-block" title="Edit">
                                                <span class="material-symbols-outlined text-[20px]">edit</span>
                                            </a>
                                            <a href="participants.jsp?eventId=<%= eb.getEventId() %>" class="p-1 rounded text-on-surface-variant dark:text-gray-400 hover:text-secondary dark:hover:text-secondary-fixed hover:bg-surface-container dark:hover:bg-gray-600 transition-colors inline-block" title="Participants">
                                                <span class="material-symbols-outlined text-[20px]">groups</span>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <%      }
                                    } else { %>
                                <tr>
                                    <td colspan="6" class="py-8 text-center text-on-surface-variant dark:text-gray-400">
                                        No events found. <a href="add_event.jsp" class="text-secondary dark:text-secondary-fixed underline">Create one now</a>.
                                    </td>
                                </tr>
                                <%  } %>
                                <%-- END DYNAMIC JAVA LOOP --%>

                            </tbody>
                        </table>
                    </div>
                    
                    <!-- Pagination -->
                    <div class="flex items-center justify-between px-md py-sm border-t border-outline-variant dark:border-[#334155] bg-surface-container-lowest dark:bg-[#1E293B]">
                        <p class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">Showing all current records</p>
                        <div class="flex gap-xs">
                            <button class="w-8 h-8 flex items-center justify-center rounded border border-outline-variant dark:border-[#334155] text-on-surface-variant dark:text-gray-400 hover:bg-surface-container-low dark:hover:bg-gray-700 disabled:opacity-50 transition-colors" disabled="">
                                <span class="material-symbols-outlined text-[20px]">chevron_left</span>
                            </button>
                            <button class="w-8 h-8 flex items-center justify-center rounded border border-[#00ADEF] bg-[#00ADEF] text-on-primary dark:text-white font-body-sm text-body-sm font-semibold transition-colors">1</button>
                            <button class="w-8 h-8 flex items-center justify-center rounded border border-outline-variant dark:border-[#334155] text-on-surface-variant dark:text-gray-400 hover:bg-surface-container-low dark:hover:bg-gray-700 transition-colors">
                                <span class="material-symbols-outlined text-[20px]">chevron_right</span>
                            </button>
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