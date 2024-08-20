import 'package:corail_clone/Auth/AuthUtils/FormHeader.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  const Address({super.key, required this.pageController, required this.cityController, required this.addressController});

  final PageController pageController;
  final cityController;
  final addressController;

  

  @override
  State<Address> createState() => _AddressState();
  
}

class _AddressState extends State<Address> {
  final _formKey = GlobalKey<FormState>();
  
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormHeader(title: 'Quelle est votre adresse ?', subtitle: "Indiquez votre adresse pour profiter pleinement de l’application Corail."),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 60),
                      decoration: InputDecoration(
                        hintText: 'Entrer nom de votre ville',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrer nom de votre ville';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          widget.cityController.text = value!;
                        },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextFormField(
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
                      validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Prenom';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          widget.addressController.text = value!;
                        },
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
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
          )
      ),
    );
  }
}