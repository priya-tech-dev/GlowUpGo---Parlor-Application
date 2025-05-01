import 'package:flutter/material.dart';
import 'package:go_up_glow_admin/colors/appcolors.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // 👈 makes the background fill the screen
        children: [
          // Background image
          Image.asset(
            'assets/images/start.png',
            fit: BoxFit.cover,
          ),

          // Semi-transparent overlay (optional, to darken the image for better readability)
          Container(
            color: Colors.black.withOpacity(0.3),
          ),

          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Column(
                mainAxisSize: MainAxisSize.min, // centers vertically
                children: [
                  const Text(
                    'GlowUpGo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Your beauty, your schedule\nStyle made simple",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'nunito',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: gold,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'nunito',
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterScreen()),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text("SIGN UP",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
