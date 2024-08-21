class User {

  User({required this.nom, required this.prenom, required this.email, required this.address, required this.telephone, required this.ville, required this.id, required this.dateNaissance});
  
  factory User.fromJson(Map<String, dynamic> json){
    
   User user =  User(
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      address: json['address'],
      telephone: json['telephone'],
      ville: json['ville'],
      id: json['id'] as int,
      dateNaissance: json['dateNaissance'] as int,
    );
    return user;
  }

  final String nom;
  final String prenom;
  final String email;
  final String address;
  final String telephone;
  final String ville;
  final int id;
  final int dateNaissance;


}