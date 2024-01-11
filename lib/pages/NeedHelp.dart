import 'package:flutter/material.dart';
import 'HomePage.dart';

class NeedHelp extends StatefulWidget {
  const NeedHelp({Key? key}) : super(key: key);

  @override
  _NeedHelp createState() => _NeedHelp();
}

class _NeedHelp extends State<NeedHelp> {
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
            builder: (context) => IconButton(
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
        elevation: 16,
        backgroundColor: const Color(0xFF1D6E73).withOpacity(0.9),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const SizedBox(height: 50),
              buildDrawerItem('Accueil', const HomePage()),
              buildDrawerItem('Premiers secours', const NeedHelp()),
              // ... Autres éléments du menu ...
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

  Widget buildCheckboxListTile(
      String title,
      bool value,
      void Function(bool?) onChanged,
      ) {
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
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const NeedHelp(),
          ),
        );
      },
      child: const Text(
        "Soumettre",
        style: TextStyle(fontSize: 18, color: Colors.black54),
        textAlign: TextAlign.center,
      ),
    );
  }
}
