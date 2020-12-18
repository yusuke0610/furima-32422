window.addEventListener('load', function() {

  const value = document.getElementById("item-price");
  var fee = document.getElementById("add-tax-price");
  var profit = document.getElementById("profit");
  
  
    value.addEventListener('input',function(){
      const inputValue = document.getElementById("item-price").value;
      fee.innerHTML = parseInt(inputValue) * parseFloat(0.1);
      profit.innerHTML = parseInt(inputValue) - parseInt(fee.innerHTML);
      })
    })
    

    
           