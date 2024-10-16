import 'package:flutter/material.dart';
import 'package:super_cleaner/constants.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final String selectedService;
  final String selectedCleaner;
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  ServiceDetailsScreen({
    super.key,
    required this.selectedService,
    required this.selectedCleaner,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Service Details',
          style: TextStyle(color: AppConstants.orangeColor, fontSize: 18),
        ),
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Text(
              'Service: $selectedService',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Cleaner: $selectedCleaner',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

           
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF2C2C2C), 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none, 
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
            ),
            const SizedBox(height: 20),

           
            TextFormField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Preferred Time',
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF2C2C2C),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              onTap: () async {
                // Open time picker
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  _timeController.text = time.format(context);
                }
              },
            ),
            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  showSuccessDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  
void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, 
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: AppConstants.orangeColor, width: 2),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 30), 
            SizedBox(width: 10), 
            Text('Order Placed', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        content: const Text(
          'Your cleaning order has been successfully placed!\n\n'
          'You will receive a confirmation email shortly.',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                backgroundColor: Colors.orange, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), 
                ),
              ),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white), 
              ),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
          ),
        ],
      );
    },
  );
}
}
