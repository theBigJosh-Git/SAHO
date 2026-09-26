import '../domain/provider_item.dart';

class ProviderCatalog {
  ProviderCatalog._();

  static const List<ProviderItem> providers = [
    ProviderItem(
      id: 'provider_001',
      name: 'Ahmed Hassan',
      title: 'AC & Home Maintenance Professional',
      rating: 4.8,
      reviewCount: 126,
      completedJobs: 184,
      yearsExperience: 5,
      isVerified: true,
      location: 'Dubai',
      bio:
          'Experienced home maintenance professional specialising in AC servicing and general household repairs.',
      serviceNames: [
        'AC Cleaning',
        'AC Repair',
        'AC Installation',
        'General Handyman',
      ],
    ),
    ProviderItem(
      id: 'provider_002',
      name: 'Daniel Okoro',
      title: 'Cleaning Professional',
      rating: 4.9,
      reviewCount: 94,
      completedJobs: 137,
      yearsExperience: 4,
      isVerified: true,
      location: 'Dubai',
      bio:
          'Home cleaning professional focused on reliable and detailed residential cleaning services.',
      serviceNames: ['Home Cleaning', 'Deep Cleaning', 'Sofa Cleaning'],
    ),
    ProviderItem(
      id: 'provider_003',
      name: 'Omar Khalid',
      title: 'Plumbing Professional',
      rating: 4.7,
      reviewCount: 81,
      completedJobs: 112,
      yearsExperience: 6,
      isVerified: true,
      location: 'Dubai',
      bio:
          'Residential plumbing professional experienced in repairs, leaks, and common drainage problems.',
      serviceNames: ['Plumbing Repair', 'Leak Repair', 'Drain Cleaning'],
    ),
    ProviderItem(
      id: 'provider_004',
      name: 'Samuel Mensah',
      title: 'Electrical & Appliance Professional',
      rating: 4.8,
      reviewCount: 73,
      completedJobs: 105,
      yearsExperience: 5,
      isVerified: true,
      location: 'Dubai',
      bio:
          'Electrical and appliance service professional handling household electrical faults and appliance repairs.',
      serviceNames: [
        'Electrical Repair',
        'Light Installation',
        'Socket & Switch Repair',
        'Washing Machine Repair',
        'Refrigerator Repair',
        'Cooker Repair',
      ],
    ),
    ProviderItem(
      id: 'provider_005',
      name: 'Youssef Ibrahim',
      title: 'Handyman & Painting Professional',
      rating: 4.6,
      reviewCount: 58,
      completedJobs: 89,
      yearsExperience: 4,
      isVerified: true,
      location: 'Dubai',
      bio:
          'Multi-skilled home professional providing handyman, mounting, furniture assembly, and painting services.',
      serviceNames: [
        'General Handyman',
        'Furniture Assembly',
        'Wall Mounting',
        'Room Painting',
        'Wall Touch-Up',
        'Full Home Painting',
      ],
    ),
    ProviderItem(
      id: 'provider_006',
      name: 'Michael Adeyemi',
      title: 'Moving Services Professional',
      rating: 4.7,
      reviewCount: 67,
      completedJobs: 96,
      yearsExperience: 5,
      isVerified: true,
      location: 'Dubai',
      bio:
          'Moving professional experienced in household moves, furniture transportation, and packing assistance.',
      serviceNames: ['Home Moving', 'Furniture Moving', 'Packing Assistance'],
    ),
  ];

  static List<ProviderItem> forService(String serviceName) {
    return providers
        .where((provider) => provider.offersService(serviceName))
        .toList();
  }
}
