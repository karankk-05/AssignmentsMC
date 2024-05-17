import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);
final HeadingStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color.fromARGB(220, 1, 9, 89),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class mytext {
  static late BuildContext context;

  static TextStyle headingtext1({required double fontSize}){
    return TextStyle(
  color: Theme.of(context).colorScheme.onSecondary,
  fontFamily: 'OpenSans',
  fontSize: fontSize,
   );
  }
  static TextStyle headingbold({required double fontSize}){
    return TextStyle(
  color: Theme.of(context).colorScheme.onSecondary,
  fontFamily: 'OpenSans',
  fontSize: fontSize,
  fontWeight: FontWeight.bold
   );
  }
  static TextStyle get subheadingtext1{
    return TextStyle(
  color: Theme.of(context).colorScheme.onBackground,
  fontFamily: 'OpenSans',
  fontSize: 12,
  
   );
  }
 
  
}