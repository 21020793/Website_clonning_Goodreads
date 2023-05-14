function setFormMessage(formElement, type, message) {
    const messageElement = formElement.querySelector(".form-message");

    messageElement.textContent = message;
    messageElement.classList.remove("form-message_success", "form-message_error");
    messageElement.classList.add("form-message_${type}");
}

function setInputError(inputElement, message) {
    inputElement.classList.add("form-input_error");
    inputElement.parentElement.querySelector(".form-input_error_message").textContent = message;
}

function clearInputError(inputElement) {
    inputElement.classList.remove("form-input_error");
    inputElement.parentElement.querySelector(".form-input_error_message").textContent = "";
}

document.addEventListener("DOMContentLoaded", () => {
    const loginForm = document.querySelector("#login");
    const registerForm = document.querySelector("#createAccount");
    let hasError = [false, false, false]; // check if there is any error in sign up form

    document.querySelector("#linkCreateAccount").addEventListener("click", e => {
        e.preventDefault();
        loginForm.classList.add("form-hidden");
        registerForm.classList.remove("form-hidden");
    });

    document.querySelector("#linkLogin").addEventListener("click", e => {
        e.preventDefault();
        loginForm.classList.remove("form-hidden");
        registerForm.classList.add("form-hidden");
    });

    loginForm.addEventListener("submit", e => {
        e.preventDefault();

        // perform AJAX/fetch login
        var username = document.getElementById("loginUsername").value;
        var password = document.getElementById("loginPassword").value;
        // Tạo đối tượng XMLHttpRequest
        var xml = new XMLHttpRequest();

        // Xử lý sự kiện khi nhận phản hồi từ server
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                if (this.responseText === "fail") {
                    setFormMessage(loginForm, "error", "Invalid username/password combination");
                } else {
                    localStorage.setItem("username", username);
                    localStorage.setItem("id", this.responseText);
                    window.location.href = "index.html";
                }
            }
        };

        // Gửi yêu cầu POST tới file PHP
        xml.open("POST", "login.php", true);
        xml.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xml.send("username=" + username + "&password=" + password);
    });

    registerForm.addEventListener("submit", e => {
        e.preventDefault();

        if (hasError.some(error => error)) {
            return;
        }

        var username = document.getElementById("signupUsername").value;
        var password = document.getElementById("signupPassword").value;
        var email = document.getElementById("signupEmail").value;

        // Tạo đối tượng XMLHttpRequest
        var xml = new XMLHttpRequest();

        // Xử lý sự kiện khi nhận phản hồi từ server
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                if (this.responseText === "success") {
                    document.querySelector("#linkLogin").click();
                    setFormMessage(loginForm, "register success", "Account created successfully. Ready to log in.");
                } else {
                    setFormMessage(registerForm, "error", this.responseText);
                }
            }
        };

        // Gửi yêu cầu POST tới file PHP
        xml.open("POST", "signup.php", true);
        xml.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xml.send("username=" + username + "&password=" + password + "&email=" + email);
    });

    document.querySelectorAll(".form-input").forEach(inputElement => {
        inputElement.addEventListener("blur", e => {
            if (e.target.id === "signupUsername" && e.target.value.length > 0 && e.target.value.length < 10) {
                setInputError(inputElement, "Username must be at least 10 characters long");
                hasError[0] = true;
            }

            if (e.target.id === "signupPassword" && e.target.value.length > 0 && e.target.value.length < 8) {
                setInputError(inputElement, "Password must be at least 8 characters long");
                hasError[1] = true;
            }

            if (e.target.id === "signupEmail" && e.target.value.length > 0) {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(e.target.value)) {
                    setInputError(inputElement, "Invalid email format");
                    hasError[2] = true;
                }
            }
        });

        inputElement.addEventListener("input", e => {
            clearInputError(inputElement);
            const inputIndex = Array.from(document.querySelectorAll(".form-input")).indexOf(inputElement);
            hasError[inputIndex] = false;
        });
    });

});