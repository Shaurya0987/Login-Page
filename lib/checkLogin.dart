import 'package:bdver/login.dart'; // for MinimalLoginPage
import 'package:flutter/material.dart';

class CheckLogin extends StatefulWidget {
  const CheckLogin({super.key});

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4B6C68),
      body: Padding(
        padding: const EdgeInsets.all(20), // ✅ fixed
        child: Center(
          child: SingleChildScrollView( // ✅ in case of small screens
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: 'Inspiration',
                    fontSize: 80,
                    color: Colors.orange.shade200,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in to Continue",
                  style: TextStyle(
                    color: Colors.orange.shade200,
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(height: 50),

                // Name field
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Jiara Marlins",
                    hintStyle: TextStyle(color: Colors.orange.shade200),
                    labelText: "Enter Your Name",
                    labelStyle: TextStyle(color: Colors.orange.shade200),
                    prefixIcon: Icon(Icons.person, color: Colors.orange.shade200),
                    filled: true,
                    fillColor: Colors.white24,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30),

                // Email field
                TextField(
                  controller: _emailController, 
                  decoration: InputDecoration(
                    hintText: "hello@reallygreatsite.com",
                    hintStyle: TextStyle(color: Colors.orange.shade200),
                    labelText: "Enter Your Email",
                    labelStyle: TextStyle(color: Colors.orange.shade200),
                    prefixIcon: Icon(Icons.email, color: Colors.orange.shade200),
                    filled: true,
                    fillColor: Colors.white24,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add login logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () {
                    // Forgot password action
                  },
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MinimalLoginPage()),
                    );
                  },
                  child: const Text(
                    "Sign Up!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
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
