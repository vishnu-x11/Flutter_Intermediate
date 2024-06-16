import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Second_page_animation.dart';

void main() {
  runApp(const MaterialApp(
    home: Main_Animation(),
  ));
}

class Main_Animation extends StatelessWidget {
  const Main_Animation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondary_animation) {
                            return Second_Page_Animation();
                          },
                          transitionsBuilder:
                              (context, animation, animation2, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          transitionDuration:
                          const Duration(milliseconds: 1000)));
                },
                child: const Text("Fade Animation")),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Second_Page_Animation();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        // Example of ScaleTransition for this transition
                        return ScaleTransition(
                          scale: Tween<double>(
                            begin: 0.0,
                            end: 1.0,
                          ).animate(CurvedAnimation(
                            parent: animation,
                            curve: Curves.fastOutSlowIn,
                          )),
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(
                          milliseconds: 600), // Set your duration
                    ),
                  );
                },
                child: const Text("Scale Animation")),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, AsecondaryAnimation) {
                          return Second_Page_Animation();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1.0, 0.0),
                              end: const Offset(0.0, 0.0),
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ));
                },
                child: const Text("Slide Animation")),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: const Duration(seconds: 1),
                          type: PageTransitionType.topToBottomPop,
                          child: Second_Page_Animation(),
                          childCurrent: this));
                },
                child: const Text("Using Package"))
          ],
        ),
      ),
    );
  }
}