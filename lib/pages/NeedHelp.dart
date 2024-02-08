import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rescuemate/pages/globals.dart';
import 'HomePage.dart';
import 'premiers_secours.dart';
import 'ParameterPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'globals.dart';

class NeedHelp extends StatefulWidget {
  const NeedHelp({Key? key}) : super(key: key);

  @override
  _NeedHelp createState() => _NeedHelp();
}

class _NeedHelp extends State<NeedHelp> {
  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;

  String _currentAdress = "";

  Future<Position> _getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print("Service disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  void _launchPhone(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    await launch(url);
  }

  void _sendingSMS(String sms, String phoneNumber) async {
    String url = 'sms:$phoneNumber?body=$sms';
    await launch(url);
  }


  void checkAndRequestPhonePermission() async {
    // Vérifiez l'état actuel de l'autorisation
    PermissionStatus status = await Permission.phone.status;

    // Si l'autorisation n'est pas déjà accordée, demandez-la à l'utilisateur
    if (!status.isGranted) {
      status = await Permission.phone.request();
    }

    // Si l'autorisation est accordée, vous pouvez maintenant effectuer l'action qui nécessitait cette autorisation
    if (status.isGranted) {
      // Faire quelque chose qui nécessite l'autorisation, comme appeler un numéro de téléphone
      _launchPhone('0781913733');
    } else {
      // L'utilisateur a refusé l'autorisation ou une erreur s'est produite
      // Vous pouvez afficher un message à l'utilisateur pour l'informer que l'autorisation est nécessaire pour effectuer cette action
    }
  }

  void checkAndRequestSendSMS() async {
    // Vérifiez l'état actuel de l'autorisation
    PermissionStatus status = await Permission.sms.status;

    // Si l'autorisation n'est pas déjà accordée, demandez-la à l'utilisateur
    if (!status.isGranted) {
      status = await Permission.sms.request();
    }

    // Si l'autorisation est accordée, vous pouvez maintenant effectuer l'action qui nécessitait cette autorisation
    if (status.isGranted) {
      // Faire quelque chose qui nécessite l'autorisation, comme appeler un numéro de téléphone
      _sendingSMS('lalalo', 'Maman');
    } else {
      // L'utilisateur a refusé l'autorisation ou une erreur s'est produite
      // Vous pouvez afficher un message à l'utilisateur pour l'informer que l'autorisation est nécessaire pour effectuer cette action
    }
  }

