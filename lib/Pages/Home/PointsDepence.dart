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
            const Text('Recus et Depences', style: TextStyle(color: Color(0xFF036086), fontSize: 16, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Points', style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        Dot(color: Colors.orange),
                        SizedBox(width: 5),
                        Text('0 Pts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Tickets', style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        Dot(color: Colors.blue),
                        SizedBox(width: 5),
                        Text('19', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Deenses', style: TextStyle(fontSize: 16)),
                    Text('2900 Dhs', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ],
                ),
              ]
            ),
            const SizedBox(height: 10),
            const Text('Montant Des Depenses', style: TextStyle(fontSize: 16,)),
            const SizedBox(height: 5),
            LinearProgressIndicator(
              value: 0.9,
              minHeight: 5,
              backgroundColor: Colors.grey.shade300,
              valueColor:const  AlwaysStoppedAnimation<Color>(Color(0xFF036086)),
              borderRadius: BorderRadius.circular(10)
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
             child: const Text('See More', style: TextStyle(color: Color(0xFF036086))),
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