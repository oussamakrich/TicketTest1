import 'package:corail_clone/Auth/Register/RegisterScreen.dart';
import 'package:corail_clone/Pages/Profile/ProfilePages/UpdateProfile.dart';
import 'package:corail_clone/Providers/UserProvider.dart';
import 'package:corail_clone/Data/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {

  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

  disconnected() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('name');
      prefs.remove('lastname');
      prefs.remove('password');
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Registerscreen()));
    }

    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final User user = userProvider.user;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/profileBackground.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
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
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 15,
                      backgroundColor: Colors.white24,
                      child: const Icon(Icons.person, color: Colors.white54),
                    ),
                    Column(
                      children: [
                        Text(
                          '${user.firstName} ${user.lastName}',
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Text(
                          'id : 0012310732003',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Apercu du compte', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ProfileSection(icon :Icons.person,title:  'Mon Profile', callBack: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProfile()));}),
                  ProfileSection(icon :Icons.list, title: 'Liste de Favoris', callBack: () {}),
                  ProfileSection(icon :Icons.lock, title: 'Changer Mot de passe', callBack: () {}),
                  ProfileSection(icon :Icons.language, title: 'Parametre de Langue', callBack: () {}),
                  ProfileSection(icon :Icons.exit_to_app, title: 'Se Deconnecter', callBack: disconnected),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key, required this.icon, required this.title, required this.callBack});

  final IconData icon;
  final String title;
  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF0088AA)),
      title: Text(title, style: TextStyle(fontSize: MediaQuery.of(context).size.height / 50),),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {callBack();},
    );
  }
}

