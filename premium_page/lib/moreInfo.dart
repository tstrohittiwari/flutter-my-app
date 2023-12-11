import 'package:flutter/material.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: SizedBox(
        width: 700,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
          color: Color.fromARGB(255, 255, 229, 107),
          elevation: 5,
          shadowColor: Color.fromARGB(124, 199, 197, 132),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: Card(
                    color: Color.fromARGB(128, 255, 255, 229),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(Icons.edit_note_rounded,size: 30,),
                          SizedBox(width: 20,),
                          Text("Request Form Filling",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: Card(
                    color: Color.fromARGB(128, 255, 255, 229),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.edit_attributes_rounded,size: 30,),
                          SizedBox(width: 20,),
                          Text("Choice Filling",style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: Card(
                    color: Color.fromARGB(128, 255, 255, 229),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.groups,size: 30,),
                          SizedBox(width: 20,),
                          Text("Upcoming meetings",style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: Card(
                    color: Color.fromARGB(128, 255, 255, 229),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month,size: 30,),
                          SizedBox(width: 20,),
                          Text("Key Dates",style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: Card(
                    color: Color.fromARGB(128, 255, 255, 229),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.account_circle,size: 30,),
                          SizedBox(width: 20,),
                          Text("Account Info",style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
