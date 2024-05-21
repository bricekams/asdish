import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 1,
                blurStyle: BlurStyle.outer,
              )
            ],
          ),
          child: CarouselSlider(
            options: CarouselOptions(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
                pauseAutoPlayOnManualNavigate: false,
                pauseAutoPlayInFiniteScroll: false,
                viewportFraction: 1,
                onScrolled: (index){},
                onPageChanged: (index,reason) {
                  setState(() {
                    this.index = index;
                  });
                }
            ),
            items: [
              Container(color: Colors.red,),
              Container(color: Colors.amber,),
              Container(color: Colors.green,),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            3,
                (index) => Container(
              height: 5,
              width: 27,
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                  color: this.index==index? Theme.of(context).colorScheme.primary: Colors.grey,
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
        ),
      ],
    );
  }
}
