import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../backend/supabase/supabase.dart';
import '../../flutter_flow/flutter_flow_util.dart';

Future<User?> googleSignInFunc() async {
  if (kIsWeb) {
    final success = await SupaFlow.client.auth.signInWithOAuth(Provider.google);
    return success ? SupaFlow.client.auth.currentUser : null;
  }

  final googleSignIn = GoogleSignIn(
    clientId: isAndroid
        ? null
        : "153522495917-lj2j1l9ek5caer7dnmqqs4j125kgeljp.apps.googleusercontent.com",
    serverClientId:
        "153522495917-10i38j05178s9s91lnt17293ak6uu161.apps.googleusercontent.com",
  );

  await googleSignIn.signOut().catchError((_) => null);
  final googleUser = await googleSignIn.signIn();
  final googleAuth = await googleUser!.authentication;
  final accessToken = googleAuth.accessToken;
  final idToken = googleAuth.idToken;

  if (accessToken == null) {
    throw 'No Access Token found.';
  }
  if (idToken == null) {
    throw 'No ID Token found.';
  }

  final authResponse = await SupaFlow.client.auth.signInWithIdToken(
    provider: Provider.google,
    idToken: idToken,
    accessToken: accessToken,
  );
  return authResponse.user;
}
