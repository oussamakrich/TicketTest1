import 'package:carousel_slider/carousel_slider.dart';
import 'package:corail_clone/Auth/WelcomePages/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Usage extends StatefulWidget {
  const Usage({super.key});

  @override
  State<Usage> createState() => _UsageState();
}

class _UsageState extends State<Usage> {
  

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<Map<String,String>> show = [
    {'image' : 'assets/images/onBoarding/partners.png', 'title' : 'Achetez intelligemment\navec Corail Partners', 'more' : 'Avec Corail, débarrassez-vous des reçus papier et organisez facilement vos dépenses. Plus de soucis à se faire pour perdre un reçu important'},
    {'image' : 'assets/images/onBoarding/QrCode.png', 'title' : 'Scannez le QR Code en\ncaisse et gagnez cashback', 'more' : "Retrouver vos magasins préférés et profitez de cashback et des avantages exclusifs avec l'application Corail"},
    {'image' : 'assets/images/onBoarding/Moneytransfer.png', 'title' : "Gagnez du cashback et\nprofitez d'offres exclusives", 'more' : "Profitez d'un maximum d'avantage cashback, offres exclusives et faites des économies concrètes avec l'application Corail"},
  ];

  changePage(){
    _controller.nextPage();
    if (_current == show.length - 1) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      setState(() {
        _current = 0;
      });
    }
    setState(() {
        _current++;
    });
  }
  retourPage(){
    _controller.previousPage();
    if (_current != 0) {
      setState(() {
          _current--;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Icon(Icons.arrow_back, size: 25, color: Colors.black,),
                  SizedBox(width: 20),
                  Text('Comment utilser Corail', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                ],
              ),
              const Spacer(),
              CarouselSlider(
                items: List.generate(show.length, (index) {
                  Map<String, String> item  = show[index];
                   return Column(
                         children: [
                            Image.asset(item['image']!, height: 150),
                            const SizedBox(height: 30),
                            Text(item['title']!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            const SizedBox(height: 20),
                            Text(item['more']!,style: TextStyle(color: Colors.grey[600]), textAlign: TextAlign.center),
                           ]
                      );
                    }
                  ),
                carouselController: _controller,
                options: CarouselOptions(
                  height: 350,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                )
              ),
              
              const SizedBox(height: 30),
              AnimatedSmoothIndicator(
                activeIndex: _current,
                count: show.length,
                effect: const WormEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  activeDotColor: Color(0xFF036086),
                  dotColor: Colors.grey,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {retourPage();},
                    child: const Row(
                      children: [
                        Icon(Icons.arrow_back, size: 20, color: Color(0xFF036086)),
                        Text('Retour', style: TextStyle(color: Color(0xFF036086), fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF036086),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {changePage();},
                      child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Continuer', style: TextStyle(color: Colors.white),),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward, size: 18, color: Colors.white,),
                    ],
                                    ),
                                  ),
                  ),
                
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('vous avez déjà un compte?'),
                  TextButton(
                    child: const Text('Se connecter', style: TextStyle(color: Color(0xFF036086))),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );;
  }
}