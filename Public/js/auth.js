function isAuthorized() {
  var accessToken = window.localStorage.getItem('accessToken');
  if (accessToken) {
    return true;
  } else {
    return false;
  }
}
