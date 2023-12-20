import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Details.dart';

class InformationDetails extends StatefulWidget {
  var street;
  var suite;
  var city;
  var zipcode;
  var geo;
  var lat;
  var lng;
  var phone;
  var website;
  var name;
  var catchp;
  var bs;
  InformationDetails(
      {Key? key,
      required this.street,
      this.suite,
      this.city,
      this.zipcode,
      this.geo,
      this.lat,
      this.lng,
      this.phone,
      this.website,
      this.name,
      this.catchp,
      this.bs})
      : super(key: key);

  @override
  State<InformationDetails> createState() => _InformationDetailsState();
}

class _InformationDetailsState extends State<InformationDetails> {
  bool _ishow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Data"),
            centerTitle: true,
            backgroundColor: const Color(0xffb42c60)),
        backgroundColor: const Color(0xfff3e5eb),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xffd1a2c2)),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.black45,
                        size: 120,
                      ),
                      const Text(
                        "Address Details",
                        style: TextStyle(color: Colors.black45, fontSize: 20.0),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Street:",
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.black45, fontSize: 20.0),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Suite:",
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.black45, fontSize: 20.0),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "City:",
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.black45, fontSize: 20.0),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Zipcode:",
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.black45, fontSize: 20.0),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.street,
                                  style: const TextStyle(
                                      color: Colors.black45, fontSize: 20.0),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  widget.suite,
                                  style: const TextStyle(
                                      color: Colors.black45, fontSize: 20.0),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  widget.city,
                                  style: const TextStyle(
                                      color: Colors.black45, fontSize: 20.0),
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Text(
                                  widget.zipcode,
                                  style: const TextStyle(
                                      color: Colors.black45, fontSize: 20.0),
                                ),
                              ]),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 30,
                              width: 100,
                              decoration:
                                  const BoxDecoration(color: Color(0xffe16b93)),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _ishow = !_ishow;
                                    });
                                  },
                                  child: Center(
                                    child: Text(_ishow ? 'Geo' : 'Geo'),
                                  ))),
                          const SizedBox(
                            width: 100,
                          ),
                          Container(
                              height: 30,
                              width: 100,
                              decoration:
                                  const BoxDecoration(color: Color(0xffe16b93)),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                                  phoneno: widget.phone,
                                                  website: widget.website,
                                                  name: widget.name,
                                                  catchpharse: widget.catchp,
                                                  bs: widget.bs,
                                                )));
                                  },
                                  child: const Center(
                                    child: Text("More"),
                                  ))),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Visibility(
                          visible: _ishow,
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              children: [
                                Text(widget.lat,
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.white70)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(widget.lng,
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.white70)),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
