import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating;

  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget> ratings = [];
    for (int i = 0; i < 5; i++) {
      ratings.add(Icon(
        Icons.star,
        color: i < rating
            ? const Color.fromRGBO(255, 215, 0, 1.0)
            : const Color.fromRGBO(189, 189, 189, 1.0),
        size: 12,
      ));
    }
    return Row(
      children: ratings,
    );
  }
}
