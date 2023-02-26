import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'edit_page.dart';
import 'get_all.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, @required this.map}) : super(key: key);
  dynamic map;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  initState() {
    super.initState();
  }

  Future<void> deleteById(id) async {
    final http.Response res = await http.delete(
      Uri.parse("https://630c645f83986f74a7bf23bb.mockapi.io/Faculties/$id"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Detail Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 450,
              width: 900,
              color: Colors.grey,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: 370,
                              width: 310,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.black38,
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      widget.map["picture"],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => EditPage(
                                          userModel: widget.map),
                                    ));
                                  },
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: TextButton.styleFrom(
                                    minimumSize: Size(33, 40),
                                    backgroundColor: Colors.blue,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        content: const Text(
                                            'Are ou Sure You Want To Delete?'),
                                        title: Column(
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Alert!!",
                                            )
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              deleteById(widget.map["id"]);
                                              Navigator.of(context)
                                                ..pop()
                                                ..pop()
                                                ..pushReplacement(
                                                  MaterialPageRoute<void>(
                                                    builder:
                                                        (BuildContext context) =>
                                                        GetAll(),
                                                  ),
                                                );
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                ),
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  minimumSize: Size(33, 40),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "${widget.map["name"]}",
                                style: TextStyle(
                                    fontSize: 30, decorationThickness: 30),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "City : ${widget.map["city"]}",
                                style: TextStyle(
                                    fontSize: 20, decorationThickness: 10),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "email : ${widget.map["email"]}",
                                style: TextStyle(
                                    fontSize: 20, decorationThickness: 10),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Pincode : ${widget.map["pincode"]}",
                                style: TextStyle(
                                    fontSize: 20, decorationThickness: 10),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Contact-Number : ${widget.map["ContactNumbar"]}",
                                style: TextStyle(
                                    fontSize: 20, decorationThickness: 10),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}