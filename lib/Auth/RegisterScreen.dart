// import 'package:corail_clone/Pages/HomeScreen.dart';
// import 'package:corail_clone/Providers/UserProvider.dart';
// import 'package:corail_clone/Data/User.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Registerscreen extends StatefulWidget {

//   const Registerscreen({super.key});

//   @override
//   State<Registerscreen> createState() => _RegisterscreenState();
// }

// class _RegisterscreenState extends State<Registerscreen> {

//   List<bool> obscureTexts = [true, true];
//   final _formKey = GlobalKey<FormState>();

//   Map<String, String> form = {
//     'lastname': '',
//     'password': '',
//     'name': '',
//   };

//   void _toggleVisibility(index) {
//     setState(() {
//       obscureTexts[index] = !obscureTexts[index];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//     final UserProvider userProvider = Provider.of<UserProvider>(context);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {},
//         ),
//         centerTitle: true,
//         title: const Text('Créer un compte', style: TextStyle(fontWeight: FontWeight.w600),),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const Text('Créer votre compte Corail', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                 const Text('Entrez votre adress mail et créer un mot de passe sécurisé', style: TextStyle(color: Colors.grey)),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//                   decoration: InputDecoration(
//                     hintText: 'Entrer Votre nom',
//                     hintStyle: const TextStyle(color: Colors.grey),
//                     filled: true,
//                     fillColor: Colors.grey.shade200,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       form['name']  = value!;
//                     },
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//                   decoration: InputDecoration(
//                     hintText: 'Entrer Votre prenom',
//                     hintStyle: const TextStyle(color: Colors.grey),
//                     filled: true,
//                     fillColor: Colors.grey.shade200,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your prenom';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       form['lastname']  = value!;
//                     },
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//                   obscureText: obscureTexts[0],
//                   decoration: InputDecoration(
//                     hintText: 'Entrer Mot de passe',
//                     hintStyle: const TextStyle(color: Colors.grey),
//                     filled: true,
//                     fillColor: Colors.grey.shade200,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide.none,
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(obscureTexts[0] ? Icons.visibility_off : Icons.visibility),
//                       onPressed: () =>  _toggleVisibility(0),
//                     ),
//                     // suffixIcon: const Icon(Icons.visibility_off),
//                   ),
//                   validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       form['password'] = value!;
//                     },
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//                   obscureText: obscureTexts[1],
//                   decoration: InputDecoration(
//                     hintText: 'Confirmer Mot de passe',
//                     hintStyle: const TextStyle(color: Colors.grey),
//                     filled: true,
//                     fillColor: Colors.grey.shade200,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide.none,
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(obscureTexts[1] ? Icons.visibility_off : Icons.visibility),
//                       onPressed: () =>  _toggleVisibility(1),
//                     ),
//                   ),
//                   validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please confirm your password';
//                       }
//                       if (value != form['password']) {
//                         return 'Passwords do not match';
//                       }
//                       return null;
//                     },
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF036086),
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                   ),
//                   child: const Text('Créer', style: TextStyle(color: Colors.white),),
//                   onPressed: () async {
//                       _formKey.currentState!.save();
//                     if (_formKey.currentState!.validate()) {
//                       SharedPreferences prefs = await SharedPreferences.getInstance();
//                       await prefs.setString('name', form['name']!);
//                       await prefs.setString('lastname', form['lastname']!);
//                       await prefs.setString('password', form['password']!);
//                       userProvider.setUser(User(firstName: form['name']!, lastName: form['lastname']!));
//                       Navigator.push(context, MaterialPageRoute(builder : (context) => const HomeScreen()));
//                     }
//                     else{
//                       print('error');
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 const Text('Ou Continuez Avec', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     OutlinedButton(
//                       onPressed: () {},
//                       style: OutlinedButton.styleFrom(
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
//                       ),
//                       child: Image.asset('assets/images/google.png', height: 24),
//                     ),
//                     OutlinedButton(
//                       onPressed: () {},
//                       style: OutlinedButton.styleFrom(
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
//                       ),
//                       child: Image.asset('assets/images/Apple.png', height: 24),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('vous avez déjà un compte?', style: TextStyle(color: Colors.grey),),
//                     TextButton(
//                       child: const Text('Se Connecter', style: TextStyle(color: Color(0xFF036086)),),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:corail_clone/Auth/Pages/AboutUser.dart';
import 'package:corail_clone/Auth/Pages/Address.dart';
import 'package:corail_clone/Auth/Pages/EmailPassword.dart';
import 'package:corail_clone/Auth/Pages/PhoneNumber.dart';
import 'package:corail_clone/Auth/Pages/otp.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:corail_clone/Providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Registerscreen extends StatefulWidget {

  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {

  final PageController _controller = PageController();
    final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  
  int _currentPage = 0;

  List<String> titles = ['Email & password', 'A propos de vous', 'Adresse', 'Numero De Telephone', 'OTP'];

  @override
  Widget build(BuildContext context) {

    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {setState(() {
            if (_currentPage == 0) {
              Navigator.pop(context);
            } else {
              _currentPage--;
              _controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
            }
          });},
        ),
        centerTitle: true,
        title: Text('Créer un compte', style: TextStyle(fontWeight: FontWeight.w400, fontSize: MediaQuery.of(context).size.height / 40, fontFamily: 'Poppins'),),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Column(
            children: [
              Text('(${titles[_currentPage]} $_currentPage/5)', style: const TextStyle(fontSize: 12),),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: LinearProgressIndicator(
                  value: _currentPage / 4,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation<Color>(MyColors.mainColor),
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        onPageChanged: (value) => setState(() => _currentPage = value),
        children: [
          Emailpassword(emailController: emailController, passwordController: passwordController, pageController: _controller,),
          AboutUser(pageController: _controller, firstNameController: firstNameController, lastNameController: lastNameController, dateController: dateController),
          Address(pageController: _controller, cityController: cityController, addressController: addressController),
          PhoneNumber(pageController: _controller, phoneController: phoneController),
          const Otp(),
        ],
      )
    );
  }
}