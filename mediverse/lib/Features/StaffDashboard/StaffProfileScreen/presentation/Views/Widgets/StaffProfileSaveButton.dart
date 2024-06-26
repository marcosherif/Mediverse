import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../Constants/constant.dart';

class StaffProfileSaveButton extends StatelessWidget {
  final text;
  final screen;
  const StaffProfileSaveButton({
    super.key,
    required this.text,
    required this.screen,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
              primaryColor,
              elevation: 3,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
            child: SizedBox(
              width: 230,
              height: 52,
              child: Center(
                child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          )),
    );
  }
}
