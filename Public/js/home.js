function clickMenu() {
  var menuPopup = document.querySelector('#menu-popup');
  var opened = menuPopup.dataset.opened;
  if (opened == "true") {
    menuPopup.style.display = "none";
    menuPopup.dataset.opened = "false";
    enableScroll();
  } else {
    menuPopup.style.display = "block";
    menuPopup.dataset.opened = "true";
    disableScroll();
  }
}

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
