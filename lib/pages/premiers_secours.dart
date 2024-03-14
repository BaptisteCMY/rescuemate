import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'eval_situation.dart';
import 'RCP.dart';
import 'etouffement.dart';
import 'PLS.dart';
import 'ParameterPage.dart';
import 'AboutPage.dart';
import 'hemorragie.dart';

class premiers_secours extends StatefulWidget {
  const premiers_secours({Key? key}) : super(key: key);

  @override
  _PremiersSecoursState createState() => _PremiersSecoursState();
}


class _PremiersSecoursState extends State<premiers_secours> {
  final List<String> options = ["Arrêt cardiaque", "Inconscient", "Étouffement", "Hémorragie"];
  List<bool> selectedOptions = [false, false, false, false, false, false];
  final _formKey = GlobalKey<FormState>();
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector( // Utilisez GestureDetector pour détecter les clics sur l'icône de l'application
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
        elevation: 16,
        backgroundColor: Color(0xFF1D6E73).withOpacity(0.9),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
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
                      pageBuilder: (_, __, ___) => const premiers_secours(),
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
                      pageBuilder: (_, __, ___) => const HomePage(),
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
                      pageBuilder: (_, __, ___) => const HomePage(),
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
                      pageBuilder: (_, __, ___) => const HomePage(),
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
                      pageBuilder: (_, __, ___) => const HomePage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Paramatres',
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
                      pageBuilder: (_, __, ___) => const AboutPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child : Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text('Premiers secours', style: TextStyle(fontSize: 32, fontFamily: 'Poppins')),
              const Padding(padding: EdgeInsets.all(20)),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(10), // Réduire la taille du padding
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.3), // Couleur du cadre gris plus foncé
                    borderRadius: BorderRadius.circular(10), // Coins arrondis du cadre
                  ),
                  child: Column(
                    children: List.generate(
                      options.length,
                          (index) => CheckboxListTile(
                        title: Text(options[index]),
                        value: selectedOptions[index],
                        onChanged: (value) {
                          setState(() {
                            selectedOptions[index] = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height : 15),
              ElevatedButton(
                onPressed: () {
                  bool atLeastOneChecked = selectedOptions.any((element) => element);

                  if (!atLeastOneChecked) {
                    setState(() {
                      showError = true;
                    });
                  } else {
                    setState(() {
                      showError = false;
                    });

                    if (selectedOptions[0]) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RCP(),
                        ),
                      );
                    } else if (selectedOptions[1]) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => eval_situation(),
                        ),
                      );
                    } else if (selectedOptions[2]) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => etouffement(),
                        ),
                      );
                    } else if (selectedOptions[3]) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => hemorragie(),
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyanAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  backgroundColor: Colors.cyanAccent.withOpacity(0.5),
                ),
                child: Text("Soumettre"),
              ),
              if (showError)
                const Text(
                  "Veuillez cocher au moins une des différentes options.",
                  style: TextStyle(color: Colors.red),
                ),

              const SizedBox(height : 25),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const eval_situation(),
                    ),
                  );
                },
                child: Ink.image(
                  image: AssetImage('assets/img/premier_regard.png'),
                  fit: BoxFit.contain,
                  width: 400, // Ajustez la largeur du bouton ici
                  height: 100, // Ajustez la hauteur du bouton ici
                  child: Container(
                    // Vous pouvez ajuster le padding, la marge, etc., pour personnaliser l'apparence du bouton
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const SizedBox(height : 25),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const RCP(),
                    ),
                  );
                },
                child: Ink.image(
                  image: AssetImage('assets/img/RCP.png'),
                  fit: BoxFit.contain,
                  width: 400, // Ajustez la largeur du bouton ici
                  height: 100, // Ajustez la hauteur du bouton ici
                  child: Container(
                    // Vous pouvez ajuster le padding, la marge, etc., pour personnaliser l'apparence du bouton
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const SizedBox(height : 25),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const etouffement(),
                    ),
                  );
                },
                child: Ink.image(
                  image: AssetImage('assets/img/étouffement.png'),
                  fit: BoxFit.contain,
                  width: 400, // Ajustez la largeur du bouton ici
                  height: 100, // Ajustez la hauteur du bouton ici
                  child: Container(
                    // Vous pouvez ajuster le padding, la marge, etc., pour personnaliser l'apparence du bouton
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const SizedBox(height : 25),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const PLS(),
                    ),
                  );
                },
                child: Ink.image(
                  image: AssetImage('assets/img/PLS.png'),
                  fit: BoxFit.contain,
                  width: 400, // Ajustez la largeur du bouton ici
                  height: 100, // Ajustez la hauteur du bouton ici
                  child: Container(
                    // Vous pouvez ajuster le padding, la marge, etc., pour personnaliser l'apparence du bouton
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const SizedBox(height : 25),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const hemorragie(),
                  ),
                  );
                },
                child: Ink.image(
                  image: AssetImage('assets/img/hemorragie.png'),
                  fit: BoxFit.contain,
                  width: 400, // Ajustez la largeur du bouton ici
                  height: 100, // Ajustez la hauteur du bouton ici
                  child: Container(
                    // Vous pouvez ajuster le padding, la marge, etc., pour personnaliser l'apparence du bouton
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}