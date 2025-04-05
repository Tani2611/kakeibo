import "@hotwired/turbo-rails"
import "controllers"

console.log("こんにちは")


document.addEventListener('turbo:load', function() {
  const category = document.querySelector('#category');
  const paymentContainer = document.querySelector('#payment-container');

  const submitButton = paymentContainer.querySelector('input[type="submit"]');

  category.addEventListener('change', function() {
    const paymentCategory = document.querySelector('#payment');
    if (paymentCategory) paymentCategory.remove();

    if (category.value) {
      const selectedTemplate = document.querySelector(`#payment-of-category${category.value}`);
      if (selectedTemplate) {
        const clonedSelect = selectedTemplate.content.cloneNode(true);
        const selectElement = clonedSelect.querySelector('select');
        if (selectElement) {
          selectElement.classList.add('select');
        }
        paymentContainer.insertBefore(clonedSelect, submitButton);
      }
    } else {
      const defaultSubSelect = document.createElement('select');
      defaultSubSelect.id = 'payment';
      defaultSubSelect.classList.add('select');
      defaultSubSelect.innerHTML = '<option value="">Payment</option>';
      paymentContainer.insertBefore(defaultSubSelect, submitButton);
    }
  });
});