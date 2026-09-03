<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home - Agig</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-purple-950 via-violet-950 to-fuchsia-950 min-h-screen text-violet-100">
  <nav class="bg-purple-950/70 border-b border-violet-300/30 backdrop-blur-sm">
    <div class="max-w-5xl mx-auto px-4 py-4 flex items-center justify-between">
      <a href="/" class="text-2xl font-bold text-violet-200 hover:text-violet-100">Agig</a>
      <div class="flex items-center gap-2">
        <a href="profile" class="bg-purple-900 hover:bg-purple-800 text-violet-100 font-semibold py-2 px-4 rounded-lg transition duration-200">Profile</a>
        <a href="logout" class="bg-fuchsia-700 hover:bg-fuchsia-600 text-white font-semibold py-2 px-4 rounded-lg transition duration-200">Logout</a>
      </div>
    </div>
  </nav>

  <div class="max-w-5xl mx-auto px-4 py-8">
    <% if (session.getAttribute("passwordNeedsUpdate") != null && (Boolean) session.getAttribute("passwordNeedsUpdate")) { %>
      <div class="mb-6 p-4 bg-amber-100/95 border-l-4 border-amber-500 rounded text-amber-900">
        <div class="flex items-start">
          <div class="flex-shrink-0">
            <svg class="h-5 w-5 text-amber-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
              <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
            </svg>
          </div>
          <div class="ml-3">
            <p class="text-sm font-medium">Your password no longer meets AGIG security policy.</p>
            <p class="mt-1 text-sm">Update now to maintain secure access.
              <a href="change-password" class="font-semibold underline hover:text-amber-700">Change password</a>
            </p>
          </div>
        </div>
      </div>
    <% } %>

    <div class="bg-purple-950/60 border border-violet-300/30 rounded-xl shadow-2xl p-8 mb-6">
      <div class="mb-4">
        <p class="text-xs text-violet-400 font-mono">☆ CLASSIFIED ☆</p>
      </div>
      <h1 class="text-3xl font-bold text-violet-100 mb-2">Welcome, Agent ${user.displayName}</h1>
      <p class="text-violet-200">Secure channel established. Classified briefing documents loaded.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <section class="bg-purple-950/60 border border-violet-300/30 rounded-xl shadow-xl p-6">
        <h2 class="text-xl font-bold text-violet-100 mb-2"><c:out value="${missionTitle}" /></h2>
        <p class="text-violet-200 text-sm mb-3"><c:out value="${missionSummary}" /></p>
        <ul class="text-sm text-violet-300 space-y-1">
          <li>Priority: <c:out value="${missionPriority}" /></li>
          <li>Region: <c:out value="${missionRegion}" /></li>
          <li>Status: <c:out value="${missionStatus}" /></li>
        </ul>
      </section>

      <section class="bg-purple-950/60 border border-violet-300/30 rounded-xl shadow-xl p-6">
        <h2 class="text-xl font-bold text-violet-100 mb-2">Encrypted Notes</h2>
        <p class="text-violet-200 text-sm mb-3"><c:out value="${notesSummary}" /></p>
        <div class="bg-purple-900/70 border border-violet-300/20 rounded p-3 text-xs text-violet-200 font-mono">
          <c:out value="${notesPayload}" /> / AUTHORIZED_USER:${user.username}
        </div>
      </section>
    </div>

    <div class="mt-6 bg-purple-950/60 border border-violet-300/30 rounded-xl shadow-xl p-6">
      <h2 class="text-xl font-bold text-violet-100 mb-2">Quick Actions</h2>
      <div class="flex flex-wrap gap-3 mt-3">
        <a href="profile" class="bg-purple-900 hover:bg-purple-800 text-violet-100 font-semibold py-2 px-4 rounded-lg transition duration-200">View Profile</a>
        <a href="change-password" class="bg-violet-400 hover:bg-violet-300 text-purple-950 font-semibold py-2 px-4 rounded-lg transition duration-200">Change Password</a>
      </div>
    </div>
  </div>
</body>
</html>
