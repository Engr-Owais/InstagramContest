import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagraphql/model/comments_response.dart';
import 'package:http/http.dart' as http;
import 'package:instagraphql/model/edges.dart';
import 'package:countup/countup.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String contestName;
  String description;
  String winner1 = "";
  String winner2 = "";
  String winner3 = "";
  String winner4 = "";
  String winner5 = "";
  String winner6 = "";
  String winner7 = "";
  String winner8 = "";
  String winner9 = "";
  String winner10 = "";
  // final DatabaseFire _firestore = DatabaseFire();

  CommentsResponse futureAlbum1 = null;

  String _endPoint = "";
  TextEditingController _postEditController;
  bool onPressedLoading = false;
  bool _visibility = false;
  bool loading = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postEditController = TextEditingController();
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  'assets/images/search.png',
                  height: 200,
                  width: 250,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F5F5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Card(
                    elevation: 0,
                    child: TextField(
                      controller: _postEditController,
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
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Enter Instagram post code.",
                          hintStyle: TextStyle(
                              color: Color(0xFF999999),
                              fontFamily: "SF Pro Display Regular",
                              fontSize: 14)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.07,
                  child: RaisedButton(
                      color: Color(0xFFFF393A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                      child: Text(
                        "Get Participants",
                        style: TextStyle(color: Color(0xFFFFF4F4)),
                      ),
                      onPressed: () {
                        if (_postEditController.text.isNotEmpty) {
                          setState(() {
                            onPressedLoading = true;
                          });
                          fetchAlbum(_endPoint,
                                  _postEditController.text.trim().toString())
                              .then((value) => {
                                    debugPrint("Result => $value"),
                                    setState(() {
                                      onPressedLoading = false;
                                    })
                                  })
                              .catchError(
                                  (error) => {debugPrint(error.toString())});
                        } else {
                          showInSnackBar("Please enter code to process.");
                        }
                      }),
                ),
              ),
              (futureAlbum1 != null &&
                      futureAlbum1.toString().isNotEmpty &&
                      !onPressedLoading)
                  ? _commentsList(futureAlbum1)
                  : (futureAlbum1 != null && onPressedLoading)
                      ? Container(
                          child: CircularProgressIndicator(),
                        )
                      : Container(),

              (futureAlbum1 != null &&
                      futureAlbum1.toString().isNotEmpty &&
                      !onPressedLoading)
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.07,
                        child: RaisedButton(
                            color: Color(0xFFFF393A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 15),
                            child: Text(
                              "Select Winners",
                              style: TextStyle(color: Color(0xFFFFF4F4)),
                            ),
                            onPressed: () async {
                              setState(() {
                                _visibility = true;
                              });
                              await showUsers();
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return Container(
                              //         color: Colors.transparent,
                              //         child: AlertDialog(
                              //           shape: RoundedRectangleBorder(
                              //               borderRadius:
                              //                   BorderRadius.circular(20),
                              //               side:
                              //                   BorderSide(color: Colors.red)),
                              //           backgroundColor: Colors.transparent,
                              //           elevation: 2.0,
                              //           title: Text(
                              //             "WINNERS",
                              //             textAlign: TextAlign.center,
                              //             style: TextStyle(color: Colors.white),
                              //           ),
                              //           actions: [
                              //             Container(
                              //               child: FlatButton(
                              //                   color: Colors.deepPurple[400],
                              //                   onPressed: () =>
                              //                       Navigator.pop(context),
                              //                   child: Text("CLOSE")),
                              //             )
                              //           ],
                              //           content: Container(
                              //             width: double.maxFinite,
                              //             child: ListView(children: <Widget>[
                              //               (winner1 != "")
                              //                   ? winnerCard("1st winner",
                              //                       winner1, Colors.purple[300])
                              //                   : Container(),
                              //               (winner2 != "")
                              //                   ? winnerCard(
                              //                       "2nd winner",
                              //                       winner2,
                              //                       Colors.deepOrangeAccent)
                              //                   : Container(),
                              //               (winner3 != "")
                              //                   ? winnerCard(
                              //                       "3rd winner",
                              //                       winner3,
                              //                       Colors.deepPurple[800])
                              //                   : Container(),
                              //               (winner4 != "")
                              //                   ? winnerCard("4th winner",
                              //                       winner4, Colors.amber)
                              //                   : Container(),
                              //               (winner5 != "")
                              //                   ? winnerCard(
                              //                       "5th winner",
                              //                       winner5,
                              //                       Colors.redAccent[400])
                              //                   : Container(),
                              //               (winner6 != "")
                              //                   ? winnerCard(
                              //                       "6th winner",
                              //                       winner6,
                              //                       Colors.deepOrange[300])
                              //                   : Container(),
                              //               (winner7 != "")
                              //                   ? winnerCard("7th winner",
                              //                       winner7, Colors.blue[300])
                              //                   : Container(),
                              //               (winner8 != "")
                              //                   ? winnerCard("8th winner",
                              //                       winner8, Colors.grey[700])
                              //                   : Container(),
                              //               (winner9 != "")
                              //                   ? winnerCard("9th winner",
                              //                       winner9, Colors.teal[500])
                              //                   : Container(),
                              //               (winner10 != "")
                              //                   ? winnerCard("10th winner",
                              //                       winner10, Colors.amber)
                              //                   : Container()
                              //             ]),
                              //           ),
                              //         ),
                              //       );
                              //     });

                              showGeneralDialog(
                                context: context,
                                barrierColor: Colors.black12
                                    .withOpacity(0.6), // background color
                                barrierDismissible:
                                    false, // should dialog be dismissed when tapped outside
                                barrierLabel: "Dialog", // label for barrier
                                transitionDuration: Duration(
                                    milliseconds:
                                        400), // how long it takes to popup dialog after button click
                                pageBuilder: (_, __, ___) {
                                  // your widget implementation
                                  return SizedBox.expand(
                                    // makes widget fullscreen
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Container(
                                              height: 200,
                                              width: 300,
                                              child:
                                                  ListView(children: <Widget>[
                                                (winner1 != "")
                                                    ? winnerCard(
                                                        "1st winner",
                                                        winner1,
                                                        Colors.purple[300])
                                                    : Container(),
                                                (winner2 != "")
                                                    ? winnerCard(
                                                        "2nd winner",
                                                        winner2,
                                                        Colors.deepOrangeAccent)
                                                    : Container(),
                                                (winner3 != "")
                                                    ? winnerCard(
                                                        "3rd winner",
                                                        winner3,
                                                        Colors.deepPurple[800])
                                                    : Container(),
                                                (winner4 != "")
                                                    ? winnerCard("4th winner",
                                                        winner4, Colors.amber)
                                                    : Container(),
                                                (winner5 != "")
                                                    ? winnerCard(
                                                        "5th winner",
                                                        winner5,
                                                        Colors.redAccent[400])
                                                    : Container(),
                                                (winner6 != "")
                                                    ? winnerCard(
                                                        "6th winner",
                                                        winner6,
                                                        Colors.deepOrange[300])
                                                    : Container(),
                                                (winner7 != "")
                                                    ? winnerCard(
                                                        "7th winner",
                                                        winner7,
                                                        Colors.blue[300])
                                                    : Container(),
                                                (winner8 != "")
                                                    ? winnerCard(
                                                        "8th winner",
                                                        winner8,
                                                        Colors.grey[700])
                                                    : Container(),
                                                (winner9 != "")
                                                    ? winnerCard(
                                                        "9th winner",
                                                        winner9,
                                                        Colors.teal[500])
                                                    : Container(),
                                                (winner10 != "")
                                                    ? winnerCard("10th winner",
                                                        winner10, Colors.amber)
                                                    : Container()
                                              ]),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: FloatingActionButton(
                                            child: Icon(Icons.close),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );

                              setState(() {
                                _visibility = true;
                              });
                            }),
                      ),
                    )
                  : Container(),

              //    ))
              // StreamBuilder(
              //   stream: Firestore.instance
              //       .collection('winners')
              //       .document('selectedwinners')
              //       .snapshots(),
              //   builder: (context, querySnapshot) {
              //     if (querySnapshot.hasError) {
              //       return Text(
              //           "Error Loading Data ......${querySnapshot.error}");
              //     }
              //     if (querySnapshot.connectionState ==
              //         ConnectionState.waiting) {
              //       return Center(
              //           child: Container(
              //               height: 50,
              //               width: 50,
              //               child: CircularProgressIndicator()));
              //     } else {
              //       ContestModel results = querySnapshot.data;
              //       if (results.winner1.isNotEmpty) {
              //         Card(
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(15.0),
              //           ),
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Column(
              //               children: [
              //                 Text("1st Winner"),
              //                 SizedBox(
              //                   height: 20,
              //                 ),
              //                 Row(
              //                   children: [
              //                     CircleAvatar(
              //                       backgroundColor: Color(0xFF9C9CE2),
              //                       foregroundColor: Colors.white,
              //                       child: Text(
              //                         "${results.winner1}"[0],
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       width: 20,
              //                     ),
              //                     Text(
              //                       ' ${results.winner1}',
              //                       style: TextStyle(
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ],
              //                 )
              //               ],
              //             ),
              //           ),
              //         );
              //       }
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget winnerCard(String title, String name, Color colors) {
    return Card(
      elevation: 5.0,
      color: colors,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Future showUsers() async {
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('winners')
        .doc('selectedwinners')
        .get();

    winner1 = variable.data()['winner1'].toString();

    setState(() {
      winner1 = variable.data()['winner1'].toString();
      winner2 = variable.data()['winner2'].toString();
      winner3 = variable.data()['winner3'].toString();
      winner4 = variable.data()['winner4'].toString();
      winner5 = variable.data()['winner5'].toString();
      winner6 = variable.data()['winner6'].toString();
      winner7 = variable.data()['winner7'].toString();
      winner8 = variable.data()['winner8'].toString();
      winner9 = variable.data()['winner9'].toString();
      winner10 = variable.data()['winner10'].toString();
    });
    // print();

    // return variable.data().toString();
    // _scrollController.animateTo(
    //   700.0,
    //   curve: Curves.easeOut,
    //   duration: const Duration(milliseconds: 300),
    // );
  }

  Widget _commentsList(CommentsResponse data) {
    if (data.data.shortcodeMedia.edgeMediaToParentComment.count > 0) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Countup(
              begin: 0,
              end: data.data.shortcodeMedia.edgeMediaToParentComment.count
                  .toDouble(),
              duration: Duration(milliseconds: 700),
              separator: ',',
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Container(
                height: 150,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 100,
                  physics: FixedExtentScrollPhysics(),
                  squeeze: 2,
                  childDelegate: ListWheelChildBuilderDelegate(
                      builder: (BuildContext context, int index) {
                    if (index < 0 || index > 9) {
                      return Container();
                    }
                    return _listItem(
                        index,
                        futureAlbum1.data.shortcodeMedia
                            .edgeMediaToParentComment.edges);
                  }),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  Widget _listItem(int index, List<Edges> data) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        onPressedLoading = false;
      });
    });

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF9C9CE2),
                    foregroundColor: Colors.white,
                    child: Text(
                      "${data[index].node.owner.username}"[0],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    ' ${data[index].node.owner.username}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<CommentsResponse> fetchAlbum(String endPoint, String postID) async {
    var headers = {
      'X-IG-App-ID': '936619743392459',
      'X-Requested-With': 'XMLHttpRequest',
      "Accept": "*/*"
    };

    String _queryHash = '97b41c52301f77ce508f55e66d17620e';
    String posts = '50';

    final response = await http.get(
        'https://www.instagram.com/graphql/query/?query_hash=$_queryHash&shortcode=$postID&first=$posts&after=$endPoint',
        headers: headers);

    if (response.statusCode == 200) {
      var result = CommentsResponse.fromJson(jsonDecode(response.body));
      setState(() {
        futureAlbum1 = result;
      });
      // return CommentsResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
