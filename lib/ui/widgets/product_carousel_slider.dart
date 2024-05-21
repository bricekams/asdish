import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatefulWidget {
  const ProductCarousel({super.key});

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 220,
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
              viewportFraction: 1,
              onPageChanged: (index,reason){
                setState(() {
                  this.index = index;
                });
              }
            ),
            items: [
              SizedBox(),
              SizedBox(),
              SizedBox(),
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
              width: this.index==index?30:10,
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
