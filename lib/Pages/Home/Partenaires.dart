import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';

class Partenaires extends StatelessWidget {
  Partenaires({super.key});

  final List<Map<String, String>> partenairesList = [
    {'name' : 'Zara', 'logo': 'assets/images/zara.png',},
    {'name' : 'Marjan', 'logo': 'assets/images/marjan.png',},
    {'name' : 'Marjan', 'logo': 'assets/images/marjan.png',},
    {'name' : 'Zara', 'logo': 'assets/images/zara.png',},
    // {'name' : 'Marjan', 'logo': 'assets/images/marjan.png',},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Nos Partenaires', style: TextStyle(fontSize: 15,fontFamily: 'Poppins-Medium',  fontWeight: FontWeight.bold),),
              TextButton(
                onPressed: () {},
                child: const Text('Voir Plus', style: TextStyle(color: MyColors.mainColor, fontSize: 13)),
              ),
            ],
          ),
          InkWell(
            onTap: (){},
            child: Container(
              width: 120,
              height: 30,
              decoration: BoxDecoration(
                color: MyColors.mainColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text('Tous Les Categories',style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold,)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height > 600 ? 200 : 150,
            child: GridView.builder(
              itemCount: partenairesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 2.2,
              ),
              itemBuilder: (context, index) => PartenaireCard(partenaire: partenairesList[index],),
            ),
          ),
        ],
      ),
    );
  }
}

class PartenaireCard extends StatelessWidget {
  const PartenaireCard({super.key, required this.partenaire});

  final Map<String, String> partenaire;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(partenaire['logo']!, fit: BoxFit.contain),
    );
  }
}