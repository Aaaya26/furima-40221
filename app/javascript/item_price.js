const itemPrice = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", function() {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    const sellProfitDom = document.getElementById("profit");
    sellProfitDom.innerHTML = inputValue - Math.floor(inputValue / 10);
  });
};

window.addEventListener('turbo:load', itemPrice);
window.addEventListener("turbo:render", itemPrice);