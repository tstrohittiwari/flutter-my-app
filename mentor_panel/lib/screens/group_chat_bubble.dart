import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class GroupChatBubble extends StatefulWidget {
  final String message;
  final String groupID;
  final bool isMine;

  const GroupChatBubble({Key? key,required this.message, required this.groupID, required this.isMine}) : super(key: key);

  @override
  State<GroupChatBubble> createState() => _GroupChatBubbleState();
}

class _GroupChatBubbleState extends State<GroupChatBubble> {


  Future<List<Map<String, dynamic>>> getMessages(String groupID) async {
    final response = await Supabase.instance.client.from('groupMessages').select('content').eq('groupID', groupID);

    return response;
  }


  @override
  Widget build(BuildContext context) {
//     // List<Widget> chatContents;
//     // // if(message == null){
//     // //   return Container();
//     // // }
//     // // else {
//     //    chatContents = [
//     //     const SizedBox(width: 12.0),
//     //     Flexible(
//     //       child: Container(
//     //         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//     //         decoration: BoxDecoration(
//     //           // color: message.isMine ? Colors.grey[600] : Colors.indigo[400],
//     //           borderRadius: BorderRadius.circular(8),
//     //         ),
//     //         child: Text(
//     //           message.content,
//     //           style: const TextStyle(color: Colors.white),
//     //         ),
//     //       ),
//     //     ),
//     //     const SizedBox(width: 12),
//     //     Text(message.createAt.toString(),
//     //         style: const TextStyle(color: Colors.grey, fontSize: 12.0)),
//     //     // MarkAsRead(message: message),
//     //     const SizedBox(width: 60),
//     //   ];



//
    return widget.message != null
        ?
    // StreamBuilder<List<Map<String, dynamic>>>(
    //   stream: getMessages(),
    //   builder: (context, snapshot) {
    Row(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
          child: Row(
            mainAxisAlignment:
            widget.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,

          ),
        ),


        const SizedBox(width: 12.0),
        Flexible(
          child: Container(

            padding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 12),

            // mainAxisAlignment:
            // widget.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,


            decoration: BoxDecoration(
              color: widget.isMine ? Colors.grey[600] : Colors.indigo[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(widget.message,
            style: const TextStyle(color: Colors.grey, fontSize: 12.0)),
        // MarkAsRead(message: message),
        const SizedBox(width: 60),
      ],
    )
    //   }
    // )
        : Container();



  }

// if (message.isMine) {
//   chatContents = chatContents.reversed.toList();
// }

// return Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
//   child: Row(
//     mainAxisAlignment:
//     message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
//     children: chatContents,
//   ),
// );
// }
}
