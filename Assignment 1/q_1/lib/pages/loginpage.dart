import 'package:flutter/material.dart';
import '../colors_decorations/appcolors.dart';
import '../colors_decorations/decorations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'homepage.dart';

class loginpage extends StatefulWidget {

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  bool? _rememberMe=false; 
  Widget _email() {
return Column(crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ).animate(),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
           
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
  ],);
  }

   Widget _Password() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _ForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: (null) ,
        
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

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
              },// Or provide a callback function for onChanged
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

    Widget _LoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        
        onPressed:() {(Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => homepage(
                                    
                                  ),
                                ),
                              ));
        
        },
       style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(100, 60)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 253, 253, 253)),
                          ),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color.fromARGB(255, 14, 4, 105),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }


   Widget _SignupBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
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
               .scale(begin:Offset(0,0) ,
               end: Offset(3, 3
               ),curve:Cubic(0.5, 0, 0, 1),
               duration:1500.milliseconds).fadeOut(delay: 2.seconds,duration: 500.milliseconds),
         ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 40),
          child: Center(
            child: Container(
              child: Column( mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [ 
                  Text(
                              'Sign In',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontFamily: 'OpenSans',
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10,),
                              _email(),
                              SizedBox(
                        height: 30.0,
                      ),
                      _Password(),
                      _ForgotPasswordBtn(),
                      _RememberMeCheckbox(),
                      _LoginBtn(),
                      _SignupBtn()
                            ],
                          ),
            ).animate().fadeIn(delay: 2200.milliseconds),
          ),
        )
      ],
    ));
  }
}
