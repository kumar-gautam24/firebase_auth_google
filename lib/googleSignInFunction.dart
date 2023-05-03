import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// String? photoUrl= 'https://www.pngfind.com/pngs/m/676-6764065_default-profile-picture-transparent-hd-png-download.png';

signInWithGoogle() async {
  // Google Sign In
  // begin interactive sign in process
  GoogleSignInAccount? googleuser= await GoogleSignIn().signIn();

  // obtain auth details from requests
  GoogleSignInAuthentication? googleAuth=await googleuser?.authentication;

  // create new credential for user
  AuthCredential credential= GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken ,
    idToken: googleAuth?.idToken,
  );

  // final sing in
  UserCredential userCredential= await FirebaseAuth.instance.signInWithCredential(credential);
  print(userCredential.user?.displayName);
  // photoUrl= userCredential.user?.photoURL;

  // store image to firebase.
  // void _savePhotoUrl(String uid, String photoUrl) {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .set({'photoUrl': photoUrl});
  // }

}