window.addEventListener('load', () => {
  console.log("OK");


  
});

window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
// console.log(priceInput);
// });
//２回CONSTできない
// window.addEventListener('load', () => {
// const priceInput = document.getElementById("item_price");

priceInput.addEventListener('input', () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const tax = 0.01
  const sumPrice = inputValue * tax
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(sumPrice);

  const profit = document.getElementById("profit");
  const sumProfit = inputValue * 1.01;
  profit.innerHTML = (sumProfit);
});

})
