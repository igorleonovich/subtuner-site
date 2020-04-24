function clickAccount() {
  var accountPopup = document.querySelector('#account-popup');
  var haspopup = accountPopup.dataset.haspopup;
  if (haspopup == "true") {
    accountPopup.style.display = "none";
    accountPopup.dataset.haspopup = "false";
  } else {
    accountPopup.style.display = "block";
    accountPopup.dataset.haspopup = "true";
  }
}
