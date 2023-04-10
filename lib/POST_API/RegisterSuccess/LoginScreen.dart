import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email=TextEditingController();
  TextEditingController _psw=TextEditingController();
  String url="https://reqres.in/api/login";
  Future<void> _login() async{
    var response=await http.post(Uri.parse(url),body: {
      // "email": "eve.holt@reqres.in",
      "password": "cityslicka"
    },
    );
    print(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 50.0,),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter your Email",
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black,fontSize: 25.0),
                    hintStyle:TextStyle(color: Colors.black)
                ),
              ),
              const SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter your Passsword",
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black,fontSize: 25.0),
                    hintStyle:TextStyle(color: Colors.black)
                ),
              ),
              const SizedBox(height: 40,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      fixedSize: Size(200.0, 50.0)
                  ),
                  onPressed:(){
                     _login();
                  },
                  child: Text("Login")
              ),

            ],
          ),
        )
    );
  }
}