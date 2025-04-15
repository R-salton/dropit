
import 'dart:convert';

import 'package:dropit/features_auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource{
final  baseUrl = 'http://10.0.2.2:3000/auth';



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

  print(response.body);
    if (response.statusCode == 200) {

      return UserModel.fromJson(json.decode(response.body)["user"]);
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
        body: jsonEncode({
          'email': email,
          'username': username,
          'password': password,
        } ),
      );
      print(response.body);

     
        return UserModel.fromJson(jsonDecode(response.body)["user"]);
      
      
      
    } catch (e) {
      throw Exception('Failed to register: $e');
    } 

  

}}