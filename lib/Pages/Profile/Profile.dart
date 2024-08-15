import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      const Text('Profie', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),),
                      IconButton(
                        icon: const Icon(Icons.notifications_none),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //change it to image
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, size: 50, color: Colors.white54),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Mustapha Boufouss',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const Text(
                    'id : 0012310732003',
                    style: TextStyle(color: Colors.white70),
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
                //add route to each ListTile
                _buildListTile(Icons.person, 'Mon Profile'),
                _buildListTile(Icons.list, 'Liste de Favoris'),
                _buildListTile(Icons.lock, 'Changer Mot de passe'),
                _buildListTile(Icons.language, 'Parametre de Langue'),
                _buildListTile(Icons.exit_to_app, 'Se Deconnecter'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF0088AA)),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}