<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Request Access - Agig</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-purple-950 via-violet-950 to-fuchsia-950 min-h-screen text-violet-100">
  <nav class="bg-purple-950/70 border-b border-violet-300/30 backdrop-blur-sm">
    <div class="max-w-4xl mx-auto px-4 py-4 flex items-center justify-between">
      <a href="/" class="text-2xl font-bold text-violet-200 hover:text-violet-100">Agig</a>
    </div>
  </nav>
  <div class="min-h-screen flex items-center justify-center px-4 py-8">
    <div class="w-full max-w-md bg-purple-950/60 border border-violet-300/30 rounded-xl shadow-2xl p-8 backdrop-blur-sm">
      <div class="text-center mb-8">
        <div class="inline-block bg-violet-400/20 rounded-full p-3 mb-4">
          <svg class="w-8 h-8 text-violet-200" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 1a9 9 0 00-9 9v4a4 4 0 004 4h1v-8H7v8h10v-8h-1v8h1a4 4 0 004-4v-4a9 9 0 00-9-9z"/>
          </svg>
        </div>
        <h1 class="text-3xl font-bold text-violet-100 mb-1">ACCESS REQUEST FORM</h1>
        <p class="text-violet-300 text-sm font-mono">Clearance Application Protocol</p>
        <p class="text-violet-200 text-xs mt-2">Submit your credentials for vetting and approval</p>
      </div>

      <% com.agig.validation.ValidationException validationError = (com.agig.validation.ValidationException) request.getAttribute("validationError"); %>
      <% java.util.Map<String, java.util.List<String>> validationErrors = (java.util.Map<String, java.util.List<String>>) request.getAttribute("validationErrors"); %>

      <form id="registerForm" action="register" method="post" class="space-y-4" novalidate>

        <!-- Username Field -->
        <div>
          <label for="username" class="block text-sm font-medium text-violet-200 mb-2">Username <span class="text-red-600">*</span></label>
          <input type="text" id="username" name="username"
            value="<c:out value="${param.username}" />"
            required minlength="3" maxlength="50" pattern="[a-zA-Z0-9_]{3,50}"
            class="w-full px-4 py-2 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent" />
          <% if (validationErrors != null && validationErrors.containsKey("username")) { %>
            <% for (String error : validationErrors.get("username")) { %>
              <p class="mt-1 text-sm text-red-600"><%= error %></p>
            <% } %>
          <% } %>
          <p id="username-live-error" class="mt-1 text-sm text-red-600 hidden"></p>
        </div>

        <!-- First Name Field -->
        <div>
          <label for="firstName" class="block text-sm font-medium text-violet-200 mb-2">First Name <span class="text-red-600">*</span></label>
          <input type="text" id="firstName" name="firstName"
            value="<c:out value="${param.firstName}" />"
            required maxlength="50" pattern="[a-zA-Z\s'\-]{1,50}"
            class="w-full px-4 py-2 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent" />
          <% if (validationErrors != null && validationErrors.containsKey("firstName")) { %>
            <% for (String error : validationErrors.get("firstName")) { %>
              <p class="mt-1 text-sm text-red-600"><%= error %></p>
            <% } %>
          <% } %>
          <p id="firstName-live-error" class="mt-1 text-sm text-red-600 hidden"></p>
        </div>

        <!-- Last Name Field -->
        <div>
          <label for="lastName" class="block text-sm font-medium text-violet-200 mb-2">Last Name <span class="text-red-600">*</span></label>
          <input type="text" id="lastName" name="lastName"
            value="<c:out value="${param.lastName}" />"
            required maxlength="50" pattern="[a-zA-Z\s'\-]{1,50}"
            class="w-full px-4 py-2 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent" />
          <% if (validationErrors != null && validationErrors.containsKey("lastName")) { %>
            <% for (String error : validationErrors.get("lastName")) { %>
              <p class="mt-1 text-sm text-red-600"><%= error %></p>
            <% } %>
          <% } %>
          <p id="lastName-live-error" class="mt-1 text-sm text-red-600 hidden"></p>
        </div>

        <!-- Email Field -->
        <div>
          <label for="email" class="block text-sm font-medium text-violet-200 mb-2">Email <span class="text-red-600">*</span></label>
          <input type="email" id="email" name="email"
            value="<c:out value="${param.email}" />"
            required maxlength="255"
            class="w-full px-4 py-2 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent" />
          <% if (validationErrors != null && validationErrors.containsKey("email")) { %>
            <% for (String error : validationErrors.get("email")) { %>
              <p class="mt-1 text-sm text-red-600"><%= error %></p>
            <% } %>
          <% } %>
          <p id="email-live-error" class="mt-1 text-sm text-red-600 hidden"></p>
        </div>

        <!-- Password Field -->
        <div>
          <label for="password" class="block text-sm font-medium text-violet-200 mb-2">Password <span class="text-red-600">*</span></label>
          <div class="relative">
            <input type="password" id="password" name="password" required maxlength="128"
              class="w-full px-4 py-2 pr-20 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent" />
            <button type="button" id="togglePassword" class="absolute inset-y-0 right-0 px-3 text-sm text-violet-200 hover:text-violet-100 font-medium">Show</button>
          </div>
          <p id="password-live-error" class="mt-1 text-sm text-red-600 hidden"></p>
          
          <!-- Password Requirements Checklist -->
          <div class="mt-3 p-3 bg-purple-900/50 border border-violet-300/20 rounded-lg">
            <p class="text-xs font-semibold text-violet-200 mb-2">Password must contain:</p>
            <ul class="space-y-1 text-sm">
              <li class="flex items-center" id="req-length">
                <span class="inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs">✓</span>
                <span class="text-violet-300">At least 12 characters</span>
              </li>
              <li class="flex items-center" id="req-upper">
                <span class="inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs">✓</span>
                <span class="text-violet-300">Uppercase letter (A-Z)</span>
              </li>
              <li class="flex items-center" id="req-lower">
                <span class="inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs">✓</span>
                <span class="text-violet-300">Lowercase letter (a-z)</span>
              </li>
              <li class="flex items-center" id="req-number">
                <span class="inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs">✓</span>
                <span class="text-violet-300">Number (0-9)</span>
              </li>
              <li class="flex items-center" id="req-special">
                <span class="inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs">✓</span>
                <span class="text-violet-300">Special character (@$!%*?&)</span>
              </li>
              <li class="flex items-center" id="req-max">
                <span class="inline-flex items-center justify-center w-4 h-4 mr-2 rounded-full bg-gray-300 text-white text-xs">✓</span>
                <span class="text-violet-300">No more than 128 characters</span>
              </li>
            </ul>
          </div>
        </div>

        <!-- Confirm Password Field -->
        <div>
          <label for="confirmPassword" class="block text-sm font-medium text-violet-200 mb-2">Confirm Password <span class="text-red-600">*</span></label>
          <div class="relative">
            <input type="password" id="confirmPassword" name="confirmPassword" required maxlength="128"
              class="w-full px-4 py-2 pr-20 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent" />
            <button type="button" id="toggleConfirmPassword" class="absolute inset-y-0 right-0 px-3 text-sm text-violet-200 hover:text-violet-100 font-medium">Show</button>
          </div>
          <p id="confirmPassword-live-error" class="mt-1 text-sm text-red-600 hidden"></p>
        </div>

        <!-- Submit Button -->
        <button id="submitButton" type="submit" class="w-full bg-violet-400 hover:bg-violet-300 disabled:bg-violet-900/60 disabled:text-violet-400 disabled:cursor-not-allowed text-purple-950 font-semibold py-2 px-4 rounded-lg transition duration-200 mt-6">
          Submit Access Request
        </button>

      </form>

      <!-- Error Message -->
      <c:if test="${error != null}">
        <div class="mt-4 p-3 bg-fuchsia-900/40 border border-fuchsia-400/40 text-fuchsia-100 rounded-lg">
          <c:out value="${error}" />
        </div>
      </c:if>

      <!-- Success Message -->
      <c:if test="${param.created == 'true'}">
        <div class="mt-4 p-3 bg-violet-900/40 border border-violet-300/40 text-violet-100 rounded-lg">
          Access request approved. You can now log in.
        </div>
      </c:if>

      <!-- Login Link -->
      <div class="mt-6 text-center">
        <p class="text-violet-200">Already have access? 
          <a href="login" class="text-fuchsia-300 hover:text-fuchsia-200 font-semibold">Log in</a>
        </p>
      </div>
    </div>
  </div>

  <script>
    const registerForm = document.getElementById('registerForm');
    const submitButton = document.getElementById('submitButton');
    const usernameInput = document.getElementById('username');
    const firstNameInput = document.getElementById('firstName');
    const lastNameInput = document.getElementById('lastName');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const togglePasswordButton = document.getElementById('togglePassword');
    const toggleConfirmPasswordButton = document.getElementById('toggleConfirmPassword');

    const FIELD_DEFAULT_CLASS = 'w-full px-4 py-2 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent';
    const FIELD_ERROR_CLASS = 'w-full px-4 py-2 border border-fuchsia-400 rounded-lg bg-purple-900/50 text-violet-100 focus:outline-none focus:ring-2 focus:ring-fuchsia-400 focus:border-transparent';
    const touched = {
      username: false,
      firstName: false,
      lastName: false,
      email: false,
      password: false,
      confirmPassword: false
    };
    let hasSubmitted = false;
    
    function updatePasswordChecklist() {
      const password = passwordInput.value;
      
      // Check each requirement
      const hasLength = password.length >= 12;
      const hasUpper = /[A-Z]/.test(password);
      const hasLower = /[a-z]/.test(password);
      const hasNumber = /\d/.test(password);
      const hasSpecial = /[@$!%*?&]/.test(password);
      const hasMaxLength = password.length <= 128;
      
      // Update UI for each requirement
      updateRequirement('req-length', hasLength);
      updateRequirement('req-upper', hasUpper);
      updateRequirement('req-lower', hasLower);
      updateRequirement('req-number', hasNumber);
      updateRequirement('req-special', hasSpecial);

      updateRequirement('req-max', hasMaxLength);

      return hasLength && hasUpper && hasLower && hasNumber && hasSpecial && hasMaxLength;
    }
    
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

    function validateUsername(showError) {
      const value = usernameInput.value.trim();
      const errorEl = document.getElementById('username-live-error');
      let error = '';

      if (!value) {
        error = 'Username is required';
      } else if (!/^[a-zA-Z0-9_]{3,50}$/.test(value)) {
        error = 'Username must be 3-50 characters and contain only letters, numbers, and underscores';
      }

      setFieldState(usernameInput, errorEl, error, showError);
      return !error;
    }

    function validateName(inputEl, fieldName, errorId, showError) {
      const value = inputEl.value.trim();
      const errorEl = document.getElementById(errorId);
      let error = '';

      if (!value) {
        error = fieldName + ' is required';
      } else if (value.length > 50) {
        error = fieldName + ' must be between 1 and 50 characters';
      } else if (!/^[a-zA-Z\s'-]{1,50}$/.test(value)) {
        error = fieldName + ' can only contain letters, spaces, hyphens, and apostrophes';
      }

      setFieldState(inputEl, errorEl, error, showError);
      return !error;
    }

    function validateEmail(showError) {
      const value = emailInput.value.trim();
      const errorEl = document.getElementById('email-live-error');
      let error = '';

      if (!value) {
        error = 'Email is required';
      } else if (value.length > 255 || !/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(value)) {
        error = 'Invalid email address';
      }

      setFieldState(emailInput, errorEl, error, showError);
      return !error;
    }

    function validatePassword(showError) {
      const isValid = updatePasswordChecklist();
      const errorEl = document.getElementById('password-live-error');

      // Password feedback is shown via checklist; no verbose inline error text.
      setFieldState(passwordInput, errorEl, '', showError && !isValid);
      return isValid;
    }

    function validateConfirmPassword(showError) {
      const value = confirmPasswordInput.value;
      const passwordValue = passwordInput.value;
      const errorEl = document.getElementById('confirmPassword-live-error');
      let error = '';

      if (!value) {
        error = 'Please confirm your password';
      } else if (value !== passwordValue) {
        error = 'Passwords do not match';
      }

      setFieldState(confirmPasswordInput, errorEl, error, showError);
      return !error;
    }

    function validateAllFields() {
      const isUsernameValid = validateUsername(touched.username || hasSubmitted);
      const isFirstNameValid = validateName(firstNameInput, 'First Name', 'firstName-live-error', touched.firstName || hasSubmitted);
      const isLastNameValid = validateName(lastNameInput, 'Last Name', 'lastName-live-error', touched.lastName || hasSubmitted);
      const isEmailValid = validateEmail(touched.email || hasSubmitted);
      const isPasswordValid = validatePassword(touched.password || hasSubmitted);
      const isConfirmPasswordValid = validateConfirmPassword(touched.confirmPassword || hasSubmitted);

      const isFormValid = isUsernameValid && isFirstNameValid && isLastNameValid && isEmailValid && isPasswordValid && isConfirmPasswordValid;
      submitButton.disabled = !isFormValid;
      return isFormValid;
    }

    function handleBlur(fieldName) {
      touched[fieldName] = true;
      validateAllFields();
    }

    function togglePasswordVisibility(inputEl, buttonEl) {
      const isPassword = inputEl.type === 'password';
      inputEl.type = isPassword ? 'text' : 'password';
      buttonEl.textContent = isPassword ? 'Hide' : 'Show';
    }
    
    // Live validation handlers
    usernameInput.addEventListener('input', validateAllFields);
    firstNameInput.addEventListener('input', validateAllFields);
    lastNameInput.addEventListener('input', validateAllFields);
    emailInput.addEventListener('input', validateAllFields);
    passwordInput.addEventListener('input', validateAllFields);
    confirmPasswordInput.addEventListener('input', validateAllFields);

    usernameInput.addEventListener('blur', () => handleBlur('username'));
    firstNameInput.addEventListener('blur', () => handleBlur('firstName'));
    lastNameInput.addEventListener('blur', () => handleBlur('lastName'));
    emailInput.addEventListener('blur', () => handleBlur('email'));
    passwordInput.addEventListener('blur', () => handleBlur('password'));
    confirmPasswordInput.addEventListener('blur', () => handleBlur('confirmPassword'));

    togglePasswordButton.addEventListener('click', () => togglePasswordVisibility(passwordInput, togglePasswordButton));
    toggleConfirmPasswordButton.addEventListener('click', () => togglePasswordVisibility(confirmPasswordInput, toggleConfirmPasswordButton));

    registerForm.addEventListener('submit', (event) => {
      hasSubmitted = true;
      if (!validateAllFields()) {
        event.preventDefault();
      }
    });

    // Initial state
    validateAllFields();
  </script>
</body>
</html>