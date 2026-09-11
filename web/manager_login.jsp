<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>EventHub Manager Login</title>
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
</head>
<body class="h-full bg-background dark:bg-[#0b1c30] flex items-center justify-center p-margin-mobile md:p-gutter text-on-surface dark:text-white antialiased transition-colors duration-200">

    <!-- FLOATING DARK MODE BUTTON -->
    <button id="theme-toggle" class="absolute top-4 right-4 p-2 rounded-full text-on-surface-variant dark:text-white hover:bg-surface-container-low dark:hover:bg-gray-800 transition-colors focus:outline-none" title="Toggle Dark Mode">
        <span id="theme-icon" class="material-symbols-outlined">dark_mode</span>
    </button>

    <div class="w-full max-w-md bg-surface-container-lowest dark:bg-[#1E293B] rounded-xl shadow-sm border border-outline-variant dark:border-[#334155] p-xl transition-colors duration-200">
        <!-- Logo Header -->
        <div class="text-center mb-xl">
            <h1 class="font-display-lg text-display-lg text-primary dark:text-primary-fixed mb-xs">EventHub</h1>
            <p class="font-body-md text-body-md text-on-surface-variant dark:text-gray-400">Management Suite</p>
        </div>
        
        <!-- Login Form -->
        <form action="ManagerLoginServlet" class="space-y-md" method="POST">
            <div>
                <label class="block font-body-sm text-body-sm font-bold text-on-surface dark:text-gray-200 mb-xs" for="email">Email</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-sm flex items-center pointer-events-none">
                        <span class="material-symbols-outlined text-outline dark:text-gray-500">mail</span>
                    </div>
                    <input class="block w-full pl-[40px] rounded-DEFAULT border-outline-variant dark:border-[#334155] bg-surface-container-lowest dark:bg-[#0b1c30] text-on-surface dark:text-white focus:border-secondary dark:focus:border-secondary-fixed focus:ring-secondary dark:focus:ring-secondary-fixed focus:ring-2 focus:ring-opacity-50 sm:text-sm font-body-sm text-body-sm py-sm placeholder-on-surface-variant dark:placeholder-gray-500 transition-colors" id="email" name="email" placeholder="manager@eventhub.com" required="" type="email"/>
                </div>
            </div>
            <div>
                <label class="block font-body-sm text-body-sm font-bold text-on-surface dark:text-gray-200 mb-xs" for="password">Password</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-sm flex items-center pointer-events-none">
                        <span class="material-symbols-outlined text-outline dark:text-gray-500">lock</span>
                    </div>
                    <input class="block w-full pl-[40px] rounded-DEFAULT border-outline-variant dark:border-[#334155] bg-surface-container-lowest dark:bg-[#0b1c30] text-on-surface dark:text-white focus:border-secondary dark:focus:border-secondary-fixed focus:ring-secondary dark:focus:ring-secondary-fixed focus:ring-2 focus:ring-opacity-50 sm:text-sm font-body-sm text-body-sm py-sm placeholder-on-surface-variant dark:placeholder-gray-500 transition-colors" id="password" name="password" placeholder="********" required="" type="password"/>
                </div>
            </div>
            <div class="flex items-center justify-end mt-sm">
                <div class="text-sm">
<a class="font-body-sm text-body-sm text-secondary dark:text-secondary-fixed hover:text-primary dark:hover:text-primary-fixed transition-colors duration-200" href="forgot_password.jsp">Forgot Password?</a>
                </div>
            </div>
            <div class="pt-sm">
                <button class="w-full flex justify-center py-sm px-md border border-transparent rounded-DEFAULT shadow-sm font-title-sm text-title-sm text-on-primary dark:text-white bg-primary dark:bg-[#00ADEF] hover:bg-primary-container dark:hover:bg-[#0095CC] focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary transition-colors duration-200" type="submit">
                    Login to Dashboard
                </button>
            </div>
        </form>
    </div>

    <script>
        const themeToggleBtn = document.getElementById('theme-toggle');
        const themeIcon = document.getElementById('theme-icon');
        const htmlElement = document.documentElement;

        if (localStorage.getItem('theme') === 'dark') {
            htmlElement.classList.add('dark');
            themeIcon.textContent = 'light_mode'; 
        }

        themeToggleBtn.addEventListener('click', () => {
            htmlElement.classList.toggle('dark');
            if (htmlElement.classList.contains('dark')) {
                localStorage.setItem('theme', 'dark');
                themeIcon.textContent = 'light_mode';
            } else {
                localStorage.setItem('theme', 'light');
                themeIcon.textContent = 'dark_mode';
            }
        });
    </script>
</body>
</html>