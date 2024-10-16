import 'package:flutter/material.dart';
import 'package:super_cleaner/cleaners_list.dart';
import 'package:super_cleaner/constants.dart';

class ServiceSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> services = [
    {
      'name': 'Residential Cleaning',
      'image': "https://plus.unsplash.com/premium_photo-1683121328013-f9efabdabde5?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      'description': 'Clean your home with utmost care and efficiency.',
    },
    {
      'name': 'Office Cleaning',
      'image': "https://plus.unsplash.com/premium_photo-1663047397245-2ddad26c5dd7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y2xlYW5pbmclMjBzZXJ2aWNlc3xlbnwwfHwwfHx8MA%3D%3D",
      'description': 'Keep your workplace neat and productive.',
    },
    {
      'name': 'Deep Cleaning',
      'image': "https://images.unsplash.com/photo-1580842402762-6f5868c17412?q=80&w=1933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      'description': 'A thorough clean that reaches every corner.',
    },
    {
      'name': 'Window Cleaning',
      'image': "https://images.unsplash.com/photo-1676091108009-d3ea5771d7bc?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      'description': 'Sparkling clean windows for a clear view.',
    },
    {
      'name': 'Carpet Cleaning',
      'image': "https://plus.unsplash.com/premium_photo-1661679071407-9eb342c3a32c?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNhcnBldCUyMGNsZWFuaW5nfGVufDB8fDB8fHww",
      'description': 'Refresh your carpets and eliminate odors.',
    },
  ];

  ServiceSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Service', style: TextStyle(color: AppConstants.orangeColor, fontSize: 18),),
       // backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color(0xFF1E1E1E), 
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CleanerSelectionScreen(
                        selectedService: services[index]['name']!,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.network(
                        services[index]['image']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              services[index]['name']!,
                              style:  TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppConstants.orangeColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              services[index]['description']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
