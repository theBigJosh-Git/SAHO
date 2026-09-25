import 'package:flutter/material.dart';

import '../domain/service_item.dart';

class ServiceCatalog {
  ServiceCatalog._();

  static const Map<String, List<ServiceItem>> servicesByCategory = {
    'Cleaning': [
      ServiceItem(
        name: 'Home Cleaning',
        description: 'Professional cleaning for your home.',
        startingPrice: 49,
        icon: Icons.cleaning_services_outlined,
      ),
      ServiceItem(
        name: 'Deep Cleaning',
        description: 'Detailed cleaning for a fresher, cleaner home.',
        startingPrice: 99,
        icon: Icons.auto_awesome_outlined,
      ),
      ServiceItem(
        name: 'Sofa Cleaning',
        description: 'Professional cleaning for sofas and upholstery.',
        startingPrice: 69,
        icon: Icons.chair_outlined,
      ),
    ],

    'Plumbing': [
      ServiceItem(
        name: 'Plumbing Repair',
        description: 'Repairs for common household plumbing problems.',
        startingPrice: 79,
        icon: Icons.plumbing_outlined,
      ),
      ServiceItem(
        name: 'Leak Repair',
        description: 'Fix leaking taps, pipes, and water connections.',
        startingPrice: 69,
        icon: Icons.water_drop_outlined,
      ),
      ServiceItem(
        name: 'Drain Cleaning',
        description: 'Clear blocked sinks, drains, and pipes.',
        startingPrice: 89,
        icon: Icons.water_outlined,
      ),
    ],

    'Electrical': [
      ServiceItem(
        name: 'Electrical Repair',
        description: 'General electrical troubleshooting and repairs.',
        startingPrice: 79,
        icon: Icons.electrical_services_outlined,
      ),
      ServiceItem(
        name: 'Light Installation',
        description: 'Installation and replacement of home lighting.',
        startingPrice: 59,
        icon: Icons.lightbulb_outline,
      ),
      ServiceItem(
        name: 'Socket & Switch Repair',
        description: 'Repair or replace faulty sockets and switches.',
        startingPrice: 49,
        icon: Icons.power_outlined,
      ),
    ],

    'AC & Cooling': [
      ServiceItem(
        name: 'AC Cleaning',
        description: 'Cleaning and maintenance for home AC units.',
        startingPrice: 79,
        icon: Icons.ac_unit_outlined,
      ),
      ServiceItem(
        name: 'AC Repair',
        description: 'Diagnosis and repair of common AC problems.',
        startingPrice: 99,
        icon: Icons.build_outlined,
      ),
      ServiceItem(
        name: 'AC Installation',
        description: 'Professional installation of AC units.',
        startingPrice: 199,
        icon: Icons.home_repair_service_outlined,
      ),
    ],

    'Handyman': [
      ServiceItem(
        name: 'General Handyman',
        description: 'Help with everyday home repairs and maintenance.',
        startingPrice: 69,
        icon: Icons.handyman_outlined,
      ),
      ServiceItem(
        name: 'Furniture Assembly',
        description: 'Assembly of beds, tables, cabinets, and furniture.',
        startingPrice: 79,
        icon: Icons.chair_alt_outlined,
      ),
      ServiceItem(
        name: 'Wall Mounting',
        description: 'Mount TVs, shelves, mirrors, and wall accessories.',
        startingPrice: 69,
        icon: Icons.wallpaper_outlined,
      ),
    ],

    'Painting': [
      ServiceItem(
        name: 'Room Painting',
        description: 'Professional painting for individual rooms.',
        startingPrice: 149,
        icon: Icons.format_paint_outlined,
      ),
      ServiceItem(
        name: 'Wall Touch-Up',
        description: 'Refresh damaged, marked, or faded wall areas.',
        startingPrice: 79,
        icon: Icons.brush_outlined,
      ),
      ServiceItem(
        name: 'Full Home Painting',
        description: 'Painting service for apartments and homes.',
        startingPrice: 399,
        icon: Icons.home_outlined,
      ),
    ],

    'Appliances': [
      ServiceItem(
        name: 'Washing Machine Repair',
        description: 'Diagnosis and repair for washing machines.',
        startingPrice: 99,
        icon: Icons.local_laundry_service_outlined,
      ),
      ServiceItem(
        name: 'Refrigerator Repair',
        description: 'Troubleshooting and repair for refrigerators.',
        startingPrice: 109,
        icon: Icons.kitchen_outlined,
      ),
      ServiceItem(
        name: 'Cooker Repair',
        description: 'Repair and maintenance for home cookers.',
        startingPrice: 89,
        icon: Icons.soup_kitchen_outlined,
      ),
    ],

    'Moving': [
      ServiceItem(
        name: 'Home Moving',
        description: 'Moving assistance for apartments and homes.',
        startingPrice: 249,
        icon: Icons.local_shipping_outlined,
      ),
      ServiceItem(
        name: 'Furniture Moving',
        description: 'Safe transportation of furniture and large items.',
        startingPrice: 149,
        icon: Icons.chair_outlined,
      ),
      ServiceItem(
        name: 'Packing Assistance',
        description: 'Professional help packing household belongings.',
        startingPrice: 99,
        icon: Icons.inventory_2_outlined,
      ),
    ],
  };

  static List<ServiceItem> forCategory(String categoryName) {
    return servicesByCategory[categoryName] ?? const [];
  }
}