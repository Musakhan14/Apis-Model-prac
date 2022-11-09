// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, use_build_context_synchronously, unused_field

import 'package:asifpractice/sharedpreferences/home_screen.dart';
import 'package:asifpractice/sharedpreferences/student_screen.dart';
import 'package:asifpractice/sharedpreferences/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // FocusNode searchFocusNode = FocusNode();
  // FocusNode textFieldFocusNode = FocusNode();
  // late SingleValueDropDownController? _cnt;
  // late MultiValueDropDownController? _cntMulti;

  // @override
  // void initState() {
  // _cnt = SingleValueDropDownController();
  // // _cntMulti = MultiValueDropDownController();
  // super.initState();
  // }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  // final typeController = SingleValueDropDownController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('Sign up'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    enabled: true,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  decoration: InputDecoration(
                    hintText: 'Age',
                    enabled: true,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    enabled: true,
                  ),
                ),
                SizedBox(height: 20),
                // DropDownTextField(
                //   singleController: typeController,
                //   clearOption: false,
                //   enableSearch: true,
                //   validator: (value) {
                //     if (value == null) {
                //       return "Required field";
                //     } else {
                //       return null;
                //     }
                //   },
                //   dropDownItemCount: 2,
                //   dropDownList: const [
                //     DropDownValueModel(
                //       name: 'Student',
                //       value: "student",
                //     ),
                //     DropDownValueModel(
                //       name: 'Teacher',
                //       value: "teacher",
                //     ),
                //   ],
                //   onChanged: (userType) {
                //     if (userType == 'student') {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => StudentScreen()));
                //     } else if (userType == 'teacher') {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => TeacherScreen()));
                //     } else {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => HomeScreen()));
                //     }
                //   },
                // ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString('email', emailController.text.toString());
                    sp.setString('age', ageController.text.toString());
                    //user student teacher
                    sp.setBool('isLogin', true);

                    sp.setString('userType', 'student');

                    if ('userType' == 'student') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentScreen()));
                    } else if ('userType' == 'teacher') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeacherScreen()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }
                  },
                  // onTap: () async {
                  // SharedPreferences sp = await SharedPreferences.getInstance();
                  // sp.setString('name', 'musa');
                  // sp.setInt('age', 23);
                  // sp.setBool('isLogin', false);
                  // print(sp.getString('name'));
                  // print(sp.getInt('age').toString());
                  // print(sp.getBool('isLogin').toString());
                  // sp.remove('age');
                  // print(sp.getInt('age').toString());
                  // },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Center(child: Text('Login')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void add() {
  //   int x = 4;
  //   int y = 4;
  //   print(x + y);
  // }

  // Future<void> multiply() async {
  //   await Future.delayed(Duration(seconds: 5));
  //   int x = 4;
  //   int y = 4;
  //   print(x + y);
  // }
}
