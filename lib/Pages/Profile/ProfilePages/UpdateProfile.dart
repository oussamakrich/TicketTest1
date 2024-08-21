import 'package:corail_clone/Data/Urls.dart';
import 'package:corail_clone/Pages/Profile/Api/updateInfo.dart';
import 'package:corail_clone/Pages/Profile/ProfilePages/UpdateFields.dart';
import 'package:corail_clone/Providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var myImage = AppEndPoints.getProfileImg;

  @override
  Widget build(BuildContext context) {

    UserProvider userProvider = Provider.of<UserProvider>(context);
    
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
                        Text('Mon Profie', style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height / 35, fontWeight: FontWeight.bold),),
                        IconButton(
                          icon: const Icon(Icons.notifications_none),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    InkWell(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height / 11,
                        backgroundImage: NetworkImage(myImage),
                        child: const Icon(Icons.camera_alt_outlined, color: Colors.white)
                      ),
                      onTap: () async {
                        final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                        if (pickedFile != null) {
                          setState(() {
                            myImage = AppEndPoints.getProfileImg;
                          });
                          var state =  await updateProfileImage(pickedFile, userProvider.user.id);
                          if (state['status'] == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state['message']), backgroundColor: Colors.green,));
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state['message']), backgroundColor: Colors.red,));
                          }
                        }
                      },
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