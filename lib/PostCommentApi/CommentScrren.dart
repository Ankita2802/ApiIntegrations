import 'package:flutter/material.dart';

import '../models/CommentsModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';

class CommentScreen extends StatefulWidget {
  var id;
  CommentScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  bool _loading = false;
  List<CommentsModel> comments = [];
  @override
  void initState() {
    // TODO: implement initState
    _readData();
    super.initState();
  }

  Future<void> _readData() async {
    setState(() {
      _loading = true;
    });
    var url =
        "https://jsonplaceholder.typicode.com/posts/${widget.id}/comments";
    var Response = await http.get(Uri.parse(url));
    print(Response.statusCode);
    if (Response.statusCode == 200) {
      var ResponseData = jsonDecode(Response.body);
      for (var data in ResponseData) {
        comments.add(CommentsModel.fromJson(data));
        print(comments);
      }
    }
    setState(() {
      _loading = false;
    });
  }

  // Future<CommentsModel> _getwithcomments(){
  //   var uri=""
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Comments with Post-Api"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: _loading == false
            ? ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) => SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.black,
                                child: Text(
                                  comments[index].id.toString(),
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Name: ${comments[index].name.toString()},",
                                      style: GoogleFonts.merriweather(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          color: Colors.blueAccent)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Email: ${comments[index].email.toString()},",
                                    style: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        color: Colors.blueAccent),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      height: 90,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          color: Colors.black26),
                                      child: Center(
                                          child: Text(
                                        "Comments: ${comments[index].body.toString()},",
                                        style: GoogleFonts.robotoSlab(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            color: Colors.blue),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      )))
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    ))
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ));
  }
}
