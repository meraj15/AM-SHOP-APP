import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isCheckBox = false;
  bool isClickedPasword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const SizedBox(height: 80),
             const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
             const SizedBox(height: 20),
              Text(
                "Sign in with your email and password or continue with social media",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
             const SizedBox(height: 40),
              TextField(
                
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                  contentPadding:
                     const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  prefixIcon:const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: "Enter your email",
                  labelText: "Email",
                ),
              ),
             const SizedBox(height: 25),
              TextField(
                obscureText: isClickedPasword,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                  contentPadding:
                     const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  suffixIcon: isClickedPasword
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isClickedPasword = false;
                            });
                          },
                          icon:const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isClickedPasword = true;
                            });
                          },
                          icon:const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                  prefixIcon:const Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: "Enter your password",
                  labelText: "Password",
                ),
              ),
             const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.orange,
                        value: isCheckBox,
                        onChanged: (value) {
                          setState(() {
                            isCheckBox = value;
                          });
                        },
                      ),
                     const Text("Remember me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("forgot-screen");
                    },
                    child:const Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
             const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("home-screen");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize:const Size(double.infinity, 50),
                ),
                child:const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
             const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/google_icon.png",
                      width: 42,
                    ),
                  ),
                 const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/facebook_icon.png",
                      width: 38,
                    ),
                  ),
                 const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/twitter_icon.png",
                      width: 38,
                    ),
                  ),
                ],
              ),
             const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("Sign-UpScreen-Complete");
                    },
                    child:const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
