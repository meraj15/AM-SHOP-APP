import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreenComplete extends StatefulWidget {
  const SignUpScreenComplete({super.key});

  @override
  State<SignUpScreenComplete> createState() => _SignUpScreenCompleteState();
}

class _SignUpScreenCompleteState extends State<SignUpScreenComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushNamed("/");
          },
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
                "Complete Profile",
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
                    Icons.person,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: "Enter your first name",
                  labelText: "First Name",
                ),
              ),
             const SizedBox(height: 20),
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
                    Icons.person,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: "Enter your last name",
                  labelText: "Last Name",
                ),
              ),
             const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                  contentPadding:
                     const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  prefixIcon:const Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: "Enter your phone number",
                  labelText: "Phone Number",
                ),
              ),
             const SizedBox(height: 20),
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
                    Icons.location_pin,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: "Enter your address",
                  labelText: "Address",
                ),
              ),
             const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("Sign-Up-Screen-Register");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
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
