import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/PostModels/PostDataModel.dart';
class Post_Data extends StatefulWidget {
  const Post_Data({Key? key}) : super(key: key);

  @override
  State<Post_Data> createState() => _Post_DataState();
}

class _Post_DataState extends State<Post_Data> {
  TextEditingController _name=TextEditingController();
  TextEditingController _job=TextEditingController();
  String url = "https://reqres.in/api/users";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Future<PostDataModel> _PostData(String name,String job) async{
    PostDataModel ? GetPostdata;
    var response= await http.post(
        Uri.parse(url),
        body: {
          "name":name,
          "job":job,
        }
    );
    var jsondata =jsonDecode(response.body);
    print(jsondata);
    GetPostdata=PostDataModel.fromJson(jsondata);
    return GetPostdata;
  }
  var name,job,date;
  @override
  Widget build(BuildContext context) {
    PostDataModel _user = PostDataModel();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            TextField(
              controller: _name,
              decoration: const InputDecoration(
                  hintText: "Enter your Name",
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.black,fontSize: 25.0),
                  hintStyle:TextStyle(color: Colors.black)
              ),
            ),
            const SizedBox(height: 10.0,),
            TextField(
              controller: _job,
              decoration: const InputDecoration(
                  hintText: "Enter yourjobEmail",
                  labelText: "job",
                  labelStyle: TextStyle(color: Colors.black,fontSize: 25.0),
                  hintStyle:TextStyle(color: Colors.black)
              ),
            ),
            SizedBox(height: 30,),
            _user == null ? CircularProgressIndicator() :Text("user ${name} is succesfullt craeated at  ${date}"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                fixedSize: Size(100.0, 40.0)
              ),
                onPressed: () async{
                  //  final n=_name.text;
                  //  print(n);
                  //     final j=_job.text;
                  //     print(j);
                  PostDataModel user= await _PostData(_name.text, _job.text);
                  print('----------------${user.name}');
                  setState(() {
                    _user=user;
                    name = _user.name;
                    job = _user.job;
                    date = _user.createdAt;

                  });  print('----------------${_user.name}');
                },
                child: Text("Save")
            )
          ],
        ),
      ),
    );
  }
}
