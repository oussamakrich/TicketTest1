import 'package:corail_clone/Auth/Api/login.dart';
import 'package:corail_clone/Auth/AuthUtils/FormHeader.dart';
import 'package:corail_clone/Auth/AuthUtils/GoogleApple.dart';
import 'package:corail_clone/Auth/Register/Pages/EmailPassword.dart';
import 'package:corail_clone/Auth/Register/RegisterScreen.dart';
import 'package:corail_clone/Auth/SignIn/ForgetPassword.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:corail_clone/Pages/HomeScreen.dart';
import 'package:corail_clone/Providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscureText = true;
  bool _rememberMe = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
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
              
              FormHeader(title: 'Connecter vous sur Corail', subtitle: 'Entrez votre adress mail et connecter vous sur votre  compte Corail'),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Adresse Email', style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.height / 60)),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 60),
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
                      onChanged: (value) => emailController.text = value,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Adresse Email', style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.height / 60)),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextFormField(
                      obscureText: obscureText,
                      style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 60),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.grey[700],),
                          onPressed: () =>  setState(() => obscureText = !obscureText),
                        ),
                        hintText: 'Entrer Mot de passe',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) => passwordController.text = value,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.scale(
                            scale: 0.8,
                            alignment: Alignment.centerLeft,
                            child: Switch(
                              value: _rememberMe,
                              inactiveThumbColor: Colors.white,
                              trackOutlineColor: const WidgetStatePropertyAll<Color>(MyColors.mainColor),
                              activeColor: MyColors.mainColor,
                              onChanged: (value){
                                setState(() {
                                  _rememberMe = !_rememberMe;
                                });
                              }
                            ),
                          ),
                          Text('Remember Me', style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.height / 60, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      InkWell(
                        child: Text('Mot de passe oublié?', style: TextStyle(color: MyColors.mainColor, fontSize: MediaQuery.of(context).size.height / 60, fontWeight: FontWeight.bold)),
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPassword()));},
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 40,
                      decoration: BoxDecoration(
                        color: MyColors.mainColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: isLoading ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 3,) : Text(
                                'Se Conecter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height / 60,
                                ),
                              ),
                      ),
                    ),
                    onTap: () async {
                        if (confirmEmail(emailController.text) == false) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar( content: Text('Entrez une adresse Email valide')));
                          return;
                        }
                        if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                          setState(() {
                            isLoading = true;
                          });
                          var response = await login(emailController.text, passwordController.text, userProvider);
                          setState(() {
                            isLoading = false;
                          });
                          if (response['status'] == 'success') {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response['message'])));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Veuillez remplir tous les champs')));
                        }
                    },
                  ),
                  const SizedBox(height: 10),
                  const GoogleApple(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("vous n'avez pas un compte?", style: TextStyle(color:  MyColors.secondaryTextColor, fontSize: MediaQuery.of(context).size.height / 60 )),
                      TextButton(
                        child: Text('Créer un compte', style: TextStyle(color: Color(0xFF036086), fontSize: MediaQuery.of(context).size.height / 60 )),
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Registerscreen()));},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}