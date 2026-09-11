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
    <title>Participants - EventHub</title>
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
<body class="bg-background dark:bg-[#0b1c30] text-on-background dark:text-white font-body-md h-screen overflow-hidden flex antialiased">
    
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
                <a class="flex items-center px-md py-sm mb-xs rounded text-secondary dark:text-secondary-fixed font-bold border-r-4 border-secondary dark:border-secondary-fixed bg-surface-container-high dark:bg-[#1E293B] transition-colors duration-200 ease-in-out" href="participants.jsp">
                    <span class="material-symbols-outlined mr-sm fill-icon">groups</span> <span class="font-body-md text-body-md">Participants</span>
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
                <a class="flex items-center px-md py-sm mb-xs rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-secondary dark:hover:text-secondary-fixed transition-colors duration-200 ease-in-out" href="manager_profile.jsp">
                    <span class="material-symbols-outlined mr-sm">account_circle</span> <span class="font-body-md text-body-md">Profile</span>
                </a>
            </li>
        </ul>
        <div class="mt-auto px-sm pt-md border-t border-outline-variant dark:border-[#334155]">
            <a class="flex items-center px-md py-sm rounded text-on-surface-variant dark:text-tertiary-fixed-dim hover:bg-surface-container-low dark:hover:bg-gray-800 hover:text-error dark:hover:text-red-400 transition-colors duration-200 ease-in-out" href="LogoutServlet">
                <span class="material-symbols-outlined mr-sm">logout</span> <span class="font-body-md text-body-md">Logout</span>
            </a>
        </div>
    </nav>

    <!-- Main Content Wrapper -->
    <div class="flex-1 md:ml-60 flex flex-col min-h-screen w-full md:w-[calc(100%-240px)]">
        
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

        <!-- Main Canvas -->
        <main class="flex-1 p-lg md:p-xl bg-background dark:bg-[#0b1c30] overflow-y-auto">
            <div class="max-w-container-max mx-auto space-y-xl">
                
                <div class="flex flex-col md:flex-row justify-between items-start md:items-end gap-md">
                    <div>
                        <h2 class="font-display-lg text-display-lg text-on-background dark:text-white mb-xs">Participants</h2>
                        <p class="font-body-md text-body-md text-on-surface-variant dark:text-gray-400">Manage and view all registered attendees across your events.</p>
                    </div>
                    <div class="flex flex-wrap items-center gap-sm w-full md:w-auto">
                        <div class="relative w-full md:w-auto">
                            <select class="appearance-none w-full md:w-auto pl-sm pr-xl py-2 rounded border border-outline-variant dark:border-[#334155] focus:border-secondary focus:ring-1 focus:ring-secondary outline-none font-body-sm text-body-sm bg-surface-container-lowest dark:bg-[#1E293B] dark:text-white min-w-[160px] transition-colors cursor-pointer">
                                <option>All Events</option>
                            </select>
                            <span class="material-symbols-outlined absolute right-sm top-1/2 -translate-y-1/2 text-on-surface-variant dark:text-gray-400 pointer-events-none text-[18px]">expand_more</span>
                        </div>
                        <button class="w-full md:w-auto bg-[#00ADEF] text-on-primary dark:text-white font-title-sm text-title-sm px-md py-2 rounded flex items-center justify-center gap-xs hover:bg-secondary dark:hover:bg-[#0095CC] transition-colors shadow-sm">
                            <span class="material-symbols-outlined text-[18px]">download</span> Export
                        </button>
                    </div>
                </div>

                <!-- Data Table -->
                <div class="bg-surface-container-lowest dark:bg-[#1E293B] rounded-xl border border-outline-variant dark:border-[#334155] shadow-[0px_1px_3px_rgba(0,0,0,0.1)] overflow-hidden transition-colors duration-200">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse min-w-[900px]">
                            <thead>
                                <tr class="bg-surface-container-low dark:bg-gray-800 border-b border-outline-variant dark:border-[#334155]">
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 px-md py-sm">Participant Name</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 px-md py-sm">Email</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 px-md py-sm">Contact</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 px-md py-sm">Booking ID</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 px-md py-sm text-center">Tickets</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 px-md py-sm text-center">Status</th>
                                    <th class="font-label-caps text-label-caps text-on-surface-variant dark:text-gray-400 px-md py-sm text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody id="participant-table-body" class="font-body-sm text-body-sm text-on-background dark:text-gray-200 divide-y divide-outline-variant dark:divide-[#334155]">
                                
                            </tbody>
                        </table>
                    </div>

                    <div class="px-md py-sm border-t border-outline-variant dark:border-[#334155] bg-surface-container-lowest dark:bg-[#1E293B] flex justify-between items-center transition-colors">
                        <span id="pagination-info" class="font-body-sm text-body-sm text-on-surface-variant dark:text-gray-400">
                            Showing 0 to 0 of 0 participants
                        </span>
                        <div class="flex gap-xs">
                            <button id="prev-page" class="w-8 h-8 flex items-center justify-center rounded border border-outline-variant dark:border-[#334155] text-on-surface-variant dark:text-gray-400 hover:bg-surface-container-low dark:hover:bg-gray-700 disabled:opacity-50 transition-colors" disabled>
                                <span class="material-symbols-outlined text-[20px]">chevron_left</span>
                            </button>
                            <div id="page-numbers" class="flex gap-xs">
                                <!-- JS will inject page numbers here when DB connects -->
                            </div>
                            <button id="next-page" class="w-8 h-8 flex items-center justify-center rounded border border-outline-variant dark:border-[#334155] text-on-surface-variant dark:text-gray-400 hover:bg-surface-container-low dark:hover:bg-gray-700 disabled:opacity-50 transition-colors" disabled>
                                <span class="material-symbols-outlined text-[20px]">chevron_right</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Theme Logic
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

            // Pagination Logic
            const rowsPerPage = 10;
            const rows = Array.from(document.querySelectorAll('.table-row'));
            const totalRows = rows.length;
            const totalPages = Math.ceil(totalRows / rowsPerPage);
            let currentPage = 1;

            const prevBtn = document.getElementById('prev-page');
            const nextBtn = document.getElementById('next-page');
            const pageNumbersContainer = document.getElementById('page-numbers');
            const paginationInfo = document.getElementById('pagination-info');

            function renderTable() {
                rows.forEach(row => row.style.display = 'none');
                
                const start = (currentPage - 1) * rowsPerPage;
                const end = start + rowsPerPage;
                rows.slice(start, end).forEach(row => row.style.display = 'table-row');
                
                const startText = totalRows === 0 ? 0 : start + 1;
                const endText = Math.min(end, totalRows);
                
                paginationInfo.textContent = `Showing \${startText} to \${endText} of \${totalRows} participants`;

                prevBtn.disabled = currentPage <= 1;
                nextBtn.disabled = currentPage >= totalPages || totalPages === 0;

                renderPageNumbers();
            }

            function renderPageNumbers() {
                pageNumbersContainer.innerHTML = '';
                for (let i = 1; i <= totalPages; i++) {
                    const btn = document.createElement('button');
                    btn.textContent = i;
                    
                    btn.className = `w-8 h-8 flex items-center justify-center rounded border font-body-sm text-body-sm transition-colors \${
                        i === currentPage 
                        ? 'border-secondary dark:border-[#00ADEF] bg-secondary dark:bg-[#00ADEF] text-on-primary dark:text-white font-semibold'
                        : 'border-outline-variant dark:border-[#334155] text-on-surface dark:text-white hover:bg-surface-container-low dark:hover:bg-gray-700'
                    }`;
                    
                    btn.addEventListener('click', () => {
                        currentPage = i;
                        renderTable();
                    });
                    pageNumbersContainer.appendChild(btn);
                }
            }

            prevBtn.addEventListener('click', () => {
                if (currentPage > 1) {
                    currentPage--;
                    renderTable();
                }
            });

            nextBtn.addEventListener('click', () => {
                if (currentPage < totalPages) {
                    currentPage++;
                    renderTable();
                }
            });

            renderTable();
        });
    </script>
</body>
</html>