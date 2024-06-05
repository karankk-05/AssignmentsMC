import 'package:flutter/material.dart';
import '../colors_decorations/decorations.dart';
class fields {
  static Widget TextField({
    TextEditingController? controller,
    required label,
    required bool secure,
   
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: kLabelStyle
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            cursorColor: Colors.white,
            controller: controller,
            obscureText: secure,
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
              hintText: 'Enter your $label',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
