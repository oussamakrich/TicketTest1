import 'package:corail_clone/Auth/Register/Data/FormProvider.dart';
import 'package:corail_clone/Auth/Register/Pages/AboutUser.dart';
import 'package:corail_clone/Auth/Register/Pages/Address.dart';
import 'package:corail_clone/Auth/Register/Pages/EmailPassword.dart';
import 'package:corail_clone/Auth/Register/Pages/PhoneNumber.dart';
import 'package:corail_clone/Auth/Register/Pages/otp.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Registerscreen extends StatefulWidget {

  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {

  final PageController _controller = PageController();
  int _currentPage = 0;
  List<String> titles = ['Email & password', 'A propos de vous', 'Adresse', 'Numero De Telephone', 'OTP'];

  @override
  Widget build(BuildContext context) {

    return Provider(
      create: (context) => FormControllersProvider(),
      child: Scaffold(
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
            Emailpassword(pageController: _controller),
            AboutUser(pageController: _controller),
            Address(pageController: _controller,),
            PhoneNumber(pageController: _controller),
            const Otp(),
          ],
        )
      ),
    );
  }
}