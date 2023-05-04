import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'Login.dart';
import 'package:client/Model/Model.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _usernameController;
    var _phoneNumberController;
    var _linkedPhoneNumberController;
    var _passwordController;
    var _confirmPasswordController;
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Image.asset(
                  'assets/images/wave-1-1.png',
                  alignment: Alignment.topCenter,
                )),
                SizedBox(height: 10),
                Container(
                    margin: EdgeInsets.all(25.0),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.teal),
                    ),
                    child: Image.asset(
                      'assets/icon.png',
                    )),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      labelText: 'User Name',
                    ),
                    controller: _usernameController,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      labelText: 'Phone Number',
                    ),
                    controller: _phoneNumberController,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      labelText: 'Blind Person Phone Number',
                    ),
                    controller: _linkedPhoneNumberController,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      labelText: 'Password',
                    ),
                    controller: _passwordController,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      labelText: 'Confirm Password',
                    ),
                    controller: _confirmPasswordController,
                  ),
                ),
                Container(
                    height: 100,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90.0)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        child: const Text('Register',
                            style:
                                TextStyle(color: Colors.white, fontSize: 22)),
                        onPressed: () {
                          // get the user input values
                          final username = _usernameController.text;
                          final phoneNumber = _phoneNumberController.text;
                          final linkedPhoneNumber =
                              _linkedPhoneNumberController.text;
                          final password = _passwordController.text;
                          final confirmPassword =
                              _confirmPasswordController.text;

                          // send the registration request
                          register(username, phoneNumber, linkedPhoneNumber,
                              password, confirmPassword);
                        })),
              ],
            ),
          ),
        ));
  }
}
