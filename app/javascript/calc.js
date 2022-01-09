function calc(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input",()=>{
    const inputPrice = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const commission = inputPrice * 0.1;
    addTaxPrice.innerHTML = commission;
    const profit = document.getElementById("profit");
    profit.innerHTML = inputPrice - commission;
  })
};

window.addEventListener("load" , calc);