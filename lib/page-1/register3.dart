import 'dart:convert';

import 'package:client/page-1/Login3.dart';
import 'package:client/tts2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
MyTTS myTTS = MyTTS();

class RegisterPage3 extends StatefulWidget {
  @override
  _RegisterPageState3 createState() => _RegisterPageState3();
}

class _RegisterPageState3 extends State<RegisterPage3> {
  final formKey = GlobalKey<FormState>();
  bool secure = true;
  bool secure2 = true;

  var userName, phoneNumber, linkedPhoneNumber;
  var password,confirmPassword;

  final _usernameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _linkedPhoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
/*
  Future<void> register(BuildContext context, String username, String phoneNumber, String linkedPhoneNumber, String password, String confirmPassword) async {
    // API endpoint URL
    var url = Uri.parse('http://192.168.1.4:8000/api/register');

    // Request body
    var body = {
      'username': username,
      'phone_number': phoneNumber,
      'linked_phone_number': linkedPhoneNumber,
      'password': password,
      'password_confirm': confirmPassword
    };

    try {
      // Send POST request
      var response = await http.post(
        url,
        body: body,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successful registration
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registration Successful'),
              content: Text('You have successfully registered. Please log in to continue.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage3()));
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Registration failed
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registration Failed'),
              content: Text('An error occurred during registration. Please try again later.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Handle any errors that occur during the request
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Failed'),
            content: Text('An error occurred during registration. Please try again later.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
  */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Center(
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
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5, color: Colors.teal),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Image.asset(
                        'assets/icon2.png',
                      )),
                  SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'User Name',
                      ),
                      controller: _usernameController,
                      onChanged: (value){
                        setState(() {
                          userName=value;
                        });
                        print(value);
                      },

                      onSaved: (_userName){
                        userName = _userName;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please your Name';
                        }
                        if(value == ' '){
                          return 'Please your Name';
                        }
                        if(!RegExp("^[a-zA-Z]").hasMatch(value)){
                          return 'Please enter valid Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                      maxLength: 11,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Phone Number',
                        counterText: '',
                      ),
                      controller: _phoneNumberController,
                      onChanged: (value){
                        setState(() {
                          phoneNumber=value;
                        });
                        print(value);
                      },

                      onSaved: (_phoneNumber){
                        phoneNumber = _phoneNumber;
                      },
                      keyboardType: TextInputType.phone,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter your phone number';
                        }
                        if(!RegExp("^[0]+[1]+[0,1,2,5]+[0-9]").hasMatch(value)){
                          return 'Please enter valid number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                      maxLength: 11,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Blind Person Phone Number',
                        counterText: '',
                      ),
                      controller: _linkedPhoneNumberController,
                      onChanged: (value){
                        setState(() {
                          linkedPhoneNumber=value;
                        });
                        print(value);
                      },

                      onSaved: (_linkedPhoneNumber){
                        linkedPhoneNumber = _linkedPhoneNumber;
                      },
                      keyboardType: TextInputType.phone,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter Blind Person phone number';
                        }
                        if(!RegExp("^[0]+[1]+[0,1,2,5]+[0-9]").hasMatch(value)){
                          return 'Please enter  valid number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                      obscureText: secure,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                secure = !secure;
                              });
                            },
                            icon: secure ? Icon(Icons.visibility):Icon(Icons.visibility_off),
                            color: Color(0xFF063F37)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Password',
                      ),
                      controller: _passwordController,
                      onChanged: (value){
                        setState(() {
                          password=value;
                        });
                        print(value);
                      },

                      onSaved: (_password){
                        password = _password;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter your Password';
                        }

                        if(value.length < 8){
                          return 'Enter 8-Digits Password';
                        }

                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                      obscureText: secure2,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_clock_outlined),
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                secure2 = !secure2;
                              });
                            },
                            icon: secure2 ? Icon(Icons.visibility):Icon(Icons.visibility_off),
                            color: Color(0xFF083F3A)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Confirm Password',
                      ),
                      controller: _confirmPasswordController,
                      onChanged: (value){
                        setState(() {
                          confirmPassword=value;
                        });
                        print(value);
                      },

                      onSaved: (_confirmPassword){
                        confirmPassword = _confirmPassword;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter your Password';
                        }

                        if(value.length < 8){
                          return 'Enter 8-Digits Password';
                        }

                        return null;
                      },
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
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      /*
                      onPressed: () {
                        if(formKey.currentState!.validate()) {
                          final username = _usernameController.text;
                          final phoneNumber = _phoneNumberController.text;
                          final linkedPhoneNumber = _linkedPhoneNumberController
                              .text;
                          final password = _passwordController.text;
                          final confirmPassword = _confirmPasswordController
                              .text;
                          register(
                              context, username, phoneNumber, linkedPhoneNumber,
                              password, confirmPassword);
                        }
                      },
                      */

                      onPressed: ()async{
                        if(formKey.currentState!.validate()) {
                          String url = 'http://192.168.1.4:8000/api/register/';
                          http.Response response = await http.post(
                            Uri.parse(url),
                            headers: <String, String>{
                              'Content-Type': 'application/json; char=UTF-8',
                            },
                            body: jsonEncode(
                              {
                                'username': userName,
                                'phone_number': phoneNumber,
                                'linked_phone_number': linkedPhoneNumber,
                                'password': password,
                                'password_confirm': confirmPassword
                              },
                            ),
                          );
                          var body = json.decode(response.body);
                          print(body);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginPage3()));
                        }
                        await myTTS.speakEnglish('Register Success'); // speak English message
                        await myTTS.speakArabic('تم التسجيل');
                      }

                    ),

                    // ... your existing code ...
                  )],
              ),
            ),
          ),
        ),
      ),
    );
  }
}