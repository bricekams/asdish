import 'package:flutter/material.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
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
      child: InkWell(
        onTap: () {
          // Handle the tap event
        },
        child: Column(

          children: [
            _buildListTile(),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      leading: Container(
        width: 70,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      title: const Text(
        "Sahel",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: _buildRatingAndDistance(),
      trailing: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(onTap: (){}, child: const Icon(Icons.more_vert))
        ],
      ),
    );
  }

  Widget _buildRatingAndDistance() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          const Text(
            "4.5",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 2),
          Icon(
            Icons.star,
            color: Colors.yellow.shade600,
            size: 15,
          ),
          const SizedBox(width: 2),
          const Text("-|-"),
          const SizedBox(width: 2),
          const Text(
            "2 km",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
