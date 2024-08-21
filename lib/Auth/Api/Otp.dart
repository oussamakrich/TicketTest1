import 'dart:convert';
import 'package:corail_clone/Data/Urls.dart';
import 'package:http/http.dart' as http;

 checkOtp(String code) async {

  try{
    var response = await http.post(
        Uri.parse(AppEndPoints.otpActivation),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'opt': code}),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return {'status': 'success', 'message': 'User registered successfully'};
    } else {
      return {'status': 'error', 'message': 'code invalide'};
    }
  }

  catch (e) {
    return {'status': 'error', 'message':'An error occured. Please check your connection and try again'};
  }
}