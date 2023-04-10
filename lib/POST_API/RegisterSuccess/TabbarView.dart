import 'package:flutter/material.dart';
import 'CreatedUser.dart';
import 'LoginScreen.dart';
import 'RegisterScreen.dart';
class Tabbarview extends StatefulWidget {
  const Tabbarview({Key? key}) : super(key: key);

  @override
  State<Tabbarview> createState() => _TabbarviewState();
}

class _TabbarviewState extends State<Tabbarview> with SingleTickerProviderStateMixin{
   late TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }
  void dispose(){
    _tabController?.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          Text("WELCOME",style: TextStyle(color: Colors.black,fontSize: 30.0,fontWeight: FontWeight.bold),),
          SizedBox(height: 50,),
          Container(
            height: 60,
            width:350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)
            ),
            child: TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.orange
              ),
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text("CREATED",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0)),
                ),
                Tab(
                  child: Text("REGISTER",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
                ),
                Tab(
                  child: Text("lOGIN",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0)),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
                children: [
                  Post_Data(),
                  Register(),
                  Login(),
                ]
            ),
          )
        ],
      ),
    );
  }
}
