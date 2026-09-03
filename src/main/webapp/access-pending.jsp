<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
if (session == null || session.getAttribute("user") == null || session.getAttribute("pendingAccessGrant") == null) {
	response.sendRedirect(request.getContextPath() + "/login");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Request Processing - Agig</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-purple-950 via-violet-950 to-fuchsia-950 min-h-screen text-violet-100">
  <nav class="bg-purple-950/70 border-b border-violet-300/30 backdrop-blur-sm">
    <div class="max-w-4xl mx-auto px-4 py-4 flex items-center justify-between">
      <a href="/" class="text-2xl font-bold text-violet-200 hover:text-violet-100">Agig</a>
    </div>
  </nav>

  <div class="min-h-screen flex items-center justify-center px-4 py-8">
    <div class="w-full max-w-md bg-purple-950/60 border border-violet-300/30 rounded-xl shadow-2xl p-8 backdrop-blur-sm text-center">
      <div class="mb-6">
        <div class="inline-block bg-violet-400/20 rounded-full p-4 mb-4">
          <svg class="w-10 h-10 text-violet-200" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 1a9 9 0 00-9 9v4a4 4 0 004 4h1v-8H7v8h10v-8h-1v8h1a4 4 0 004-4v-4a9 9 0 00-9-9z"/>
          </svg>
        </div>
        <h1 class="text-3xl font-bold text-violet-100 mb-1">CLEARANCE PROCESSING</h1>
        <p class="text-violet-300 text-sm font-mono">Access Request Under Review</p>
      </div>

      <p class="text-violet-200 mb-8">Your credentials are being verified. Provisional access granted while vetting completes...</p>

      <div class="flex justify-center mb-6">
        <div class="w-16 h-16 border-4 border-violet-300/30 border-t-violet-300 rounded-full animate-spin"></div>
      </div>

      <p class="text-sm text-violet-300" id="countdownText">Finalizing clearance in 5 seconds...</p>
    </div>
  </div>

  <script>
    let remaining = 5;
    const countdownEl = document.getElementById('countdownText');

    const timer = setInterval(() => {
      remaining -= 1;
      if (remaining > 0) {
        countdownEl.textContent = 'Finalizing clearance in ' + remaining + ' seconds...';
        return;
      }

      clearInterval(timer);
      window.location.href = 'home';
    }, 1000);
  </script>
</body>
</html>
