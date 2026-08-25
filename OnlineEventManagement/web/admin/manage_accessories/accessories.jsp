
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Manage Accessories - EventHub</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;600;700&family=Inter:wght@400;600&family=JetBrains+Mono:wght@400&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>

<script id="tailwind-config">
        tailwind.config = {
          darkMode: "class",
          theme: {
            extend: {
              "colors": {
                      "on-secondary-fixed-variant": "#3a485c",
                      "on-secondary-container": "#57657b",
                      "error-container": "#ffdad6",
                      "on-tertiary-fixed": "#001e2c",
                      "surface-container-low": "#f2f4f6",
                      "surface": "#f7f9fb",
                      "surface-container-highest": "#e0e3e5",
                      "error": "#ba1a1a",
                      "secondary": "#515f74",
                      "on-error": "#ffffff",
                      "inverse-surface": "#2d3133",
                      "on-background": "#191c1e",
                      "on-primary-fixed-variant": "#3f465c",
                      "tertiary": "#000000",
                      "outline": "#76777d",
                      "on-surface": "#191c1e",
                      "surface-variant": "#e0e3e5",
                      "tertiary-container": "#001e2c",
                      "secondary-container": "#d5e3fd",
                      "on-primary-container": "#7c839b",
                      "surface-container": "#eceef0",
                      "surface-bright": "#f7f9fb",
                      "tertiary-fixed-dim": "#7bd0ff",
                      "on-tertiary-container": "#008ebf",
                      "on-secondary": "#ffffff",
                      "tertiary-fixed": "#c4e7ff",
                      "inverse-on-surface": "#eff1f3",
                      "on-error-container": "#93000a",
                      "surface-container-lowest": "#ffffff",
                      "on-primary-fixed": "#131b2e",
                      "on-surface-variant": "#45464d",
                      "surface-tint": "#565e74",
                      "outline-variant": "#c6c6cd",
                      "primary-fixed-dim": "#bec6e0",
                      "surface-dim": "#d8dadc",
                      "primary-fixed": "#dae2fd",
                      "secondary-fixed": "#d5e3fd",
                      "secondary-fixed-dim": "#b9c7e0",
                      "background": "#f7f9fb",
                      "on-tertiary": "#ffffff",
                      "primary": "#000000",
                      "surface-container-high": "#e6e8ea",
                      "primary-container": "#131b2e",
                      "on-tertiary-fixed-variant": "#004c69"
              },
              "borderRadius": {
                      "DEFAULT": "0.125rem",
                      "lg": "0.25rem",
                      "xl": "0.5rem",
                      "full": "0.75rem"
              },
              "spacing": {
                      "margin-mobile": "16px",
                      "gutter": "24px",
                      "base": "4px",
                      "margin-desktop": "32px",
                      "md": "16px",
                      "lg": "24px",
                      "sm": "8px",
                      "xl": "40px",
                      "xs": "4px"
              },
              "fontFamily": {
                      "headline-lg": [
                              "Hanken Grotesk"
                      ],
                      "title-md": [
                              "Hanken Grotesk"
                      ],
                      "body-md": [
                              "Inter"
                      ],
                      "data-mono": [
                              "JetBrains Mono"
                      ],
                      "display-lg": [
                              "Hanken Grotesk"
                      ],
                      "label-caps": [
                              "Inter"
                      ],
                      "body-sm": [
                              "Inter"
                      ],
                      "headline-lg-mobile": [
                              "Hanken Grotesk"
                      ]
              },
              "fontSize": {
                      "headline-lg": [
                              "32px",
                              {
                                      "lineHeight": "40px",
                                      "letterSpacing": "-0.01em",
                                      "fontWeight": "600"
                              }
                      ],
                      "title-md": [
                              "20px",
                              {
                                      "lineHeight": "28px",
                                      "fontWeight": "600"
                              }
                      ],
                      "body-md": [
                              "16px",
                              {
                                      "lineHeight": "24px",
                                      "fontWeight": "400"
                              }
                      ],
                      "data-mono": [
                              "13px",
                              {
                                      "lineHeight": "18px",
                                      "fontWeight": "400"
                              }
                      ],
                      "display-lg": [
                              "48px",
                              {
                                      "lineHeight": "56px",
                                      "letterSpacing": "-0.02em",
                                      "fontWeight": "700"
                              }
                      ],
                      "label-caps": [
                              "12px",
                              {
                                      "lineHeight": "16px",
                                      "letterSpacing": "0.05em",
                                      "fontWeight": "600"
                              }
                      ],
                      "body-sm": [
                              "14px",
                              {
                                      "lineHeight": "20px",
                                      "fontWeight": "400"
                              }
                      ],
                      "headline-lg-mobile": [
                              "24px",
                              {
                                      "lineHeight": "32px",
                                      "fontWeight": "600"
                              }
                      ]
              }
      },
          },
        }
      </script>
