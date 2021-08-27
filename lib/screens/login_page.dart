import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/screens/home_page.dart';
import 'package:foodapp/screens/sing_up_page.dart';
import 'package:foodapp/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  late UserCredential userCredential;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  // ignore: override_on_non_overriding_member
  Future loginAuth() async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: deprecated_member_use
        globalKey.currentState!.showSnackBar(
          SnackBar(
            content: Text("No user found for that email"),
          ),
        );
      } else if (e.code == 'wrong-password') {
        // ignore: deprecated_member_use
        globalKey.currentState!.showSnackBar(
          SnackBar(
            content: Text("Wron password provided for that user. "),
          ),
        );
        setState(() {
          loading = false;
        });
      }
    }
  }

  // hata yönetimi
  void validation() {
    if (email.text.trim().isEmpty ||
        // ignore: unnecessary_null_comparison
        email.text.trim() == null && password.text.trim().isEmpty ||
        // ignore: unnecessary_null_comparison
        password.text.trim() == null) {
      // ignore: deprecated_member_use
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("All Field is Empty"),
        ),
      );
    }
    // email in bo girilmesi durumunda çalışacak kod bloğu
    // ignore: unnecessary_null_comparison
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      // ignore: deprecated_member_use
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("e-Mail is empty"),
        ),
      );
      return;
    }
    // şifrenin boş girilmesi durumunda çalışacak kod bloğu
    // ignore: unnecessary_null_comparison
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      // ignore: deprecated_member_use
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Password is empty"),
        ),
      );
      return;
    } else {
      setState(() {
        loading = true;
      });
      loginAuth();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      print("Giriş İşlemi başarılı");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Log in",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                MyTextField(
                  textcontroller: email,
                  obsuruceText: false,
                  hinttext: "Email",
                  icon: Icons.person,
                  iconColor: Colors.white,
                ),
                SizedBox(
                  height: 30,
                ),
                MyTextField(
                  textcontroller: password,
                  obsuruceText: true,
                  hinttext: "Password",
                  icon: Icons.lock_outlined,
                  iconColor: Colors.white,
                ),
              ],
            ),
            loading
                ? CircularProgressIndicator()
                : Container(
                    width: 200,
                    height: 60,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        validation();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New user ?", style: TextStyle(color: Colors.white)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Text(
                    "Register now.",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
