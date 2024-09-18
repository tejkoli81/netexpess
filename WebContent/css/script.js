document.addEventListener('DOMContentLoaded', function() {
  const paymentMethod = document.getElementById('payment-method');
  const cardFields = document.querySelectorAll('.card-fields');
  const upiFields = document.querySelector('.upi-fields');
  const paymentForm = document.querySelector('.payment-form');
  const cardNumberInput = document.getElementById('card-number');
  const expirationDateInput = document.getElementById('expiration-date');
  const cvvInput = document.getElementById('cvv');
  const upiIdInput = document.getElementById('upi-id');

  // Function to toggle visibility of card fields and UPI fields
  function toggleFields() {
    if (paymentMethod.value === 'card') {
      cardFields.forEach(field => field.style.display = 'block');
      upiFields.style.display = 'none';
    } else if (paymentMethod.value === 'upi') {
      cardFields.forEach(field => field.style.display = 'none');
      upiFields.style.display = 'block';
    }
  }

  // Initial call to toggle fields based on default selection
  toggleFields();

  // Event listener to toggle fields when payment method changes
  paymentMethod.addEventListener('change', toggleFields);
/*
  // Event listener for form submission
  paymentForm.addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent form submission for now

    // Validate based on selected payment method
    if (paymentMethod.value === 'card') {
      if (!isValidCardNumber(cardNumberInput.value)) {
        alert('Please enter a valid card number.');
        return;
      }
      if (!isValidExpirationDate(expirationDateInput.value)) {
        alert('Please enter a valid expiration date in MM/YYYY format.');
        return;
      }
      if (!isValidCVV(cvvInput.value)) {
        alert('Please enter a valid CVV.');
        return;
      }
    } else if (paymentMethod.value === 'upi') {
      if (!upiIdInput.value.trim()) {
        alert('Please enter a valid UPI ID.');
        return;
      }
    }

    // If all validations pass, submit the form
    alert('Payment submitted successfully!');
    paymentForm.reset(); // Reset the form
  });
*/
  // Function to validate card number (simple validation for demonstration)
  function isValidCardNumber(cardNumber) {
    return /^\d{16}$/.test(cardNumber); // Simple validation for 16-digit card numbers
  }

  // Function to validate expiration date (simple validation for demonstration)
  function isValidExpirationDate(expirationDate) {
    return /^\d{2}\/\d{4}$/.test(expirationDate); // Simple validation for MM/YYYY format
  }

  // Function to validate CVV (simple validation for demonstration)
  function isValidCVV(cvv) {
    return /^\d{3}$/.test(cvv); // Simple validation for 3-digit CVV
  }
});
 