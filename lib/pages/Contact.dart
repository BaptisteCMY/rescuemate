import 'package:flutter/material.dart';
import 'HomePage.dart'; // Importez la page d'accueil ici

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  static List<String> contacts = [];

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  late TextEditingController _contactController;

  @override
  void initState() {
    super.initState();
    _contactController = TextEditingController();
  }

  @override
  void dispose() {
    _contactController.dispose();
    super.dispose();
  }

  void _saveContact(BuildContext context) {
    String contactNumber = _contactController.text;
    Contact.contacts.add(contactNumber);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Contact sauvegardé: $contactNumber'),
        duration: Duration(seconds: 2),
      ),
    );

    _contactController.clear();
    setState(() {}); // Actualiser l'affichage des contacts après l'ajout
  }

  void _removeContact(int index) {
    Contact.contacts.removeAt(index);
    setState(() {}); // Actualiser l'affichage des contacts après la suppression
  }

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Entrez le numéro de téléphone du contact',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _contactController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Numéro de téléphone',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveContact(context),
              child: const Text('Enregistrer le contact'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: Contact.contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(Contact.contacts[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeContact(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
