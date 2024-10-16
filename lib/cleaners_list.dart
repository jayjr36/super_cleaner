import 'package:flutter/material.dart';
import 'package:super_cleaner/constants.dart';
import 'package:super_cleaner/order_submission.dart';

class CleanerSelectionScreen extends StatelessWidget {
  final String selectedService;

  CleanerSelectionScreen({super.key, required this.selectedService});

  // Dummy cleaners list
  final List<Map<String, String>> cleaners = [
    {
      'name': 'Janeth Dane',
      'image':
          'https://media.istockphoto.com/id/469671372/photo/african-girl-cleaning-window-glass.jpg?s=612x612&w=0&k=20&c=c1RhiP_UiW28pILPT7jDp73J8QWOY9J9Fc7WRlXB930=',
      'address': 'Mbezi',
    },
    {
      'name': 'Jane Smith',
      'image':
          'https://www.shutterstock.com/image-photo/laughing-portrait-black-woman-cleaning-600nw-2326402989.jpg',
      'address': 'Kimara',
    },
    {
      'name': 'Jane Smith',
      'image':
          'https://media.istockphoto.com/id/609608134/photo/woman-with-basket-and-cleaning-equipment.jpg?s=612x612&w=0&k=20&c=9a6DIVAdZnS8tRQ9UA5wWsvIvexqq8jyGq2woKzUyWE=',
      'address': 'Kimara',
    },
    {
      'name': 'Pauline Dave',
      'image': 'https://s3.envato.com/files/325627604/124_E39A0918.jpg',
      'address': 'Mbezi',
    },
    {
      'name': 'Anne Luke',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSnZVjVHlfauTiilKEsklU3ixn98iPRXiyeVfuooGGiE0HbbnDe8PvcTf4DRtHCR7MD-c&usqp=CAU',
      'address': 'Kimara',
    },
    {
      'name': 'Juliane Willson',
      'image':
          'https://img.freepik.com/premium-photo/happy-young-black-lady-rubber-gloves-washes-floor-with-cleaning-supplies-enjoys-cleaning-living-room_116547-35431.jpg',
      'address': 'Kimara',
    },
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select a Cleaner',
          style: TextStyle(color: AppConstants.orangeColor, fontSize: 18),
        ),
        backgroundColor:
            const Color(0xFF212121), // Darker color for the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cleaners.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    cleaners[index]['image']!,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                ),
                title: Text(
                  cleaners[index]['name']!,
                  style: TextStyle(
                    color: AppConstants.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  cleaners[index]['address']!,
                  style: TextStyle(
                    color: Colors.grey[300], // Lighter gray for subtitle
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceDetailsScreen(
                        selectedService: selectedService,
                        selectedCleaner: cleaners[index]['name']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
