import 'package:flutter/material.dart';
import 'package:super_cleaner/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  
Widget build(BuildContext context) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;

  return Scaffold(
    backgroundColor: Colors.black87, 
     appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: Text('Home', style: TextStyle(color: AppConstants.orangeColor, fontSize: 18),),
        // backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: AppConstants.orangeColor,),
            onPressed: () {
              // Notification action here
            },
          ),
        ],
      ),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Message
          Text(
            'Welcome, John',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade800,
              shadows: [
                Shadow(
                  blurRadius: 8,
                  color: Colors.orangeAccent.withOpacity(0.6),
                  offset: const Offset(3, 3),
                ),
              ],
            ),
          ),
          SizedBox(height: h * 0.02),
          Text(
            'Here are your options:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade500,
            ),
          ),
          SizedBox(height: h * 0.03),

          // Navigation Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildFeatureCard('History', Icons.shopping_bag, () {
                  Navigator.pushNamed(context, '/order');
                }),
                _buildFeatureCard('Schedule', Icons.calendar_today, () {
                  Navigator.pushNamed(context, '/services');
                }),
                _buildFeatureCard('Profile', Icons.person, () {
                  // Navigate to Profile page
                }),
                _buildFeatureCard('Settings', Icons.settings, () {
                  // Navigate to Settings page
                }),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildFeatureCard(String title, IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
        gradient: LinearGradient(
          colors: [Colors.black87, Colors.grey[800]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.orange.shade800),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.orange.shade800,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}
}
