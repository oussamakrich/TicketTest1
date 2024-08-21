
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:corail_clone/Data/Urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

updateProfileInfo(
  String nom,
  String prenom,
  String email,
  String telephone,
  String adresse,
  String ville,
  int dateNaissance,
  int id,
) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    Map<String, String> headers = {
      'Authorization': accessToken,
      "Content-type": "application/json",
    };
    var body = {
        "nom": nom,
        "prenom": prenom,
        "dateNaissance": dateNaissance,
        "ville": ville,
        "email": email,
        "address": adresse,
        "telephone": telephone,
    };
    try{
      final response = await http.put(
        Uri.parse(AppEndPoints.updateProfile + id.toString()),
        headers: headers,
        body: json.encode(body), 
      );

      if (response.statusCode == 200) {
        
        return {'status': 'success', 'message': 'Profil mis à jour avec succès'};
      } else {
        return {'status': 'error', 'message': response.body};
      }
    }
    catch(e){
      return {'status': 'error', 'message': 'Une Erreur est survenue'};
    }

}


updateProfileImage(pickedFile, id) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String accessToken = prefs.getString('accessToken')!;

  var uri = Uri.parse(AppEndPoints.updateProfile);

    var request = http.MultipartRequest('PUT', uri);
    Map<String, String> headers = {
      "Authorization" : accessToken,
      "Content-type": "multipart/form-data"
    };
    var multipartFile = await http.MultipartFile.fromPath('file', pickedFile.path);

    request.files.add(multipartFile);
    request.headers.addAll(headers);
    var response = await request.send();

    if (response.statusCode == 200) {
      return {'status': 'success', 'message': 'Profil mis à jour avec succès'};
    } else {
      return {'status': 'error', 'message': response.reasonPhrase};
    }

}