import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/CameraScreen.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/AllAboutTextFieldAndIconsSendAndCamera.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/DateChat.dart';

import 'package:mediverse/Features/DoctorDashboard/widgets/MessagesListView.dart';

String textData = "";
int counterOfDateOfMessage = 0;

class ChatCoumn extends StatefulWidget {
  const ChatCoumn(
      {super.key,
      required ScrollController controller2,
      required this.textEditingcontroller,
      required this.messages,
      required this.doctorId,
      required this.patientId,
      required this.nowRole})
      : _scrollablecontroller = controller2;

  final ScrollController _scrollablecontroller;
  final TextEditingController textEditingcontroller;
  final CollectionReference<Object?> messages;
  final String doctorId;
  final String patientId;
  final String nowRole;

  @override
  State<ChatCoumn> createState() => _ChatCoumnState();
}

class _ChatCoumnState extends State<ChatCoumn> {
  @override
  void initState() {
    super.initState();
    // Call function to mark chat as read when screen is first initialized
    markChatAsRead();
  }

  String formatDateddmmyyyy(String timestampMsg) {
    int seconds = int.parse(timestampMsg.split(',')[0].split('=')[1]);
    int nanoseconds =
        int.parse(timestampMsg.split(',')[1].split('=')[1].replaceAll(')', ''));

    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(
        seconds * 1000000 + nanoseconds ~/ 1000);

    // Format the DateTime to 'dd/MM/yyyy' to use as a group key
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.messages
          .orderBy(kCreatedAt, descending: true)
          .where('doctor_id', isEqualTo: widget.doctorId)
          .where('patient_id', isEqualTo: widget.patientId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          List<String> dates = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            dates.add(formatDateddmmyyyy(
                snapshot.data!.docs[i].get('createdAt').toString()));
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          // var objList = dates.reversed;

          // // creating a new list with the object
          // dates = new List.from(objList);
          // var messageListIter = messagesList.reversed;

          // // creating a new list with the object
          // messagesList = new List<Message>.from(messageListIter);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // DateOfChat(
              //   dates: dates,
              // ),
              MessagesListView(
                doc_id: widget.doctorId,
                patient_id: widget.patientId,
                messagesList: messagesList,
                controller: widget._scrollablecontroller,
                dates: dates,
              ),
              AllAboutTextFieldAndIconsSendAndCamera(
                textEditingcontroller: widget.textEditingcontroller,
                messages: widget.messages,
                scrollablecontroller: widget._scrollablecontroller,
                onPressedCameraIcon: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraScreen(
                        patient_id: widget.patientId,
                        doc_id: widget.doctorId,
                      ),
                    ),
                  );
                },
                patient_id: widget.patientId,
                doctor_id: widget.doctorId,
              ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return const Center(
          child: Text("No chats in Here"),
        );
      },
    );
  }

  Future<void> markChatAsRead() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('ChatHistory')
          .where('doctor_id', isEqualTo: widget.doctorId)
          .where('patient_id', isEqualTo: widget.patientId)
          .where('latestSender', isNotEqualTo: widget.nowRole)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Update the first document found (assuming there's only one match)
        var documentId = querySnapshot.docs[0].id;
        await FirebaseFirestore.instance
            .collection('ChatHistory')
            .doc(documentId)
            .update({'isRead': true});
      }
    } catch (e) {
      log('Error marking chat as read: $e');
      // Handle error as needed
    }
  }
}
