import 'package:flutter/material.dart';
import 'package:go_up_glow_admin/colors/appcolors.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Check if it's web or mobile by checking the screen width
          bool isWeb = constraints.maxWidth >
              800; // Change 800 to your desired breakpoint for web

          return Stack(
            fit: StackFit.expand, // Makes the background fill the screen
            children: [
              // Background image
              Image.asset(
                'assets/images/start.png',
                fit: isWeb
                    ? BoxFit.cover
                    : BoxFit
                        .contain, // Use BoxFit.cover for web, BoxFit.contain for mobile
              ),

              // Semi-transparent overlay (optional, to darken the image for better readability)
              Container(
                color: Colors.black.withOpacity(0.3),
              ),

              // Content
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: isWeb
                          ? 150
                          : 250), // Adjust top padding based on device
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Centers vertically
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
                        padding: EdgeInsets.symmetric(
                            horizontal: isWeb
                                ? 100
                                : 40), // Adjust horizontal padding for web vs mobile
                        child: Column(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 400, // Set max width for buttons
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
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
                            ),
                            const SizedBox(height: 15),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 400, // Set max width for buttons
                              ),
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen()),
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
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
