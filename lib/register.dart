import 'package:flutter/material.dart';
import 'package:super_cleaner/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username, _email, _password;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.08, vertical: h * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.03),
                // App Logo or Icon
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

                SizedBox(height: h * 0.02),

                Text(
                  'Create your Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppConstants.greyText,
                  ),
                ),

                SizedBox(height: h * 0.03),

                // Username Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (value) => _username = value,
                ),

                SizedBox(height: h * 0.02),

                // Email Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                ),

                SizedBox(height: h * 0.02),

                // Email Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    prefixIcon: const Icon(Icons.phone_android),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.contains('@')) {
                      return 'Please enter a valid phone';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                ),

                SizedBox(height: h * 0.02),

                // Password Input
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value,
                ),

                SizedBox(height: h * 0.02),

                // Password Input
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value,
                ),

                SizedBox(height: h * 0.05),

                // Register Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print(
                          'username: $_username, email: $_email, password: $_password');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(
                        vertical: h * 0.015, horizontal: w * 0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: h * 0.02),

                // Terms and conditions message
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'By signing up, you agree to our ',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.02),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
