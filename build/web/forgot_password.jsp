<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="utf-8"/>
    <title>Forgot Password - EventHub</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms"></script>
    <script> tailwind.config = { darkMode: "class" } </script>
</head>
<body class="bg-gray-50 dark:bg-[#0b1c30] text-gray-900 dark:text-white h-screen flex items-center justify-center antialiased">
    <div class="w-full max-w-md p-8 space-y-6 bg-white dark:bg-[#1E293B] rounded-xl shadow-md border border-gray-200 dark:border-[#334155]">
        <div class="text-center">
            <h2 class="text-xl font-semibold">Forgot Password</h2>
            <p class="text-sm text-gray-600 dark:text-gray-400 mt-2">Enter your registered email address.</p>
        </div>
        <% if ("notfound".equals(request.getParameter("error"))) { %>
            <div class="p-3 text-sm text-red-600 bg-red-100 dark:bg-red-900/30 dark:text-red-400 rounded">
                No account found with that email address.
            </div>
        <% } %>
        <form action="ForgotPasswordServlet" method="POST" class="space-y-4">
            <div>
                <label class="block text-sm font-medium mb-1">Email Address</label>
                <input type="email" name="email" required 
                       class="w-full px-4 py-2 border border-gray-300 dark:border-[#334155] rounded-lg bg-gray-50 dark:bg-gray-800 focus:outline-none focus:ring-2 focus:ring-blue-500"/>
            </div>
            <button type="submit" class="w-full py-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition-colors">
                Verify Email
            </button>
        </form>
        <div class="text-center">
            <a href="manager_login.jsp" class="text-sm text-blue-600 dark:text-blue-400 hover:underline">Back to Login</a>
        </div>
    </div>
</body>
</html>