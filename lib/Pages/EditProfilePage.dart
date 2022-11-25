import 'dart:async';
import 'package:command_flutter/Chats/api/firebase.dart';
import 'package:command_flutter/HomePage.dart';
import 'package:command_flutter/Pages/HomeView.dart';
import 'package:command_flutter/Pages/addImage.dart';
import 'package:command_flutter/Utils/UserPerefer.dart';
import 'package:command_flutter/Widget/ButtonWidget.dart';
import 'package:flutter/material.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();

  String email = '';
  String password = '';
  String name = '';
  String middleName = '';
  String surName = '';

  Future<void> _LoginButtonActio() async {
    email = emailController.text;
    password = passwordController.text;
    name = nameController.text;
    surName = surNameController.text;
    middleName = middleNameController.text;

    print("login: login = ${email} password = ${password}");
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    surNameController.clear();
    middleNameController.clear();
  }

  Widget _FrontButton(){
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
                          SizedBox(height: 50),
                          HomeView(),
                          SizedBox(height: 30),
                          TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  labelText: 'Email'
                              ),
                              onChanged: (name) {},
                            ),
                          SizedBox(height: 30),
                          TextField(
                            controller: surNameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                labelText: 'Surname'
                            ),
                            onChanged: (name) {},
                          ),
                          SizedBox(height: 30),
                          TextField(
                            controller: middleNameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                labelText: 'middleName'
                            ),
                            onChanged: (name) {},
                          ),
                          SizedBox(height: 30),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                labelText: 'name'
                            ),
                            onChanged: (name) {},
                          ),
                          SizedBox(height: 40),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                            height: 40,
                            width: 320,
                            child: buildEditProfileButton()
                              ),
                            ),
                        ],
                      ),
        ),
                  ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
            body: Stack(
              children: [
                Container(
                  child: Container(
                    child: Stack(
                      children: [
                        Image.asset('assets/profile/profileBackground.jpg',width: 1000, fit:BoxFit.fill),
                        Image.asset('assets/profile/GroundUpBar.png',width: 1000, fit:BoxFit.fill),
                      ],
                    ),
                  ),
                ),
                _FrontButton(),
              ],
            )
        )
    );
  }

  Widget buildEditProfileButton() =>
      ButtonWidget(
        text: 'Save',
        onClicked: () {
          Timer(Duration(seconds: 1), () {
            PushToJson(email, password, name, surName, middleName, "no");
            //Обновление данных для чата
            baseAPI.updateUser(userEmail: email, userSurname: surName, userName: name, userMiddle_name: middleName);
          });
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => (HomePage()))
          );
          _LoginButtonActio();
        },
      );
}

