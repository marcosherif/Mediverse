part of 'choose_details_cubit.dart';

@immutable
sealed class ChooseDetailsState {}

final class ChooseDetailsInitial extends ChooseDetailsState {}

final class ChooseDetailsUpdate extends ChooseDetailsState {
  final List<Widget> clinicsList;
  final List<bool> clinicListBool;
  final List<Widget> daysList;
  final List<bool> dayListBool;
  final List<Widget> timesList;
  final List<bool> timeListBool;

  ChooseDetailsUpdate(
    this.clinicsList,
    this.clinicListBool,
    this.daysList,
    this.dayListBool,
    this.timesList,
    this.timeListBool,
  );
}

final class ChooseDetailsReady extends ChooseDetailsState {
  final List<Widget> clinicsList;
  final List<bool> clinicListBool;
  final List<Widget> daysList;
  final List<bool> dayListBool;
  final List<Widget> timesList;
  final List<bool> timeListBool;
  final String selectedTime;
  final String selectedDate;
  final String selectedDay;
  final String selectedClinic;
  final String selectedClinicCost;
  final bool isBooked;

  ChooseDetailsReady(
    this.clinicsList,
    this.clinicListBool,
    this.daysList,
    this.dayListBool,
    this.timesList,
    this.timeListBool,
    this.selectedTime,
    this.selectedDate,
    this.selectedDay,
    this.selectedClinic,
    this.selectedClinicCost,
    this.isBooked,
  );
}

final class ChooseDetailsLoading extends ChooseDetailsState {}
