<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("resetEmail") == null || request.getAttribute("secQuestion") == null) {
        response.sendRedirect("forgot_password.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="utf-8"/>
    <title>Security Question - EventHub</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms"></script>
    <script> tailwind.config = { darkMode: "class" } </script>
</head>
<body class="bg-gray-50 dark:bg-[#0b1c30] text-gray-900 dark:text-white h-screen flex items-center justify-center antialiased">
    <div class="w-full max-w-md p-8 space-y-6 bg-white dark:bg-[#1E293B] rounded-xl shadow-md border border-gray-200 dark:border-[#334155]">
        <div class="text-center">
            <h2 class="text-xl font-semibold">Security Verification</h2>
            <p class="text-sm text-gray-600 dark:text-gray-400 mt-2">Answer your security question.</p>
        </div>
        <% if ("wronganswer".equals(request.getParameter("error"))) { %>
            <div class="p-3 text-sm text-red-600 bg-red-100 dark:bg-red-900/30 dark:text-red-400 rounded">
                Incorrect answer. Try again.
            </div>
        <% } %>
        <form action="VerifyAnswerServlet" method="POST" class="space-y-4">
            <div>
                <label class="block text-sm font-medium mb-2 text-blue-600 dark:text-blue-400">
                    <%= request.getAttribute("secQuestion") %>
                </label>
                <input type="text" name="answer" required placeholder="Your answer..."
                       class="w-full px-4 py-2 border border-gray-300 dark:border-[#334155] rounded-lg bg-gray-50 dark:bg-gray-800 focus:outline-none focus:ring-2 focus:ring-blue-500"/>
            </div>
            <button type="submit" class="w-full py-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition-colors">
                Submit Answer
            </button>
        </form>
    </div>
</body>
</html>