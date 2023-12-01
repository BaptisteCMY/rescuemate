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
        backgroundColor: Color(0xFF1D6E73).withOpacity(0.9), // Change the background color and transparency
        child: Container(
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
                      pageBuilder: (_, __, ___) => const NeedHelp(),
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
                    padding: MaterialStateProperty.all(const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10)),
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
                const SizedBox(width: 40),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10)),
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
            const SizedBox(height: 40),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.only(left: 120, right: 120, top: 20, bottom: 20)),
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

