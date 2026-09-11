<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("resetEmail") == null || session.getAttribute("verified") == null) {
        response.sendRedirect("forgot_password.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="utf-8"/>
    <title>Reset Password - EventHub</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms"></script>
    <script> tailwind.config = { darkMode: "class" } </script>
</head>
<body class="bg-gray-50 dark:bg-[#0b1c30] text-gray-900 dark:text-white h-screen flex items-center justify-center antialiased">
    <div class="w-full max-w-md p-8 space-y-6 bg-white dark:bg-[#1E293B] rounded-xl shadow-md border border-gray-200 dark:border-[#334155]">
        <div class="text-center">
            <h2 class="text-xl font-semibold">Create New Password</h2>
            <p class="text-sm text-gray-600 dark:text-gray-400 mt-2">Setting password for <%= session.getAttribute("resetEmail") %></p>
        </div>
        <% if ("update_failed".equals(request.getParameter("error"))) { %>
            <div class="p-3 text-sm text-red-600 bg-red-100 dark:bg-red-900/30 dark:text-red-400 rounded">
                Update failed. Please try again.
            </div>
        <% } %>
        <form action="ResetPasswordServlet" method="POST" class="space-y-4">
            <div>
                <label class="block text-sm font-medium mb-1">New Password</label>
                <input type="password" name="newPassword" required minlength="4"
                       class="w-full px-4 py-2 border border-gray-300 dark:border-[#334155] rounded-lg bg-gray-50 dark:bg-gray-800 focus:outline-none focus:ring-2 focus:ring-blue-500"/>
            </div>
            <button type="submit" class="w-full py-2 bg-green-600 hover:bg-green-700 text-white font-semibold rounded-lg transition-colors">
                Save & Login
            </button>
        </form>
    </div>
</body>
</html>