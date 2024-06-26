import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediverse/AllModels/Staff.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/StaffDashboard/LabStaffMainScreen/presentation/LabStaffMainScreen.dart';

import 'PatientCard.dart';

class ListViewPatient extends StatelessWidget {
  const ListViewPatient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Staff')
            .doc(globalcurrentUserId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: SpinKitSpinningCircle(
              color: kprimaryColor,
              size: 50,
            )); // Show a loading indicator while waiting for data
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } // Convert JSON data to StaffModel object
          if (snapshot.data == null) {
            return Center(
              child: Text("No Patient For Now"),
            );
          }
          StaffModel staff = StaffModel.fromJson(snapshot.data!.data()!);

          return ListView.builder(
            itemCount: staff.jobs.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  deleteElemetInArray(
                      'Staff', globalcurrentUserId, 'Jobs', staff.jobs[index]);
                },
                // Background when swiping to delete
                background: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: MedicalCard(
                  id: staff.jobs[index],
                ),
              );
            },
          );
        });
  }
}
