
import 'dart:convert';

import 'package:dropit/features_auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource{
final String baseUrl = "http://localhost:3000/auth";


/// Returns a [UserModel] object if the login is successful.

Future<UserModel> login({required String email, required String password}) async {

  try {

    final response = await http.post(
    Uri.parse('$baseUrl/login'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonDecode({
      'email': email,
      'password': password,
    } as String),
  );
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    }

     
    throw Exception('Invalid email or password');
    

    
  } catch (e) {
    throw Exception('Failed to login: $e');
  }}



  /// Returns a [UserModel] object if the registration is successful.
  
  Future<UserModel> register({required String email, required String username, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonDecode({
          'email': email,
          'username': username,
          'password': password,
        } as String),
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(json.decode(response.body));
      }
      throw Exception('Failed to register');
      
      
      
    } catch (e) {
      throw Exception('Failed to register: $e');
    } 

  

}}