import 'dart:convert';
import 'package:corail_clone/Data/Urls.dart';
import 'package:corail_clone/Data/User.dart';
import 'package:corail_clone/Providers/UserProvider.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

login(String email, String password, UserProvider userProvider) async {

  var body = {
    'email': email,
    'motpasse': password,
  };
  try {
    var response = await http.post(
      Uri.parse(AppEndPoints.login),
      body: json.encode(body), 
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['accessToken'] == null || responseData['refreshToken'] == null) {
        throw Exception('Access token or refresh token is missing from the response');
      }
      final decodedToken = JwtDecoder.decode(responseData['accessToken']);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', json.encode(responseData['accessToken']));
      final user = User.fromJson(decodedToken['user']);
      userProvider.setUser(user);
      return {'status': 'success', 'message': 'User logged in successfully'};
    } else {
      return {'status': 'error', 'message': response.body};
    }
  }
  catch (e) {
    return {'status': 'error', 'message':'An error occured. Please check your connection and try again'};
  }
}