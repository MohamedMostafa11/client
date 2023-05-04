import 'dart:convert';
import 'dart:js';
import 'package:client/navigation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../page-1/Admin.dart';
import '../page-1/Login.dart';

final String baseUrl = 'http://127.0.0.1:8000/api/';
final String registerUrl = baseUrl + 'register/';
final String loginUrl = baseUrl + 'login/';

Future<void> register(String username, String phoneNumber,
    String linkedPhoneNumber, String password, String confirmPassword) async {
  final response = await http.post(registerUrl as Uri, body: {
    'username': username,
    'phone_number': phoneNumber,
    'linked_phone_number': linkedPhoneNumber,
    'password': password,
    'password_confirm': confirmPassword,
  });

  if (response.statusCode == 201) {
    // registration successful
    Navigator.push(context as BuildContext,
        MaterialPageRoute(builder: (context) {
      return LoginPage();
    })); // you can navigate to the login page or display a success message
  } else if (response.statusCode == 400) {
    // validation error
    showDialog<String>(
      context: context as BuildContext,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('Fill all the fields correct'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    // you can display the error message returned by the API
    final data = json.decode(response.body);
    final error = data['non_field_errors'][0];
    // display the error message to the user
  } else {
    // some other error occurred
    // you can display a generic error message to the user
  }
}

Future<void> login(String phoneNumber, String password) async {
  final response = await http.post(loginUrl as Uri, body: {
    'phone_number': phoneNumber,
    'password': password,
  });

  if (response.statusCode == 200) {
    // login successful
    Navigator.push(context as BuildContext,
        MaterialPageRoute(builder: (context) {
      return Admin();
    }));
    // you can store the user token returned by the API in a secure storage
    final data = json.decode(response.body);
    final token = data['token'];
    // store the token securely
  } else if (response.statusCode == 400) {
    // validation error
    showDialog<String>(
      context: context as BuildContext,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('Login Failed'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    // you can display the error message returned by the API
    final data = json.decode(response.body);
    final error = data['non_field_errors'][0];
    // display the error message to the user
  } else {
    // some other error occurred
    // you can display a generic error message to the user
  }
}
