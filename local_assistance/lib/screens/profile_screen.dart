import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:local_assistance/screens/main_screen.dart';

class ProfileScreen extends StatefulWidget {
  static String routName = '/profile-screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  final _formKey = GlobalKey<FormState>();
  File _pickedImage;

  String _fullname = '';

  String _location = '';

  String _phoneNumber = '';

  String _password = '';

  var _locationFocus = FocusNode();

  var _phonenumberFocus = FocusNode();

  var _passwordFocus = FocusNode();

  void _takeImage() async {
    final pickImageFile =
        await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickImageFile;
    });
  }

  void _pickImage() async {
    final pickImageFile =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickImageFile;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _locationFocus.dispose();
    _phonenumberFocus.dispose();
    _passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void saveForm() async {
      if (!_formKey.currentState.validate()) {
        return;
      }
      _formKey.currentState.save();
      try {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          'fullname': _fullname,
          'location': _location,
          'phonenumber': _phoneNumber,
        });
        if (_pickedImage != null) {
          final ref = FirebaseStorage.instance
              .ref()
              .child('user_image')
              .child(FirebaseAuth.instance.currentUser.uid + '.jpg');
          await ref.putFile(_pickedImage).whenComplete(() => null);
        }
        if (_password != 'obscureText') {
          await FirebaseAuth.instance.currentUser.updatePassword(_password);
        }
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Save successfully')));
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }

    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          elevation: 0,
          backgroundColor: Colors.amber[400],
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              Map<String, dynamic> data = snapshot.data.data();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            top: 0,
                            width: screenSize.width,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.amber[400],
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              width: 120,
                              height: 120,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Positioned(
                                    top: 0,
                                    child: FutureBuilder(
                                      future: FirebaseStorage.instance
                                          .ref('user_image/' +
                                              FirebaseAuth
                                                  .instance.currentUser.uid +
                                              '.jpg')
                                          .getDownloadURL(),
                                      builder: (context, snapshot) {
                                        return CircleAvatar(
                                          radius: 60,
                                          backgroundColor: Colors.amberAccent,
                                          backgroundImage: _pickedImage != null
                                              ? FileImage(_pickedImage)
                                              : (snapshot.data == null)
                                                  ? null
                                                  : NetworkImage(snapshot.data),
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: PopupMenuButton(
                                      itemBuilder: (context) {
                                        var list =
                                            List<PopupMenuEntry<Object>>();
                                        list.add(
                                          PopupMenuItem(
                                            child: InkWell(
                                              onTap: _takeImage,
                                              child: Text("Take a photo"),
                                            ),
                                            value: 1,
                                          ),
                                        );
                                        list.add(
                                          PopupMenuDivider(
                                            height: 10,
                                          ),
                                        );
                                        list.add(
                                          PopupMenuItem(
                                            child: InkWell(
                                              onTap: _pickImage,
                                              child: Text(
                                                  "Pick a photo from gallery"),
                                            ),
                                            value: 2,
                                          ),
                                        );
                                        return list;
                                      },
                                      child: Container(
                                        width: 40,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: Icon(Icons.camera_alt),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            right: screenSize.width * 0.5 - 60,
                            bottom: 1,
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextFormField(
                              initialValue: data['fullname'],
                              decoration: InputDecoration(
                                labelText: 'Fullname',
                              ),
                              onSaved: (e) {
                                _fullname = e;
                              },
                              onFieldSubmitted: (_) {
                                _locationFocus.requestFocus();
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextFormField(
                              initialValue: data['location'],
                              decoration: InputDecoration(
                                labelText: 'Location',
                              ),
                              onSaved: (e) {
                                _location = e;
                              },
                              focusNode: _locationFocus,
                              onFieldSubmitted: (_) {
                                _phonenumberFocus.requestFocus();
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextFormField(
                              initialValue: data['phonenumber'],
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                              ),
                              onSaved: (e) {
                                _phoneNumber = e;
                              },
                              focusNode: _phonenumberFocus,
                              onFieldSubmitted: (_) {
                                _passwordFocus.requestFocus();
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextFormField(
                              initialValue: 'obscureText',
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value.length < 6)
                                  return "Password must greater than 6";
                                return null;
                              },
                              onSaved: (e) {
                                _password = e;
                              },
                              focusNode: _passwordFocus,
                            ),
                          ),
                          GestureDetector(
                            onTap: saveForm,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.amberAccent[400],
                              ),
                              height: 30,
                              width: screenSize.width * 0.3,
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
