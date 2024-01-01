import 'package:flutter/material.dart';
import 'package:new_proj/services/AuthenticationService.dart';

import 'HomePage/HomePage.dart';
import 'components/RoundedInputField.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthenticationService _authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Image.asset(
                  'assets/logo.jpeg', // Replace with the actual image asset path
                  height: 200.0,
                  width: 200.0,
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  RoundedInputField(
                    labelText: 'Username',
                    obscureText: false,
                    borderRadius: 40.0,
                    controller: _usernameController,
                  ),
                  SizedBox(height: 16.0),
                  RoundedInputField(
                    labelText: 'Password',
                    obscureText: true,
                    borderRadius: 40.0,
                    controller: _passwordController,
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Implement forgot password functionality here
                        },
                        child: Text('Forgot Password?'),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Print username and password before attempting login
                          print('Username: ${_usernameController.text}');
                          print('Password: ${_passwordController.text}');

                          // Implement login functionality here
                          _performLogin();
                        },
                        child: Text('Login'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Implement login via OTP functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue, // Change color as needed
                        ),
                        child: Text('Login via OTP'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performLogin() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final bool isAuthenticated = await _authenticationService.authenticate(
      username: username,
      password: password,
    );

    if (isAuthenticated) {
      // Navigate to the new page upon successful authentication
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      // Show an error message or handle authentication failure
      print('Authentication failed');
    }
  }
}