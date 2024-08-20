import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  FormHeader({super.key, required this.title, required this.subtitle});

  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: MediaQuery.of(context).size.height / 45, fontFamily: 'Poppins')),
        const SizedBox(height: 10),
        Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.height / 70, fontFamily: 'Poppins')),
        const SizedBox(height: 20),
      ],
    );
  }
}