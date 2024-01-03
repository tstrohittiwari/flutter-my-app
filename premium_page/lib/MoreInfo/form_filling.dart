import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premium_page/MoreInfo/extra_services.dart';

class FormFilling extends StatelessWidget {
  const FormFilling({super.key});

  @override
  Widget build(BuildContext context) {
    return ExtraServices(
      serviceName: "Request Form Filling",
      serviceIcon: Icons.edit_note_rounded,
      onTapHandler: CustomTapHandler(
            (BuildContext context) async {
          // Handle onTap logic here
          await showModalBottomSheet<void>(
            backgroundColor: Color.fromARGB(255, 255, 229, 107),
            elevation: 10,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 18,
            ),
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 500,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Text(
                          "Form Filling",
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Divider(color: Colors.brown,thickness: 2),
                        ),
                        FormFillingCard(formName: "JoSSA"),
                        FormFillingCard(formName: "UPTU"),
                        FormFillingCard(formName: "MPDTE"),
                        FormFillingCard(formName: "HSTES"),
                        FormFillingCard(formName: "MHTCET"),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class FormFillingCard extends StatelessWidget {
  const FormFillingCard({super.key, required this.formName});

  final String formName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.brown,
            width: 3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                formName,
                style: TextStyle(
                  color: Color.fromARGB(255, 52, 23, 6),
                  fontWeight: FontWeight.bold,
                  fontSize: 16

                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Apply",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 229, 107),
                  ),
                ),
                style: ButtonStyle(
                  side: MaterialStatePropertyAll(
                      BorderSide(color: Colors.white, width: 2)),
                  elevation: MaterialStatePropertyAll(5),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 80, 64, 47),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