</head>

<body class="bg-background text-on-background font-body-md h-screen overflow-hidden flex">

<!-- SideNavBar -->

<nav class="hidden md:flex bg-surface-container-lowest dark:bg-surface-container-lowest fixed left-0 top-0 h-full w-[280px] border-r border-outline-variant dark:border-outline-variant flex-col py-lg px-md z-20">

<div class="flex items-center gap-sm mb-xl px-sm">

<span class="material-symbols-outlined text-primary dark:text-on-primary-fixed" style="font-variation-settings: 'FILL' 1; font-size: 32px;">
hub
</span>

<div>

<h1 class="font-headline-lg text-headline-lg font-bold text-primary dark:text-on-primary-fixed">
EventHub
</h1>

<p class="font-label-caps text-label-caps text-on-surface-variant">
Enterprise Admin
</p>

</div>

</div>

<ul class="flex flex-col gap-sm flex-grow">

<li>

<!-- Dashboard - Active -->

        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-lg text-primary font-bold border-l-4 border-primary bg-surface-container-low transition-colors duration-200"
                href="<%= request.getContextPath() %>/admin/admin_dashboard/adminDashboard.jsp">

                <span
                    class="material-symbols-outlined"
                    style="font-variation-settings: 'FILL' 1;">

                    dashboard

                </span>

                <span>
                    Dashboard
                </span>

            </a>

        </li>


        <!-- Users -->

        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
                href="<%= request.getContextPath() %>/ManageUsersServlet">

                <span class="material-symbols-outlined">
                    group
                </span>

                <span>
                    Users
                </span>

            </a>

        </li>


        <!-- Event Managers -->

        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
                href="<%= request.getContextPath() %>/ManageEventManagersServlet">

                <span class="material-symbols-outlined">
                    badge
                </span>

                <span>
                    Event Managers
                </span>

            </a>

        </li>

<!-- Events  -->

        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
                 href="<%= request.getContextPath() %>/ManageEventsServlet">

                <span class="material-symbols-outlined">
                    calendar_today
                </span>

                <span>
                    Events
                </span>

            </a>

        </li>

<li>

<a class="flex items-center gap-md px-md py-sm rounded-lg text-primary dark:text-on-primary-fixed font-bold border-r-4 border-primary bg-surface-container-low opacity-80"
href="<%= request.getContextPath() %>/AccessoriesServlet">

<span class="material-symbols-outlined" data-icon="inventory_2" style="font-variation-settings: 'FILL' 1;">
inventory_2
</span>

<span class="font-body-md text-body-md">
Accessories
</span>

</a>

</li>

<li>

<a class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant dark:text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
href="<%= request.getContextPath() %>/ManageBookingsServlet">

<span class="material-symbols-outlined" data-icon="confirmation_number">
confirmation_number
</span>

<span class="font-body-md text-body-md">
Bookings
</span>

</a>

</li>

 <!-- Reports -->

        <li>

            <a
                class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200 border-l-4 border-transparent hover:border-outline-variant"
                href="<%= request.getContextPath() %>/ReportsServlet">

                <span class="material-symbols-outlined">
                    assessment
                </span>

                <span>
                    Reports
                </span>

            </a>

        </li>

</ul>

<div class="mt-auto pt-md border-t border-outline-variant">

<a class="flex items-center gap-md px-md py-sm rounded-lg text-on-surface-variant dark:text-on-surface-variant hover:bg-surface-container-low transition-colors duration-200"
href="<%= request.getContextPath() %>/AdminProfileServlet">

<img
alt="Admin User Profile"
class="w-8 h-8 rounded-full object-cover border border-outline-variant"
data-alt="A small, circular profile picture of an administrative user in a corporate setting. Light mode, professional aesthetic, neutral background."
src="https://lh3.googleusercontent.com/aida-public/AB6AXuAxsC5eactRY7iQ9M1GkhHZ1XdB3-ym11f1-ALd-89I0gaWokKCYAgkA0jg1Q5oxYoaiyq-kZGsXSfshLBNwSV0Uxb4sFv9AN3eGdZud_YfrST9QxkH1D4O385xAHApI2QJ8k-sDO5wBhUJMFz-MEm9baC0YRnscGPuOH0Db30kl5K7oYjVL0LBrDbLhCydsbtObNG5ijIN0RIFV-0o42Oljw5xmyASjFjUd9jpnMu581TmgpdHycgjIQ"/>

<span class="font-body-md text-body-md">
Profile
</span>

</a>

</div>

</nav>


<!-- TopNavBar -->

<header class="hidden md:flex bg-surface-container-lowest dark:bg-surface-container-lowest fixed top-0 right-0 w-[calc(100%-280px)] h-16 border-b border-outline-variant dark:border-outline-variant justify-between items-center px-lg ml-[280px] z-10">

