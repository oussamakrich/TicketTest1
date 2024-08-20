import 'package:corail_clone/Auth/AuthUtils/FormHeader.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';

class Emailpassword extends StatefulWidget {
  Emailpassword({super.key, required this.emailController, required this.passwordController, required this.pageController});

  TextEditingController emailController;
  TextEditingController passwordController;
  PageController pageController;


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
                      validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          widget.emailController.text = value!;
                        },
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
                        // suffixIcon: const Icon(Icons.visibility_off),
                      ),
                      validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          // form['password'] = value!;
                        },
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
                      validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          // if (value != form['password']) {
                          //   return 'Passwords do not match';
                          // }
                          return null;
                        },
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                      //  _formKey.currentState!.save();
                      // if (_formKey.currentState!.validate()) {
                      //   // SharedPreferences prefs = await SharedPreferences.getInstance();
                      //   // await prefs.setString('name', form['name']!);
                      //   // await prefs.setString('lastname', form['lastname']!);
                      //   // await prefs.setString('password', form['password']!);
                      //   // userProvider.setUser(User(firstName: form['name']!, lastName: form['lastname']!));
                      //   // Navigator.push(context, MaterialPageRoute(builder : (context) => const HomeScreen()));
                      // }
                      // else{
                      //   print('error');
                      // }
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
                  Text('Ou Continuez Avec', textAlign: TextAlign.center, style: TextStyle(color: MyColors.secondaryTextColor, fontSize: MediaQuery.of(context).size.height / 60, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),  
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Image.asset('assets/images/google.png'),
                          ),
                        ),
                        const SizedBox(width: 15),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Transform.scale(scale: 1.6, child:  Image.asset('assets/images/Apple.png')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('vous avez déjà un compte?', style: TextStyle(color: Colors.grey, fontFamily: 'Poppins'),),
                      TextButton(
                        child: const Text('Se Connecter', style: TextStyle(color: Color(0xFF036086), fontFamily: 'Poppins'),),
                        onPressed: () {},
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