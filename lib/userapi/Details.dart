import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Details extends StatefulWidget {
  var phoneno;
  var website;
  var name;
  var catchpharse;
  var bs;

  Details(
      {Key? key,
      required this.phoneno,
      this.website,
      this.name,
      this.catchpharse,
      this.bs})
      : super(key: key);
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe16b93),
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.person,
                color: Colors.black45,
                size: 120,
              ),
              Text(
                "Personal Details",
                style: GoogleFonts.robotoSlab(
                    color: Colors.black45, fontSize: 30.0),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Table(
                    defaultColumnWidth: const FixedColumnWidth(190.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                    children: [
                      TableRow(children: [
                        const Column(children: [
                          Text('Phoneno', style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text(widget.phoneno,
                              style: const TextStyle(fontSize: 20.0))
                        ]),
                      ]),
                      TableRow(children: [
                        const Column(children: [
                          Text('Website', style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text(widget.website,
                              style: const TextStyle(fontSize: 20.0))
                        ]),
                      ]),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Company Details",
                style: GoogleFonts.robotoSlab(
                    color: Colors.black45, fontSize: 30.0),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Table(
                  defaultColumnWidth: const FixedColumnWidth(190.0),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                      const Column(children: [
                        Text('Name', style: TextStyle(fontSize: 20.0))
                      ]),
                      Column(children: [
                        Text(widget.name,
                            style: const TextStyle(fontSize: 20.0))
                      ]),
                    ]),
                    TableRow(children: [
                      const Column(children: [
                        Text('catchPhrase', style: TextStyle(fontSize: 20.0))
                      ]),
                      Column(children: [
                        Text(widget.catchpharse,
                            style: const TextStyle(fontSize: 20.0))
                      ]),
                    ]),
                    TableRow(children: [
                      const Column(children: [
                        Text('Bs', style: TextStyle(fontSize: 20.0))
                      ]),
                      Column(children: [
                        Text(widget.bs, style: const TextStyle(fontSize: 20.0))
                      ]),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
