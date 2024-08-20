import 'package:carousel_slider/carousel_slider.dart';
import 'package:corail_clone/InitialPages/UsagePages/UsagePage.dart';
import 'package:corail_clone/Data/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<Map<String,String>> show = [
    {'image' : 'assets/images/onBoarding/Cash.png', 'title' : 'Bienvenue à Corail \n Gagnez & Économisez', 'more' : 'Gagnez des points de cashback sur vos achats quotidiens dans vos magasins préférés tels que Marjan, Carrefour, Zara et plus encore !'},
    {'image' : 'assets/images/onBoarding/onlinePayment.png', 'title' : 'Bye les Reçus Papier\n Numérisez & Organisez', 'more' : 'Avec Corail, débarrassez-vous des reçus papier et organisez facilement vos dépenses. Plus de soucis à se faire pour perdre un reçu important'},
    {'image' : 'assets/images/onBoarding/Analysis.png', 'title' : 'Découvrez vos habitudes\n achat', 'more' : 'Corail vous aide à suivre vos dépenses et à les afficher de manière simple pour comprendre comment vous dépensez votre argent'},
  ];

  changePage(){
    _controller.nextPage();
    if (_current == show.length - 1) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Usage()));
      setState(() {
        _current = 0;
      });
    }
    setState(() {
        _current++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.language, size: 17, color: MyColors.mainColor),
                    SizedBox(width: 5),
                    Text('Français', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    Icon(Icons.arrow_drop_down, size: 17),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/logo.png',
                 width: MediaQuery.of(context).size.width / 4,
                 height: MediaQuery.of(context).size.width / 4,
              ),
              
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
              

              AnimatedSmoothIndicator(
                activeIndex: _current,
                count: show.length,
                effect: const WormEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  activeDotColor: Colors.blue,
                  dotColor: Colors.grey,
                ),
              ),
              Column(
                children: [
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 40,
                      decoration: BoxDecoration(
                        color: MyColors.mainColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Center(
                            child: Text(
                              'Continuer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.height / 55,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          const Icon(
                              color: Colors.white,
                              size: 19,
                              Icons.arrow_forward
                          ),
                        ],
                      ),
                    ),
                    onTap: (){changePage();},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('vous avez déjà un compte?', style: TextStyle(color:  MyColors.secondaryTextColor)),
                      TextButton(
                        child: const Text('Se connecter', style: TextStyle(color: Color(0xFF036086))),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}