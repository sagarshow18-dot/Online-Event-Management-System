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
    <title>EventHub - Manager Settings</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet" />
    
    <script src="https://cdn.tailwindcss.com"></script>
    
    <script>
        tailwind.config = {
            darkMode: 'class'
        }
    </script>
</head>
<body class="bg-gray-50 dark:bg-gray-900 text-gray-900 dark:text-gray-100 min-h-screen flex flex-col">
    
    <!-- Top Navigation / Header -->
    <header class="bg-white dark:bg-[#1E293B] border-b border-gray-200 dark:border-[#334155] px-6 py-4 flex justify-between items-center">
        <h1 class="text-xl font-bold">EventHub Manager</h1>
        <div class="flex items-center space-x-4">
            <button id="theme-toggle" class="text-on-surface-variant dark:text-white hover:text-secondary dark:hover:text-secondary-fixed transition-all duration-200 flex items-center justify-center w-8 h-8 rounded-full hover:bg-surface-container-low dark:hover:bg-gray-800" title="Toggle Dark Mode">
                    <span id="theme-icon" class="material-symbols-outlined">dark_mode</span>
                </button>
            <span class="text-sm font-medium">Hello, <%= manager.getName() %></span>
            <a href="manage_events.jsp" class="text-sm bg-gray-200 dark:bg-gray-800 px-3 py-1.5 rounded hover:bg-gray-300 transition-colors">Dashboard</a>
        </div>
    </header>

    <!-- Main Content Hub -->
    <main class="flex-grow max-w-4xl w-full mx-auto p-6 md:p-10">
        <h2 class="text-2xl font-bold mb-2">Account Settings</h2>
        <p class="text-sm text-gray-600 dark:text-gray-400 mb-8">Manage your profile information, credentials, and security settings.</p>
        
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div class="bg-white dark:bg-[#1E293B] p-6 rounded-xl border border-gray-200 dark:border-[#334155] shadow-sm flex flex-col justify-between">
                <div>
                    <h3 class="text-lg font-semibold mb-2">Profile & Avatar</h3>
                    <p class="text-sm text-gray-600 dark:text-gray-400 mb-4">Update your profile picture, name, contact details, and address.</p>
                </div>
                
                
                <a href="manager_profile.jsp" class="inline-block text-center bg-blue-600 text-white text-sm font-semibold px-4 py-2 rounded hover:bg-blue-700 transition-colors">Manage Profile</a>
            </div>

            <!-- Password & Security -->
            <div class="bg-white dark:bg-[#1E293B] p-6 rounded-xl border border-gray-200 dark:border-[#334155] shadow-sm flex flex-col justify-between">
                <div>
                    <h3 class="text-lg font-semibold mb-2">Security & Password</h3>
                    <p class="text-sm text-gray-600 dark:text-gray-400 mb-4">Change your account password to keep your event management data secure.</p>
                </div>
                <a href="manager_profile.jsp" class="inline-block text-center bg-blue-600 text-white text-sm font-semibold px-4 py-2 rounded hover:bg-blue-700 transition-colors">Change Password</a>
            </div>
        </div>

        <div class="mt-8">
            <a href="manager_dashboard.jsp" class="text-sm text-blue-600 dark:text-blue-400 hover:underline">&larr; Back to Dashboard</a>
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