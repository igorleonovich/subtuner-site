function isAuthorized() {
  var accessToken = window.sessionStorage.getItem('accessToken');
  if (accessToken) {
    return true;
  } else {
    return false;
  }
}
