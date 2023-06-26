import 'package:flutter/material.dart';

class Utils {
  static List<Widget> getRatingStar(double voteAverage) {
    List<Widget> star = [];
    double rating = voteAverage / 2;
    double empty = 5 - rating;
    while (rating > 1) {
      star.add(const Icon(Icons.star, color: Colors.amber));
      rating--;
    }

    if (rating == 0) {
      star.add(const Icon(Icons.star_border, color: Colors.amber));
    } else {
      star.add(const Icon(Icons.star_half, color: Colors.amber));
    }

    while (empty > 1) {
      star.add(const Icon(Icons.star_border, color: Colors.amber));
      empty--;
    }

    star.add(Text(" $voteAverage"));
    return star;
  }
}
