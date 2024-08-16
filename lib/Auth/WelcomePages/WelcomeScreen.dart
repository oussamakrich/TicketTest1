import 'package:carousel_slider/carousel_slider.dart';
import 'package:corail_clone/Auth/RegisterScreen.dart';
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
    print(_current);
    _controller.nextPage();
    if (_current == show.length - 1) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Registerscreen()));
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
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.language, size: 20, color: Color(0xFF036086),),
                    SizedBox(width: 5),
                    Text('Français'),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/images/logo.png', height: 50),
              const SizedBox(height: 40),
              
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
              // Continue button
              ElevatedButton(
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
    );
  }
}

class Show extends StatelessWidget {
  const Show({super.key, required this.show});

  final Map<String, String> show;  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
         children: [
          Image.asset(show['image']!, height: 150),
          const SizedBox(height: 30),
          Text(show['title']!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          const SizedBox(height: 20),
          Text(show['more']!,style: TextStyle(color: Colors.grey[600]), textAlign: TextAlign.center),
         ]
      ),
    ) ;
  }
}