import 'package:flutter/material.dart';
import '../colors_decorations/appcolors.dart';
import '../colors_decorations/decorations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'homepage.dart';
import '../widgets/fields.dart';
import '../services/login_service.dart';

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool? _rememberMe = false;

  Widget _RememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: Theme.of(context),
            child: Checkbox(
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
              checkColor: Colors.green,
              activeColor: Colors.white,
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  bool isLoading = false;
  Widget _LoginBtn({required bool isLoading}) {
    // Pass isLoading as a parameter
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () async {
          // Set isLoading to true to show the progress indicator

          setLoading(true); // Update the loading state
          await login(emailController.text, passwordController.text, context);
          // Set isLoading to false after the login process completes
          setLoading(false); // Update the loading state
        },
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(Size(100, 60)),
          backgroundColor: WidgetStateProperty.all<Color>(
              Color.fromARGB(255, 253, 253, 253)),
        ),
        icon: Icon(null), // Icon to be displayed on the left side
        label:
            _LoginButtonLabel(isLoading: isLoading), // Pass the isLoading flag
      ),
    );
  }

  void setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

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
                    _RememberMeCheckbox(),
                    _LoginBtn(isLoading: isLoading),
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

class _LoginButtonLabel extends StatelessWidget {
  final bool isLoading;

  const _LoginButtonLabel({Key? key, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Spacing between the text and the indicator
        if (isLoading)
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          )
        else
          Text(
            'LOGIN',
            style: TextStyle(
              color: Color.fromARGB(255, 14, 4, 105),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
      ],
    );
  }
}
