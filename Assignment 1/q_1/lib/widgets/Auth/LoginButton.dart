import 'package:flutter/material.dart';
import '../../services/LoginService.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isLoading = false;

  void setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () async {
          setLoading(true); // Update the loading state
          await login(widget.emailController.text, widget.passwordController.text, context);
          setLoading(false); // Update the loading state
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(100, 60)),
          backgroundColor: MaterialStateProperty.all<Color>(
            Color.fromARGB(255, 253, 253, 253),
          ),
        ),
        
        label: _LoginButtonLabel(isLoading: isLoading),
      ),
    );
  }
}

class _LoginButtonLabel extends StatelessWidget {
  final bool isLoading;

  const _LoginButtonLabel({Key? key, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
