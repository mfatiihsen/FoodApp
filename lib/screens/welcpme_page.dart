import 'package:flutter/material.dart';
import 'package:foodapp/screens/login_page.dart';
import 'package:foodapp/screens/sing_up_page.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2b2b),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Color(0xff2b2b2b),
              child: Center(),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome To MFS software",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Order food form our restaurant and",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text("Make reservation in real-time",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SignupAndLoginButton(
                    text: "Login",
                    color: Colors.white,
                    kColorBackgorund: Colors.red,
                    borderColor: Colors.black,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                  ),
                  SignupAndLoginButton(
                    text: "Sign Up",
                    color: Colors.white,
                    kColorBackgorund: Colors.red,
                    borderColor: Colors.red,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SignupAndLoginButton extends StatelessWidget {
  const SignupAndLoginButton({
    Key? key,
    required this.text,
    required this.color,
    required this.press,
    required this.kColorBackgorund,
    required this.borderColor,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color kColorBackgorund;
  final Color borderColor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 45,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: kColorBackgorund,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(30)),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
