import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';
import '../Appointment/BookingScreen.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({Key? key}) : super(key: key);

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  String dropdownValue = paymentMethods.first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kSecondryBackgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: kSecondryBackgroundColor,
                          width: 2,
                        ),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/booking.jpg',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      child: Text(
                                        'Booking Details',
                                        style: Themes.titleLarge.copyWith(
                                          fontFamily: 'Readex Pro',
                                          color: kprimaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date Chosen',
                          style: Themes.labelMedium.copyWith(
                            fontFamily: 'Readex Pro',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Sat, Oct 04 - 7:00pm',
                          style: Themes.labelLarge18,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Location',
                          style: Themes.labelMedium.copyWith(
                            fontFamily: 'Readex Pro',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Tiba Dental Care',
                          style: Themes.labelLarge18,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kSecondryBackgroundColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: kSecondryBackgroundColor,
                                width: 2,
                              ),
                            ),
                            alignment: const AlignmentDirectional(0, 0),
                            child: Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/Payment.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0, 0),
                                            child: Text(
                                              'Payment Details',
                                              style: Themes.titleLarge.copyWith(
                                                fontFamily: 'Readex Pro',
                                                color: kprimaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Amount',
                                style: Themes.labelMedium.copyWith(
                                  fontFamily: 'Readex Pro',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                '150.00 L.E',
                                style: Themes.labelLarge18,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Payment Method',
                                style: Themes.labelMedium.copyWith(
                                  fontFamily: 'Readex Pro',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded),
                                elevation: 16,
                                style:
                                    const TextStyle(color: kprimaryTextColor),
                                underline: Container(
                                  height: 2,
                                  color: kprimaryColor,
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: paymentMethods
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                          child: Divider(
                            thickness: 2,
                            color: kSecondryBackgroundColor,
                          ),
                        ),
                        Text(
                          'Notes',
                          style: Themes.bodyXLarge,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                          child: Text(
                            'To ensure smooth scheduling, it is important to note that doctor appointments must be modified, rescheduled, or canceled at least 24 hours before the scheduled time.',
                            style: Themes.labelMedium,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Please be aware that in the event of canceling a prepaid appointment, a cancellation fee of 50 L.E will be deducted.',
                            style: Themes.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kprimaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Confirm Booking',
                              style: Themes.titleLarge.copyWith(
                                color: Colors.white,
                                fontFamily: 'Readex Pro',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}