import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';

class ReceitpsHeader extends StatelessWidget {
  const ReceitpsHeader({super.key});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(50)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey.shade700,)),
              Column(
                children: [
                  const Row(
                    children: [
                      Text('Current Month', style: TextStyle(color:Colors.grey, fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      Text('June', style: TextStyle(color:Color(0xFF036086), fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text('Click for Custom', style: TextStyle(color:Colors.grey.shade600,fontSize: MediaQuery.of(context).size.height / 70,)),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade700,)),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height / 20,
          child: const  SearchBar(
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 15)),
            shadowColor: WidgetStatePropertyAll(Colors.transparent),
            backgroundColor: WidgetStatePropertyAll(Colors.transparent),
            side: WidgetStatePropertyAll(BorderSide(color: Colors.grey)),
            leading: Icon(Icons.search, color: Colors.grey),
            hintText: 'Recherchez ici',
            hintStyle: WidgetStatePropertyAll(TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15)),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  color: const Color(0xFF036086),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.filter_alt_rounded, color: Colors.white, size: 18,),
                    const SizedBox(width: 5),
                    Text('Filter', style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height / 55,),),
                    
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.sort, color: MyColors.mainColor,),
                    const SizedBox(width: 5),
                    Text('Sort High to Low', style: TextStyle(color: MyColors.mainColor, fontSize: MediaQuery.of(context).size.height / 60,),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}