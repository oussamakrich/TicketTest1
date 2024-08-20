import 'package:corail_clone/Auth/AuthUtils/FormHeader.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AboutUser extends StatefulWidget {
  AboutUser({super.key, required this.pageController, required this.firstNameController, required this.lastNameController, required this.dateController});

  PageController pageController;
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController dateController;

  @override
  State<AboutUser> createState() => _AboutUserState();
}

class _AboutUserState extends State<AboutUser> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();

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
                  FormHeader(title: 'Parlez-Nous de vous', subtitle: "Saisissez correctement votre nom,prénom et autres informations pour une expérience Corail optimale."),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextFormField(
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
                      validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Nom';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          widget.firstNameController.text = value!;
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
                          // form['password'] = value!;
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
                          _dateController.text = formattedDate;
                        }
                      },
                      controller: _dateController,
                      validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Date de Naissance';
                          }
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
          ],
          ),
          )
      ),
    );
  }
}