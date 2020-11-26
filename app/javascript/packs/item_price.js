// window.addEventListener('load', () => {
//   console.log("OK");
// });

window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");

priceInput.addEventListener('input', () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const tax = 0.1;
  const sumPrice = inputValue * tax;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(sumPrice);

  const profit = document.getElementById("profit");
  const sumProfit = inputValue * 1.1;
  profit.innerHTML = Math.floor(sumProfit);
});

})
