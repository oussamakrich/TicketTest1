import 'package:corail_clone/Auth/AuthUtils/FormHeader.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
            // key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormHeader(title: 'Confirmer votre Compte', subtitle: "le code de confirmation a été envoyé à My email pour Confirmer votre compte"), //Change my email woith the email of the user
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: Colors.grey,
                    showFieldAsBox: true,
                    focusedBorderColor: MyColors.mainColor,
                    textStyle: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 60),
                    onSubmit: (String verificationCode){
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: const Text("Verification Code"),
                              content: Text('Code entered is $verificationCode'),
                            );
                          }
                    );}
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text("Vous n'avez pas reçu le code de confirmation ?", style: TextStyle( fontSize: MediaQuery.of(context).size.height / 60, color: Colors.grey)),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {},
                          child: Text("Renvoyer", style: TextStyle( fontSize: MediaQuery.of(context).size.height / 60, color: MyColors.mainColor)),
                        ),

                    
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      // widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        color: MyColors.mainColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: Text('Verifier', style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height / 60, fontFamily: 'Poppins'))),
                    ),
                  ),
          ],
          ),
          )
      ),
    );;
  }
}