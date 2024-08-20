import 'package:corail_clone/Pages/Profile/ProfilePages/UpdateFields.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/profileBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
             Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.white,
                        ),
                        Text('Profie', style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height / 35, fontWeight: FontWeight.bold),),
                        IconButton(
                          icon: const Icon(Icons.notifications_none),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 11,
                      backgroundColor: Colors.white24,
                      child: const Icon(Icons.camera_alt_outlined, color: Colors.white),
                    ),
                    
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: UpdateFields(),
              )
              ),
          ],
        ),
      ),
    );
  }
}