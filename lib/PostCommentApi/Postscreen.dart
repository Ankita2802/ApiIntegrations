import 'package:apiintergration/models/CommentsModel.dart';
import 'package:apiintergration/models/PostsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';

import 'CommentScrren.dart';

class PostsComment extends StatefulWidget {
  const PostsComment({Key? key}) : super(key: key);

  @override
  State<PostsComment> createState() => _PostsCommentState();
}

class _PostsCommentState extends State<PostsComment> {
  var id2;
  var id;
  List<PostsModel> post = [];
  PostsModel? postsModel;
  bool _loading = false;
  bool _ishow = false;
  Future<void> _getdata() async {
    // postsModel = await datagetting();
    setState(() {
      _loading = true;
    });
    var url = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response);
    if (response.statusCode == 200) {
      var responsedata = jsonDecode(response.body);
      for (var data in responsedata) {
        post.add(PostsModel.fromJson(data));
      }
    }
    setState(() {
      _loading = false;
    });
  }

  List<CommentsModel> post1 = [];
  Future<void> _getdata1(var id1) async {
    post1.clear();
    // postsModel = await datagetting();
    var url = "https://jsonplaceholder.typicode.com/posts/${id1}/comments";
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response);
    if (response.statusCode == 200) {
      var responsedata = jsonDecode(response.body);
      setState(() {
        for (var data in responsedata) {
          post1.add(CommentsModel.fromJson(data));
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _getdata();
    _getdata1(id);
    super.initState();
  }

  void _visibilityhide() {
    setState(() {
      if (id == id2) {
        _ishow = !_ishow;
      }
    });
  }

  int index1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Posts-Api"),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: _loading == false
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: post.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _getdata1(post[index].id);
                              print(post[index].id);
                              id = (post[index].id.toString());
                              print(id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CommentScreen(
                                            id: post[index].id.toString(),
                                          )));
                            },
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Text(post[index].id.toString()),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            post[index].title.toString(),
                            style: GoogleFonts.robotoSlab(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _getdata1(post[index].id);
                                  index1 = index!;
                                });
                              },
                              child: Icon(
                                _ishow ? Icons.comment : Icons.comment,
                                size: 20.0,
                              )),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                              child: Text(
                            post[index].body.toString(),
                            style: GoogleFonts.rocknRollOne(
                                color: Colors.grey, fontSize: 18.0),
                            maxLines: 3,
                          ))
                        ],
                      ),
                      Visibility(
                        visible: index == index1,
                        child: ListView.builder(
                          itemCount: post1.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Row(
                            children: [
                              id2 = Text(
                                post1[index].id.toString(),
                                style: const TextStyle(fontSize: 20.0),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: Text(
                                post1[index].body.toString(),
                                style: const TextStyle(fontSize: 15.0),
                                maxLines: 4,
                              ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.indigo),
              ));
  }
}
