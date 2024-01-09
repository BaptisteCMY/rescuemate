import 'package:flutter/material.dart';
import 'package:rescuemate/pages/ParameterPage.dart';
import 'HomePage.dart';

class NeedHelp extends StatelessWidget {
  const NeedHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const HomePage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/img/logoRM.png",
              width: 30,
              height: 30,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'RescueMate',
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        // Increase the preferredSize
        toolbarHeight: 60,
      ),
      endDrawer: Drawer(
          elevation: 16, // Change the elevation (default is 16)
          backgroundColor: const Color(0xFF1D6E73).withOpacity(0.9), // Change the background color and transparency
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7, // Change the width
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const SizedBox(height: 50),
                ListTile(
                  title: const Text(
                    'Accueil',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const HomePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Premiers secours',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const NeedHelp(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Mon compte',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const NeedHelp(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Localisation',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const NeedHelp(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Chat',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const NeedHelp(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Formations',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const NeedHelp(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Paramètres',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const ParameterPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Informations',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const NeedHelp(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      body: const Center(
        child: Text("Prochainement disponible"),
      ),
    );
  }
}