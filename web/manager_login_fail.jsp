<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>EventHub Manager Login Error</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
</head>
<body class="h-full bg-background dark:bg-[#0b1c30] flex items-center justify-center p-4 text-on-surface dark:text-white antialiased">
    <div class="w-full max-w-md bg-surface-container-lowest dark:bg-[#1E293B] rounded-xl shadow-sm border border-outline-variant dark:border-[#334155] p-8 text-center">
        <span class="material-symbols-outlined text-error text-[48px] mb-4">error</span>
        <h1 class="text-headline-md font-bold text-error mb-2">Login Failed</h1>
        <p class="text-body-md text-on-surface-variant dark:text-gray-300 mb-6">Error, manager details do not match our data, please recheck.</p>
        <div class="space-y-3">
            <a href="manager_login.jsp" class="inline-block w-full py-2 px-4 rounded bg-primary dark:bg-[#00ADEF] text-white font-semibold hover:opacity-95 transition-opacity">
                Try Again
            </a>
            <a href="manager_login.jsp" class="inline-block w-full text-sm text-secondary dark:text-secondary-fixed hover:underline">
                Go back to login page
            </a>
        </div>
    </div>
</body>
</html>