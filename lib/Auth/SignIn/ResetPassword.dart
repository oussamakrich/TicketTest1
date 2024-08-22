import 'package:corail_clone/Auth/Api/ResetPasswordUtils.dart';
import 'package:corail_clone/Auth/AuthUtils/FormHeader.dart';
import 'package:corail_clone/Auth/SignIn/SignInScreen.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key, required this.emailController, required this.codeController});

  TextEditingController emailController;
  TextEditingController codeController;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.language, size: 17, color: MyColors.mainColor),
              SizedBox(width: 5),
              Text('Français', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              Icon(Icons.arrow_drop_down, size: 17),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                 width: MediaQuery.of(context).size.width / 4,
                 height: MediaQuery.of(context).size.width / 4,
              ),
              const SizedBox(height: 20),
              FormHeader(title: 'Réinitialisation du Mot de Passe', subtitle: "Veuillez entrer un nouveau mot de passe pour votre compte. Assurez-vous qu'il est sécurisé et facile à retenir."),
              const SizedBox(height: 20),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mot de passe', style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.height / 60)),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 60),
                      decoration: InputDecoration(
                        hintText: 'Mot de passe',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) =>  passwordController.text = value,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text('Confirmer mot de passe', style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.height / 60)),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 60),
                      decoration: InputDecoration(
                        hintText: 'Confirmer mot de passe',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) =>  confirmPasswordController.text = value,
                    ),
                  ),
                ],
              ),
                  
              const SizedBox(height: 30),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 40,
                  decoration: BoxDecoration(
                    color: MyColors.mainColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: isLoading ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: CircularProgressIndicator(color: Colors.white),
                    ) : Text(
                      'Suivant',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height / 55,
                      ),
                    ),
                  ),
                ),
                onTap: () async{
                  if (passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Veuillez entrer votre nouveau mot de passe')));
                  }
                  else if (passwordController.text != confirmPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Les mots de passe ne correspondent pas')));
                  }
                  else{
                    setState(() {
                      isLoading = true;
                    });
                    var status = await updatePassword(widget.emailController.text, widget.codeController.text, passwordController.text);
                    setState(() {
                      isLoading = false;
                    });
                    if (status['status'] == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(status['message'])));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(status['message'])));
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}