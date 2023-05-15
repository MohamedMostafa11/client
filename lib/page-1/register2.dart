import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Login2.dart';
import 'login.dart';

class RegisterPage2 extends StatefulWidget {
  @override
  _RegisterPageState2 createState() => _RegisterPageState2();
}

class _RegisterPageState2 extends State<RegisterPage2> {
  final formKey = GlobalKey<FormState>();
  bool secure = true;
  bool secure2 = true;
  final _usernameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _linkedPhoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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

    // Send POST request
    var response = await http.post(url, body: body);

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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage2()));
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
  }

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