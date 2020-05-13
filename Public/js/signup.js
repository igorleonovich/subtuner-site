function signUp() {
  var signUpUrl = "http://dev-subtuner.com:8090/v1/users/register"

  var usernameElement = document.getElementById('username');
  var emailElement = document.getElementById('email');
  var passwordElement = document.getElementById('password');
  var username = usernameElement.value;
  var email = emailElement.value;
  var password = passwordElement.value;

  var xhr = createCORSRequest('POST', signUpUrl);
  xhr.addEventListener('load', function() {
    var responseObject = JSON.parse(this.response);
    if (debug == true) {
      console.log('Received:', this.response);
    }
    if (responseObject.accessToken) {
      localStorage.setItem('accessToken', responseObject.accessToken);
      localStorage.setItem('refreshToken', responseObject.refreshToken);
    } else {
      console.log("Error: Cannot parse tokens");
    }
  });

  var sendObject = JSON.stringify({username: username, email: email, password: password});

  if (debug == true) {
    console.log('Send:', sendObject);
  }
  xhr.send(sendObject);
}
