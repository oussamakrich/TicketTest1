import 'package:corail_clone/Data/MyColors.dart';
import 'package:corail_clone/Data/User.dart';
import 'package:corail_clone/Pages/Profile/Api/updateInfo.dart';
import 'package:corail_clone/Pages/Profile/ProfilePages/Inputs.dart';
import 'package:corail_clone/Providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateFields extends StatelessWidget {
  UpdateFields({super.key});

  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController villeController = TextEditingController();
  final TextEditingController addresseController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    UserProvider userProvider = Provider.of<UserProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Paramétre du Compte', style: TextStyle(color: MyColors.mainColor, fontSize: MediaQuery.of(context).size.height / 55, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomInput(hintText: userProvider.user.nom, label: 'Nom', controller: nomController, isOne: false),
              CustomInput(hintText: userProvider.user.prenom, label: 'prenom', controller: prenomController, isOne: false),
            ],
          ),
          const SizedBox(height: 10),
          CustomInput(hintText: userProvider.user.email, label: 'Email', controller: emailController, isOne: true),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomInput(hintText: userProvider.user.ville, label: 'ville', controller: villeController, isOne: false),
              CustomInput(hintText: userProvider.user.address.toString(), label: 'Adresse', controller: addresseController, isOne: false),
            ],
          ),
          const SizedBox(height: 10),
          CustomInput(hintText: userProvider.user.telephone, label: 'Telephone', controller: telephoneController, isOne: true),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomInput(hintText: '', label: 'Sex', controller: sexController, isOne: false),
              CustomInput(hintText: userProvider.user.dateNaissance.toString(), label: 'Date Naissance', controller: dateController, isOne: false),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Center(child: Text('Annuler', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height / 65),)),
                  ),
                ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                      color: MyColors.mainColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Center(child: Text('Valider', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height / 65),)),
                  ),

                  onTap: () async {
                    if (checkEmptyFields(nomController.text, prenomController.text, emailController.text, telephoneController.text, addresseController.text, villeController.text, dateController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('Veuillez remplir les champs'), backgroundColor: Colors.red,));
                      return;
                    }

                    var status = await updateProfileInfo(
                      nomController.text.isEmpty ? userProvider.user.nom : nomController.text,
                      prenomController.text.isEmpty ? userProvider.user.prenom : prenomController.text,
                      emailController.text.isEmpty ? userProvider.user.email : emailController.text,
                      telephoneController.text.isEmpty ? userProvider.user.telephone : telephoneController.text,
                      addresseController.text.isEmpty ? userProvider.user.address : addresseController.text,
                      villeController.text.isEmpty ? userProvider.user.ville : villeController.text,
                      dateController.text.isEmpty ? userProvider.user.dateNaissance : int.parse(dateController.text),
                      userProvider.user.id,
                    );
                    if (status['status'] == 'success') {
                      updateUser(userProvider, nomController, prenomController, emailController, telephoneController, addresseController, villeController, dateController);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(status['message']), backgroundColor: Colors.green,));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(status['message']), backgroundColor: Colors.red,));
                    }
                  },
                )
              ],
            ),
      
        ],
      ),
    );
  }
}

updateUser(UserProvider userProvider, nomController, prenomController, emailController, telephoneController, addresseController, villeController, dateController) {
  User user = User(
    id: userProvider.user.id,
    nom: nomController.text.isEmpty ? userProvider.user.nom : nomController.text,
    prenom: prenomController.text.isEmpty ? userProvider.user.prenom : prenomController.text,
    email: emailController.text.isEmpty ? userProvider.user.email : emailController.text,
    telephone: telephoneController.text.isEmpty ? userProvider.user.telephone : telephoneController.text,
    address: addresseController.text.isEmpty ? userProvider.user.address : addresseController.text,
    ville: villeController.text.isEmpty ? userProvider.user.ville : villeController.text,
    dateNaissance: dateController.text.isEmpty ? userProvider.user.dateNaissance : int.parse(dateController.text),
  );
  userProvider.setUser(user);
}

checkEmptyFields(String nom, String prenom, String email, String telephone, String adresse, String ville, String dateNaissance) {
  if (nom.isEmpty || prenom.isEmpty || email.isEmpty || telephone.isEmpty || adresse.isEmpty || ville.isEmpty || dateNaissance.isEmpty) {
    return false;
  } else {
    return true;
  }
}