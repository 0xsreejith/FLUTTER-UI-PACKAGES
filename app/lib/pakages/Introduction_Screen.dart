import 'package:app/components/Intro_Component.dart';
import 'package:flutter/material.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final List<Widget> _pages = [
    IntroComponent(
        title: "Welcome",
        description: "Discover the app...",
        imagePath: "https://picsum.photos/600/400?random=1"),
    IntroComponent(
        title: "Explore",
        description: "Explore amazing features...",
        imagePath: "https://picsum.photos/600/400?random=2"),
    IntroComponent(
        title: "Stay Connected",
        description: "Keep in touch...",
        imagePath: "https://picsum.photos/600/400?random=3"),
    IntroComponent(
        title: "Get Started",
        description: "Let's dive into the app!",
        imagePath: "https://picsum.photos/600/400?random=4"),
  ];

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _skip() {
    _pageController.jumpToPage(_pages.length - 1);
  }

  void _next() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to home or main screen after onboarding
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _pageController,
            itemCount: _pages.length,
            itemBuilder: (context, index) => _pages[index],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: _currentIndex != _pages.length - 1
                ? TextButton(
                    onPressed: _skip,
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: _next,
              child: Text(_currentIndex == _pages.length - 1 ? "Finish" : "Next"),
            ),
          ),
        ],
      ),
    );
  }
}
