import 'package:flutter/material.dart';

class HistoriqueDepences extends StatelessWidget {
  HistoriqueDepences({super.key});

  final List<Map<String, String>> historique = [
    {'name' : 'Zara', 'price' : '350 Dhs', 'logo': 'assets/images/zara.png', 'date' : '2024-02-14'},
    {'name' : 'Zara', 'price' : '450 Dhs', 'logo': 'assets/images/zara.png', 'date' : '2024-03-30'},
    {'name' : 'Zara', 'price' : '180 Dhs', 'logo': 'assets/images/zara.png', 'date' : '2024-05-26'},
    {'name' : 'Zara', 'price' : '150 Dhs', 'logo': 'assets/images/zara.png', 'date' : '2024-07-16'},
    {'name' : 'Zara', 'price' : '180 Dhs', 'logo': 'assets/images/zara.png', 'date' : '2024-07-16'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Historique Des Depences', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              TextButton(
                onPressed: () {},
                child: const Text('Voir Plus', style: TextStyle(color: Color(0xFF036086), fontSize: 16)),
              ),
            ],
          ),
          SizedBox(
            height: 70,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: historique.length,
              itemBuilder: (context, index) => HistoriqueCard(historique: historique[index]),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoriqueCard extends StatelessWidget {
  const HistoriqueCard({super.key, required this.historique});

  final Map<String, String> historique;

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        historique['logo']!,
                        width: 50,
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(historique['name']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        Text(historique['date']!, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
                Text(historique['price']!, style: const  TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
              ],
            )
          );
  }
}