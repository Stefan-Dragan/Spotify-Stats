import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:client/src/models/user.dart';

class ApiServiceAdmin {
  // Replace this with your actual backend base URL
  final String baseUrl = 'https://your-api-url.com/api/';

  void redirectToLogin(BuildContext context){
    Navigator.pushNamed(context, '/login');
  }
  
  // Fetch Users from backend
  Future<List<User>> fetchUsersFromBackend(BuildContext context) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'cookie', 
      },
    );
    if(response.statusCode == 401){
      redirectToLogin(context);
    }

    if (response.statusCode == 200) {
      // Parsing JSON data to List<User>
      final List<dynamic> data = json.decode(response.body);
      return data.map((userJson) => User.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  // Add a user to the backend
  Future<void> addUserToBackend(User user, BuildContext context) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'cookie', // Adding cookie to headers
      },
      body: json.encode(user.toJson()),
    );

    if(response.statusCode == 401){
      redirectToLogin(context);
    }

    if (response.statusCode == 201) {
      print('User added: ${user.firstName} ${user.lastName}');
    } else {
      throw Exception('Failed to add user');
    }
  }

  // Delete a user from the backend
  Future<void> deleteUserFromBackend(User user, BuildContext context) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/users/${user.id}'), // Assuming the user has an id
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'cookie', // Adding cookie to headers
      },
    );

    if(response.statusCode == 401){
      redirectToLogin(context);
    }

    if (response.statusCode == 200) {
      print('User deleted: ${user.firstName} ${user.lastName}');
    } else {
      throw Exception('Failed to delete user');
    }
  }

  // Update a user on the backend
  Future<void> updateUserInBackend(User user, BuildContext context) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/${user.id}'), // Assuming the user has an id
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'cookie', // Adding cookie to headers
      },
      body: json.encode(user.toJson()),
    );

    if(response.statusCode == 401){
      redirectToLogin(context);
    }

    if (response.statusCode == 200) {
      print('User updated: ${user.firstName} ${user.lastName}');
    } else {
      throw Exception('Failed to update user');
    }
  }
}
