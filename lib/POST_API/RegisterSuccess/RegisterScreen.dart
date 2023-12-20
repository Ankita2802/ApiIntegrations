import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _psw = TextEditingController();
  String url = "https://reqres.in/api/login";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _signup() async {
    Map<String, dynamic> body = {};
    var res = await http.post(Uri.parse(url), body: {
      "email": _email.text,
      "password": _psw.text,
    });
    print(res.body);
    print(body);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          TextField(
            controller: _name,
            decoration: const InputDecoration(
                hintText: "Enter your Name",
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.black, fontSize: 25.0),
                hintStyle: TextStyle(color: Colors.black)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: _email,
            decoration: const InputDecoration(
                hintText: "Enter your Email",
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.black, fontSize: 25.0),
                hintStyle: TextStyle(color: Colors.black)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: _psw,
            decoration: const InputDecoration(
                hintText: "Enter your Passsword",
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.black, fontSize: 25.0),
                hintStyle: TextStyle(color: Colors.black)),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  fixedSize: const Size(200.0, 50.0)),
              onPressed: () async {
                _signup();
              },
              child: const Text("Register"))
        ],
      ),
    ));
  }
}
