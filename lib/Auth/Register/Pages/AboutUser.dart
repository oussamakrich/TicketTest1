import 'package:corail_clone/Auth/AuthUtils/FormHeader.dart';
import 'package:corail_clone/Auth/Register/Data/FormProvider.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AboutUser extends StatefulWidget {
  AboutUser({super.key, required this.pageController});

  PageController pageController;

  @override
  State<AboutUser> createState() => _AboutUserState();
}

class _AboutUserState extends State<AboutUser> {


  @override
  Widget build(BuildContext context) {

    FormControllersProvider formControllers = Provider.of<FormControllersProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(title: 'Parlez-Nous de vous', subtitle: "Saisissez correctement votre nom,prénom et autres informations pour une expérience Corail optimale."),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.06,
              child: TextFormField(
                controller: formControllers.firstNameController,
                style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 60),
                decoration: InputDecoration(
                  hintText: 'Entrer Votre Nom',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) => formControllers.firstNameController.text = value,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.06,
              child: TextFormField(
                controller: formControllers.lastNameController,
                style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 60),
                decoration: InputDecoration(
                  hintText: 'Entrer Votre Prenom',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) =>  formControllers.lastNameController.text = value,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
               width: MediaQuery.of(context).size.width * 0.9,
               height: MediaQuery.of(context).size.height * 0.06,
              child: TextFormField(
                style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 60),
                decoration: InputDecoration(
                  hintText: 'Date de Naissance',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                ),
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                     String formattedDate =  DateFormat('yyyy-MM-dd').format(picked);
                      formControllers.dateController.text = formattedDate;
                  }
                },
                controller: formControllers.dateController,
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () async {
                if (formControllers.firstNameController.text.isEmpty || formControllers.lastNameController.text.isEmpty || formControllers.dateController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Veuillez remplir tous les champs')));
                } 
                else {
                  widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  color: MyColors.mainColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Text('Continuer', style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height / 60, fontFamily: 'Poppins'))),
              ),
            ),
                ],
                ),
                ),
    );
  }
}