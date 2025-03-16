import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServiceUser {
  final String baseUrl = 'https://your-api-url.com/api/';

  void redirectToLogin(BuildContext context){
    Navigator.pushNamed(context, '/login');
  }

  Future<void> searchCountry(String country, BuildContext context) async {
    //TODO: trebuie sa ne gandim cum facem fetch-ul
    final response = await http.get(
      Uri.parse('$baseUrl/search/$country'),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'cookie', 
      },
    );

    if(response.statusCode == 401){
      redirectToLogin(context);
    }

    if (response.statusCode == 201) {
      
    }else{


    }
  }

  Future<void> searchGlobal(BuildContext context) async {
    //TODO: trebuie sa ne gandim cum facem fetch-ul
    final response = await http.get(
      Uri.parse('$baseUrl/search/global'),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'cookie', 
      },
    );
    
    if(response.statusCode == 401){
      redirectToLogin(context);
    }

    if (response.statusCode == 201) {
      
    }else{


    }
  }

  Future<void> searchUser(String user, BuildContext context) async {
    //TODO: trebuie sa ne gandim cum facem fetch-ul
    final response = await http.get(
      Uri.parse('$baseUrl/search/$user'),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'cookie', 
      },
    );
    
    if(response.statusCode == 401){
      redirectToLogin(context);
    }

    if (response.statusCode == 201) {
      
    }else{


    }
  }
  Future<void> getTracks(BuildContext context) async {
    //TODO: trebuie sa ne gandim cum facem fetch-ul
    final response = await http.get(
      Uri.parse('$baseUrl/tracks'),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'cookie', 
      },
    );
    
    if(response.statusCode == 401){
      redirectToLogin(context);
    }

    if (response.statusCode == 201) {
      
    }else{


    }
  }

  Future<void> getHistory(BuildContext context) async {
    //TODO: trebuie sa ne gandim cum facem fetch-ul
    final response = await http.get(
      Uri.parse('$baseUrl/history'),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'cookie', 
      },
    );
    
    if(response.statusCode == 401){
      redirectToLogin(context);
    }

    if (response.statusCode == 201) {
      
    }else{


    }
  }
  
}