import 'package:flutter/material.dart';
import 'NeedHelp.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/img/logoRM.png",
            width: 30,
            height: 30,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('RescueMate',
        style: TextStyle(
          fontSize: 28,
          color: Colors.black
        ),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Code à exécuter lorsque le bouton du menu est pressé
            },
          ),
        ],
        // Increase the preferredSize
        toolbarHeight: 60,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text('URGENCE', style: TextStyle(fontSize: 42, fontFamily: 'Poppins')),
            const Padding(padding: EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Align buttons horizontally
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10)), // Adjust the padding
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF97A2FF)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const NeedHelp(),
                      ),
                    );
                  },
                  child: const Text(
                    "J'ai besoin\n d'aides",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 40), // Add some space between buttons
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10)), // Adjust the padding
                    backgroundColor: MaterialStateProperty.all(const Color(0xFFA6FF97)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const NeedHelp(),
                      ),
                    );
                  },
                  child: const Text(
                    "Premiers\n Secours",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.only(left: 120, right: 120, top: 20, bottom: 20)), // Adjust the padding
                backgroundColor: MaterialStateProperty.all(const Color(0xFFFF856A)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const NeedHelp(),
                  ),
                );
              },
              child: const Text(
                "Urgence",
                style: TextStyle(fontSize: 18, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
