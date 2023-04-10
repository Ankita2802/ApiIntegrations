import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as  http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../models/person.dart';
import 'package:apiintergration/userapi/addressdetails.dart';
class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  List<Person> person= [];

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
    var url = "https://jsonplaceholder.typicode.com/users";
    var Response = await http.get(Uri.parse(url));
    print(Response.statusCode);
    if (Response.statusCode == 200) {
      var responsedata = jsonDecode(Response.body);
      for (var data in responsedata) {
          person.add(Person.fromJson(data));
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
      backgroundColor:  Color(0xff8b224b),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_sharp,color: Colors.white70,size: 30,),
                  SizedBox(width: 150,),
                  Icon(Icons.circle,size: 10,color: Colors.white,),
                  SizedBox(width: 5,),
                  Icon(Icons.circle,size: 10,color: Colors.white,),
                  SizedBox(width: 5,),
                  Icon(Icons.circle,size: 10,color: Colors.white,),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(90.0),topLeft: Radius.circular(90.0))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child:_loading == false? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: person.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0,vertical: 10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                InformationDetails(
                                  street: person[index].address.street.toString(),
                                  suite: person[index].address.suite.toString(),
                                  city: person[index].address.city.toString(),
                                  zipcode: person[index].address.zipcode.toString(),
                                  geo: person[index].address.geo.toString(),
                                  lat: person[index].address.geo.lat.toString(),
                                  lng: person[index].address.geo.lng.toString(),
                                  phone: person[index].phone.toString(),
                                  website: person[index].website.toString(),
                                  name: person[index].company.name.toString(),
                                  catchp: person[index].company.catchPhrase.toString(),
                                    bs: person[index].company.bs.toString(),
                                )));
                          },
                          child: Container(
                            height: 70,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xffd1a2c2)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Color(0xffe16b93),
                                              shape: BoxShape.circle
                                          ),
                                          child: Center(child: Text(person[index].id.toString(),style: TextStyle(color: Color(0xfff3e5eb)),)),
                                        ),
                                        SizedBox(width: 20.0,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(person[index].name.toString(),style: GoogleFonts.ptSerif(color: Color(0xff733f50),fontSize: 13.0,fontWeight: FontWeight.bold),),
                                            SizedBox(height: 3,),
                                            Text(person[index].email.toString(),style: GoogleFonts.ptSerif(color: Color(0xff733f50),fontSize: 13.0,fontWeight: FontWeight.bold)),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                  ):Center(
                  child: SpinKitRing(
                    color: Colors.black,
                    size: 500,
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
