import 'package:flutter/material.dart';
import 'package:instaadmin/database.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool check = false;
  String contestName;
  String description;
  final DatabaseFire _firestore = DatabaseFire();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Select Winners",
                style: TextStyle(fontSize: 26),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Winner 1", hintText: "Winner name"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 1,
                    child: RaisedButton(
                        child: Text(
                          'Add Winner',
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () async {
                          await _firestore.updateWinner('Asif Ali', 'winner1');
                        }))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Winner 2", hintText: "Winner name"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 1,
                    child: RaisedButton(
                        child: Text(
                          'Add Winner',
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {}))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
