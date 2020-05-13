function logIn() {
  var logInUrl = "http://dev-subtuner.com:8090/v1/users/login"

  var emailElement = document.getElementById('email');
  var passwordElement = document.getElementById('password');
  var email = emailElement.value;
  var password = passwordElement.value;

  var xhr = createCORSRequest('POST', logInUrl);
  xhr.addEventListener('load', function() {
    var responseObject = JSON.parse(this.response);
    if (debug == true) {
      console.log('Received:', this.response);
    }
    if (responseObject.accessToken) {
      localStorage.setItem('accessToken', responseObject.accessToken);
      localStorage.setItem('refreshToken', responseObject.refreshToken);
      window.open('console', "_self");
    } else {
      console.log("Error: Cannot parse tokens");
    }
    document.getElementById('main-container-overlay').style.display = "none";
  });

  var sendObject = JSON.stringify({email: email, password: password});

  if (debug == true) {
    console.log('Send:', sendObject);
  }
  xhr.send(sendObject);
  document.getElementById('main-container-overlay').style.display = "block";
}