<div class="flex items-center w-1/3">

<div class="relative w-full max-w-md">

<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant">
search
</span>

<input
class="w-full pl-10 pr-4 py-2 bg-surface-container-low border border-outline-variant rounded-full font-body-sm text-body-sm focus:outline-none focus:border-tertiary-container focus:ring-1 focus:ring-tertiary-container transition-all"
placeholder="Search accessories..."
type="text"/>

</div>

</div>

<div class="flex items-center gap-md">

<button class="text-on-surface-variant hover:text-primary transition-colors p-sm rounded-full hover:bg-surface-container-low active:scale-95">

<span class="material-symbols-outlined" data-icon="notifications">
notifications
</span>

</button>

<button class="text-on-surface-variant hover:text-primary transition-colors p-sm rounded-full hover:bg-surface-container-low active:scale-95">

<span class="material-symbols-outlined" data-icon="settings">
settings
</span>

</button>

<div class="h-6 w-[1px] bg-outline-variant mx-sm">
</div>

<button class="font-label-caps text-label-caps text-on-surface-variant hover:text-primary transition-colors active:scale-95">
Logout
</button>

</div>

</header>


<!-- Main Content -->

<main class="flex-1 ml-0 md:ml-[280px] mt-0 md:mt-16 overflow-y-auto p-margin-mobile md:p-margin-desktop bg-surface flex flex-col gap-lg">

<!-- Header Actions -->

<div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-md">

<div>

<nav aria-label="Breadcrumb" class="flex text-on-surface-variant mb-xs">

<ol class="inline-flex items-center space-x-1 md:space-x-3 font-label-caps text-label-caps">

<li class="inline-flex items-center">

<a class="inline-flex items-center hover:text-primary transition-colors" href="#">
Dashboard
</a>

</li>

<li>

<div class="flex items-center">

<span class="material-symbols-outlined text-[16px] mx-1">
chevron_right
</span>

<span class="text-primary font-semibold">
Accessories
</span>

</div>

</li>

</ol>

</nav>

<h2 class="font-headline-lg-mobile md:font-headline-lg text-headline-lg-mobile md:text-headline-lg text-on-background">
Manage Accessories
</h2>

</div>

<button class="bg-primary text-on-primary px-lg py-sm rounded-DEFAULT font-body-md text-body-md font-semibold hover:bg-primary-container hover:text-on-primary-container transition-colors shadow-sm flex items-center gap-sm">

<span class="material-symbols-outlined text-[20px]">
add
</span>

Add Accessory

</button>

</div>


<!-- Data Table Card -->

<div class="bg-surface-container-lowest rounded-xl border border-outline-variant overflow-hidden flex flex-col">


<!-- Table Toolbar -->

<div class="p-md border-b border-outline-variant flex justify-between items-center bg-surface-bright">

<div class="flex gap-sm">

<button class="px-md py-xs text-sm border border-outline-variant rounded-full font-label-caps text-label-caps bg-surface-container-low text-on-surface hover:bg-surface-container transition-colors">
All (124)
</button>

<button class="px-md py-xs text-sm border border-transparent rounded-full font-label-caps text-label-caps text-on-surface-variant hover:bg-surface-container-low transition-colors">
Available
</button>

<button class="px-md py-xs text-sm border border-transparent rounded-full font-label-caps text-label-caps text-on-surface-variant hover:bg-surface-container-low transition-colors">
Low Stock
</button>

</div>

<button class="text-on-surface-variant hover:text-primary p-xs rounded hover:bg-surface-container-low transition-colors">

<span class="material-symbols-outlined">
filter_list
</span>

</button>

</div>


<!-- Table -->

<div class="overflow-x-auto">

<table class="w-full text-left border-collapse min-w-[800px]">

<thead class="bg-surface-container-low border-b border-outline-variant font-label-caps text-label-caps text-on-surface-variant">

<tr>

<th class="p-md font-semibold">
Accessory Name
</th>

<th class="p-md font-semibold">
Category
</th>

<th class="p-md font-semibold text-right">
Price
</th>

<th class="p-md font-semibold text-right">
Quantity
</th>

<th class="p-md font-semibold">
Availability
</th>

<th class="p-md font-semibold">
Status
</th>

<th class="p-md font-semibold text-right">
Actions
</th>

</tr>

</thead>

<tbody class="font-body-sm text-body-sm text-on-background divide-y divide-outline-variant/50">

