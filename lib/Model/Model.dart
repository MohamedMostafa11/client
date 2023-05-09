import 'dart:convert';
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
    Future<void> fetchData(BuildContext context) async {
      try {
        // Your API call code here
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        // Error handling code here
      }
  }
  }else if (response.statusCode == 400) {
    // validation error

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
    Future<void> fetchData(BuildContext context) async {
      try {
        // Your API call code here
        Navigator.push(context, MaterialPageRoute(builder: (context) => Admin()));
      } catch (e) {
        // Error handling code here
      }    // you can store the user token returned by the API in a secure storage
    final data = json.decode(response.body);
    final token = data['token'];
    // store the token securely
  }
  }else if (response.statusCode == 400) {
    // validation error

    // you can display the error message returned by the API
    final data = json.decode(response.body);
    final error = data['non_field_errors'][0];
    // display the error message to the user
  } else {
    // some other error occurred
    // you can display a generic error message to the user
  }
}
