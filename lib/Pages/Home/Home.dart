import 'package:corail_clone/Pages/Home/HistoriqueDepences.dart';
import 'package:corail_clone/Pages/Home/Partenaires.dart';
import 'package:corail_clone/Pages/Home/PointsBonus.dart';
import 'package:corail_clone/Pages/Home/PointsDepence.dart';
import 'package:corail_clone/Pages/Home/SalesShow.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SalesShow(),
            const SizedBox(height: 10),
            const PointsDepnce(),
            HistoriqueDepences(),
            Partenaires(),
            const PointBonus(),
          ],
        ),
    );
  }
}