import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'À propos de nous',
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: const SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notre mission',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Notre application a pour objectif de sauver des vies. Nous sommes une équipe de trois personnes travaillant sur ce projet depuis plusieurs semaines pendant nos heures de cours.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Fonctionnalités principales',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Le but principal de notre application est de fournir les premiers secours à une personne en situation d'urgence. Nous travaillons actuellement sur l'implémentation d'un système de géolocalisation qui permettra d'envoyer une alerte dans un périmètre défini par l'utilisateur.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Sensibilisation aux gestes de premiers secours',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Nous avons également pour objectif de fournir des informations simples et rapides sur les gestes de premiers secours à effectuer dans différentes situations d'urgence. Cette fonctionnalité vise à aider les personnes n'ayant pas les qualifications nécessaires à intervenir efficacement.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
