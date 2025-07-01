import 'dart:ui';
import 'package:flutter/material.dart';
import 'learn_more.dart'; // import learn more

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? selectedAgency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Row(
          children: [
            // WHITE PANEL (left)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 60),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'asset/logo.png',
                                  width: 800,
                                  height: 250,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              'Log in to track and respond to emergencies',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.67,
                              ),
                            ),
                            const SizedBox(height: 40),
                            const Text(
                              'Agency Login Name:',
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              value: selectedAgency,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              hint: const Text('Select agency name'),
                              items: ['Red Cross', 'NDRRMC']
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) =>
                                  setState(() => selectedAgency = value),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Email:',
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'Write your Email',
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Password:',
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Write Your Password',
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),

                            /// BUTTONS: Glow on hover, darken on press
                            Row(
                              children: [
                                _buildGlowingButton('Log In', () {
                                  debugPrint('Login pressed');
                                }),
                                const SizedBox(width: 24),
                                _buildGlowingButton('Can’t Sign in?', () {
                                  showCantSignInDialog(context);
                                }),
                              ],
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // RED PANEL (right)
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFE62629), Color(0xFF9B2C3A)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'From Taglish posts to\ntargeted rescue—\nRespondNER delivers',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'An AI-powered system that analyzes\nTaglish disaster-related social media\nposts to identify key people, places, and\nurgent needs. Designed to support faster,\nsmarter emergency response through\nalmost real-time information extraction.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Learn more button with hover/press styling
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LearnMorePage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.white.withOpacity(0.1);
                              }
                              return Colors.transparent;
                            }),
                        elevation: MaterialStateProperty.resolveWith<double>(
                          (states) =>
                              states.contains(MaterialState.hovered) ? 12 : 0,
                        ),
                        shadowColor: MaterialStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.white.withOpacity(0.4);
                          }
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.resolveWith<BorderSide>(
                          (states) => BorderSide(
                            color: Colors.white,
                            width: states.contains(MaterialState.hovered)
                                ? 3
                                : 2,
                          ),
                        ),
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Learn more',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔧 Shared button styling method
  Widget _buildGlowingButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(180, 56)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.red.shade900;
          } else if (states.contains(MaterialState.hovered)) {
            return Colors.red.shade600;
          }
          return Colors.red.shade800;
        }),
        shadowColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.redAccent.withOpacity(0.6);
          }
          return Colors.transparent;
        }),
        elevation: MaterialStateProperty.resolveWith<double>(
          (states) => states.contains(MaterialState.hovered) ? 12 : 4,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 40),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

void showCantSignInDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: AlertDialog(
          backgroundColor: const Color(0xFF005A9C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: const Text(
            "Can’t Sign in?",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          content: const Text(
            "Please make sure your login credentials are correct.\n\n"
            "For account assistance, contact your system administrator.",
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                "okay",
                style: TextStyle(
                  color: Color(0xFF005A9C),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

// DIALOG FUNCTION: CAN'T SIGN IN
void cantSignInDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Center(
          child: Container(
            width: 400,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF14426A), // Top
                  Color(0xFF2782D0), // Bottom
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Can’t Sign in?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30, // Bigger font
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Please check your login credentials. Contact your administrator for help.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 24,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      "okay",
                      style: TextStyle(
                        color: Color(0xFF14426A),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
