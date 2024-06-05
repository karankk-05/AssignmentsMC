import 'package:flutter/material.dart';
import '../colors_decorations/appcolors.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/TextFields.dart';
import '../widgets/Auth/LoginButton.dart'; // Import the new login button widget

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(gradient: gradients.login),
          ),
          Center(
            child: Image.asset('assets/logo.png', height: 100, width: 50)
                .animate()
                .scale(
                  begin: Offset(0, 0),
                  end: Offset(3, 3),
                  curve: Cubic(0.5, 0, 0, 1),
                  duration: 1500.milliseconds,
                )
                .fadeOut(
                  delay: 2.seconds,
                  duration: 500.milliseconds,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Log In',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontFamily: 'OpenSans',
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    fields.TextField(
                        controller: emailController,
                        label: 'Email',
                        secure: false),
                    SizedBox(
                      height: 30.0,
                    ),
                    fields.TextField(
                        controller: passwordController,
                        label: 'Password',
                        secure: true),
                    SizedBox(height: 20),
                   
                    LoginButton( // Use the new LoginButton widget
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 2200.milliseconds),
            ),
          )
        ],
      ),
    );
  }
}
