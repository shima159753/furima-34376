function price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () =>{
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();

  const priceProfit = document.getElementById("profit");
  priceProfit.innerHTML = ( priceInput.value - Math.floor(inputValue * 0.1)).toLocaleString();
  });
}
window.addEventListener("load", price);