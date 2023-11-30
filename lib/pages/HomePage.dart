import 'package:flutter/material.dart';
import 'NeedHelp.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RescueMate"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/logoRM.png', width: 150),
            const Text('RescueMate', style: TextStyle(fontSize: 42, fontFamily: 'Poppins')),
            const Text("Un clic pour sauver une vie !",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                backgroundColor: MaterialStatePropertyAll(Color(0xFF97A2FF)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: ( _, __, ___) => NeedHelp()
                  ),
                );
              },
              child:  const Text("J'ai besoin d'aides",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black45
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
