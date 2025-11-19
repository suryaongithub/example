import 'package:flutter/material.dart';
import 'package:new_material_widgets/GlossyCeramic.dart';

void main() {
  runApp(const GlossyCeramicShowcase());
}

class GlossyCeramicShowcase extends StatelessWidget {
  const GlossyCeramicShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlossyCeramic Showcase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ShowcaseHome(),
    );
  }
}

class ShowcaseHome extends StatefulWidget {
  const ShowcaseHome({super.key});

  @override
  State<ShowcaseHome> createState() => _ShowcaseHomeState();
}

class _ShowcaseHomeState extends State<ShowcaseHome> {
  // Initialize color scheme
  final GCColorSchema colorScheme = GCColorSchema(
    backgroundColor: const Color.fromARGB(239, 226, 243, 253),
    cardColor: const Color.fromARGB(115, 255, 255, 255),
    buttonColor: const Color.fromARGB(255, 151, 157, 241),
    rippleColor: const Color.fromARGB(134, 80, 68, 221),
    shadowColor: const Color.fromARGB(80, 136, 161, 172),
    activeColor: const Color.fromARGB(255, 105, 111, 199),
    inactiveColor: const Color.fromARGB(115, 225, 225, 225),
    textColor: const Color.fromARGB(255, 115, 115, 115),
    auxIconColor: const Color.fromARGB(255, 189, 189, 189),
    tintColor: const Color.fromARGB(115, 148, 162, 223),
  );

  // Text controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  // State variables for demo
  int cardTapCount = 0;
  String lastAction = "No action yet";
  bool buttonEnabled = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'GlossyCeramic',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.activeColor,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'A modern design language showcase',
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.textColor,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 32),

              // GCTextField Section
              _buildSection(
                title: 'Text Fields',
                children: [
                  GCTextField(
                    hintText: 'Username',
                    icon: Icons.person_outline,
                    colorScheme: colorScheme,
                    textEditingController: usernameController,
                  ),
                  const SizedBox(height: 16),
                  GCTextField(
                    hintText: 'Email Address',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    colorScheme: colorScheme,
                    textEditingController: emailController,
                  ),
                  const SizedBox(height: 16),
                  GCTextField(
                    hintText: 'Password',
                    icon: Icons.lock_outline,
                    obscured: true,
                    colorScheme: colorScheme,
                    textEditingController: passwordController,
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // GCButton Section
              _buildSection(
                title: 'Buttons',
                children: [
                  Row(
                    children: [
                      GCButton(
                        colorScheme: colorScheme,
                        height: 50,
                        width: 150,
                        elevation: 3.0,
                        curveRadii: 25.0,
                        function: () {
                          setState(() {
                            lastAction = "Primary button pressed!";
                          });
                        },
                        child: const Center(
                          child: Text(
                            'Primary',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      GCButton(
                        colorScheme: colorScheme,
                        height: 50,
                        width: 150,
                        elevation: 3.0,
                        curveRadii: 25.0,
                        disabled: !buttonEnabled,
                        function: () {
                          setState(() {
                            lastAction = "Secondary button pressed!";
                            buttonEnabled = !buttonEnabled;
                          });
                        },
                        child: Center(
                          child: Text(
                            buttonEnabled ? 'Toggle Off' : 'Disabled',
                            style: TextStyle(
                              color: buttonEnabled ? Colors.white : Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GCButton(
                    colorScheme: colorScheme,
                    height: 60,
                    width: double.infinity,
                    elevation: 4.0,
                    curveRadii: 30.0,
                    function: () {
                      setState(() {
                        lastAction = "Icon button pressed!";
                        buttonEnabled = true;
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, color: Colors.white),
                        SizedBox(width: 12),
                        Text(
                          'Button with Icon',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // GCCard Section
              _buildSection(
                title: 'Cards',
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GCCard(
                          colorScheme: colorScheme,
                          height: 120,
                          width: double.infinity,
                          elevation: 2,
                          curveRadii: 20,
                          functionPressed: () {
                            setState(() {
                              cardTapCount++;
                              lastAction = "Card tapped $cardTapCount times";
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.touch_app,
                                  color: colorScheme.activeColor,
                                  size: 32,
                                ),
                                const Spacer(),
                                Text(
                                  'Tap Me',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.textColor,
                                  ),
                                ),
                                Text(
                                  'Single tap',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: colorScheme.auxIconColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: GCCard(
                          colorScheme: colorScheme,
                          height: 120,
                          width: double.infinity,
                          elevation: 2,
                          curveRadii: 20,
                          functionDoublePressed: () {
                            setState(() {
                              lastAction = "Card double-tapped!";
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.double_arrow,
                                  color: colorScheme.activeColor,
                                  size: 32,
                                ),
                                const Spacer(),
                                Text(
                                  'Double Tap',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.textColor,
                                  ),
                                ),
                                Text(
                                  'Try it!',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: colorScheme.auxIconColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GCCard(
                    colorScheme: colorScheme,
                    height: 100,
                    width: double.infinity,
                    elevation: 3,
                    curveRadii: 20,
                    functionHeld: () {
                      setState(() {
                        lastAction = "Card long-pressed!";
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: colorScheme.activeColor,
                            size: 40,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Long Press Card',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.textColor,
                                  ),
                                ),
                                Text(
                                  'Hold to trigger action',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: colorScheme.auxIconColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GCCard(
                    colorScheme: colorScheme,
                    height: 80,
                    width: double.infinity,
                    elevation: 1,
                    curveRadii: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: colorScheme.auxIconColor,
                            size: 32,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'Static card with no interactions',
                              style: TextStyle(
                                fontSize: 14,
                                color: colorScheme.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Status Display
              GCCard(
                colorScheme: colorScheme,
                height: 80,
                width: double.infinity,
                elevation: 2,
                curveRadii: 20,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Last Action:',
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.auxIconColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          lastAction,
                          style: TextStyle(
                            fontSize: 16,
                            color: colorScheme.activeColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: colorScheme.textColor,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}
