import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class description extends StatefulWidget {
  var id;
  var title;
  var body;
  description({Key? key, required this.id, this.title, this.body})
      : super(key: key);

  @override
  State<description> createState() => _descriptionState();
}

class _descriptionState extends State<description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Data"),
            centerTitle: true,
            backgroundColor: Colors.purple),
        backgroundColor: const Color(0xffeeb2ea),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Container(
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xffb585f3)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              border:
                                  Border.all(color: Colors.purple, width: 3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Center(
                                child: Text("Id:",
                                    style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0))),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                border:
                                    Border.all(color: Colors.purple, width: 3),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                              ),
                              child: Center(
                                  child: Text("${widget.id}",
                                      style: GoogleFonts.robotoSlab(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0))),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              border:
                                  Border.all(color: Colors.purple, width: 3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Center(
                                child: Text("Title:",
                                    style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0))),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                border:
                                    Border.all(color: Colors.purple, width: 3),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                              ),
                              child: Center(
                                  child: Text("${widget.title}",
                                      style: GoogleFonts.robotoSlab(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0))),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              border:
                                  Border.all(color: Colors.purple, width: 3),
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0)),
                            ),
                            child: Center(
                                child: Text("Des:",
                                    style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0))),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 180,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                border:
                                    Border.all(color: Colors.purple, width: 3),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                              ),
                              child: Center(
                                  child: Text("${widget.body}",
                                      style: GoogleFonts.robotoSlab(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0))),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
