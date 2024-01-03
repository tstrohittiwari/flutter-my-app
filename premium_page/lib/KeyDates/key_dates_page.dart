import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyNewsPages extends StatelessWidget {
  const KeyNewsPages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 80, 64, 47),
              Color.fromARGB(255, 48, 39, 38),
              Color.fromARGB(255, 28, 22, 25),
              Color.fromARGB(255, 48, 39, 38),
            ],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent.withOpacity(0),
            appBar: AppBar(
              backgroundColor: Colors.transparent.withOpacity(0),
              title: Text(
                "College Mitra",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                  child: Text(
                    "Key Dates",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Color.fromARGB(255, 255, 229, 107),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              "Hstes last date - 24/2/2024",
                              style:
                                  GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                              child: Divider(),
                            ),
                            Text(
                              "Hstes last date - 24/2/2024",
                              style:
                              GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                              child: Divider(),
                            ),
                            Text(
                              "Hstes last date - 24/2/2024",
                              style:
                              GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                              child: Divider(),
                            ),
                            Text(
                              "Hstes last date - 24/2/2024",
                              style:
                              GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                              child: Divider(),
                            ),
                            Text(
                              "Hstes last date - 24/2/2024",
                              style:
                              GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                              child: Divider(),
                            ),
                            Text(
                              "Hstes last date - 24/2/2024",
                              style:
                              GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                              child: Divider(),
                            ),
                            Text(
                              "Hstes last date - 24/2/2024",
                              style:
                              GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                              child: Divider(),
                            ),
                            Text(
                              "Hstes last date - 24/2/2024",
                              style:
                              GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                  child: Text(
                    "Important News",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ),

                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Color.fromARGB(255, 255, 229, 107),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                "Jee mains results is out",
                                style:
                                GoogleFonts.lato(fontWeight: FontWeight.bold),
                              ),
                              Divider(),
                              Text(
                                "Jossa seat matrix is out for second round Jossa seat matrix is out for second round",
                                style:
                                GoogleFonts.lato(fontWeight: FontWeight.bold),
                              ),
                              Divider(),
                              Text(
                                "Jossa seat matrix is out for second round",
                                style:
                                GoogleFonts.lato(fontWeight: FontWeight.bold),
                              ),
                              Divider(),
                              Text(
                                "Hstes last date - 24/2/2024",
                                style:
                                GoogleFonts.lato(fontWeight: FontWeight.bold),
                              ),
                              Divider(),
                              Text(
                                "Jossa seat matrix is out for second round",
                                style:
                                GoogleFonts.lato(fontWeight: FontWeight.bold),
                              ),
                              Divider(),
                              Text(
                                "Jossa seat matrix is out for second round",
                                style:
                                GoogleFonts.lato(fontWeight: FontWeight.bold),
                              ),
                              Divider(),
                              Text(
                                "Jossa seat matrix is out for second round",
                                style:
                                GoogleFonts.lato(fontWeight: FontWeight.bold),
                              ),
                              Divider(),
                              Text(
                                "Jossa seat matrix is out for second round",
                                style:
                                GoogleFonts.lato(fontWeight: FontWeight.bold),
                              ),
                              Divider(),
                              Text(
                                "Jossa seat matrix is out for second round",
                                style:
                                GoogleFonts.lato(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
