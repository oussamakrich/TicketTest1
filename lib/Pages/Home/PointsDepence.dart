import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';

class PointsDepnce extends StatelessWidget {
  const PointsDepnce({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            const Text('Reçus et Dépenses', style: TextStyle(color: MyColors.mainColor, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Poppins-Medium'),),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Points', style: TextStyle(fontSize: 12)),
                    Row(
                      children: [
                        Dot(color: Colors.orange),
                        SizedBox(width: 5),
                        Text('0 Pts', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tickets', style: TextStyle(fontSize: 12)),
                    Row(
                      children: [
                        Dot(color: Colors.blue),
                        SizedBox(width: 5),
                        Text('19', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Deenses', style: TextStyle(fontSize: 11)),
                    Text('2900 Dhs', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  ],
                ),
              ]
            ),
            const SizedBox(height: 10),
            const Text('Montant Des Depenses', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 5),
            LinearProgressIndicator(
              value: 0.9,
              minHeight: 5,
              backgroundColor: Colors.grey.shade300,
              valueColor:const  AlwaysStoppedAnimation<Color>(Color(0xFF036086)),
              borderRadius: BorderRadius.circular(10)
            ),
            const SizedBox(height: 7),
            const Text('Par Mois', style: TextStyle(color: MyColors.mainColor, fontWeight: FontWeight.normal, fontSize: 11)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.grey.shade200,
                minimumSize: const Size(double.infinity, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
             child: const Text('See More', style: TextStyle(color: MyColors.mainColor, fontSize: 14, fontWeight: FontWeight.w600),),
            ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}