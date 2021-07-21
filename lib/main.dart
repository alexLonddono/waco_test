import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:waco_test/routes.dart';
import 'package:waco_test/core/providers/product_provider.dart';
import 'package:waco_test/src/pages/home.dart';
import 'package:waco_test/src/pages/signin.dart';
import 'package:waco_test/core/services/authentication_service.dart';

//Initialize Firebase App
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null),
        // Firestore providers
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: AuthenticationWrapper(),
        debugShowCheckedModeBanner: false,
        routes: rutasApp(),
      ),
    );
  }
}

// Later return for homepage or loginpage
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return SignInPage();
  }
}
