import 'package:flutter/material.dart';

class Supplier {
  final String name;
  final String address;
  final String paymentInfo;
  final Image logo;

  const Supplier({
    required this.name,
    required this.address,
    required this.paymentInfo,
    required this.logo
  });
}
