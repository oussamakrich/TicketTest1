import 'package:flutter/material.dart';

class Partenaires extends StatelessWidget {
  Partenaires({super.key});

  final List<Map<String, String>> partenairesList = [
    {'name' : 'Zara', 'logo': 'assets/images/zara.png',},
    {'name' : 'Marjan', 'logo': 'assets/images/marjan.png',},
    {'name' : 'Marjan', 'logo': 'assets/images/marjan.png',},
    {'name' : 'Zara', 'logo': 'assets/images/zara.png',},
    {'name' : 'Marjan', 'logo': 'assets/images/marjan.png',},
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
              const Text('Nos Partenaires', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              TextButton(
                onPressed: () {},
                child: const Text('Voir Plus', style: TextStyle(color: Color(0xFF036086), fontSize: 16)),
              ),
            ],
          ),
          InkWell(
            onTap: (){
              /// Pass function by argument and implement filter methods
            },
            child: Container(
              width: 120,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFF01597D),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: const Center(
                child: Text(
                  'Tous Les Categories',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => PartenaireCard(partenaire: partenairesList[index],),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
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
      child: Image.asset(partenaire['logo']!, width: 50, height: 70),
    );
  }
}