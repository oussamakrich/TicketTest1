import 'package:flutter/material.dart';

class ReceitpsHeader extends StatelessWidget {
  const ReceitpsHeader({super.key});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(50)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios, size: 20,)),
              Column(
                children: [
                  const Text('Current Month June', style: TextStyle(fontSize: 16, color:Color(0xFF036086), fontWeight: FontWeight.bold)),
                  Text('Click for Custom', style: TextStyle(color:Colors.grey.shade600)),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios, size: 20,)),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(
          height: 40,
          child: SearchBar(
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 15)),
            shadowColor: WidgetStatePropertyAll(Colors.transparent),
            backgroundColor: WidgetStatePropertyAll(Colors.transparent),
            side: WidgetStatePropertyAll(BorderSide(color: Colors.grey)),
            leading: Icon(Icons.search, color: Colors.grey),
            hintText: 'Recherchez ici',
            hintStyle: WidgetStatePropertyAll(TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xFF036086),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.filter_alt_rounded, color: Colors.white, size: 18,),
                  SizedBox(width: 5),
                  Text('Filter', style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.sort, color: Color(0xFF036086),),
                  SizedBox(width: 5),
                  Text('Sort High to Low', style: TextStyle(color: Color(0xFF036086)),),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}