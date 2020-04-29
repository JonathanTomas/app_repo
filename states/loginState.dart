import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginProvider { GOOGLE, FACEBOOK }

class LoginState with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;
  Observable<FirebaseUser> user;
  Observable<Map<String, dynamic>> profile;
  SharedPreferences _prefs;

  bool _loggedIn = false;
  bool _loading = true;
  FirebaseUser _user;

  LoginState() {
    loginState();
  }

  bool isLoggedIn() => _loggedIn;
  bool isLoading() => _loading;

  FirebaseUser currentUser() => _user;

  void login(LoginProvider loginProvider) async {
    _loading = true;
    notifyListeners();

    switch (loginProvider) {
      case LoginProvider.GOOGLE:
        _user = await _handleGoogleSignIn();
        break;
      case LoginProvider.FACEBOOK:
        _user = await _handleFacebookSignIn();
        break;
    }

    _loading = false;
    if (_user != null) {
      _prefs.setBool('isLoggedIn', true);
      _loggedIn = true;
      updateUserData(_user);
      notifyListeners();
    } else {
      _loggedIn = false;
      notifyListeners();
    }
  }

  void logout() {
    _prefs.remove('isLoggedIn');
    _googleSignIn.signOut();
    _loggedIn = false;
    notifyListeners();
  }
  // Me traigo el contexto de la actividad desde donde se realiza la llamada
  Future<dynamic> handleEmailSignIn(String email, String password,BuildContext context) async {
    try {
      _loading = true;
      notifyListeners();
      final AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final FirebaseUser _user = authResult.user;

      _loading = false;
      if (_user != null) {
        _prefs.setBool('isLoggedIn', true);
        _loggedIn = true;
        updateUserDataOnEmailSignIn(_user);
        notifyListeners();
      } else {
        _loggedIn = false;
        // Si no existe el usuario muestro una ventana modal de que no existe
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Center(
                  child: Text("El ususario no existe."),
                ),
              );
            },
        );
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      // Si no existe el usuario muestro una ventana modal de que no existe
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Center(
                  child: Text("Error: " + e.toString()),
                ),
              );
            },
        );
      notifyListeners();

      return e.code;
    }
  }

  Future<FirebaseUser> handleEmailSignUp(
      String email,
      String password,
      String displayName,
      DateTime birthDate,
      String userName,
      String profilePicture) async {
    try {
      _loading = true;
      notifyListeners();
      final AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final FirebaseUser _user = authResult.user;

      _loading = false;
      if (_user != null) {
        _prefs.setBool('isLoggedIn', true);
        _loggedIn = true;
        createUserData(
            _user, email, displayName, birthDate, userName, profilePicture);
        notifyListeners();
      } else {
        _loggedIn = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
      return null;
    }
  }

  Future<FirebaseUser> _handleGoogleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  Future<FirebaseUser> _handleFacebookSignIn() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    if (result.status != FacebookLoginStatus.loggedIn) {
      return null;
    }

    final AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: result.accessToken.token);

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  void createUserData(FirebaseUser user, String email, String displayName,
      DateTime birthDate, String userName, String profilePicture) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    Map<String, dynamic> dataList = {
      'uid': user.uid,
      'email': user.email,
      'photoURL': profilePicture,
      'displayName': displayName,
      'phone': user.phoneNumber,
      'lastSeen': DateTime.now().toString(),
      'birthDate': birthDate.toString(),
      'coins': 100,
      'plan': 'FREE',
      'userName': userName,
      'courses': [],
      'refer': '',
    };

    return ref.setData(dataList, merge: true);
  }

  void updateUserDataOnEmailSignIn(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    Map<String, dynamic> dataList = {
      'lastSeen': DateTime.now().toString(),
    };

    return ref.setData(dataList, merge: true);
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    ref.get().then((doc) {
      if (!doc.exists) {
        Map<String, dynamic> dataList = {
          'uid': user.uid,
          'email': user.email,
          'photoURL': user.photoUrl,
          'displayName': user.displayName,
          'phone': user.phoneNumber,
          'lastSeen': DateTime.now().toString(),
          'coins': 100,
          'plan': 'FREE',
          'userName': user.email.split('@')[0],
          'courses': [],
          'refer': '',
        };
        return ref.setData(dataList, merge: true);
      } else {
        Map<String, dynamic> dataList = {
          'lastSeen': DateTime.now().toString(),
        };
        return ref.setData(dataList, merge: true);
      }
    });
  }

  void loginState() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('isLoggedIn')) {
      _user = await _auth.currentUser();
      _loggedIn = _user != null;
      _loading = false;
      user = Observable(_auth.onAuthStateChanged);

      profile = user.switchMap((FirebaseUser u) {
        if (u != null) {
          return _db
              .collection('users')
              .document(u.uid)
              .snapshots()
              .map((snap) => snap.data);
        } else {
          return Observable.just({});
        }
      });
      notifyListeners();
    } else {
      _loading = false;
      notifyListeners();
    }
  }
}
