<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Seed Users - Agig</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
  <div class="min-h-screen flex items-center justify-center px-4 py-8">
    <div class="w-full max-w-2xl bg-white rounded-lg shadow-md p-8">
      <div class="text-center mb-8">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">Seed Test Users</h1>
        <p class="text-gray-600">Add predefined test users to the database</p>
      </div>

      <!-- Success Message -->
      <% if (request.getAttribute("success") != null) { %>
      <div class="mb-6 p-4 bg-green-50 border border-green-200 text-green-800 rounded-lg">
        <%= request.getAttribute("success") %>
      </div>
      <% } %>

      <!-- Error Message -->
      <% if (request.getAttribute("error") != null) { %>
      <div class="mb-6 p-4 bg-red-50 border border-red-200 text-red-800 rounded-lg">
        <%= request.getAttribute("error") %>
      </div>
      <% } %>

      <!-- Add All Button -->
      <div class="mb-6">
        <form method="post" class="flex gap-2">
          <input type="hidden" name="action" value="addAll" />
          <button type="submit" class="flex-1 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded-lg transition duration-200">
            Add All Users
          </button>
        </form>
      </div>

      <!-- Users Table -->
      <div class="overflow-x-auto">
        <table class="w-full border-collapse">
          <thead>
            <tr class="bg-gray-100 border-b border-gray-300">
              <th class="text-left px-4 py-2 font-semibold text-gray-700">Username</th>
              <th class="text-left px-4 py-2 font-semibold text-gray-700">Name</th>
              <th class="text-left px-4 py-2 font-semibold text-gray-700">Email</th>
              <th class="text-left px-4 py-2 font-semibold text-gray-700">Password</th>
              <th class="text-center px-4 py-2 font-semibold text-gray-700">Action</th>
            </tr>
          </thead>
          <tbody>
            <% java.util.Map<String, Object> users = (java.util.Map<String, Object>) request.getAttribute("users"); %>
            <% if (users != null) { %>
              <% for (Object userObj : users.values()) { %>
                <% java.lang.reflect.Field[] fields = userObj.getClass().getDeclaredFields(); %>
                <% String username = ""; String firstName = ""; String lastName = ""; String email = ""; String password = ""; %>
                <% for (java.lang.reflect.Field field : fields) { field.setAccessible(true); 
                  if ("username".equals(field.getName())) username = (String) field.get(userObj);
                  else if ("firstName".equals(field.getName())) firstName = (String) field.get(userObj);
                  else if ("lastName".equals(field.getName())) lastName = (String) field.get(userObj);
                  else if ("email".equals(field.getName())) email = (String) field.get(userObj);
                  else if ("password".equals(field.getName())) password = (String) field.get(userObj);
                } %>
                <tr class="border-b border-gray-200 hover:bg-gray-50">
                  <td class="px-4 py-3 text-gray-900 font-mono text-sm"><%= username %></td>
                  <td class="px-4 py-3 text-gray-700"><%= firstName %> <%= lastName %></td>
                  <td class="px-4 py-3 text-gray-700"><%= email %></td>
                  <td class="px-4 py-3 text-gray-700 font-mono text-sm"><%= password %></td>
                  <td class="px-4 py-3 text-center">
                    <form method="post" style="display: inline;">
                      <input type="hidden" name="action" value="add" />
                      <input type="hidden" name="username" value="<%= username %>" />
                      <button type="submit" class="bg-green-600 hover:bg-green-700 text-white font-semibold py-1 px-3 rounded text-sm transition duration-200">
                        Add
                      </button>
                    </form>
                  </td>
                </tr>
              <% } %>
            <% } %>
          </tbody>
        </table>
      </div>

      <!-- Back Link -->
      <div class="mt-6 text-center">
        <p class="text-gray-600">
          <a href="login" class="text-green-600 hover:text-green-700 font-semibold">Back to Login</a>
        </p>
      </div>
    </div>
  </div>
</body>
</html>
