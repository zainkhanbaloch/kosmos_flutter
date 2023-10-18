import 'package:flutter/material.dart';

class NavCard extends StatelessWidget {
  const NavCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/mars'); // Navigate to the Mars screen
              },
              child: Card(
                color: Colors.grey[400],
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/appicon.png",
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Mars"),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/news'); // Navigate to the News screen
              },
              child: Card(
                color: Colors.grey[400],
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/appicon.png",
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("News"),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/blog'); // Navigate to the Blog screen
              },
              child: Card(
                color: Color.fromARGB(255, 199, 199, 199),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/appicon.png",
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Blog"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
