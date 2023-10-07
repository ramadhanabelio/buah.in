document.addEventListener("DOMContentLoaded", function () {
  const usernameInput = document.getElementById("username");
  const passwordInput = document.getElementById("password");
  const password2Input = document.getElementById("password2");
  const passwordVisibilityToggle = document.getElementById("password-visibility-toggle");
  const passwordVisibilityIcon = document.getElementById("password-visibility-icon");
  const password2VisibilityToggle = document.getElementById("password2-visibility-toggle");
  const password2VisibilityIcon = document.getElementById("password2-visibility-icon");

  // Validasi saat form di-submit
  document.querySelector("form").addEventListener("submit", function (event) {
    let hasError = false;

    if (!validateUsername(usernameInput.value)) {
      event.preventDefault(); // Mencegah form submit
      hasError = true;
    }

    if (!validatePassword(passwordInput.value)) {
      event.preventDefault(); // Mencegah form submit
      hasError = true;
    }

    if (!validateConfirmPassword(passwordInput.value, password2Input.value)) {
      event.preventDefault(); // Mencegah form submit
      hasError = true;
    }

    if (hasError) {
      setTimeout(function () {
        hideValidationMessage();
      }, validationDuration);
    }
  });

  // Validasi saat input kehilangan fokus
  usernameInput.addEventListener("blur", function () {
    if (!validateUsername(usernameInput.value)) {
      setTimeout(function () {
        hideValidationMessage();
      }, validationDuration);
    }
  });

  passwordInput.addEventListener("blur", function () {
    if (!validatePassword(passwordInput.value)) {
      setTimeout(function () {
        hideValidationMessage();
      }, validationDuration);
    }
  });

  password2Input.addEventListener("blur", function () {
    if (!validateConfirmPassword(passwordInput.value, password2Input.value)) {
      setTimeout(function () {
        hideValidationMessage();
      }, validationDuration);
    }
  });

  // Toggle visibilitas password
  passwordVisibilityToggle.addEventListener("click", function () {
    togglePasswordVisibility(passwordInput, passwordVisibilityIcon);
  });

  password2VisibilityToggle.addEventListener("click", function () {
    togglePasswordVisibility(password2Input, password2VisibilityIcon);
  });

  // Validasi username
  function validateUsername(username) {
    const regex = /^[a-zA-Z0-9]{5,}$/;
    return regex.test(username);
  }

  // Validasi password
  function validatePassword(password) {
    return password.length >= 8;
  }

  // Validasi konfirmasi password
  function validateConfirmPassword(password, confirmPassword) {
    return password === confirmPassword;
  }

  // Sembunyikan pesan validasi
  function hideValidationMessage() {
    const validationElements = document.getElementsByClassName("fade");
    Array.from(validationElements).forEach(function (element) {
      element.textContent = "";
      element.classList.remove("fade");
    });
  }

  // Toggle visibilitas password
  function togglePasswordVisibility(inputElement, visibilityIcon) {
    if (inputElement.type === "password") {
      inputElement.type = "text";
      visibilityIcon.classList.remove("fa-eye");
      visibilityIcon.classList.add("fa-eye-slash");
    } else {
      inputElement.type = "password";
      visibilityIcon.classList.remove("fa-eye-slash");
      visibilityIcon.classList.add("fa-eye");
    }
  }
});
