const pay = () => {
Payjp.setPublicKey("pk_test_d796fa8fac7e21e4e5c8f3c1");
const form = document.getElementById("charge-form");
form.addEventListener("submit", (e) => {
  e.preventDefault();
const formResult = document.getElementById("charge-form");
const formData = new FormData(formResult);

const card = {
  number: formData.get("order_buyer[card_number]"),
  cvc: formData.get("order_buyer[card_cvc]"),
  exp_month: formData.get("order_buyer[card_month]"),
  exp_year: `20${formData.get("order_buyer[card_year]")}`,
};

 Payjp.createToken(card, (status, response) => {
   if (status == 200) {
     const token = response.id;
     const renderDom = document.getElementById("charge-form");
     const tokenObj = `<input value=${token} type="hidden" name='token' >`;
     renderDom.insertAdjacentHTML("beforeend", tokenObj);
   }
     document.getElementById("card-number").removeAttribute("name");
     document.getElementById("card-exp-month").removeAttribute("name");
     document.getElementById("card-exp-year").removeAttribute("name");
     document.getElementById("card-cvc").removeAttribute("name");

     document.getElementById("charge-form").submit();
 });
});
};

window.addEventListener("load", pay);