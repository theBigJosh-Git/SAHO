import 'package:flutter/material.dart';

class ServiceItem {
  final String name;
  final String description;
  final double startingPrice;
  final IconData icon;
  final String duration;
  final List<String> includes;

  const ServiceItem({
    required this.name,
    required this.description,
    required this.startingPrice,
    required this.icon,
    this.duration = 'Varies by service',
    this.includes = const [],
  });
}