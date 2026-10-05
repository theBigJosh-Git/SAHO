class ReviewItem {
  final String id;
  final String bookingId;
  final String providerName;
  final double rating;
  final String? comment;
  final DateTime createdAt;

  const ReviewItem({
    required this.id,
    required this.bookingId,
    required this.providerName,
    required this.rating,
    required this.createdAt,
    this.comment,
  });
}
