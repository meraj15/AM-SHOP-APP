import 'package:flutter/material.dart';
import 'package:am_shops/screen/add_card_screen.dart';
import 'package:am_shops/screen/forgot_password_screen.dart';
import 'package:am_shops/screen/home_screen.dart';
import 'package:am_shops/screen/login_screen.dart';
import 'package:am_shops/screen/sign_up_complete_screem.dart';
import 'package:am_shops/screen/sign_up_register_screen.dart';

void main(List<String> args) {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "LoginScreen",
      routes: {
        "/": (_) => LoginScreen(),
        "forgot-screen": (_) =>const ForgotPassword(),
        "Sign-UpScreen-Complete": (_) => SignUpScreenComplete(),
        "Sign-Up-Screen-Register": (_) => SignUpScreenRegister(),
        "home-screen": (_) =>const HomeScreen(),
        "add-card-screen": (_) => AddCardProduct(
              product: HomeScreenState.productCard,
              totalProductCards:HomeScreenState.totalProductCards ,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) =>const HomeScreen(),
        );
      },
    );
  }
}
