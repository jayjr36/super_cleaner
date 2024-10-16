import 'package:flutter/material.dart';
import 'package:super_cleaner/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: h * 0.1),

                const Icon(Icons.cleaning_services,
                    size: 80, color: Colors.orange),

                SizedBox(height: h * 0.02),

                // App Title
                Text(
                  'Super Cleaner',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.orangeColor,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: h * 0.05),

                // Login Title
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppConstants.greyText,
                  ),
                ),

                SizedBox(height: h * 0.03),

                // Email Input Field
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    labelStyle: TextStyle(color: Colors.grey.shade700),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),

                SizedBox(height: h * 0.03),

                // Password Input Field
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    labelStyle: TextStyle(color: Colors.grey.shade700),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),

                SizedBox(height: h * 0.05),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                    // if (_formKey.currentState!.validate()) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Processing Data')),
                    //   );
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: w * 0.3),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: h * 0.02),

                // Forgot Password and Signup links
                TextButton(
                  onPressed: () {
                    // Navigate to Forgot Password
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                    ),
                  ),
                ),

                SizedBox(height: h * 0.02),

                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
