<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Change Password - Agig</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-purple-950 via-violet-950 to-fuchsia-950 min-h-screen text-violet-100">
  <% java.util.Map<String, java.util.List<String>> changePasswordErrors = (java.util.Map<String, java.util.List<String>>) request.getAttribute("changePasswordErrors"); %>

  <nav class="bg-purple-950/70 border-b border-violet-300/30 backdrop-blur-sm">
    <div class="max-w-4xl mx-auto px-4 py-4 flex items-center justify-between">
      <a href="/" class="text-2xl font-bold text-violet-200 hover:text-violet-100">Agig</a>
      <div class="flex items-center gap-2">
		<a href="profile" class="bg-purple-900 hover:bg-purple-800 text-violet-100 font-semibold py-2 px-4 rounded-lg transition duration-200">Profile</a>
		<a href="logout" class="bg-fuchsia-700 hover:bg-fuchsia-600 text-white font-semibold py-2 px-4 rounded-lg transition duration-200">Logout</a>
      </div>
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
		<h1 class="text-3xl font-bold text-violet-100 mb-1">SECURITY CREDENTIAL UPDATE</h1>
		<p class="text-violet-300 text-sm font-mono">Passphrase Reissuance Protocol</p>
		<p class="text-violet-200 text-xs mt-2">Maintain your classified access through regular credential updates</p>
      </div>

      <c:if test="${param.updated == 'true'}">
		<div class="mb-4 p-3 bg-violet-900/40 border border-violet-300/40 text-violet-100 rounded-lg">
          Password updated successfully.
        </div>
      </c:if>

      <form id="changePasswordForm" action="change-password" method="post" class="space-y-4" novalidate>
        <div>
          <label for="currentPassword" class="block text-sm font-medium text-violet-200 mb-2">Current Password <span class="text-red-600">*</span></label>
          <div class="relative">
            <input type="password" id="currentPassword" name="currentPassword" required maxlength="128"
              class="w-full px-4 py-2 pr-20 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent" />
            <button type="button" id="toggleCurrentPassword" class="absolute inset-y-0 right-0 px-3 text-sm text-violet-200 hover:text-violet-100 font-medium">Show</button>
          </div>
          <% if (changePasswordErrors != null && changePasswordErrors.containsKey("currentPassword")) { %>
            <% for (String error : changePasswordErrors.get("currentPassword")) { %>
              <p class="mt-1 text-sm text-red-600"><%= error %></p>
            <% } %>
          <% } %>
          <p id="currentPassword-live-error" class="mt-1 text-sm text-red-600 hidden"></p>
        </div>

        <div>
          <label for="newPassword" class="block text-sm font-medium text-violet-200 mb-2">New Password <span class="text-red-600">*</span></label>
          <div class="relative">
            <input type="password" id="newPassword" name="newPassword" required maxlength="128"
              class="w-full px-4 py-2 pr-20 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent" />
            <button type="button" id="toggleNewPassword" class="absolute inset-y-0 right-0 px-3 text-sm text-violet-200 hover:text-violet-100 font-medium">Show</button>
          </div>
          <% if (changePasswordErrors != null && changePasswordErrors.containsKey("newPassword")) { %>
            <% for (String error : changePasswordErrors.get("newPassword")) { %>
              <p class="mt-1 text-sm text-red-600"><%= error %></p>
            <% } %>
          <% } %>
          <p id="newPassword-live-error" class="mt-1 text-sm text-red-600 hidden"></p>

          <div class="mt-3 p-3 bg-purple-900/50 border border-violet-300/20 rounded-lg">
            <p class="text-xs font-semibold text-violet-200 mb-2">New password must contain:</p>
            <ul class="space-y-1 text-sm">
              <li class="flex items-center" id="change-req-length">
                <span class="inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs">✓</span>
                <span class="text-violet-300">At least 12 characters</span>
              </li>
              <li class="flex items-center" id="change-req-upper">
                <span class="inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs">✓</span>
                <span class="text-violet-300">Uppercase letter (A-Z)</span>
              </li>
              <li class="flex items-center" id="change-req-lower">
                <span class="inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs">✓</span>
                <span class="text-violet-300">Lowercase letter (a-z)</span>
              </li>
              <li class="flex items-center" id="change-req-number">
                <span class="inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs">✓</span>
                <span class="text-violet-300">Number (0-9)</span>
              </li>
              <li class="flex items-center" id="change-req-special">
                <span class="inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs">✓</span>
                <span class="text-violet-300">Special character (@$!%*?&)</span>
              </li>
              <li class="flex items-center" id="change-req-max">
                <span class="inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs">✓</span>
                <span class="text-violet-300">No more than 128 characters</span>
              </li>
            </ul>
          </div>
        </div>

        <div>
          <label for="confirmPassword" class="block text-sm font-medium text-violet-200 mb-2">Confirm New Password <span class="text-red-600">*</span></label>
          <div class="relative">
            <input type="password" id="confirmPassword" name="confirmPassword" required maxlength="128"
              class="w-full px-4 py-2 pr-20 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent" />
            <button type="button" id="toggleConfirmPassword" class="absolute inset-y-0 right-0 px-3 text-sm text-violet-200 hover:text-violet-100 font-medium">Show</button>
          </div>
          <% if (changePasswordErrors != null && changePasswordErrors.containsKey("confirmPassword")) { %>
            <% for (String error : changePasswordErrors.get("confirmPassword")) { %>
              <p class="mt-1 text-sm text-red-600"><%= error %></p>
            <% } %>
          <% } %>
          <p id="confirmPassword-live-error" class="mt-1 text-sm text-red-600 hidden"></p>
        </div>

        <button id="changePasswordSubmit" type="submit" class="w-full bg-violet-400 hover:bg-violet-300 disabled:bg-violet-900/60 disabled:text-violet-400 disabled:cursor-not-allowed text-purple-950 font-semibold py-2 px-4 rounded-lg transition duration-200 mt-2">
          Update Password
        </button>
      </form>
    </div>
  </div>

  <script>
    const changePasswordForm = document.getElementById('changePasswordForm');
    const currentPasswordInput = document.getElementById('currentPassword');
    const newPasswordInput = document.getElementById('newPassword');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const changePasswordSubmit = document.getElementById('changePasswordSubmit');

    const toggleCurrentPasswordButton = document.getElementById('toggleCurrentPassword');
    const toggleNewPasswordButton = document.getElementById('toggleNewPassword');
    const toggleConfirmPasswordButton = document.getElementById('toggleConfirmPassword');

    const FIELD_DEFAULT_CLASS = 'w-full px-4 py-2 pr-20 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent';
    const FIELD_ERROR_CLASS = 'w-full px-4 py-2 pr-20 border border-fuchsia-400 rounded-lg bg-purple-900/50 text-violet-100 focus:outline-none focus:ring-2 focus:ring-fuchsia-400 focus:border-transparent';

    const touched = {
      currentPassword: false,
      newPassword: false,
      confirmPassword: false
    };
    let hasSubmitted = false;

    function updateRequirement(elementId, isMet) {
      const element = document.getElementById(elementId);
      const badge = element.querySelector('span:first-child');
      const text = element.querySelector('span:last-child');

      if (isMet) {
        badge.className = 'inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-violet-400 text-purple-950 text-xs';
        badge.textContent = '✓';
        text.className = 'text-violet-100 font-medium';
      } else {
        badge.className = 'inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs';
        badge.textContent = '✓';
        text.className = 'text-violet-300';
      }
    }

    function setFieldState(inputEl, errorEl, errorMessage, showError) {
      const hasError = Boolean(errorMessage);

      if (showError && hasError) {
        inputEl.className = FIELD_ERROR_CLASS;
      } else {
        inputEl.className = FIELD_DEFAULT_CLASS;
      }

      if (showError && hasError) {
        errorEl.textContent = errorMessage;
        errorEl.classList.remove('hidden');
      } else {
        errorEl.textContent = '';
        errorEl.classList.add('hidden');
      }
    }

    function validateCurrentPassword(showError) {
      const errorEl = document.getElementById('currentPassword-live-error');
      const error = currentPasswordInput.value ? '' : 'Current password is required';
      setFieldState(currentPasswordInput, errorEl, error, showError);
      return !error;
    }

    function validateNewPassword(showError) {
      const password = newPasswordInput.value;
      const hasLength = password.length >= 12;
      const hasUpper = /[A-Z]/.test(password);
      const hasLower = /[a-z]/.test(password);
      const hasNumber = /\d/.test(password);
      const hasSpecial = /[@$!%*?&]/.test(password);
      const hasMaxLength = password.length <= 128;

      updateRequirement('change-req-length', hasLength);
      updateRequirement('change-req-upper', hasUpper);
      updateRequirement('change-req-lower', hasLower);
      updateRequirement('change-req-number', hasNumber);
      updateRequirement('change-req-special', hasSpecial);
      updateRequirement('change-req-max', hasMaxLength);

      const errorEl = document.getElementById('newPassword-live-error');
      let error = '';

      if (currentPasswordInput.value && password && currentPasswordInput.value === password) {
        error = 'New password must be different from current password';
      }

      setFieldState(newPasswordInput, errorEl, error, showError);
      return hasLength && hasUpper && hasLower && hasNumber && hasSpecial && hasMaxLength && !error;
    }

    function validateConfirmPassword(showError) {
      const errorEl = document.getElementById('confirmPassword-live-error');
      let error = '';

      if (!confirmPasswordInput.value) {
        error = 'Please confirm your new password';
      } else if (confirmPasswordInput.value !== newPasswordInput.value) {
        error = 'Passwords do not match';
      }

      setFieldState(confirmPasswordInput, errorEl, error, showError);
      return !error;
    }

    function validatePasswordChangeForm() {
      const isCurrentValid = validateCurrentPassword(touched.currentPassword || hasSubmitted);
      const isNewValid = validateNewPassword(touched.newPassword || hasSubmitted);
      const isConfirmValid = validateConfirmPassword(touched.confirmPassword || hasSubmitted);

      const isFormValid = isCurrentValid && isNewValid && isConfirmValid;
      changePasswordSubmit.disabled = !isFormValid;
      return isFormValid;
    }

    function handleBlur(fieldName) {
      touched[fieldName] = true;
      validatePasswordChangeForm();
    }

    function togglePasswordVisibility(inputEl, buttonEl) {
      const isPassword = inputEl.type === 'password';
      inputEl.type = isPassword ? 'text' : 'password';
      buttonEl.textContent = isPassword ? 'Hide' : 'Show';
    }

    currentPasswordInput.addEventListener('input', validatePasswordChangeForm);
    newPasswordInput.addEventListener('input', validatePasswordChangeForm);
    confirmPasswordInput.addEventListener('input', validatePasswordChangeForm);

    currentPasswordInput.addEventListener('blur', () => handleBlur('currentPassword'));
    newPasswordInput.addEventListener('blur', () => handleBlur('newPassword'));
    confirmPasswordInput.addEventListener('blur', () => handleBlur('confirmPassword'));

    toggleCurrentPasswordButton.addEventListener('click', () => togglePasswordVisibility(currentPasswordInput, toggleCurrentPasswordButton));
    toggleNewPasswordButton.addEventListener('click', () => togglePasswordVisibility(newPasswordInput, toggleNewPasswordButton));
    toggleConfirmPasswordButton.addEventListener('click', () => togglePasswordVisibility(confirmPasswordInput, toggleConfirmPasswordButton));

    changePasswordForm.addEventListener('submit', (event) => {
      hasSubmitted = true;
      if (!validatePasswordChangeForm()) {
        event.preventDefault();
      }
    });

    validatePasswordChangeForm();
  </script>
</body>
</html>
