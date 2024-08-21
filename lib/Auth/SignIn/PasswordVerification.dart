import 'package:corail_clone/Auth/Api/ResetPasswordUtils.dart';
import 'package:corail_clone/Auth/AuthUtils/FormHeader.dart';
import 'package:corail_clone/Auth/SignIn/ResetPassword.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';

class PasswordVerification extends StatefulWidget {
  PasswordVerification({super.key, required this.emailController});

  TextEditingController emailController;
  @override
  State<PasswordVerification> createState() => _PasswordVerificationState();
}

class _PasswordVerificationState extends State<PasswordVerification> {
  TextEditingController codeController = TextEditingController();

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
              FormHeader(title: 'Entrez le Code de verification ?', subtitle: "Veuillez entrer le code de vérification que nous vous avons envoyé par e-mail ou par SMS. Si vous n'avez pas reçu le code, vérifiez vos spams ou demandez un nouvel envoi."),
              const SizedBox(height: 20),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Code de Verification', style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.height / 60)),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 60),
                      decoration: InputDecoration(
                        hintText: 'Code de Verification',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) =>  codeController.text = value,
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
                    child: isLoading ? const CircularProgressIndicator(color: Colors.white,) : Text(
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
                  if (codeController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Veuillez entrer votre email')));
                  }
                  else{
                    setState(() {
                      isLoading = true;
                    });
                    var status = await verifyReset(widget.emailController.text, codeController.text);
                    setState(() {
                      isLoading = false;
                    });
                    if (status['status'] == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(status['message'])));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword(emailController: widget.emailController, codeController: codeController,)));
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