import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/AllModels/requestModel.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/HospitalMangmentRequestWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/LabAccountRequest.dart';

class HospitalMangmentRequestCompleteWidget extends StatelessWidget {
  const HospitalMangmentRequestCompleteWidget({
    super.key,
    required this.doctor,
    required this.onPressedAccept,
    required this.onPressedDecline,
  });
  final Doctor doctor;
  final void Function() onPressedAccept;
  final void Function() onPressedDecline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Material(
        color: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 370,
          height: 300,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: const AlignmentDirectional(0, 0),
          child: HospitalMangmentRequestWidget(
            doctorModel: doctor,
            onPressedAccept: onPressedAccept,
            onPressedDecline: onPressedDecline,
          ),
        ),
      ),
    );
  }
}
