import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import 'package:mediverse/Features/Beginning/SignUpDoctor/presentation/Manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:mediverse/GlobalWidgets/CustomAlignText.dart';
import 'package:mediverse/GlobalWidgets/CustomSignUpLogin.dart';
import 'package:mediverse/GlobalWidgets/CustomTextFormField.dart';
import 'package:mediverse/GlobalWidgets/CustomTextFormField2.dart';
import 'package:mediverse/GlobalWidgets/CustomTextFormField3.dart';
import 'package:mediverse/GlobalWidgets/LogoContainer.dart';
import 'package:mediverse/GlobalWidgets/StartingCont.dart';
import 'package:mediverse/GlobalWidgets/titleText.dart';

class DoctorSignUpScreen extends StatefulWidget {
  const DoctorSignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DoctorSignUpScreen();
}

class _DoctorSignUpScreen extends State<DoctorSignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController natIDController = TextEditingController();
  final TextEditingController specialityController = TextEditingController();
  final TextEditingController locController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();
  final TextEditingController licNoController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  String? email;
  String? password;
  String? natId;
  String? speciality;
  String? hospital;
  String? licNo;
  String? phoneNum;
  String? location;
  String? name;
  String? age;
  String? orgType; //PUBLIC OR PRIVATE
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  List<String> dropdownItems = ["Please select...", 'Public', 'Private'];

  @override
  void initState() {
    orgType = dropdownItems[selectedIndex2];
    super.initState();
  }

  int selectedIndex = 0;
  int selectedIndex2 = 0;

  Widget build(BuildContext context) {
    return BlocConsumer<SignUpDocCubit, SignUpDocState>(
      listener: (context, state) {
        if (state is SignUpDocLoading) {
          isLoading = true;
        } else if (state is SignUpDocSuccess) {
          isLoading = false;
        } else if (state is SignUpDocFailure) {
          showSnackbar(context, state.errMsg);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
                // popUntilRoute(context, '/registerChoice');
              },
            ),
          ),
          body: Form(
            key: formKey,
            child: Stack(
              children: [
                startingCont(),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 88,
                          ),
                          Padding(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 70,
                                ),
                                LogoCont(),
                                titleText(text: "Doctor Sign Up"),
                                SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // AlignText(
                      //   text: "Choose Type Of Staff",
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      //   child: CustomTextFormField2(
                      //     selectedIndex: selectedIndex,
                      //     items: dropdownItems,
                      //     value: orgType,
                      //     onChanged: (newValue) {
                      //       setState(() {
                      //         selectedIndex = dropdownItems.indexOf(newValue!);
                      //         orgType = newValue;
                      //       });
                      //     },
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          text: "Name",
                          TextEditingController: nameController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          text: "Age",
                          TextEditingController: ageController,
                          // icon: Icon(
                          //   Icons.arrow_drop_down_sharp,
                          //   size: 30,
                          // ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          text: "Phone Number",
                          TextEditingController: phoneNumController,
                          // icon: Icon(
                          //   Icons.arrow_drop_down_sharp,
                          //   size: 30,
                          // ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          text: "National ID",
                          TextEditingController: natIDController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          text: "Specialty",
                          TextEditingController: specialityController,
                          // icon: Icon(
                          //   Icons.arrow_drop_down_sharp,
                          //   size: 30,
                          // ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          text: "Hospital Or Clinic Name",
                          TextEditingController: hospitalController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          TextEditingController: licNoController,
                          text: "License Number",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          TextEditingController: locController,
                          text: "Detailed Location",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          TextEditingController: emailController,
                          text: "Email",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: CustomTextFormField3(
                          text: "Password",
                          controller: passwordController,
                        ),
                      ),
                      CustomSignUpLogin(
                        text: "Sign Up",
                        onTap: () async {
                          email = emailController.text.trim();
                          password = passwordController.text.trim();
                          name = nameController.text.trim();
                          age = ageController.text.trim();
                          phoneNum = phoneNumController.text.trim();
                          natId = natIDController.text.trim();
                          licNo = licNoController.text.trim();
                          location = locController.text.trim();
                          hospital = hospitalController.text.trim();
                          speciality = specialityController.text.trim();
                          if (formKey.currentState!.validate()) {
                            // BlocProvider.of<SignUpDocCubit>(context)
                            //     .signUpDocUser(
                            //         email: email!, password: password!);

                            BlocProvider.of<SignUpDocCubit>(context)
                                .signUpInfoDoctor(
                              name: name!,
                              age: age!,
                              phoneNum: phoneNum!,
                              national_id: natId!,
                              hospital: hospital!,
                              licNo: licNo!,
                              speciality: speciality!,
                              orgType: "Hospital",
                              email: email!,
                              password: password!,
                              location: location!,
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
