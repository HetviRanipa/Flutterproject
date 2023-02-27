import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail_page.dart';

class EditPage extends StatefulWidget {
  EditPage({Key? key, this.userModel}) : super(key: key);
  dynamic userModel;

  @override
  State<EditPage> createState() => _EditPageState();

}

class _EditPageState extends State<EditPage> {
  var id;

  void initState() {
    if (widget.userModel != null) {
      id = widget.userModel["id"].toString();
    }
    nameController = TextEditingController(
        text: widget.userModel != null
            ? widget.userModel["name"].toString()
            : "");
    imageController = TextEditingController(
        text: widget.userModel != null
            ? widget.userModel["picture"].toString()
            : "");
    priceController = TextEditingController(
        text: widget.userModel != null
            ? widget.userModel["price"].toString()
            : "");

  }

  Map<String, String> map = {};
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  Future<void> addInApi(Map<String, String> map) async {
    print(map);
    http.Response res = await http.post(
      Uri.parse("https://63171deccb0d40bc414c7d89.mockapi.io/students"),
      body: jsonEncode(map),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Detail"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        // color: Colors.deepOrangeAccent,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Enter Name"),
                    validator: (value) {
                      var passNonNullValue = value ?? "";
                      if (passNonNullValue.isEmpty) {
                        return ("Password is required");
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: imageController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter image url"),
                    validator: (value) {
                      var passNonNullValue = value ?? "";
                      if (passNonNullValue.isEmpty) {
                        return ("Password is required");
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter price"),
                    validator: (value) {
                      var passNonNullValue = value ?? "";
                      if (passNonNullValue.isEmpty) {
                        return ("Password is required");
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150),
                  child: TextButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: const Text('Confirmation'),
                        title: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Confirm Changes??",
                            ),
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
                              if (_formKey.currentState!.validate()) {
                                map["name"] = nameController.text.toString();
                                map["picture"] =
                                    imageController.text.toString();
                                map["price"] =
                                    priceController.text.toString();
                                if (widget.userModel == null) {
                                  addInApi(map);
                                } else {
                                  updateInApi(
                                    map,
                                    id: id.toString(),
                                  );
                                }
                                Navigator.of(context)
                                  ..pop()
                                  ..pop()
                                  ..pushReplacement(
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          DetailsPage(
                                            map: map,
                                          ),
                                    ),
                                  );
                              }
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      backgroundColor: Colors.green,
                      minimumSize: Size(150, 50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateInApi(Map<String, String> map, {id}) async {
    print(id.toString());
    map["id"] = id.toString();
    print(map);
    http.Response res = await http.put(
      Uri.parse("https://63171deccb0d40bc414c7d89.mockapi.io/students/" +
          id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(map),
    );
  }
}