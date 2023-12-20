import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'PostDataModel.dart';

class PostDataUser extends StatefulWidget {
  const PostDataUser({Key? key}) : super(key: key);

  @override
  State<PostDataUser> createState() => _PostDataUserState();
}

class _PostDataUserState extends State<PostDataUser> {
  var name, job, date;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  PostDataModel _user = PostDataModel();
  String url = "https://reqres.in/api/users";
  Future<PostDataModel> _postData(String name, String job) async {
    PostDataModel? getPostdata;
    var response = await http.post(Uri.parse(url), body: {
      "name": name,
      "job": job,
    });
    var jsondata = jsonDecode(response.body);
    getPostdata = PostDataModel.fromJson(jsondata);
    print(jsondata);
    return getPostdata;
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _job = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("User Created Page"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _name,
              decoration: const InputDecoration(
                  hintText: "Enter your Name",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: _job,
              decoration: const InputDecoration(
                  hintText: "Enter your Job Profile",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: "Job",
                  labelStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgor Password",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            _user == null
                ? const CircularProgressIndicator()
                : Text("user is ${name} craeted at successfully ${date}"),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50.0)),
              child: InkWell(
                  onTap: () async {
                    PostDataModel user = await _postData(_name.text, _job.text);
                    setState(() {
                      _user = user;
                      name = _user.name;
                      job = _user.job;
                      date = _user.createdAt;
                    });
                  },
                  child: const Center(
                      child: Text(
                    "Created User",
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
