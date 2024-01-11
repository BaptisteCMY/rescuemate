import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'HomePage.dart';
import 'ParameterPage.dart';
import 'NeedHelp.dart';

const String _url = 'https://auth.service-public.fr/realms/service-public/protocol/openid-connect/auth?response_type=code&client_id=spclient&scope=france_connect%20address%20phone%20openid%20profile%20email&state=tN2-J4f5G299Vo7E-AKtX3HeqeGICasvR-3txMPPkLw%3D&redirect_uri=https://www.service-public.fr/openid_connect_login&nonce=WzUy1FuYStOh-wGYGtQEgMUYF3TzYusLTyypkUqkTWE&prompt=login';

void _launchURL(String url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);
  @override
  _InscriptionState createState() => _InscriptionState();

}

class _InscriptionState extends State<Inscription> {
  // Ajoutez une variable pour suivre l'état de la checkbox
  bool psc1Checked = false;
  bool sstChecked = false;
  bool pse1Checked = false;
  bool pse2Checked = false;
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text('Inscription', style: TextStyle(fontSize: 30, fontFamily: 'Poppins')),
              const Padding(padding: EdgeInsets.all(35)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8, // Ajustez la largeur selon vos besoins
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.only(left: 10, right: 10, top: 0.5, bottom: 0.5)),
                    backgroundColor: MaterialStateProperty.all(const Color(0xFFFFFFFF)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _launchURL(_url);
                  },
                  child: Image.asset("assets/img/FranceConnectLogo.png")
                ),
              ),
              const Text("Se connecter avec FranceConnect",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                width: 250,
                child: Divider(
                  color: Colors.blue, // Couleur de la ligne
                  height: 100, // Hauteur de la ligne
                  thickness: 2,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Ajustez l'espacement horizontal ici
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ajustez l'alignement ici
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: nomController,
                        decoration: const InputDecoration(
                          labelText: 'Nom',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: prenomController,
                        decoration: const InputDecoration(
                          labelText: 'Prénom',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10), // Ajustez l'espacement horizontal et vertical ici
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child:  TextField(
                    controller: telephoneController,
                    keyboardType: TextInputType.phone, // Utilisez TextInputType.phone pour le clavier numérique
                    decoration: const InputDecoration(
                      labelText: 'Numéro de téléphone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10), // Ajustez l'espacement horizontal et vertical ici
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child:  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              ListTileTheme(
                tileColor: Colors.white, // Couleur du conteneur ListTile
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Container(
                    width: 200,
                    height: 125,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black), // Couleur de la bordure
                      borderRadius: BorderRadius.circular(5.0), // Rayon de la bordure
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text('   Diplôme', style: TextStyle(fontSize: 16)),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: psc1Checked,
                              onChanged: (bool? value) {
                                setState(() {
                                  psc1Checked = value!;
                                });
                              },
                            ),
                            const Text('PSC1'),
                            Checkbox(
                              value: sstChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  sstChecked = value!;
                                });
                              },
                            ),
                            const Text('SST'),
                            // Ajoutez d'autres CheckBox avec des libellés ici...
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: pse1Checked,
                              onChanged: (bool? value) {
                                setState(() {
                                  pse1Checked = value!;
                                });
                              },
                            ),
                            const Text('PSE1'),
                            Checkbox(
                              value: pse2Checked,
                              onChanged: (bool? value) {
                                setState(() {
                                  pse2Checked = value!;
                                });
                              },
                            ),
                            const Text('PSE2'),
                            // Ajoutez d'autres CheckBox avec des libellés ici...
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.only(left: 60, right: 60, top: 5, bottom: 5)),
                    backgroundColor: MaterialStateProperty.all(Colors.cyanAccent.withOpacity(0.5),),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Récupérez les valeurs depuis les contrôleurs
                    String nom = nomController.text.trim();
                    String prenom = prenomController.text.trim();
                    String telephone = telephoneController.text.trim();
                    String email = emailController.text.trim();


                    // Vérifiez si tous les champs du formulaire (sauf la checkbox) sont remplis
                    if (nom.isNotEmpty && prenom.isNotEmpty && telephone.isNotEmpty && email.isNotEmpty) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const HomePage(),
                        ),
                      );
                    } else {
                      // Affichez un message d'erreur si des champs du formulaire sont manquants
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Formulaire incomplet'),
                            content: const Text('Veuillez remplir tous les champs du formulaire.'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Soumettre', style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}