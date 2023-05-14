import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:client/tts.dart';
import 'register.dart';
import 'Admin.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _phoneNumber;
    var _password;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Login Screen'),
            ),
            body: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(25.0),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(width: 5, color: Colors.teal),
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Image.asset(
                            'assets/icon2.png',
                          )),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            labelText: 'Phone Number',
                          ),
                          controller: _phoneNumber,

                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter phone number';
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
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            labelText: 'Password',
                          ),
                          controller: _password,
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
                      Column(
                        children: [
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
                                  child: const Text('Log In',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22)),

                                  onPressed: () {
                                    //final phoneNumber = _phoneNumber.text;
                                    //final password = _password.text;
                                    //login(phoneNumber, password);

                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Admin()));

                                    if(formKey.currentState!.validate()){
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Admin()));
                                    TTS().speak("Login success");
                                    }
                                  }


                                  )
                          ),
                          Container(
                            child: Text(
                              'Don’t have an account yet?',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          Container(
                              height: 90,
                              padding: const EdgeInsets.all(20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0)),
                                  ),
                                  child: const Text('Sign Up',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22)),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return RegisterPage();
                                    }));
                                  })),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}
