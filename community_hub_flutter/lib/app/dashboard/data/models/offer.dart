import 'package:flutter/material.dart';

class ServiceOffer {
  final String title;
  final String discount;
  final String? actionText;
  final Color? color;

  ServiceOffer(
      {required this.title,
      required this.discount,
      this.color = Colors.blueAccent,
      this.actionText = 'Grab Offer'});

  static List<ServiceOffer> get offers => [
        ServiceOffer(
            title: 'Offer AC service',
            discount: 'Get 25%',
            color: const Color(0xffEAF6EF)),
        ServiceOffer(
            title: 'Offer AC service',
            discount: 'Get 25%',
            color: const Color(0xffE9F6FC)),
      ];
}
