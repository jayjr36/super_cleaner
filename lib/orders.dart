import 'package:flutter/material.dart';
import 'package:super_cleaner/constants.dart';
import 'package:super_cleaner/models/order.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<Order> sampleOrders = [
    Order(
      cleaner: Cleaner(
        name: 'Janeth Dane',
        phone: '0765489015',
        imageUrl:
            'https://media.istockphoto.com/id/469671372/photo/african-girl-cleaning-window-glass.jpg?s=612x612&w=0&k=20&c=c1RhiP_UiW28pILPT7jDp73J8QWOY9J9Fc7WRlXB930=',
        address: 'Mbezi',
        status: 'Completed',
      ),
      orderDate: DateTime.now().subtract(const Duration(days: 1)), // 1 day ago
    ),
    Order(
      cleaner: Cleaner(
        name: 'Jane Smith',
        phone: '0654890128',
        imageUrl:
            'https://www.shutterstock.com/image-photo/laughing-portrait-black-woman-cleaning-600nw-2326402989.jpg',
        address: 'Kimara',
        status: 'In Progress',
      ),
      orderDate: DateTime.now().subtract(const Duration(days: 3)), // 3 days ago
    ),
    Order(
      cleaner: Cleaner(
        name: 'Juliane Willson',
        phone: '0754670913',
        imageUrl:
            'https://img.freepik.com/premium-photo/happy-young-black-lady-rubber-gloves-washes-floor-with-cleaning-supplies-enjoys-cleaning-living-room_116547-35431.jpg',
        address: 'Kimara',
        status: 'Pending',
      ),
      orderDate: DateTime.now().subtract(const Duration(days: 5)), // 5 days ago
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(
            color: AppConstants.orangeColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black54,
        child: ListView.builder(
          itemCount: sampleOrders.length,
          itemBuilder: (context, index) {
            final order = sampleOrders[index];
            return Card(
              margin: const EdgeInsets.all(10.0),
              color: Colors.grey[850], // Card color for dark mode
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 10.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        order.cleaner.imageUrl,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.cleaner.name,
                            style: const TextStyle(
                              color: Colors
                                  .orangeAccent, // Orange theme color for name
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.phone,
                                  color: Colors.orange,
                                  size: 18), // Orange icon
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  order.cleaner.phone,
                                  style: const TextStyle(
                                    color: Colors
                                        .white70, // Subtle text color for dark mode
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: Colors.orange,
                                  size: 18), // Orange icon
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  order.cleaner.address,
                                  style: const TextStyle(
                                    color: Colors
                                        .white70, // Subtle text color for address
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.assignment_turned_in,
                                  color: Colors.orange,
                                  size: 18), // Orange icon
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  order.cleaner.status,
                                  style: const TextStyle(
                                    color: Colors
                                        .greenAccent, // Highlighted status color
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            ' ${order.orderDate.toLocal().toShortDateString()}',
                            style: const TextStyle(
                              color:
                                  Colors.white60, // Subtle text color for date
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

extension DateTimeFormatting on DateTime {
  String toShortDateString() {
    return "${this.day}/${this.month}/${this.year}";
  }
}
