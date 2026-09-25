import 'package:flutter/material.dart';

class ServiceItem {
  final String name;
  final String description;
  final double startingPrice;
  final IconData icon;

  const ServiceItem({
    required this.name,
    required this.description,
    required this.startingPrice,
    required this.icon,
  });
}