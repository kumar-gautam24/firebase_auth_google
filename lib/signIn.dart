import 'package:flutter/material.dart';
import 'googleSignInFunction.dart';

class SignInGoogle extends StatelessWidget {
  const SignInGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Column(
            children:  [
              const SizedBox(height: 50,),
              const Icon(
                Icons.account_circle,
                size: 100,
              ),
              // app logo

              // welcome back
             const SizedBox(height: 40),
              const Text(
                'Welcome back!',
                style: TextStyle(
                  color: Colors.grey,
                    fontSize: 18,
                ),
              ),
              const SizedBox(height: 160,),
              GestureDetector(
                onTap:()=> signInWithGoogle(),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black45,
                      width: 3.0,
                    ),
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Image(
                      image: AssetImage(
                          'assests/google_logo.png'
                      ),
                    height: 70,
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              const Text(
                'Login  using Google',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              )
              // google login logo

            ],
          ),
        ),
      ),
    );
  }
}
