import 'package:corail_clone/Auth/AuthUtils/FormHeader.dart';
import 'package:corail_clone/Auth/Register/Data/FormProvider.dart';
import 'package:corail_clone/Auth/Api/registerUser.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key, required this.pageController});

  final PageController pageController;



  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    final formControllers = Provider.of<FormControllersProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(title: 'Entrer votre numéro de téléphone', subtitle: "Introduisez votre adresse email ou telephone pour réinitialisation du mot de passe."),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.06,
              child: TextFormField(
                controller: formControllers.phoneController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 60),
                decoration: InputDecoration(
                  hintText: 'Entrer Votre Numéro de Téléphone',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) => formControllers.phoneController.text = value,
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () async {
                if (formControllers.phoneController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Veuillez entrer votre numéro de téléphone')));
                }
                else{
                  setState(() {
                    isLoading = true;
                  });
                  Map<String, String> registerStatus = await registerUser(formControllers);
                  if (registerStatus['status'] == 'success') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Utilisateur enregistré avec succès')));
                    widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(registerStatus['message'] ?? 'Ecchec de l\'enregistrement')));
                  }
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  color: MyColors.mainColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: 
                  isLoading 
                  ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
                  ) 
                  : Text('Continuer', style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height / 60, fontFamily: 'Poppins'))
                ),
              ),
            ),
                ],
                ),
                ),
    );
  }
}