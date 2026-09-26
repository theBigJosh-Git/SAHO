class ProviderItem {
  final String id;
  final String name;
  final String title;
  final double rating;
  final int reviewCount;
  final int completedJobs;
  final int yearsExperience;
  final bool isVerified;
  final String location;
  final String bio;
  final List<String> serviceNames;

  const ProviderItem({
    required this.id,
    required this.name,
    required this.title,
    required this.rating,
    required this.reviewCount,
    required this.completedJobs,
    required this.yearsExperience,
    required this.isVerified,
    required this.location,
    required this.bio,
    required this.serviceNames,
  });

  bool offersService(String serviceName) {
    return serviceNames.contains(serviceName);
  }
}
