import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_mangement_system/views/landing_page.dart';

import '../../models/student.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => AdminLogInSignUpState();
}

class AdminLogInSignUpState extends State<AdminHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController idNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = false;
  List<Student> studentData = [
    Student(
      name: "Aditya Kumar Singh",
      personalNumber: "0123456798",
      guardianNumber: "9876543210",
      isVeg: true,
      roomNo: "41",
    ),
    Student(
      name: "Md Asif Anasry",
      personalNumber: "0123456798",
      guardianNumber: "9876543210",
      isVeg: false,
      roomNo: "09",
    ),
    Student(
      name: "Souvik Mondal",
      personalNumber: "0123456798",
      guardianNumber: "9876543210",
      isVeg: false,
      roomNo: "-1",
    ),
    Student(
      name: "Dipanjan Dutta",
      personalNumber: "0123456798",
      guardianNumber: "9876543210",
      isVeg: true,
      roomNo: "39",
    ),
    Student(
      name: "Aditi Saha",
      personalNumber: "0123456798",
      guardianNumber: "9876543210",
      isVeg: false,
      roomNo: "-1",
    ),
    Student(
      name: "Slide 6",
      personalNumber: "0123456798",
      guardianNumber: "9876543210",
      isVeg: false,
      roomNo: "-1",
    ),
    Student(
      name: "Slide 7",
      personalNumber: "0123456798",
      guardianNumber: "9876543210",
      isVeg: false,
      roomNo: "-1",
    ),
    Student(
      name: "Slide 8",
      personalNumber: "0123456798",
      guardianNumber: "9876543210",
      isVeg: false,
      roomNo: "-1",
    )
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome Admin',
          style: GoogleFonts.outfit(
            color: Color(0xFF0F1113),
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: IconButton(
              icon: Icon(
                Icons.logout,
                color: Color(0xFF57636C),
                size: 24,
              ),
              onPressed: () async {
                Get.offAll(LandingPage());
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Purulia Government Engineering College',
                  style: GoogleFonts.outfit(
                    color: Color(0xFF57636C),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Old Boys Hostel',
                  style: GoogleFonts.outfit(
                    color: Color(0xFF57636C),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 7, 16, 2),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'VEG Students Present : ',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.outfit(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '2',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.outfit(
                    // fontFamily: 'Outfit',
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 2, 16, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'NON-VEG Students Present : ',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.outfit(
                    color: Color(0xFFFF0000),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '1',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.outfit(
                    // fontFamily: 'Outfit',
                    color: Color(0xFFFF0000),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: studentData.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return StudentCard(studentData[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget StudentCard(Student students) {
    String? name = students.name ?? "Error";
    bool? isVeg = students.isVeg ?? false;
    String? personalNumber = students.personalNumber ?? "Error";
    String? guardianNumber = students.guardianNumber ?? "Error";
    String? roomNo = students.roomNo ?? "Error";
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x411D2429),
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.outfit(
                          // fontFamily: 'Outfit',
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                            child: AutoSizeText(
                              'Personal No. -',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.outfit(
                                // fontFamily: 'Outfit',
                                color: Color(0xFF57636C),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                            child: AutoSizeText(
                              personalNumber,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.outfit(
                                // fontFamily: 'Outfit',
                                color: Color(0xFF57636C),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                            child: AutoSizeText(
                              'Guardian No. -',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.outfit(
                                // fontFamily: 'Outfit',
                                color: Color(0xFF57636C),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                            child: AutoSizeText(
                              guardianNumber,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.outfit(
                                // fontFamily: 'Outfit',
                                color: Color(0xFF57636C),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 16, 0, 4),
                      child: Text(
                        isVeg ? 'VEG' : "NON - VEG",
                        style: GoogleFonts.raleway(
                          // fontFamily: 'Raleway',
                          color: isVeg ? Colors.green : Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 4, 8),
                          child: Text(
                            'Room No. - ',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.outfit(
                              // fontFamily: 'Outfit',
                              color: Color(0xFF0F1113),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            roomNo,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}