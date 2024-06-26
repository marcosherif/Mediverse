import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/AllModels/requestModel.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Email_service.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/HospitalMangmentRequestCompleteWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/LabRequestAccountCompeleteWidget.dart';

class DoctorsRequestWidget extends StatelessWidget {
  const DoctorsRequestWidget({
    super.key,
    required Stream<QuerySnapshot<Object?>> doctorStream,
    required TextEditingController searchController,
  })  : _doctorStream = doctorStream,
        _searchController = searchController;

  final Stream<QuerySnapshot<Object?>> _doctorStream;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: _doctorStream,
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> doctorRequestsSnapshot) {
            if (doctorRequestsSnapshot.hasError) {
              log('${doctorRequestsSnapshot.error}');
              return Text('Error: ${doctorRequestsSnapshot.error}');
            }

            if (doctorRequestsSnapshot.connectionState ==
                ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            }

            var doctorsRequested = doctorRequestsSnapshot.data?.docs
                .map((doc) =>
                    RequestModel.fromJson(doc.data() as Map<String, dynamic>))
                .toList();
            if (_searchController.text.isNotEmpty) {
              doctorsRequested = doctorsRequested?.where((doctor) {
                final name = doctor.name?.toLowerCase();
                final searchValue = _searchController.text.toLowerCase();
                return name!.contains(searchValue);
              }).toList();
            }
            return Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: doctorsRequested?.length,
                itemBuilder: (context, i) {
                  return LabRequestAccountCompeleteWidget(
                    requestModel: doctorsRequested![i],
                    onPressedAccept: () async {
                      String requestId =
                          doctorRequestsSnapshot.data!.docs[i].id;

                      FirebaseFirestore.instance
                          .collection('info_Doctors')
                          .doc(requestId)
                          .update({
                        'Condition': 'Approved',
                        'Clinics': FieldValue.arrayUnion([
                          {
                            'cost': 0,
                            'name': doctorsRequested![i].orgName,
                            'type': doctorsRequested[i].orgType,
                          }
                        ]),
                      });
                      // Update the array in Firestore using arrayUnion
                      await FirebaseFirestore.instance
                          .collection('Staff')
                          .doc(globalcurrentUserId)
                          .update({
                        'Jobs': FieldValue.arrayUnion([requestId]),
                      });
                      FirebaseFirestore.instance
                          .collection('Form_Requests_Info')
                          .doc(requestId)
                          .delete();

                      EmailService().sendEmail(context, acceptanceMailAddDoctor,
                          'Request Acceptance', 'rinosamyramy@gmail.com');
                    },
                    onPressedDecline: () async {
                      String requestId =
                          doctorRequestsSnapshot.data!.docs[i].id;

                      FirebaseFirestore.instance
                          .collection('info_Doctors')
                          .doc(requestId)
                          .update({
                        'Condition': 'Declined',
                      });
                      EmailService().sendEmail(context, rejectionMail,
                          'Request Rejection', 'rinosamyramy@gmail.com');
                    },
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
