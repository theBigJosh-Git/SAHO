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
        duration: '2–3 hours',
        includes: [
          'General room cleaning',
          'Floor vacuuming and mopping',
          'Kitchen surface cleaning',
          'Bathroom cleaning',
          'Dusting accessible surfaces',
        ],
      ),
      ServiceItem(
        name: 'Deep Cleaning',
        description: 'Detailed cleaning for a fresher, cleaner home.',
        startingPrice: 99,
        icon: Icons.auto_awesome_outlined,
        duration: '4–6 hours',
        includes: [
          'Detailed room cleaning',
          'Kitchen deep cleaning',
          'Bathroom deep cleaning',
          'Floor cleaning',
          'Detailed dusting of accessible areas',
        ],
      ),
      ServiceItem(
        name: 'Sofa Cleaning',
        description: 'Professional cleaning for sofas and upholstery.',
        startingPrice: 69,
        icon: Icons.chair_outlined,
        duration: '1–2 hours',
        includes: [
          'Sofa surface cleaning',
          'Vacuuming',
          'Spot treatment',
          'Upholstery cleaning',
        ],
      ),
    ],

    'Plumbing': [
      ServiceItem(
        name: 'Plumbing Repair',
        description: 'Repairs for common household plumbing problems.',
        startingPrice: 79,
        icon: Icons.plumbing_outlined,
        duration: '1–2 hours',
        includes: [
          'Initial plumbing inspection',
          'Basic fault diagnosis',
          'Minor pipe and fitting repairs',
          'Leak and connection checks',
        ],
      ),
      ServiceItem(
        name: 'Leak Repair',
        description: 'Fix leaking taps, pipes, and water connections.',
        startingPrice: 69,
        icon: Icons.water_drop_outlined,
        duration: '1–2 hours',
        includes: [
          'Leak source inspection',
          'Tap and connection checks',
          'Minor leak repair',
          'Post-repair water check',
        ],
      ),
      ServiceItem(
        name: 'Drain Cleaning',
        description: 'Clear blocked sinks, drains, and pipes.',
        startingPrice: 89,
        icon: Icons.water_outlined,
        duration: '1–2 hours',
        includes: [
          'Drain inspection',
          'Basic blockage removal',
          'Sink and drain flow check',
          'Basic cleanup after service',
        ],
      ),
    ],

    'Electrical': [
      ServiceItem(
        name: 'Electrical Repair',
        description: 'General electrical troubleshooting and repairs.',
        startingPrice: 79,
        icon: Icons.electrical_services_outlined,
        duration: '1–2 hours',
        includes: [
          'Basic electrical inspection',
          'Fault diagnosis',
          'Minor electrical repairs',
          'Basic safety check',
        ],
      ),
      ServiceItem(
        name: 'Light Installation',
        description: 'Installation and replacement of home lighting.',
        startingPrice: 59,
        icon: Icons.lightbulb_outline,
        duration: '1–2 hours',
        includes: [
          'Existing fitting inspection',
          'Light fitting installation',
          'Basic wiring connection',
          'Functionality check',
        ],
      ),
      ServiceItem(
        name: 'Socket & Switch Repair',
        description: 'Repair or replace faulty sockets and switches.',
        startingPrice: 49,
        icon: Icons.power_outlined,
        duration: '1–2 hours',
        includes: [
          'Socket or switch inspection',
          'Basic fault diagnosis',
          'Minor repair or replacement',
          'Functionality check',
        ],
      ),
    ],

    'AC & Cooling': [
      ServiceItem(
        name: 'AC Cleaning',
        description: 'Cleaning and maintenance for home AC units.',
        startingPrice: 79,
        icon: Icons.ac_unit_outlined,
        duration: '1–2 hours',
        includes: [
          'AC unit inspection',
          'Filter cleaning',
          'Accessible unit cleaning',
          'Basic cooling performance check',
        ],
      ),
      ServiceItem(
        name: 'AC Repair',
        description: 'Diagnosis and repair of common AC problems.',
        startingPrice: 99,
        icon: Icons.build_outlined,
        duration: '1–3 hours',
        includes: [
          'AC fault inspection',
          'Basic diagnosis',
          'Minor repair work',
          'Cooling performance check',
        ],
      ),
      ServiceItem(
        name: 'AC Installation',
        description: 'Professional installation of AC units.',
        startingPrice: 199,
        icon: Icons.home_repair_service_outlined,
        duration: '3–5 hours',
        includes: [
          'Installation area inspection',
          'AC unit mounting',
          'Basic connection setup',
          'Installation testing',
        ],
      ),
    ],

    'Handyman': [
      ServiceItem(
        name: 'General Handyman',
        description: 'Help with everyday home repairs and maintenance.',
        startingPrice: 69,
        icon: Icons.handyman_outlined,
        duration: '1–3 hours',
        includes: [
          'Basic home repair assessment',
          'Minor household repairs',
          'Small fixture adjustments',
          'Basic maintenance work',
        ],
      ),
      ServiceItem(
        name: 'Furniture Assembly',
        description: 'Assembly of beds, tables, cabinets, and furniture.',
        startingPrice: 79,
        icon: Icons.chair_alt_outlined,
        duration: '1–3 hours',
        includes: [
          'Furniture parts inspection',
          'Furniture assembly',
          'Basic alignment and adjustment',
          'Stability check',
        ],
      ),
      ServiceItem(
        name: 'Wall Mounting',
        description: 'Mount TVs, shelves, mirrors, and wall accessories.',
        startingPrice: 69,
        icon: Icons.wallpaper_outlined,
        duration: '1–2 hours',
        includes: [
          'Mounting position assessment',
          'Basic measurements',
          'Wall mounting',
          'Alignment and stability check',
        ],
      ),
    ],

    'Painting': [
      ServiceItem(
        name: 'Room Painting',
        description: 'Professional painting for individual rooms.',
        startingPrice: 149,
        icon: Icons.format_paint_outlined,
        duration: '4–8 hours',
        includes: [
          'Basic wall preparation',
          'Painting of agreed wall areas',
          'Basic edge finishing',
          'Work-area cleanup',
        ],
      ),
      ServiceItem(
        name: 'Wall Touch-Up',
        description: 'Refresh damaged, marked, or faded wall areas.',
        startingPrice: 79,
        icon: Icons.brush_outlined,
        duration: '1–3 hours',
        includes: [
          'Affected area inspection',
          'Basic surface preparation',
          'Paint touch-up',
          'Basic finishing',
        ],
      ),
      ServiceItem(
        name: 'Full Home Painting',
        description: 'Painting service for apartments and homes.',
        startingPrice: 399,
        icon: Icons.home_outlined,
        duration: '1–3 days',
        includes: [
          'Basic wall preparation',
          'Painting of agreed interior areas',
          'Basic edge and corner finishing',
          'Work-area cleanup',
        ],
      ),
    ],

    'Appliances': [
      ServiceItem(
        name: 'Washing Machine Repair',
        description: 'Diagnosis and repair for washing machines.',
        startingPrice: 99,
        icon: Icons.local_laundry_service_outlined,
        duration: '1–2 hours',
        includes: [
          'Appliance inspection',
          'Basic fault diagnosis',
          'Minor repair work',
          'Functionality test',
        ],
      ),
      ServiceItem(
        name: 'Refrigerator Repair',
        description: 'Troubleshooting and repair for refrigerators.',
        startingPrice: 109,
        icon: Icons.kitchen_outlined,
        duration: '1–3 hours',
        includes: [
          'Refrigerator inspection',
          'Basic fault diagnosis',
          'Minor repair work',
          'Cooling performance check',
        ],
      ),
      ServiceItem(
        name: 'Cooker Repair',
        description: 'Repair and maintenance for home cookers.',
        startingPrice: 89,
        icon: Icons.soup_kitchen_outlined,
        duration: '1–2 hours',
        includes: [
          'Cooker inspection',
          'Basic fault diagnosis',
          'Minor repair work',
          'Basic functionality check',
        ],
      ),
    ],

    'Moving': [
      ServiceItem(
        name: 'Home Moving',
        description: 'Moving assistance for apartments and homes.',
        startingPrice: 249,
        icon: Icons.local_shipping_outlined,
        duration: '3–6 hours',
        includes: [
          'Basic moving assessment',
          'Loading assistance',
          'Transportation',
          'Unloading assistance',
        ],
      ),
      ServiceItem(
        name: 'Furniture Moving',
        description: 'Safe transportation of furniture and large items.',
        startingPrice: 149,
        icon: Icons.chair_outlined,
        duration: '2–4 hours',
        includes: [
          'Furniture handling',
          'Loading assistance',
          'Transportation',
          'Unloading assistance',
        ],
      ),
      ServiceItem(
        name: 'Packing Assistance',
        description: 'Professional help packing household belongings.',
        startingPrice: 99,
        icon: Icons.inventory_2_outlined,
        duration: '2–4 hours',
        includes: [
          'Packing assistance',
          'Basic item organization',
          'Box arrangement',
          'Preparation of items for moving',
        ],
      ),
    ],
  };

  static List<ServiceItem> forCategory(String categoryName) {
    return servicesByCategory[categoryName] ?? const [];
  }
}