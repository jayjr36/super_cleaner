class Order {
  final Cleaner cleaner;
  final DateTime orderDate;

  Order({
    required this.cleaner,
    required this.orderDate,
  });
}

// Model class for cleaner
class Cleaner {
  final String name;
  final String phone;
  final String imageUrl;
  final String address;
  final String status;

  Cleaner({
    required this.name,
    required this.phone,
    required this.imageUrl,
    required this.address,
    required this.status,
  });
}
