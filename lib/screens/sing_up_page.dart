import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // ignore: unused_local_variable
  bool loading = false;
  late UserCredential userCredential;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  // firebase ile veri gönderme işlemi
  // kullanıcı kaydı oluşturma işlemi kod bloğu
  // ignore: override_on_non_overriding_member
  Future sendData() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);

      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user!.uid)
          .set({
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim(),
        'email': email.text.trim(),
        'userid': userCredential.user!.uid,
        'password': password.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: deprecated_member_use
        globalKey.currentState!.showSnackBar(
            SnackBar(content: Text("The password provied is too weak.")));
      } else if (e.code == 'email-alaready-in-use') {
        // ignore: deprecated_member_use
        globalKey.currentState!.showSnackBar(SnackBar(
            content: Text("The account already exist for that email")));
      }
    } catch (exception) {
      // ignore: deprecated_member_use
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Hatanız : "),
        ),
      );
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

  // hata işlemi - validation textfield ' ların boş girilmesi durumunda çalışacak kod blooğu
  void validation() {
    // ignore: unnecessary_null_comparison
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
      // ignore: deprecated_member_use
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("First Name is empty"),
        ),
      );
      return;
    }

    // ignore: unnecessary_null_comparison
    if (lastName.text.trim().isEmpty || lastName.text.trim() == null) {
      // ignore: deprecated_member_use
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Last Name is empty"),
        ),
      );
      return;
    }

    // ignore: unnecessary_null_comparison
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      // ignore: deprecated_member_use
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Email is empty"),
        ),
      );
      return;
    }

    // ignore: unnecessary_null_comparison
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      // ignore: deprecated_member_use
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(" Password is empty"),
        ),
      );
      return;
    } else {
      setState(() {
        loading = true;
      });
      sendData();
      //asdadfdsfsdfsfNavigator.pop(context);
      print("Kayıt işlemi başarılı");
    }
  }

  Widget build(BuildContext context) {
    // Form Tasasrımı
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Sing Up",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextForm(
                      textcontroller: firstName,
                      hintText: "FirstName",
                      hintColor: Colors.white,
                      borderColor: Colors.grey,
                      buttonIcon: Icons.person,
                      iconColor: Colors.white,
                      obsuruceText: false,
                    ),
                    TextForm(
                      textcontroller: lastName,
                      hintText: "Last Name",
                      hintColor: Colors.white,
                      borderColor: Colors.grey,
                      buttonIcon: Icons.person_pin_circle,
                      iconColor: Colors.white,
                      obsuruceText: false,
                    ),
                    TextForm(
                      textcontroller: email,
                      hintText: "e-Mail",
                      hintColor: Colors.white,
                      borderColor: Colors.grey,
                      buttonIcon: Icons.mail,
                      iconColor: Colors.white,
                      obsuruceText: false,
                    ),
                    TextForm(
                      textcontroller: password,
                      hintText: " Password",
                      hintColor: Colors.white,
                      borderColor: Colors.grey,
                      buttonIcon: Icons.lock_outline,
                      iconColor: Colors.white,
                      obsuruceText: true,
                    ),
                  ],
                ),
              ),
              loading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FormButton(
                          text: "Cancel",
                          butonColor: Colors.grey,
                          press: () {
                            validation();
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FormButton(
                          text: "Register",
                          butonColor: Colors.red,
                          press: () {
                            validation();
                          },
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}

// buton tasarımı - classı
class FormButton extends StatelessWidget {
  const FormButton({
    Key? key,
    required this.text,
    required this.butonColor,
    required this.press,
  }) : super(key: key);

  final String text;
  final Color butonColor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: press,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: butonColor,
        child: Text(
          text,
        ),
      ),
    );
  }
}

// textfield classı - kutuscuk tasarımı
class TextForm extends StatelessWidget {
  const TextForm({
    Key? key,
    required this.hintText,
    required this.hintColor,
    required this.borderColor,
    required this.buttonIcon,
    required this.iconColor,
    required this.obsuruceText,
    required this.textcontroller,
  }) : super(key: key);

  final String hintText;
  final Color hintColor;
  final Color borderColor;
  final IconData buttonIcon;
  final Color iconColor;
  final bool obsuruceText;
  final TextEditingController textcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textcontroller,
      obscureText: obsuruceText,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          prefixIcon: Icon(buttonIcon, color: iconColor),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: borderColor,
          ))),
    );
  }
}
