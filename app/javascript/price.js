function price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", (e) =>{
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

  const priceProfit = document.getElementById("profit");
  priceProfit.innerHTML = ( priceInput.value - Math.floor(inputValue * 0.1));
  e.preventDefault();
  });
}
window.addEventListener("load", price)