import 'package:carousel_slider/carousel_slider.dart';
import 'package:corail_clone/Auth/RegisterScreen.dart';
import 'package:corail_clone/Auth/WelcomePages/WelcomeScreen.dart';
import 'package:corail_clone/Data/MyColors.dart';
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
    if (_current == show.length - 1) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder:(context) => MyModal(context),
      );
    }
    else{
      _controller.nextPage();
      setState(() {
          _current++;
      });
    }
  }

  retourPage(){
    _controller.previousPage();
    if (_current == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      return;
    }
    setState(() {
          _current--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
          },
          icon: const Icon(Icons.arrow_back, size: 20),
        ),
        title: Text('Comment utilser Corail', style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 40, fontWeight: FontWeight.w600),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CarouselSlider(
                  items: List.generate(show.length, (index) {
                    Map<String, String> item  = show[index];
                     return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                              Image.asset(item['image']!, height: MediaQuery.of(context).size.height * 0.3),
                              const SizedBox(height: 25,),
                              Text(item['title']!, style: TextStyle(fontSize: MediaQuery.of(context).size.height / 30, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                              const SizedBox(height: 8),
                              Text(item['more']!,style: TextStyle(color: Colors.grey[600],fontSize: MediaQuery.of(context).size.height / 60,), textAlign: TextAlign.center),
                             ]
                        );
                      }
                    ),
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.6,
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
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {retourPage();},
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back, size: 20, color: MyColors.mainColor),
                          SizedBox(width: 10),
                          Text('Retour', style: TextStyle(color: MyColors.mainColor, fontSize: 16, fontWeight: FontWeight.w500),),
                          // SizedBox(width: 10),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {changePage();},

                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 40,
                        decoration: BoxDecoration(
                          color: MyColors.mainColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_current == show.length - 1 ? 'Inscrivez-vous' : 'Continuer', style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height / 55,),),
                          const SizedBox(width: 5),
                          const Icon(Icons.arrow_forward, size: 18, color: Colors.white,),
                        ],
                      ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Apprenez à utiliser Corail en vidéo', style: TextStyle(color: MyColors.secondaryTextColor)),
                    TextButton(
                      child: const Text('Regarder', style: TextStyle(color: MyColors.mainColor)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

MyModal(context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Données Collectées', style: TextStyle(fontSize: MediaQuery.of(context).size.height / 50, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
          child : const Icon(Icons.assignment, size: 20, color: MyColors.mainColor),
          ),
          Text("Conditions d'utilisation", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 40, fontWeight: FontWeight.bold, fontFamily: 'Poppins-Meduim'),),
          Text("En cliquant sur accepter ci-dessous, vous acceptez nos Termes et Conditions. Vous pouvez en savoir plus sur l'utilisation de vos données dans notre Politique de Confidentialité.",
            style: TextStyle(fontSize: MediaQuery.of(context).size.height / 65, fontWeight: FontWeight.w400, fontFamily: 'Poppins', color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
          InkWell(
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Registerscreen()));},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 40,
              decoration: BoxDecoration(
                color: MyColors.mainColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Accepter et Continuer', style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height / 60, fontFamily: 'Poppins'),),
                  const SizedBox(width: 5),
                  const Icon(Icons.arrow_forward, size: 18, color: Colors.white,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
}