import 'package:flutter/material.dart';
import 'package:premium_page/chat/groups_chat_list.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.studentName,
    required this.studentImage,
    required this.bgImage,
    required this.counsellingName,
    required this.studentMessage,
  });

  final String counsellingName;
  final String bgImage;
  final String studentImage;
  final String studentName;
  final String studentMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(255, 255, 229, 107),
      // semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // elevation: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      margin: EdgeInsets.all(10),

      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: Image.asset(
              bgImage,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  counsellingName,
                  style: TextStyle(fontSize: 50),
                ),
                GestureDetector(
                  onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                  );},
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(studentImage),
                                  radius: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      studentName,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 28, 22, 25),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      studentMessage,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 28, 22, 25),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("5",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
