import 'dart:convert';

import 'package:corail_clone/Data/Urls.dart';
import 'package:http/http.dart' as http;


requestReset(String email) async {
  
  try{

    var response = await http.post(
      Uri.parse(AppEndPoints.resetPassword), 
      body: json.encode({'email': email}),
      headers: {'Content-Type': 'application/json'}
    );

    if (response.statusCode == 200){
      return {'status': 'success', 'message': 'Un Code de réinitialisation de mot de passe a été envoyé à votre adresse e-mail'};
    }
    else{
      return {'status': 'error', 'message': response.body};
    }

  }
  catch (e){
    return {'status': 'error', 'message': 'Une erreur s\'est produite'};
  }

}


verifyReset(String email, String code) async{

  try{

    final response = await http.post(
        Uri.parse(AppEndPoints.verifyResetPassword),
        body: json.encode({
          'email' : email,
          'code' : code,
        }),
        headers: {'Content-Type': 'application/json'},
      );
    if (response.statusCode == 200){
      return {'status': 'success', 'message': 'Code de vérification correct'};
    }
    else{
      return {'status': 'error', 'message': response.body};
    }
  }
  catch(e){
    return {'status': 'error', 'message': 'Une erreur s\'est produite'};
  }

}

updatePassword(String email, String otp, String password) async {
  
  try{

    final response = await http.post(
        Uri.parse(AppEndPoints.updatePassword),
        body: json.encode({
          'email' : email,
          'code' : otp,
          'new_password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200){
        return {'status': 'success', 'message': 'Mot de passe mis à jour avec succès'};
      }
      else{
        return {'status': 'error', 'message': response.body};
      }
  }
  catch(e){
    return {'status': 'error', 'message': 'Une erreur s\'est produite'};
  }

}