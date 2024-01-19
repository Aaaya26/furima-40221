window.addEventListener('turbo:load', function() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", function() {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue/10);
    const sellProfitDom = document.getElementById("profit");
    sellProfitDom.innerHTML = inputValue - (inputValue/10);
    console.log(sellProfitDom);
  });
});