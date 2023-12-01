import 'package:flutter/material.dart';


class NeedHelp extends StatelessWidget {
  const NeedHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RescueMate"),
      ),
      body: const Center(
        child: Text("Prochainement disponible"),
      ),
    );
  }
}