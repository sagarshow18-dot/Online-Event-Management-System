<%@ page import="com.event.model.ManagerBean" %>
<%
    ManagerBean manager = (ManagerBean) session.getAttribute("manager");
    if (manager == null) {
        response.sendRedirect("manager_login.jsp");
        return;
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EventHub - Notifications</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
        darkMode: 'class'
    }
</script>
    <!-- Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet" />
</head>
<body class="bg-gray-50 dark:bg-gray-900 text-gray-900 dark:text-gray-100 min-h-screen flex flex-col">

    <!-- Top Navigation -->
    <header class="bg-white dark:bg-[#1E293B] border-b border-gray-200 dark:border-[#334155] px-6 py-4 flex justify-between items-center">
        <div class="flex items-center gap-4">
            <a href="manager_dashboard.jsp" class="text-gray-500 dark:text-gray-400 hover:text-blue-600 transition-colors">
                <span class="material-symbols-outlined">arrow_back</span>
            </a>
            <h1 class="text-xl font-bold">Notifications</h1>
        </div>
        <div 
            class="flex items-center space-x-4">
            <button id="theme-toggle" class="text-on-surface-variant dark:text-white hover:text-secondary dark:hover:text-secondary-fixed transition-all duration-200 flex items-center justify-center w-8 h-8 rounded-full hover:bg-surface-container-low dark:hover:bg-gray-800" title="Toggle Dark Mode">
                    <span id="theme-icon" class="material-symbols-outlined">dark_mode</span>
                </button>
            <img alt="Profile" class="w-8 h-8 rounded-full object-cover" 
                 src="<%= (manager.getPhoto() != null) ? request.getContextPath() + "/" + manager.getPhoto() : "https://ui-avatars.com/api/?name=" + manager.getName() %>"/>
        
        </div>
    </header>

    <!-- Main Content -->
    <main class="flex-grow max-w-3xl w-full mx-auto p-6 md:p-10">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold">Recent Activity</h2>
            <button class="text-sm text-blue-600 dark:text-blue-400 hover:underline">Mark all as read</button>
        </div>

        <!-- Notifications List -->
        <div class="bg-white dark:bg-[#1E293B] border border-gray-200 dark:border-[#334155] rounded-xl shadow-sm overflow-hidden">
            <ul class="divide-y divide-gray-200 dark:divide-[#334155]">
                
                <!-- Example 1: New Event -->
                <li class="p-4 hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors flex gap-4 items-start">
                    <div class="p-2 bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 rounded-full">
                        <span class="material-symbols-outlined text-sm">event_available</span>
                    </div>
                    <div>
                        <p class="text-sm font-medium">
                            <span class="font-bold">Manager #104</span> created a new event <span class="font-bold text-blue-600 dark:text-blue-400">Tech Symposium 2026</span>!
                        </p>
                        <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">10 minutes ago</p>
                    </div>
                </li>

                <!-- Example 2: Event Full -->
                <li class="p-4 hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors flex gap-4 items-start">
                    <div class="p-2 bg-red-100 dark:bg-red-900/30 text-red-600 dark:text-red-400 rounded-full">
                        <span class="material-symbols-outlined text-sm">group_off</span>
                    </div>
                    <div>
                        <p class="text-sm font-medium">
                            <span class="font-bold text-blue-600 dark:text-blue-400">Winter Coding Bootcamp</span> is now full!
                        </p>
                        <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">2 hours ago</p>
                    </div>
                </li>

                <!-- Example 3: Booking Milestone -->
                <li class="p-4 hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors flex gap-4 items-start">
                    <div class="p-2 bg-green-100 dark:bg-green-900/30 text-green-600 dark:text-green-400 rounded-full">
                        <span class="material-symbols-outlined text-sm">local_activity</span>
                    </div>
                    <div>
                        <p class="text-sm font-medium">
                            <span class="font-bold">375</span> people have booked <span class="font-bold text-blue-600 dark:text-blue-400">Global Tech Summit</span>!
                        </p>
                        <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">1 day ago</p>
                    </div>
                </li>
                
                <!-- Example 4: New Reviews -->
<li class="p-4 hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors flex gap-4 items-start">
    <div class="p-2 bg-yellow-100 dark:bg-yellow-900/30 text-yellow-600 dark:text-yellow-400 rounded-full">
        <span class="material-symbols-outlined text-sm">rate_review</span>
    </div>
    <div>
        <p class="text-sm font-medium">
            <span class="font-bold">198</span> people left a review on <span class="font-bold text-blue-600 dark:text-blue-400">Summer Music Festival</span>! 
            <a href="event_reviews.jsp" class="text-blue-600 dark:text-blue-400 hover:underline">Click to check them!</a>
        </p>
        <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">5 hours ago</p>
    </div>
</li>

            </ul>
        </div>
    </main>
    
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