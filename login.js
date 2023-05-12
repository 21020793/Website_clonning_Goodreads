function setFormMessage(formElement, type, message){
    const messageElement = formElement.querySelector(".form-message");

    messageElement.textContent = message;
    messageElement.classList.remove("form-message_success", "form-message_error");
    messageElement.classList.add("form-message_${type}");
}

function setInputError(inputElement, message) {
    inputElement.classList.add("form-input_error");
    inputElement.parentElement.querySelector(".form-input_error_message").textContent = message;
}

function clearInputError(inputElement){
    inputElement.classList.remove("form-input_error");
    inputElement.parentElement.querySelector(".form-input_error_message").textContent = "";
}

document.addEventListener("DOMContentLoaded", ()=> {
    const loginForm = document.querySelector("#login");
    const registerForm = document.querySelector("#createAccount");

    document.querySelector("#linkCreateAccount").addEventListener("click" , e =>{
        e.preventDefault();
        loginForm.classList.add("form-hidden");
        registerForm.classList.remove("form-hidden");
    });

    document.querySelector("#linkLogin").addEventListener("click" , e =>{
        e.preventDefault();
        loginForm.classList.remove("form-hidden");
        registerForm.classList.add("form-hidden");
    });

    loginForm.addEventListener("submit", e =>{
        e.preventDefault();

        // perform AJAX/fetch login

        setFormMessage(loginForm, "error", "Invalid username/password combination");
    });

    document.querySelectorAll(".form-input").forEach(inputElement => {
        inputElement.addEventListener("blur", e =>{
            if (e.target.id === "signupUsername" && e.target.value.length > 0 && e.target.value.length < 10){
                setInputError(inputElement, "Username must be at least 10 character length");
            }

            if (e.target.id === "signupPassword" && e.target.value.length > 0 && e.target.value.length < 8){
                setInputError(inputElement, "Password must be at least 8 character length");
            }
        });

        inputElement.addEventListener("input", e => {
            clearInputError(inputElement);
        })
    });
});