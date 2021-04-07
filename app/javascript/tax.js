function tax() {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener('keyup', () => {
      const price = priceInput.value;
      const addTaxPrice = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");
      const taxPrice = Math.round(price * 0.1);
      const saleProfit = Math.round(price - taxPrice);
      
      addTaxPrice.innerHTML = taxPrice;
      profit.innerHTML = saleProfit; 
  });
}
window.addEventListener("load", tax);