import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SalesShow extends StatelessWidget {
  const SalesShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 15),
      decoration: const BoxDecoration(
        color: Color(0xFF036086),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Welcome to Corail', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.white,
                      minimumSize: const Size(10, 35),
                    ),
                    onPressed: () {},
                    child: const Text('+ 0 Pts', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
          SalesSlider(),
      
        ],
      ),
    );
  }
}


class SalesSlider extends StatefulWidget {
  SalesSlider({super.key});

  @override
  State<SalesSlider> createState() => _SalesSliderState();
}

class _SalesSliderState extends State<SalesSlider> {
  int _current = 0;

  List<String> images = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              height: 200,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: List.generate(images.length, (index) {
             return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.contain,
                  ),
                ),
              );
              }
            )
        ),
        const SizedBox(height: 20),
        AnimatedSmoothIndicator(
          activeIndex: _current,
          count: images.length,
          effect: const WormEffect(
            dotWidth: 8,
            dotHeight: 8,
            activeDotColor: Colors.white,
            dotColor: Colors.white70,
          ),
        ),
      ],
    );
  }
}