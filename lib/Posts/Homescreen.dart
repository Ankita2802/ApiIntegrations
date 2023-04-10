import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:apiintergration/models/usermodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as  http;
import 'description.dart';
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<Usermodel> user = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Readjson();
  }
  bool _loading=false;
  Future<void> Readjson() async {
    setState(() {
      _loading=true;
    });
    var url = "https://jsonplaceholder.typicode.com/posts";
    var Response = await http.get(Uri.parse(url));
    print(Response.statusCode);
    if (Response.statusCode == 200) {
      var responsedata = jsonDecode(Response.body);
      print(responsedata);
      for (var data in responsedata) {
        user.add(Usermodel.fromJson(data));
      }
      setState(() {

      });
    }
    setState(() {
      _loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeb2ea),
      appBar: AppBar(
        title: const Text("Api demo"),
        centerTitle: true,
        backgroundColor: Color(0xffa77ff5),
        automaticallyImplyLeading: false,
      ),
      body: _loading == false?ListView.builder(
        shrinkWrap: true,
         scrollDirection: Axis.vertical,
          itemCount: user.length,
          itemBuilder: (context, index) =>
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5.0),
                child: Card(
                  child: Container(
                    height: 50,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffb585f3)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>description(id: user[index].id.toString(),title: user[index].title.toString(),body: user[index].body.toString(),)));
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff675791)
                                    ),
                                    child: Center(child: Text(user[index].id.toString(),style: TextStyle(color: Colors.white70),)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )

      ):Center(
        child: SpinKitPianoWave(
          color: Colors.white,
          size: 70,
        ),
      )
    );
  }
}



