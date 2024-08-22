import 'package:corail_clone/Data/MyColors.dart';
import 'package:corail_clone/Pages/Home/Home.dart';
import 'package:corail_clone/Pages/Profile/Profile.dart';
import 'package:corail_clone/Pages/Receipt/Receipts.dart';
import 'package:corail_clone/Pages/Rewards/Rewards.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final PageController controller = PageController();
  int _currentIndex = 0;

  void updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void changePage(int index) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: PageView(
        controller: controller,
        onPageChanged: updateIndex,
        children: const [
          Home(),
          Rewards(),
          Receipts(),
          Profile(),
        ],
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isKeyboardOpen ? null : Padding(
        padding: const EdgeInsets.only(top: 20),
        child: FloatingActionButton(
          backgroundColor: MyColors.mainColor,
          mini: true,
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Icon(Icons.qr_code_scanner_sharp, color: Colors.white,),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: MyColors.mainColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          changePage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey, size: MediaQuery.of(context).size.width * 0.07,),
            activeIcon: Icon(Icons.home, color: MyColors.mainColor, size: MediaQuery.of(context).size.width * 0.07,),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined, color: Colors.grey, size: MediaQuery.of(context).size.width * 0.07,),
            activeIcon: Icon(Icons.list_alt_outlined, color: MyColors.mainColor,size: MediaQuery.of(context).size.width * 0.07,),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt, color: Colors.grey, size: MediaQuery.of(context).size.width * 0.07,),
            activeIcon: Icon(Icons.receipt, color: MyColors.mainColor, size: MediaQuery.of(context).size.width * 0.07,),
            label: 'Receipt'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey,size: MediaQuery.of(context).size.width * 0.07,),
            activeIcon: Icon(Icons.person, color: MyColors.mainColor, size: MediaQuery.of(context).size.width * 0.07,),
            label: 'Profile'
          ),
        ] 
      ), 

    );
  }
}