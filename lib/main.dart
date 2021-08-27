import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/provider/my_provider.dart';
import 'package:foodapp/screens/home_page.dart';
import 'package:foodapp/screens/login_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MyProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xff2b2b2b),
            appBarTheme: AppBarTheme(
              color: Color(0xff2b2b2b),
            )),
        // home: CartScreen(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (index, snpcshot) {
            if (!snpcshot.hasData) {
              return LoginScreen();
            }
            return HomeScreen();
          },
        ),
      ),
    );
  }
}
