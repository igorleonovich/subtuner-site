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
      window.sessionStorage.setItem('accessToken', responseObject.accessToken);
      window.sessionStorage.setItem('refreshToken', responseObject.refreshToken);
      window.open('console', "_self");
    } else {
      console.log("Error: Cannot parse tokens");
    }
    document.getElementById('main-container-overlay').style.display = "none";
  });

  const signUpOutput = {
    username: username,
    email: email,
    password: password
  }
  var sendObject = JSON.stringify(signUpOutput);

  if (debug == true) {
    console.log('Send:', sendObject);
  }
  xhr.send(sendObject);
  document.getElementById('main-container-overlay').style.display = "block";
}
