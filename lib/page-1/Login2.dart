import 'package:client/page-1/Admin.dart';
import 'package:client/page-1/register2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'register.dart';

class LoginPage2 extends StatefulWidget {
  @override
  State<LoginPage2> createState() => _LoginPageState2();
}

class _LoginPageState2 extends State<LoginPage2> {
  var formKey = GlobalKey<FormState>();

  Future<void> login(String phone_number, String password) async {
    // API endpoint URL
    var url = Uri.parse('http://192.168.1.4:8000/api/login');

    // Request body
    var body = {
      'phone_number': phone_number,
      'password': password
    };

    // Send POST request
    var response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      // Successful login
      Navigator.push(context, MaterialPageRoute(builder: (context) => Admin()));
    } else {
      // Login failed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid phone number or password.'),
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

  @override
  Widget build(BuildContext context) {
    var _phoneNumber;
    var _password;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter phone number';
                            }
                            if (!RegExp("^[0]+[1]+[0,1,2,5]+[0-9]")
                                .hasMatch(value)) {
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Password';
                            }
                            if (value.length < 8) {
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
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              onPressed: () {
                                final phone_number = _phoneNumber.text;
                                final password = _password.text;
                                login(phone_number, password);
                              },
                            ),

                            // ... your existing code ...
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
                                        borderRadius:
                                        BorderRadius.circular(30.0)),
                                  ),
                                  child: const Text('Sign Up',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22)),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return RegisterPage2();
                                        }));
                                  })),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}