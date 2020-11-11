window.addEventListener('input', () => {
  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor( inputValue / 10);
  const inputProfit = document.getElementById("profit");
  inputProfit.innerHTML = Math.floor( inputValue * 0.9);
});
});