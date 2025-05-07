const minusBtn = document.getElementById('minus-btn');
const plusBtn = document.getElementById('plus-btn');
const qtyInput = document.getElementById('qty-input');

plusBtn.addEventListener('click', function () {
    let current = parseInt(qtyInput.value, 10);
    qtyInput.value = current + 1;
});

minusBtn.addEventListener('click', function () {
    let current = parseInt(qtyInput.value, 10);
    if (current > 1) {
        qtyInput.value = current - 1;
    }
});

// POPUP BOX PAYMENT

document.addEventListener("DOMContentLoaded", function () {
    let cashInputField = document.getElementsByClassName("input-field")[0];
    cashInputField.addEventListener("input", validateCashInput);
});

function showPopup() {
    document.getElementById("paymentPopup").style.display = "flex";

    const inputField = document.getElementsByClassName("input-field")[0];
    inputField.value = "";
    document.getElementsByClassName("btn-proceed")[0].disabled = true;
    document.getElementsByClassName("warning")[0].style.display = "block";
}

function hidePopup() {
    document.getElementById("paymentPopup").style.display = "none";
}

function validateCashInput() {
    let cashInput = document.getElementsByClassName("input-field")[0].value;
    let payment_total = document.getElementById("payment-total").textContent.replace("Php", "").trim();

    let numericPayment = parseFloat(payment_total);
    let numericCash = parseFloat(cashInput);

    let warningEl = document.getElementsByClassName("warning")[0];
    let proceedBtn = document.getElementsByClassName("btn-proceed")[0];

    console.log(numericCash);
    console.log(numericPayment);

    if (Number.isNaN(numericCash) || numericCash < numericPayment) { 
        warningEl.style.display = "block";
        proceedBtn.disabled = true;
    } else {
        warningEl.style.display = "none";
        proceedBtn.disabled = false;
    }
}