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
            Text('My Receipts', style: TextStyle(fontSize: MediaQuery.of(context).size.height / 42, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Poppins-Medium')),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(child: Text('+ 1300 Pts', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height / 65))),
                  ),
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