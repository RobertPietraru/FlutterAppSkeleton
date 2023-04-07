import 'package:authentication/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> inject() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  authInject();
}
