<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Forgot Password - Agig</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-purple-950 via-violet-950 to-fuchsia-950 min-h-screen text-violet-100">
  <nav class="bg-purple-950/70 border-b border-violet-300/30 backdrop-blur-sm">
    <div class="max-w-4xl mx-auto px-4 py-4 flex items-center justify-between">
      <a href="/" class="text-2xl font-bold text-violet-200 hover:text-violet-100">Agig</a>
      <a href="login" class="bg-purple-900 hover:bg-purple-800 text-violet-100 font-semibold py-2 px-4 rounded-lg transition duration-200">Back to Login</a>
    </div>
  </nav>

  <div class="min-h-screen flex items-center justify-center px-4 py-8">
    <div class="w-full max-w-lg bg-purple-950/60 border border-violet-300/30 rounded-xl shadow-2xl p-8 backdrop-blur-sm">
      <div class="text-center mb-8">
        <div class="inline-block bg-violet-400/20 rounded-full p-3 mb-4">
          <svg class="w-8 h-8 text-violet-200" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 1a11 11 0 00-11 11v8a4 4 0 004 4h2v-8h-2v8h14v-8h-2v8h2a4 4 0 004-4v-8a11 11 0 00-11-11z"/>
          </svg>
        </div>
        <h1 class="text-3xl font-bold text-violet-100 mb-1">CREDENTIAL RECOVERY</h1>
        <p class="text-violet-300 text-sm font-mono">Emergency Access Protocol</p>
        <p class="text-violet-200 text-xs mt-2">Retrieve or reset your classified access credentials</p>
      </div>

      <form method="post" action="forgot-password" class="space-y-4">
        <div>
          <label for="username" class="block text-sm font-medium text-violet-200 mb-2">Username</label>
          <input type="text" id="username" name="username" placeholder="Enter your username" oninput="toggleButton()"
            class="w-full px-4 py-2 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent" />
        </div>

        <button id="submitButton" type="submit" class="w-full bg-violet-400 hover:bg-violet-300 disabled:bg-violet-900/60 disabled:text-violet-400 disabled:cursor-not-allowed text-purple-950 font-semibold py-2 px-4 rounded-lg transition duration-200 mt-6">
          Attempt Recovery
        </button>
      </form>

      <% if (request.getAttribute("lockoutNotice") != null) { %>
      <div class="mt-4 p-4 bg-yellow-900/50 border-l-4 border-yellow-500 text-yellow-200 rounded-lg">
        <p class="font-semibold">Clearance Level: Compromised by Forgetfulness</p>
        <p class="text-sm mt-1">A classified agent who cannot remember their own credentials is a liability. Consider this a security review. Password self-recovery is denied. Contact your superior for manual clearance reset and to explain this lapse in operational security.</p>
      </div>
      <% } %>
    </div>
  </div>

  <script>
    function toggleButton() {
      const usernameField = document.getElementById('username');
      const submitButton = document.getElementById('submitButton');
      submitButton.disabled = usernameField.value.trim() === '';
    }
  </script>
</body>
</html>
