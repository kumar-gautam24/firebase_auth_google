import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'googleSignInFunction.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}
final FirebaseAuth _auth = FirebaseAuth.instance;

User? user ;
String? photoUrl ;
String? displayName ;
String? email ;

class _LogInState extends State<LogIn> {
  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }
  _getCurrentUser() async {
    final User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      setState(() {
        user = currentUser;
        photoUrl = user?.photoURL;
        displayName = user?.displayName;
        email = user?.email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        actions: [
        IconButton(
            onPressed: () async{
              await GoogleSignIn().signOut();
              FirebaseAuth.instance.signOut();
              setState(() {
                user=null;
                photoUrl=null;
                displayName=null;
                email=null;
              });
            },
            icon: const Icon(Icons.power_settings_new)
        ),
      ],
      ),
      backgroundColor: Colors.grey,
      body: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text('Success!',
                style: TextStyle(
                  color: Colors.limeAccent,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 240),
              CircleAvatar(
                radius: 60.0,
                  backgroundImage: NetworkImage(
                      photoUrl?? 'https://www.pngfind.com/pngs/m/676-6764065_default-profile-picture-transparent-hd-png-download.png'
                  ),
              ),
              const SizedBox(height: 10),
              Text('Name: ${displayName??'UserName'}',
                style:const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text('Mail : ${email??'abc@email.com'}',
                style:const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async{
                  await GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                child: const Text('LogOut'),
              ),
            ],
          ),
      ),
    );
  }
}
