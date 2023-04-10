
import 'package:apiintergration/userapi/userscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'POST_API/RegisterSuccess/CreatedUser.dart';
import 'POST_API/RegisterSuccess/TabbarView.dart';
import 'PostCommentApi/Postscreen.dart';
import 'Posts/Homescreen.dart';
import 'models/PostModels/UserCreated.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    // TODO: implement initState
   Future.delayed(Duration(seconds: 3),(){
     Navigator.push(context,MaterialPageRoute(builder: (context) => Post_Data(),
     ));
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[
                Colors.black,
                Colors.black26
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
          )
        ),
      ),
    );
  }
}
