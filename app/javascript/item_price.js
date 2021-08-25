
function priceCheck(){
  const getPrice = document.getElementById("item-price")
  getPrice.addEventListener("input", () => {
    const inputValue = getPrice.value;
    const tax = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    tax.innerHTML = Math.floor(inputValue * 0.10)
    profit.innerHTML = Math.floor(inputValue - tax.innerHTML) 
    
  })
}
window.addEventListener("load", priceCheck);