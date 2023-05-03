import 'package:fire/signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'logout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.hasError)
            {
              return Text(snapshot.error.toString());
            }
          if(snapshot.connectionState==ConnectionState.active)
            {
              if(snapshot.data==null)
                {
                  return const SignInGoogle();
                }
              else {
                return const LogIn();
              }
            }
          return const Center(child: CircularProgressIndicator());
          },
          ),
    );
  }
}




