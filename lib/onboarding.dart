import 'package:onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:super_cleaner/constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        swipeableBody: const [
          OnboardingPage(
            image: 'assets/images/clean1.png',
            title: 'Order a Cleaner',
            description:
                'Order a professional cleaner for your home or office with just a few clicks. Select from a range of cleaning services, customize your order based on your needs, and enjoy a spotless space with no hassle.',
          ),
          OnboardingPage(
            image: 'assets/images/clean2.jpg',
            title: 'Choose Your Preferred Time',
            description:
                'We know your schedule is important. Choose the most convenient time for the cleaner to visit your home or office. Whether it’s early morning or late evening, we’ve got you covered with flexible booking times.',
          ),
          OnboardingPage(
            image: 'assets/images/clean3.jpg',
            title: 'Track Your Order',
            description:
                'Stay informed with real-time updates. Track your order status, get notifications when your cleaner is en route, and receive instant updates upon job completion. Your peace of mind is our priority.',
          ),
        ],
        buildFooter: (context, netDragDistance, pagesLength, currentIndex,
            setIndex, slideDirection) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pagesLength, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: currentIndex == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color:
                          currentIndex == index ? Colors.orange : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstants.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (currentIndex == pagesLength - 1) {
                      // Navigate to home or login page
                      Navigator.pushReplacementNamed(context, '/login');
                    } else {
                      // Go to next page
                      setIndex(currentIndex + 1);
                    }
                  },
                  child: Text(
                    currentIndex == pagesLength - 1 ? 'Get Started' : 'Next',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(184, 73, 67, 67),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Image.asset(
              image,
              height: 250,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: h * 0.1),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(221, 4, 240, 24),
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
