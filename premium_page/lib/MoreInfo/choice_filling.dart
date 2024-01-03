import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premium_page/MoreInfo/extra_services.dart';

import 'form_filling.dart';

class ChoiceFilling extends StatelessWidget {
  const ChoiceFilling({super.key});

  @override
  Widget build(BuildContext context) {
    return ExtraServices(
      serviceName: "Request Choice Filling",
      serviceIcon: Icons.edit_attributes_rounded,
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
                          "Choice Filling",
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
