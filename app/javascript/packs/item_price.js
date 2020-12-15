window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");

priceInput.addEventListener('input', () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const fee = 0.1;
  const cost = inputValue * fee;
  const addTaxDom = document.getElementById("add-tax-price");
  const costFee = Math.floor(cost);
  addTaxDom.innerHTML = costFee

  const profit = document.getElementById("profit");
  const sumProfit = inputValue - costFee ;
  profit.innerHTML = Math.floor(sumProfit);
});

})
