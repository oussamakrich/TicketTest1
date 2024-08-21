import 'dart:convert';

import 'package:corail_clone/Auth/Register/Data/FormProvider.dart';
import 'package:corail_clone/Data/Urls.dart';
import 'package:http/http.dart' as http;

Future<Map<String, String>> registerUser(FormControllersProvider formControllers) async {

  
   Map<String, String> body = {
      'nom': formControllers.firstNameController.text,
      'prenom': formControllers.lastNameController.text,
      'dateNaissance': formControllers.dateController.text,
      'ville': formControllers.cityController.text,
      'address': formControllers.addressController.text,
      'telephone': formControllers.phoneController.text,
      'motpasse': formControllers.passwordController.text,
      'email': formControllers.emailController.text,
  };

  try{
    var response = await http.post(
        Uri.parse(AppEndPoints.register),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
    );

    if (response.statusCode == 200) {
      return {'status': 'success', 'message': 'User registered successfully'};
    } else {
      return {'status': 'error', 'message': response.body};
    }
  }
  catch(e){
    return {'status': 'error', 'message':'An error occured. Please check your connection and try again'};
  }


}