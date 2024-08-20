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
              Text('Welcome to Corail', style: TextStyle(fontSize: MediaQuery.of(context).size.width / 20 , color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Poppins-Medium'),),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 33,
                      width: 90,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Center(
                        child: Text('+ 0 Pts', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13)),
                      )),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.notifications_none, color: Colors.white,),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          child: PageView(
            children: images.map((image) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(image, fit: BoxFit.contain),
                ),
              );
            }).toList(),
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
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