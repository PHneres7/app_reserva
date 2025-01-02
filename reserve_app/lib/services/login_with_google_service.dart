import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential?> LoginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn(
        clientId: '117409240250181732207',
        //nao funcionou :(
        hostedDomain: 'http://localhost/__/auth/handler/',
      ).signIn();

      final googleAuth = await googleUser?.authentication;

      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

      return await _auth.signInWithCredential(cred);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
