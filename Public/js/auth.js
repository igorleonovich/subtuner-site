function signUp() {
  var loginUrl = "http://localhost:8080/v1/users/register"
  var xhr = new XMLHttpRequest();
  var usernameElement = document.getElementById('username');
  var emailElement = document.getElementById('email');
  var passwordElement = document.getElementById('password');
  var username = usernameElement.value;
  var email = emailElement.value;
  var password = passwordElement.value;

  xhr.open('POST', loginUrl, true);
  xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
  xhr.addEventListener('load', function() {
    var responseObject = JSON.parse(this.response);
    console.log('Received:', responseObject);
    if (responseObject.accessToken) {
      localStorage.setItem('accessToken', responseObject.accessToken);
      localStorage.setItem('refreshToken', responseObject.refreshToken);
    } else {
      console.log("Error");
    }
  });

  var sendObject = JSON.stringify({username: username, email: email, password: password});

  console.log('Send:', sendObject);

  xhr.send(sendObject);
}
