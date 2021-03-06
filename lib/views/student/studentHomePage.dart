import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_mangement_system/services/database.dart';
import 'package:hostel_mangement_system/utils/colors.dart';
import 'package:hostel_mangement_system/views/landing_page.dart';
import '../../models/student.dart';

class StudentHomePage extends StatefulWidget {
  final String jwtToken;

  const StudentHomePage({Key? key, required this.jwtToken}) : super(key: key);
  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  String? choiceChipsValue1;
  String? choiceChipsValue2;
  double ccheight = 120;
  bool isPresent = true;
  String name = "";
  String personalNumber = "";
  String guardianNumber = "";
  String roomNo = "";
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isVeg = false;
  String? studentId;
  String collegeName = "";
  bool isLoading = false;
  DataBaseMethods dataBaseMethods = DataBaseMethods();
  getStudentData() async {
    setState(() {
      isLoading = true;
    });
    final results = await dataBaseMethods.getStudentData(widget.jwtToken);
    name = results['name'];
    isVeg = results['foodPrefarence'] == "veg" ? true : false;
    isPresent = results['presentStatus'] == "present" ? true : false;
    personalNumber = results['personalNumber'];
    guardianNumber = results['guardianNumber'];
    roomNo = results['roomNo'].toString();
    collegeName = results['collegeName'];
    setState(() {
      isLoading = false;
    });
    // curStudent.isBlank
  }

  @override
  void initState() {
    getStudentData();
    // studentId = "Bearer " + widget.jwtToken;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          )
        : Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: backGroundColor,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FittedBox(
                    child: Text(
                      'Welcome\n' + name,
                      style: GoogleFonts.outfit(
                        color: Colors.black,
                        // fontSize: ,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Color(0xFF57636C),
                    size: 24,
                  ),
                  onPressed: () {
                    Get.offAll(LandingPage());
                  },
                ),
              ],
              centerTitle: false,
              elevation: 0,
            ),
            // backgroundColor: Color(0xFFF1F4F8),
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            collegeName,
                            style: GoogleFonts.outfit(
                              // fontFamily: 'Outfit',
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 8),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 2, 2, 12),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: ccheight * 2 + 9,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Color(0x34090F13),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 8, 12, 8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Room No.',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.outfit(
                                            // fontFamily: 'Outfit',
                                            color: Color(0xFF0F1113),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 0, 16),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                roomNo,
                                                style: GoogleFonts.outfit(
                                                  // fontFamily: 'Outfit',
                                                  color: Color.fromARGB(
                                                      255, 84, 98, 112),
                                                  fontSize: 82,
                                                  fontWeight: FontWeight.w500,
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
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.all(2),
                                child: Container(
                                  height: ccheight,
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x34090F13),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 8, 12, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ChoiceChip(
                                                  backgroundColor: Colors.white,
                                                  elevation: 6,
                                                  shadowColor: Colors.black,
                                                  selectedColor:
                                                      Color(0xFF323B45),
                                                  selected: isVeg,
                                                  onSelected: (bool value) {
                                                    setState(() {
                                                      isVeg = value;
                                                      dataBaseMethods
                                                          .changeFoodType(true,
                                                              widget.jwtToken);
                                                    });
                                                    print(widget.jwtToken);
                                                  },
                                                  label: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Text(
                                                      "Veg".toUpperCase(),
                                                      style: GoogleFonts.outfit(
                                                        // fontFamily: 'Outfit',
                                                        color: isVeg
                                                            ? Colors.white
                                                            : Color(0xFF323B45),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                ChoiceChip(
                                                  backgroundColor: Colors.white,
                                                  elevation: 6,
                                                  shadowColor: Colors.black,
                                                  selectedColor:
                                                      Color(0xFF323B45),
                                                  // disabledColor: ,
                                                  selected: !isVeg,
                                                  onSelected: (bool value) {
                                                    setState(() {
                                                      isVeg = !value;
                                                      dataBaseMethods
                                                          .changeFoodType(false,
                                                              widget.jwtToken);
                                                    });
                                                    print(widget.jwtToken);
                                                  },
                                                  label: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Text(
                                                      "Non-Veg".toUpperCase(),
                                                      style: GoogleFonts.outfit(
                                                        // fontFamily: 'Outfit',
                                                        color: !isVeg
                                                            ? Colors.white
                                                            : Color(0xFF323B45),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
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
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.all(2),
                                child: Container(
                                  height: ccheight,
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x34090F13),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 8, 12, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ChoiceChip(
                                                  backgroundColor: Colors.white,
                                                  elevation: 6,
                                                  shadowColor: Colors.black,
                                                  selectedColor:
                                                      Color(0xFF323B45),
                                                  selected: isPresent,
                                                  onSelected: (bool value) {
                                                    setState(() {
                                                      isPresent = value;
                                                      dataBaseMethods
                                                          .attendanceStatus(
                                                              true,
                                                              widget.jwtToken);
                                                    });
                                                  },
                                                  label: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Text(
                                                      "PRESENT",
                                                      style: GoogleFonts.outfit(
                                                        // fontFamily: 'Outfit',
                                                        color: !isPresent
                                                            ? Color(0xFF323B45)
                                                            : Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                ChoiceChip(
                                                  onSelected: (bool value) {
                                                    setState(() {
                                                      isPresent = !value;
                                                      dataBaseMethods
                                                          .attendanceStatus(
                                                              false,
                                                              widget.jwtToken);
                                                    });
                                                  },
                                                  backgroundColor: Colors.white,
                                                  elevation: 6,
                                                  shadowColor: Colors.black,
                                                  selectedColor:
                                                      Color(0xFF323B45),
                                                  // disabledColor: ,
                                                  selected: !isPresent,

                                                  label: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Text(
                                                      "ABSENT",
                                                      style: GoogleFonts.outfit(
                                                        // fontFamily: 'Outfit',
                                                        color: isPresent
                                                            ? Color(0xFF323B45)
                                                            : Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
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
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 2, 2, 12),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x34090F13),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 5, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: Text(
                                                  'Personal Phone No. - ',
                                                  style: GoogleFonts.outfit(
                                                    // fontFamily: 'Outfit',
                                                    color: Color(0xFF0F1113),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: Text(
                                                  personalNumber,
                                                  style: GoogleFonts.outfit(
                                                    // fontFamily: 'Outfit',
                                                    color: Color(0xFF0F1113),
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 2, 5, 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: Text(
                                                  'Guardian Phone No. - ',
                                                  style: GoogleFonts.outfit(
                                                    // fontFamily: 'Outfit',
                                                    color: Color(0xFF0F1113),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: Text(
                                                  guardianNumber,
                                                  style: GoogleFonts.outfit(
                                                    // fontFamily: 'Outfit',
                                                    color: Color(0xFF0F1113),
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w300,
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
