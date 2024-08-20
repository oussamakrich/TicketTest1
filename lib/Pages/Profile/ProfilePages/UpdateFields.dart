import 'package:corail_clone/Data/MyColors.dart';
import 'package:corail_clone/Pages/Profile/ProfilePages/Inputs.dart';
import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Paramétre du Compte', style: TextStyle(color: MyColors.mainColor, fontSize: MediaQuery.of(context).size.height / 55, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomInput(hintText: 'username', label: 'Nom', controller: nomController, isOne: false),
              CustomInput(hintText: 'username', label: 'Nom', controller: prenomController, isOne: false),
            ],
          ),
          const SizedBox(height: 10),
          CustomInput(hintText: 'email@email.com', label: 'Email', controller: emailController, isOne: true),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomInput(hintText: 'ville', label: 'ville', controller: villeController, isOne: false),
              CustomInput(hintText: 'address-xs123', label: 'Adresse', controller: addresseController, isOne: false),
            ],
          ),
          const SizedBox(height: 10),
          CustomInput(hintText: '0684829018', label: 'Telephone', controller: telephoneController, isOne: true),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomInput(hintText: 'male', label: 'Sex', controller: sexController, isOne: false),
              CustomInput(hintText: '2105-52-65', label: 'Date Naissance', controller: dateController, isOne: false),
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
                )
              ],
            ),
      
        ],
      ),
    );
  }
}