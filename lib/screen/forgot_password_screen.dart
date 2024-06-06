import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
 const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isClickedPasword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/");
          },
          icon:const Icon(Icons.arrow_back, color: Colors.black),
        ),
        // title: Text(
        //   "Forgot Password",
        //   style: TextStyle(
        //     color: Colors.white,
        //     letterSpacing: 1.2,
        //   ),
        // ),
        // centerTitle: true,
        // backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const SizedBox(height: 40),
             const Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
             const SizedBox(height: 16),
              Text(
                "Please enter your email and we will send\nyou a link to return to your account",
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
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                  contentPadding:
                    const  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  prefixIcon: const Icon(
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
             const SizedBox(height: 20),
              TextField(
                obscureText: isClickedPasword,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                  contentPadding:
                    const  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  hintText: "Enter your new password",
                  labelText: "New Password",
                ),
              ),
             const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/");
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
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
