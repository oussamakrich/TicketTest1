import 'package:corail_clone/Auth/AuthUtils/FormHeader.dart';
import 'package:corail_clone/Auth/AuthUtils/GoogleApple.dart';
import 'package:corail_clone/Auth/Register/Data/FormProvider.dart';
import 'package:corail_clone/Auth/SignIn/SignInScreen.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Emailpassword extends StatefulWidget {
  const Emailpassword({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<Emailpassword> createState() => _EmailpasswordState();
}

class _EmailpasswordState extends State<Emailpassword> {
  final _formKey = GlobalKey<FormState>();

  List<bool> obscureTexts = [true, true];
  

  void _toggleVisibility(index) {
    setState(() {
      obscureTexts[index] = !obscureTexts[index];
    });
  }

  @override
  Widget build(BuildContext context) {

    FormControllersProvider formControllers = Provider.of<FormControllersProvider>(context);

    return SingleChildScrollView(
      child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormHeader(title: 'Créer votre compte Corail', subtitle: 'Entrez votre adress mail et créer un mot de passe sécurisé'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 55),
                      decoration: InputDecoration(
                        hintText: 'Entrer Votre Email',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) => formControllers.emailController.text = value,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 55),
                      obscureText: obscureTexts[0],
                      decoration: InputDecoration(
                        hintText: 'Entrer Mot de passe',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(obscureTexts[0] ? Icons.visibility_off : Icons.visibility),
                          onPressed: () =>  _toggleVisibility(0),
                        ),
                      ),
                      onChanged: (value) => formControllers.passwordController.text = value,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                     width: MediaQuery.of(context).size.width * 0.9,
                     height: MediaQuery.of(context).size.height * 0.06,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 55),
                      obscureText: obscureTexts[1],
                      decoration: InputDecoration(
                        hintText: 'Confirmer Mot de passe',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(obscureTexts[1] ? Icons.visibility_off : Icons.visibility),
                          onPressed: () =>  _toggleVisibility(1),
                        ),
                      ),
                      onChanged: (value) => formControllers.confirmPasswordController.text = value,
                      
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      if (formControllers.emailController.text.isEmpty || !confirmEmail(formControllers.emailController.text)) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Entrez une adresse mail valide')));
                        return;
                      }
                      if (formControllers.passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Entrez un mot de passe')));
                        return;
                      }
                      if (formControllers.confirmPasswordController.text.isEmpty || !confirmPassword(formControllers.passwordController.text, formControllers.confirmPasswordController.text)) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Les mots de passe ne correspondent pas')));
                        return;
                      }
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
                  
                  const SizedBox(height: 20),
                  const GoogleApple(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('vous avez déjà un compte?', style: TextStyle(color: Colors.grey, fontFamily: 'Poppins'),),
                      TextButton(
                        child: const Text('Se Connecter', style: TextStyle(color: Color(0xFF036086), fontFamily: 'Poppins'),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
      ),
    );
  }
}

bool confirmEmail(String email) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}

bool confirmPassword(String password, String confirmPassword) {
  return password == confirmPassword;
}