  bool etouffement = false;
  bool saignement = false;
  bool vertiges = false;
  bool coince = false;
  bool hypothermie = false;
  bool conscient = false;
  bool inconscient = false;
  bool respire = false;
  bool neRespirePas = false;

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
            builder: (context) =>
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
          ),
        ],
        toolbarHeight: 60,
      ),
      endDrawer: Drawer(
        elevation: 16, // Change the elevation (default is 16)
        backgroundColor: const Color(0xFF1D6E73).withOpacity(0.9),
        child: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.7, // Change the width
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text('Je suis la victime',
                    style: TextStyle(fontSize: 24, fontFamily: 'Poppins')),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTileTheme(
                        dense: true,
                        child: Column(
                          children: [
                            buildCheckboxListTile(
                              'Étouffement',
                              etouffement,
                                  (bool? value) {
                                setState(() {
                                  etouffement = value ?? false;
                                });
                              },
                            ),
                            buildCheckboxListTile(
                              'Saignement',
                              saignement,
                                  (bool? value) {
                                setState(() {
                                  saignement = value ?? false;
                                });
                              },
                            ),
                            buildCheckboxListTile(
                              'Vertiges',
                              vertiges,
                                  (bool? value) {
                                setState(() {
                                  vertiges = value ?? false;
                                });
                              },
                            ),
                            buildCheckboxListTile(
                              'Coincé',
                              coince,
                                  (bool? value) {
                                setState(() {
                                  coince = value ?? false;
                                });
                              },
                            ),
                            buildCheckboxListTile(
                              'Hypothermie',
                              hypothermie,
                                  (bool? value) {
                                setState(() {
                                  hypothermie = value ?? false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      buildCommentTextField(),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                buildSubmitButton(),
                const SizedBox(height: 100),
                const Text('Je suis témoin',
                    style: TextStyle(fontSize: 24, fontFamily: 'Poppins')),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTileTheme(
                        dense: true,
                        child: Column(
                          children: [
                            buildCheckboxListTile(
                              'Conscient',
                              conscient,
                                  (bool? value) {
                                setState(() {
                                  conscient = value ?? false;
                                });
                              },
                            ),
                            buildCheckboxListTile(
                              'Inconscient',
                              inconscient,
                                  (bool? value) {
                                setState(() {
                                  inconscient = value ?? false;
                                });
                              },
                            ),
                            buildCheckboxListTile(
                              'Respire',
                              respire,
                                  (bool? value) {
                                setState(() {
                                  respire = value ?? false;
                                });
                              },
                            ),
                            buildCheckboxListTile(
                              'Ne respire pas',
                              neRespirePas,
                                  (bool? value) {
                                setState(() {
                                  neRespirePas = value ?? false;
                                });
                              },
                            ),
                            buildCheckboxListTile(
                              'Saignement',
                              saignement,
                                  (bool? value) {
                                setState(() {
                                  saignement = value ?? false;
                                });
                              },
                            ),
                            buildCheckboxListTile(
                              'Étouffement',
                              etouffement,
                                  (bool? value) {
                                setState(() {
                                  etouffement = value ?? false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      buildCommentTextField(),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItem(String title, Widget page) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
          ),
        );
      },
    );
  }

  Widget buildCheckboxListTile(String title,
      bool value,
      void Function(bool?) onChanged,) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget buildCommentTextField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Ajouter un commentaire...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          style: const TextStyle(
            color: Colors.black, // Set the text color to black
          ),
          maxLines: 3,
        ),
      ),
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        backgroundColor: Colors.cyanAccent.withOpacity(0.5),
      ),
      onPressed: () {
        sendHelpMessage(); // Appeler la méthode pour envoyer le message d'aide
      },
      child: const Text(
        "Soumettre",
        style: TextStyle(fontSize: 18, color: Colors.black54),
        textAlign: TextAlign.center,
      ),
    );
  }

  void sendHelpMessage() async {
    _currentLocation = await _getCurrentLocation();
    print(
        "Latitude: ${_currentLocation?.latitude}, Longitude: ${_currentLocation
            ?.longitude}");

    // Vérifier si c'est la victime ou le témoin et ajouter cette information au message
    String role = 'Victime'; // Par défaut, considérez que c'est la victime
    if (conscient || inconscient || respire || neRespirePas) {
      role = 'Témoin';
    }
    String url = 'https://www.google.fr/maps/dir//';
    String coordinates = '${_currentLocation?.latitude},${_currentLocation?.longitude}';
    String message = 'RescueMate: nous avons besoin de vous ici : $url$coordinates! Je suis $role. Problème :';




    // Vérifier quelles cases sont cochées et ajouter le contenu du message en conséquence
    if (etouffement) {
      message += 'Étouffement ';
    }
    if (saignement) {
      message += 'Saignement ';
    }
    if (vertiges) {
      message += 'Vertiges ';
    }
    if (coince) {
      message += 'Coincé ';
    }
    if (hypothermie) {
      message += 'Hypothermie ';
    }
    if (conscient) {
      message += 'Conscient ';
    }
    if (inconscient) {
      message += 'Inconscient ';
    }
    if (respire) {
      message += 'Respire ';
    }
    if (neRespirePas) {
      message += 'Ne respire pas ';
    }

    // Ajouter le commentaire s'il y en a un
    // Vous pouvez récupérer le commentaire à partir d'un contrôleur de texte
    // Remarque : Vous devez ajouter un contrôleur de texte pour le commentaire dans votre code
    // et récupérer la valeur du texte de ce contrôleur
    // Par exemple : TextEditingController _commentController = TextEditingController();
    // puis, dans le onPressed(), vous pouvez obtenir le commentaire en utilisant _commentController.text
    String commentaire = ''; // Remplacer par la valeur réelle du commentaire
    if (commentaire.isNotEmpty) {
      message += 'RescueMate: $commentaire';
    }

    // Envoyer le message
    _sendingSMS(message, globalPhoneNumber);
  }
}