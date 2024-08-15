import 'package:corail_clone/Pages/Home/PointsDepence.dart';
import 'package:corail_clone/Pages/Home/SalesShow.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SalesShow(),
            SizedBox(height: 10),
            PointsDepnce(),
          ],
        ),
    );
  }
}