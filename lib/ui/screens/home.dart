import 'package:asdish/ui/widgets/carousel_slider.dart';
import 'package:asdish/ui/widgets/home_appbar.dart';
import 'package:asdish/ui/widgets/cards/product_card.dart';
import 'package:asdish/ui/widgets/tiles/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(child: HomeCarouselSlider()),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nearest restaurants",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_sharp,
                        size: 15,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),


              IntrinsicHeight(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      11,
                      (index) => index != 10
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: RestaurantTile(),
                            )
                          : SizedBox(
                              width: 100,
                              child: Center(
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "more...",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),


              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Newest products",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_sharp,
                        size: 15,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              IntrinsicHeight(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      11,
                      (index) => index != 10
                          ? const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 5),
                              child: ProductCard(width: 130),
                            )
                          : SizedBox(
                              width: 100,
                              child: Center(
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "more...",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),


              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bestsellers",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_sharp,
                        size: 15,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: AlignedGridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return index != 11
                        ? ProductCard()
                        : TextButton(
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                              backgroundColor: MaterialStateProperty.resolveWith(
                                (states) {
                                  return Theme.of(context).colorScheme.primary;
                                },
                              ),
                              foregroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
                            ),
                            onPressed: () {},
                            child: const Text("See more..."),
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
