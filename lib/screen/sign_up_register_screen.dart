import 'package:flutter/material.dart';

class SignUpScreenRegister extends StatefulWidget {
  SignUpScreenRegister({super.key});

  @override
  State<SignUpScreenRegister> createState() => _SignUpScreenRegisterState();
}

class _SignUpScreenRegisterState extends State<SignUpScreenRegister> {
  bool isClickedPasword = true;
  bool isClickedPaswordConfirm = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("Sign-UpScreen-Complete");
          },
          icon:const Icon(Icons.arrow_back, color: Colors.black),
        ),
        // title: Text(
        //   "Sign Up",
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
             const Text(
                "Register Account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
             const SizedBox(height: 16),
              Text(
                "Complete your details or continue\nwith social media",
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
             const SizedBox(height: 20),
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
              TextField(
                obscureText: isClickedPaswordConfirm,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                  contentPadding:
                     const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  suffixIcon: isClickedPaswordConfirm
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isClickedPaswordConfirm = false;
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
                              isClickedPaswordConfirm = true;
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
                  hintText: "Re-enter your password",
                  labelText: "Confirm Password",
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
             const SizedBox(height: 40),
              Text(
                "Or sign up with",
                style: TextStyle(color: Colors.grey[600]),
              ),
             const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/google_icon.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/facebook_icon.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/twitter_icon.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
             const SizedBox(height: 30),
              Text(
                "By continuing, you confirm that you agree\nwith our Terms and Conditions",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
