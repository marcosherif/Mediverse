import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediverse/AllModels/patient.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/data/repo/SignUp_repo.dart';

class SignUpInfoRepoImpl extends SignUpInfoRepo {
  CollectionReference details =
      FirebaseFirestore.instance.collection('info_Patients');
  CollectionReference patientProfile =
      FirebaseFirestore.instance.collection('Patient_Profile');

  @override
  signUpInfoPatient({required Patient patient}) async {
    await details.doc(patient.id).set({
      'Name': patient.Name,
      'Age': patient.Age,
      'Email': patient.Email,
      'Phone Number': patient.Phone,
      'NationalId': patient.National_id,
      'Bookings': [],
      'Doctor Notes': [],
      'Doctors': [],
      'Lab Results': [],
      'Medical Prescriptions': [],
      'Medical Records': [],
      'Profile Picture':
          "https://firebasestorage.googleapis.com/v0/b/mediverse-app.appspot.com/o/photos%2Fimages.png?alt=media&token=e8dc6906-f46c-4325-ac3d-cd9e7f348087",
    });
    await patientProfile.doc(patient.id).set({
      'Name': patient.Name,
      'Age': patient.Age,
      'Email': patient.Email,
      'Phone Number': patient.Phone,
      'NationalId': patient.National_id,
      'Profile Picture':
          "https://firebasestorage.googleapis.com/v0/b/mediverse-app.appspot.com/o/photos%2Fimages.png?alt=media&token=e8dc6906-f46c-4325-ac3d-cd9e7f348087",
    });
  }
}
