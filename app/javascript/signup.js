document.addEventListener("DOMContentLoaded", () => {
    const phone_number = document.querySelector("input[data-validate-phone]");
    phone_number.addEventListener("input", e => {
      if (valid_phone_number(phone_number.value)) {
        // check with the server if already used
        phone_number.classList.remove("invalid");
        console.log("valid")
        confirm_phone_unique(phone_number.value);
      } else {
        // show user it is invalid
        console.log("invalid");
        phone_number.classList.add("invalid");
      }
    });
  });
  function valid_phone_number(number) {
    const regex = /\d{9,}/;
    return regex.test(number);
  }
  function confirm_phone_unique(number) {
    fetch(`/url?number=${number}`).then(data => {
      console.log(data);
    });
}