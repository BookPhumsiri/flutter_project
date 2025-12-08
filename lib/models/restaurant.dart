class Restaurant {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;

  const Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.rating = 4.5,
  });
}
