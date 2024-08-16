import 'package:flutter/material.dart';

class Myappbar extends StatelessWidget {
  const Myappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('My Receipts', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.white,
                    minimumSize: const Size(8, 30),
                    maximumSize: const Size(120, 40),
                  ),
                  onPressed: () {},
                  child: const Text('+ 1300 Pts', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: () {},
                  color: Colors.white,
                ),
              ],
            ),                
          ]
        ),
        const SizedBox(height: 30),
        
      ],
    );;
  }
}