import 'package:flutter/material.dart';
import 'package:instaadmin/database.dart';

class HomeScreen1 extends StatefulWidget {
  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  final DatabaseFire _firestore = DatabaseFire();

  TextEditingController controller1,
      controller2,
      controller3,
      controller4,
      controller5,
      controller6,
      controller7,
      controller8,
      controller9,
      controller10;

  bool visible1 = true,
      visible2 = false,
      visible3 = false,
      visible4 = false,
      visible5 = false,
      visible6 = false,
      visible7 = false,
      visible8 = false,
      visible9 = false,
      visible10 = false;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    controller5 = TextEditingController();
    controller6 = TextEditingController();
    controller7 = TextEditingController();
    controller8 = TextEditingController();
    controller9 = TextEditingController();
    controller10 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Image.asset('assets/images/winners.png'),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 26),
                      child: Text(
                        "Select Winners",
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: visible1,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("1st Winner"),
                                SizedBox(
                                  height: 20,
                                ),
                                winnerOne(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: visible2,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("2nd Winner"),
                                SizedBox(
                                  height: 20,
                                ),
                                winnerTwo(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: visible3,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("3rd Winner"),
                                SizedBox(
                                  height: 20,
                                ),
                                winnerThree(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: visible4,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("4th Winner"),
                                SizedBox(
                                  height: 20,
                                ),
                                winnerFour(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: visible5,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("5th Winner"),
                                SizedBox(
                                  height: 20,
                                ),
                                winnerFive(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: visible6,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("6th Winner"),
                                SizedBox(
                                  height: 20,
                                ),
                                winnerSix(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: visible7,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("7th Winner"),
                                SizedBox(
                                  height: 20,
                                ),
                                winnerSeven(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: visible8,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("8th Winner"),
                                SizedBox(
                                  height: 20,
                                ),
                                winnerEight(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: visible9,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("9th Winner"),
                                SizedBox(
                                  height: 20,
                                ),
                                winnerNine(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: visible10,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("10th Winner"),
                                SizedBox(
                                  height: 20,
                                ),
                                winnerTen(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.07,
                child: RaisedButton(
                    color: Color(0xFFFF393A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Color(0xFFFFF4F4)),
                    ),
                    onPressed: () {
                      controller1.clear();
                      controller2.clear();
                      controller3.clear();
                      controller4.clear();
                      controller5.clear();
                      controller6.clear();
                      controller7.clear();
                      controller8.clear();
                      controller9.clear();
                      controller10.clear();
                      setState(() {
                        visible2 = false;
                        visible3 = false;
                        visible4 = false;
                        visible5 = false;
                        visible6 = false;
                        visible7 = false;
                        visible8 = false;
                        visible9 = false;
                        visible10 = false;
                      });
                    }),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      )),
    );
  }

  Widget winnerOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: textInputField(
            'Enter Name',
            controller1,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: RaisedButton(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
                onPressed: () async {
                  await _firestore.updateWinner(controller1.text, 'winner1');
                  setState(() {
                    visible2 = true;
                  });
                }))
      ],
    );
  }

  Widget winnerTwo() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: textInputField(
            'Enter Name',
            controller2,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: RaisedButton(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
                onPressed: () async {
                  await _firestore.updateWinner(controller2.text, 'winner2');
                  setState(() {
                    visible3 = true;
                  });
                }))
      ],
    );
  }

  Widget winnerThree() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: textInputField(
            'Enter Name',
            controller3,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: RaisedButton(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
                onPressed: () async {
                  await _firestore.updateWinner(controller3.text, 'winner3');
                  setState(() {
                    visible4 = true;
                  });
                }))
      ],
    );
  }

  Widget winnerFour() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: textInputField(
            'Enter Name',
            controller4,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: RaisedButton(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
                onPressed: () async {
                  await _firestore.updateWinner(controller4.text, 'winner4');
                  setState(() {
                    visible5 = true;
                  });
                }))
      ],
    );
  }

  Widget winnerFive() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: textInputField(
            'Enter Name',
            controller5,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: RaisedButton(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
                onPressed: () async {
                  await _firestore.updateWinner(controller5.text, 'winner5');
                  setState(() {
                    visible6 = true;
                  });
                }))
      ],
    );
  }

  Widget winnerSix() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: textInputField(
            'Enter Name',
            controller6,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: RaisedButton(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
                onPressed: () async {
                  await _firestore.updateWinner(controller6.text, 'winner6');
                  setState(() {
                    visible7 = true;
                  });
                }))
      ],
    );
  }

  Widget winnerSeven() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: textInputField(
            'Enter Name',
            controller7,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: RaisedButton(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
                onPressed: () async {
                  await _firestore.updateWinner(controller7.text, 'winner7');
                  setState(() {
                    visible8 = true;
                  });
                }))
      ],
    );
  }

  Widget winnerEight() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: textInputField('Enter Name', controller8),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: RaisedButton(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
                onPressed: () async {
                  await _firestore.updateWinner(controller8.text, 'winner8');
                  setState(() {
                    visible9 = true;
                  });
                }))
      ],
    );
  }

  Widget winnerNine() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: textInputField(
            "Enter Name",
            controller9,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: RaisedButton(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
                onPressed: () async {
                  await _firestore.updateWinner(controller9.text, 'winner9');
                  setState(() {
                    visible10 = true;
                  });
                }))
      ],
    );
  }

  Widget winnerTen() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: textInputField('Enter Name', controller10),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: RaisedButton(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
                onPressed: () async {
                  await _firestore.updateWinner(controller10.text, 'winner10');
                }))
      ],
    );
  }

  Widget textInputField(String text, TextEditingController _controller) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation: 0,
        child: TextField(
          controller: _controller,
          autofocus: false,
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
              filled: true,
              fillColor: Color(0xFFF3F5F5),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              hintText: text,
              hintStyle: TextStyle(
                  color: Color(0xFF999999),
                  fontFamily: "SF Pro Display Regular",
                  fontSize: 14)),
        ),
      ),
    );
  }
}
