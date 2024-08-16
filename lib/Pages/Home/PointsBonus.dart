import 'package:flutter/material.dart';

class PointBonus extends StatelessWidget {
  const PointBonus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Points Bonus',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Voir Plus',
                  style: TextStyle(color: Color(0xFF036086), fontSize: 16),
                ),
              ),
            ],
          ),
        Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Deal', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),),
                  Text('20 Pts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                ]
              ),
              Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/zara.png',
                        width: 50,
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Zara Shop Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          Text('Latest Trend in clothingfor women, en & kids', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: 0.9,
                minHeight: 5,
                backgroundColor: Colors.grey.shade300,
                valueColor:const  AlwaysStoppedAnimation<Color>(Color(0xFF036086)),
                borderRadius: BorderRadius.circular(10)
              ),
              const SizedBox(height: 5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nombre de Points', style: TextStyle(color: Color(0xFF036086), fontSize: 16,)),
                  Text('20', style: TextStyle(fontSize: 16,)),
                ]
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
               child: const Text('Shop Now', style: TextStyle(color: Color(0xFF036086))),
              ),
          ],
        ),
      ),
          
        ],
      ),
    );
  }
}