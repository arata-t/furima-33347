const pay = () => {
  Payjp.setPublicKey("pk_test_d1c8448ced1a8a4074b03dbc");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("item_order[number]"),
      cvc: formData.get("item_order[cvc]"),
      exp_month: formData.get("item_order[exp_month]"),
      exp_year: `20${formData.get("item_order[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);