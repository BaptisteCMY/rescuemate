import 'package:flutter/material.dart';
import 'globals.dart';
import 'HomePage.dart'; // Importez la page d'accueil ici

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

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
    globalPhoneNumber = contactNumber;

    // Affichez un SnackBar pour indiquer que le contact a été sauvegardé
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Contact sauvegardé: $contactNumber'),
        duration: Duration(seconds: 2), // Durée du message
      ),
    );

    // Naviguer vers la page d'accueil après un délai
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Remplacez HomePage() par le nom de votre page d'accueil
      );
    });
  }

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
              onPressed: () => _saveContact(context), // Utilisez _saveContact avec le contexte
              child: const Text('Enregistrer le contact'),
            ),
          ],
        ),
      ),
    );
  }
}
