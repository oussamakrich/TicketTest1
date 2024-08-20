import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';

class GoogleApple extends StatelessWidget {
  const GoogleApple({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Ou Continuez Avec', textAlign: TextAlign.center, style: TextStyle(color: MyColors.secondaryTextColor, fontSize: MediaQuery.of(context).size.height / 70, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),  
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.4,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Image.asset('assets/images/google.png'),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.05,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Transform.scale(scale: 1.6, child:  Image.asset('assets/images/Apple.png')),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}