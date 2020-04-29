import 'package:cursos/screens/appScreen.dart';
import 'package:cursos/screens/profileScreen.dart';
import 'package:cursos/screens/settingsScreen.dart';
import 'package:cursos/screens/signInScreen.dart';
import 'package:cursos/screens/tutorialScreen.dart';
import 'package:cursos/states/loginState.dart';
import 'package:cursos/states/themeState.dart';
import 'package:cursos/states/tutorialState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
            stream: FirebaseAuth.instance.onAuthStateChanged),
        ChangeNotifierProvider<ThemeState>(
          builder: (_) => ThemeState(),
        ),
        ChangeNotifierProvider<LoginState>(
          builder: (BuildContext context) => LoginState(),
        ),
        ChangeNotifierProvider<TutorialState>(
          builder: (BuildContext context) => TutorialState(),
        ),
      ],
      child: Consumer<ThemeState>(
        builder: (context, state, child) {
          return MaterialApp(
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: RemoveScrollGlow(),
                child: child,
              );
            },
            debugShowCheckedModeBanner: false,
            title: 'Cursos',
            theme: state.currentTheme,
            routes: {
              '/': (BuildContext context) {
                var loginState = Provider.of<LoginState>(context);
                var tutorialState = Provider.of<TutorialState>(context);
                if (loginState.isLoggedIn() == true &&
                    tutorialState.isTutorialSeen() == true) {
                  return AppScreen();
                } else if (tutorialState.isTutorialSeen() == false &&
                    loginState.isLoggedIn() == false) {
                  return TutorialScreen();
                } else if (tutorialState.isTutorialSeen() == true &&
                    loginState.isLoggedIn() == false) {
                  return SignInScreen();
                } else {
                  return AppScreen();
                }
              },
              '/settings': (BuildContext context) => SettingsScreen(),
              '/profile': (BuildContext context) => ProfileScreen(),
            },
          );
        },
      ),
    );
  }
}

class RemoveScrollGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