<%
    java.util.List<java.util.Map<String, Object>> accessoryList =
        (java.util.List<java.util.Map<String, Object>>)
        request.getAttribute("accessoryList");

    if (accessoryList != null && !accessoryList.isEmpty()) {

        for (java.util.Map<String, Object> accessory : accessoryList) {

            int accessoryId = (Integer) accessory.get("accessoryId");

            String accessoryName = accessory.get("accessoryName") != null
                    ? accessory.get("accessoryName").toString()
                    : "";

            String category = accessory.get("category") != null
                    ? accessory.get("category").toString()
                    : "";

            java.math.BigDecimal price =
                    (java.math.BigDecimal) accessory.get("price");

            int quantity = (Integer) accessory.get("quantity");

            String status = accessory.get("status") != null
                    ? accessory.get("status").toString()
                    : "";

            String imageUrl = accessory.get("imageUrl") != null
                    ? accessory.get("imageUrl").toString()
                    : "";

            boolean active =
                    "ACTIVE".equalsIgnoreCase(status);

            String statusClass;

            if (active) {
                statusClass = "bg-[#e6f4ea] text-[#137333]";
            } else {
                statusClass = "bg-[#fce8e6] text-[#c5221f]";
            }
%>

<tr class="hover:bg-surface-container-low/50 transition-colors group">

    <td class="p-md">

        <div class="flex items-center gap-md">

            <div class="w-10 h-10 bg-surface-container rounded-DEFAULT flex items-center justify-center border border-outline-variant overflow-hidden">

                <% if (!imageUrl.isEmpty()) { %>

                    <img
                        class="w-full h-full object-cover"
                        src="<%= imageUrl %>"
                        alt="<%= accessoryName %>"/>

                <% } else { %>

                    <span class="material-symbols-outlined text-outline">
                        inventory_2
                    </span>

                <% } %>

            </div>

            <span class="font-semibold text-primary">
                <%= accessoryName %>
            </span>

        </div>

    </td>


    <td class="p-md text-on-surface-variant">
        <%= category %>
    </td>


    <td class="p-md text-right font-data-mono text-data-mono">
        ₹<%= price %>/day
    </td>


    <td class="p-md text-right font-data-mono text-data-mono">
        <%= quantity %>
    </td>


    <td class="p-md">

        <div class="w-full bg-surface-container rounded-full h-1.5 mt-2">

            <%
                int availabilityWidth;

                if (quantity >= 10) {
                    availabilityWidth = 80;
                } else if (quantity >= 5) {
                    availabilityWidth = 50;
                } else if (quantity > 0) {
                    availabilityWidth = 20;
                } else {
                    availabilityWidth = 0;
                }
            %>

            <div
                class="<%= quantity <= 4 ? "bg-error" : "bg-primary" %> h-1.5 rounded-full"
                style="width: <%= availabilityWidth %>%">
            </div>

        </div>

    </td>


    <td class="p-md">

        <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-semibold <%= statusClass %>">

            <%= status.isEmpty() ? "Unknown" : status %>

        </span>

    </td>


    <td class="p-md text-right">

        <div class="flex justify-end gap-xs opacity-0 group-hover:opacity-100 transition-opacity">

            <!-- Edit -->
            <button
                type="button"
                class="p-xs text-on-surface-variant hover:text-tertiary-container hover:bg-secondary-container rounded transition-colors"
                title="Edit">

                <span class="material-symbols-outlined text-[18px]">
                    edit
                </span>

            </button>


            <!-- Update Quantity -->
            <button
                type="button"
                class="p-xs text-on-surface-variant hover:text-tertiary-container hover:bg-secondary-container rounded transition-colors"
                title="Update Quantity">

                <span class="material-symbols-outlined text-[18px]">
                    inventory_2
                </span>

            </button>


            <!-- Delete -->
            <a
                href="<%= request.getContextPath() %>/AccessoriesServlet?action=delete&accessoryId=<%= accessoryId %>"
                onclick="return confirm('Are you sure you want to delete this accessory?');"
                class="p-xs text-on-surface-variant hover:text-error hover:bg-error-container rounded transition-colors"
                title="Delete">

                <span class="material-symbols-outlined text-[18px]">
                    delete
                </span>

            </a>

        </div>

    </td>

</tr>

<%
        }

    } else {
%>

<tr>

    <td colspan="7" class="py-8 text-center text-on-surface-variant">
        No accessories found.
    </td>

</tr>

<%
    }
%>

</tbody>
</table>

</div>


<!-- Pagination Footer -->

<div class="p-sm border-t border-outline-variant bg-surface-bright flex justify-between items-center font-body-sm text-body-sm text-on-surface-variant">

<span>
Showing 1-3 of 124 accessories
</span>

<div class="flex gap-xs">

<button class="p-xs border border-outline-variant rounded hover:bg-surface-container-low disabled:opacity-50 transition-colors" disabled="">

<span class="material-symbols-outlined text-[18px]">
chevron_left
</span>

</button>

<button class="p-xs border border-outline-variant rounded hover:bg-surface-container-low transition-colors">

<span class="material-symbols-outlined text-[18px]">
chevron_right
</span>

</button>

</div>

</div>

</div>

</main>

</body>
</html>

