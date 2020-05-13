window.onload = function() {
  refreshAccountPopup();
}

function refreshAccountPopup() {
  var htmlFile = new XMLHttpRequest();
  htmlFile.open("GET", "html/account-popup-guest.html", true);
  htmlFile.onreadystatechange = function() {
    if (htmlFile.readyState === 4) {  // Makes sure the document is ready to parse.
      if (htmlFile.status === 200) {  // Makes sure it's found the file.
        var accountPopup = document.getElementById("account-popup");
        accountPopup.innerHTML = htmlFile.responseText;
      }
    }
  }
  htmlFile.send(null);
}
