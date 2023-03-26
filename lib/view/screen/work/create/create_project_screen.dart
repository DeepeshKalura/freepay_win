import 'package:flutter/material.dart';

import '../../../../common/theme_common.dart';
import '../../../../common/widget_common.dart';

import '../../../../controller/firebase_controller.dart';
import '../../../../controller/project_controller.dart';
import '../../../../model/project_model.dart';

class CreateProjectPageScreen extends StatefulWidget {
  const CreateProjectPageScreen({Key? key}) : super(key: key);

  @override
  CreateProjectPageScreenState createState() => CreateProjectPageScreenState();
}

class CreateProjectPageScreenState extends State<CreateProjectPageScreen> {
  final FirebaseController _firebaseController = FirebaseController();
  TextEditingController titletextController = TextEditingController();
  TextEditingController nametextController = TextEditingController();
  TextEditingController imagetextController = TextEditingController();
  TextEditingController ammounttextController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ProjectController _projectController = ProjectController();
  var isLoading = false;

  @override
  void dispose() {
    super.dispose();
    titletextController.dispose();
    nametextController.dispose();
    imagetextController.dispose();
    ammounttextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: InkWell(
                onTap: () {
                  _firebaseController.signOut();
                },
                child: const Icon(
                  Icons.keyboard_arrow_left_outlined,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0,
            ),
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 135),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Text(
                                'Create Project',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: Text(
                                    'Upload File',
                                    style: TextStyle(
                                      fontFamily: 'NatoSansKhmer',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Text(
                                'Choose your file to upload',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0x96303030),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: Text(
                                    'Title',
                                    style: KimberTheme.bodyText1.override(
                                      fontFamily: 'NatoSansKhmer',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: TextFormField(
                                  controller: titletextController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'eg. Landing Page Design',
                                    hintStyle: KimberTheme.bodyText1.override(
                                      fontFamily: 'NatoSansKhmer',
                                      color: const Color(0x9A303030),
                                      useGoogleFonts: false,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x65757575),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x65757575),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  style: KimberTheme.bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: Text(
                                    'Name',
                                    style: KimberTheme.bodyText1.override(
                                      fontFamily: 'NatoSansKhmer',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: TextFormField(
                                  controller: nametextController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'eg. xyz company',
                                    hintStyle: KimberTheme.bodyText1.override(
                                      fontFamily: 'NatoSansKhmer',
                                      color: const Color(0x9A303030),
                                      useGoogleFonts: false,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x65757575),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x65757575),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  style: KimberTheme.bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: Text(
                                    'imageUrl',
                                    style: KimberTheme.bodyText1.override(
                                      fontFamily: 'NatoSansKhmer',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: TextFormField(
                                  controller: imagetextController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'eg. www.image.png',
                                    hintStyle: KimberTheme.bodyText1.override(
                                      fontFamily: 'NatoSansKhmer',
                                      color: const Color(0x9A303030),
                                      useGoogleFonts: false,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x65757575),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x65757575),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  style: KimberTheme.bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: Text(
                                    'Amount',
                                    style: KimberTheme.bodyText1.override(
                                      fontFamily: 'NatoSansKhmer',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: TextFormField(
                                  controller: ammounttextController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'eg. \$200-\$300',
                                    hintStyle: KimberTheme.bodyText1.override(
                                      fontFamily: 'NatoSansKhmer',
                                      color: const Color(0x9A303030),
                                      useGoogleFonts: false,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x65757575),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x65757575),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  style: KimberTheme.bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 1),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16, 0, 16, 16),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              isLoading = true;
                                              setState(() {});
                                              var project = ProjectModel(
                                                title: titletextController.text,
                                                imagePath:
                                                    imagetextController.text,
                                                name: nametextController.text,
                                                amount:
                                                    ammounttextController.text,
                                              );
                                              await _projectController
                                                  .addProject(project);
                                              titletextController.clear();
                                              imagetextController.clear();
                                              nametextController.clear();
                                              ammounttextController.clear();
                                            },
                                            text: 'Publish Project',
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 45,
                                              color: KimberTheme.primaryColor,
                                              textStyle: KimberTheme.subtitle2
                                                  .override(
                                                fontFamily: 'NatoSansKhmer',
                                                color: Colors.white,
                                                useGoogleFonts: false,
                                              ),
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 32),
                                        child: Text(
                                          'By Clicking The button you van upload your project and cheeck in feed',
                                          textAlign: TextAlign.center,
                                          style: KimberTheme.bodyText1.override(
                                            fontFamily: 'NatoSansKhmer',
                                            color: const Color(0xCF303030),
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
