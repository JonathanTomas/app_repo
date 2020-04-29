import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cursos/constants/appColors.dart';
import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/states/loginState.dart';
import 'package:cursos/widgets/courseCreation/inputField.dart';
import 'package:cursos/widgets/uiElements/appButton.dart';
import 'package:cursos/widgets/uiElements/customDialog.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class SignUpFormUserName extends StatefulWidget {
  SignUpFormUserName(
      {Key key, this.email, this.displayName, this.password, this.birthDate})
      : super(key: key);
  final email;
  final displayName;
  final password;
  final birthDate;

  @override
  _SignUpFormUserNameState createState() => _SignUpFormUserNameState();
}

class _SignUpFormUserNameState extends State<SignUpFormUserName> {
  final _userNameController = TextEditingController();
  bool isUsed = false;
  File _image;
  String _imageURL;
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setProfilePicture();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.25,
                        backgroundImage: _image == null
                            ? AssetImage('assets/images/profile_picture.png')
                            : FileImage(_image),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: secondaryColor.withOpacity(0.5),
                              child: Icon(
                                Icons.camera_alt,
                                size: 35,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  InputField(
                    hint: 'Username',
                    errorText: 'Username must not be empty',
                    textInputAction: TextInputAction.next,
                    textController: _userNameController,
                    keyboardType: TextInputType.text,
                  ),
                  Container(
                    height: 20,
                  ),
                  Text(
                    'Just some more details',
                    style: screenTitle,
                  ),
                  Container(
                    height: 10,
                  ),
                  AppButton(
                      action: () {
                        checkIfUsed().then((value) {
                          if (_formKey.currentState.validate() &&
                              isUsed == false) {
                            createProfilePicture().then((value) {
                              Provider.of<LoginState>(context)
                                  .handleEmailSignUp(
                                      widget.email,
                                      widget.password,
                                      widget.displayName,
                                      widget.birthDate,
                                      _userNameController.value.text,
                                      _imageURL)
                                  .then((value) => Navigator.of(context)
                                      .pushNamedAndRemoveUntil(
                                          '/', (route) => false));
                            });
                          } else if (_formKey.currentState.validate() &&
                              isUsed == true) {
                            showContent(
                              context,
                              'Username not available',
                              'Username ${_userNameController.value.text} is already taken by an existing account. Please, try again with another username.',
                              'Try again',
                              'pop',
                              '',
                              null,
                            );
                          }
                        });
                      },
                      text: 'Continue',
                      style: redButtonText),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future checkIfUsed() async {
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection("users").getDocuments();
    var list = querySnapshot.documents;

    for (var element in list) {
      if (element.data['userName'] == _userNameController.value.text) {
        isUsed = true;
        break;
      } else {
        isUsed = false;
      }
    }
  }

  void setProfilePicture() async {
    if (await Permission.camera.request().isGranted) {
      var image = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 10);
      setState(() {
        _image = image;
      });
    } else if (await Permission.camera.request().isDenied) {
      print('Permission denied');
    } else if (await Permission.camera.request().isPermanentlyDenied) {
      print(
          'Permission denied, for grating us access to your gallery, please go to settings and change the permissions settings.');
    } else if (await Permission.camera.request().isRestricted) {
      print('Permissions have been restricted by Parental Control.');
    }
  }

  Future createProfilePicture() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('users_profile_pictures/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    var imageURL = await (await uploadTask.onComplete).ref.getDownloadURL();
    setState(() {
      _imageURL = imageURL.toString();
    });
  }
}
