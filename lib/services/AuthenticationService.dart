

class AuthenticationService {
  Future<bool> authenticate({required String username, required String password}) async {
    // Simulate authentication with hardcoded credentials
    if (username == 'hardcodeduser' && password == 'hardcodedpassword') {
      return true; // Authentication successful
    } else {
      return false; // Authentication failed
    }
  }
}