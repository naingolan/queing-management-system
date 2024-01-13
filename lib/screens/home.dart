import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../datasource/flutter_flow_theme.dart';
import '../datasource/language.dart';
import '../datasource/utils.dart';
import 'home_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,
  })
      : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {


  late AnimationController _animationController;
  late Animation _animation;
  var _lang = "";
  var userLang;
  var _name;
  late bool _isAdmin;
  bool? _isDemo;
  var invites, single, double, scanned;
  var eventName;


  receiveBackgroundMessage(RemoteMessage message) async {


    // var notificationTitle = message.notification?.title;
    // SharedPreferences sharedPreferences = await SharedPreferences
    //     .getInstance();
    // lang = sharedPreferences.getString("lang");
    // var deviceId = message.data['new_device_id'];
    // print(deviceId);
    // var notificationMessage = message?.notification?.body;

  }


_glowanimation(){
    _animationController = AnimationController(vsync:this,duration: Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    _animation =  Tween(begin: 1.0,end: 5.0).animate(_animationController)..addListener((){
      setState(() {
      });
    });
  }

  fetchRecent()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var apiUrl = await Utils.getBaseUrl();
    apiUrl += "login";
    print(apiUrl);
    var responseData = await Utils.loginUserNewOne(sharedPreferences.getString("username")!, sharedPreferences.getString("password")!, apiUrl);
    print(responseData);
    if(responseData['error']==false) Utils.setNewInviteDataShared(responseData);
  }
  _getLang() async {
    userLang = await Utils.getLanguage();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
    invites = json.decode(sharedPreferences.getString("invites")!);
    eventName = json.decode(sharedPreferences.getString("eventName")!);
    print(invites);
    single = invites.where((invite) => invite['cardType'] == 'single' || invite['cardType'] == 'Single').toList();
    double = invites.where((invite) => invite['cardType'] == 'double' || invite['cardType'] == 'Double').toList() ;
    scanned = invites.where((invite)=>invite['scanStatus'] == true).toList();
    // print(single.length);
      _lang = userLang;
      print(eventName);
    });
  }




  @override
  void initState(){
     this.fetchRecent();
    _glowanimation();
     super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return RelativeBuilder(
        builder: (context, height, width, sy, sx) {
          return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                centerTitle: false,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                  child: Row(
                    children:[
                  Image.asset(
                     "assets/images/ifm_white.png",
                         width:50,
                    height: 50,
                  ) ,

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Institute of Finance',
                        style: FlutterFlowTheme
                            .of(context)
                            .bodyText2
                            .override(
                          fontFamily: 'Inter',
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Management',
                        style: FlutterFlowTheme
                            .of(context)
                            .bodyText2
                            .override(
                          fontFamily: 'Inter',
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                  ]
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),

                        color: FlutterFlowTheme
                            .of(context).buttonColor,
                      ),
                      width: 85,
                      height: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {

                              },
                              child: Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              right: 4),
                                          child: Container(
                                              child: Icon(Icons.notifications_none, color:Color(0xFFFFFFFF)))
                                      )
                                    ],
                                  )))
                        ],
                      ),
                    ),
                  ),
                ],
                backgroundColor: FlutterFlowTheme.of(context).buttonColor,
                bottomOpacity: 0.0,
                elevation: 0.0,
                toolbarHeight: 50,
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(25, 25, 0, 0),
                              child: Text(
                                'Joined Queues',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).titleColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>HomeScreen()),
                          );

                        },


                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(25, 8, 25, 0),
                          child: Container(
                            // width: double.infinity,
                              padding: EdgeInsets.only(left:10, top:10, bottom:10, right:10),
                              width: screenWidth,
                              height:sy(250),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: FlutterFlowTheme.of(context).shadowColor,
                                    blurRadius: 1,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child:Column(
                                children: [
                                  Container(
                              // width: double.infinity,
                                    margin:EdgeInsets.symmetric(vertical:10),
                                      padding: EdgeInsets.only(left:10, right:10, top:10, bottom:10),
                              width: screenWidth,
                              // height:sy(50),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0XFFE4E7EB), // Set your desired border color here
                                  width: .5, // Set the border width
                                ),
                                boxShadow: [

                                  BoxShadow(
                                    color: FlutterFlowTheme.of(context).shadowColor,
                                    blurRadius: 0,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                  children:[
                                    Container(
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: FlutterFlowTheme.of(context).iconsBackgroundColor, // Set your desired color
                                      ),
                                      child: Icon(
                                          Icons.list,
                                          size: 32,
                                          color: FlutterFlowTheme.of(context).buttonColor
                                      ),
                                    ),

                                    SizedBox(
                                        width:15
                                    ),

                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text(
                                            'Meals and Accomodation',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                              fontFamily: 'Inter',
                                              color: Color(0xFF6B727F),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),

                                          Text(
                                            'Theatre B',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                              fontFamily: 'Inter',
                                              color: Color(0xFF6B727F),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ]


                                      )

                                    ),



                                  Center(
                                        child:Text(
                                            "14",
                                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context).buttonColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),

                                        )
                                      ),
                                    SizedBox(
                                        width:15
                                    ),


                                  ]
                              )

                          ),

                                  Container(
                                    // width: double.infinity,
                                      margin:EdgeInsets.symmetric(vertical:10),
                                      padding: EdgeInsets.only(left:10, right:10, top:10, bottom:10),
                                      width: screenWidth,
                                      // height:sy(50),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0XFFE4E7EB), // Set your desired border color here
                                          width: .5, // Set the border width
                                        ),
                                        boxShadow: [

                                          BoxShadow(
                                            color: FlutterFlowTheme.of(context).shadowColor,
                                            blurRadius: 0,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                          children:[
                                            Container(
                                              width: 48.0,
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: FlutterFlowTheme.of(context).iconsBackgroundColor, // Set your desired color
                                              ),
                                              child: Icon(
                                                  Icons.list,
                                                  size: 32,
                                                  color: FlutterFlowTheme.of(context).buttonColor
                                              ),
                                            ),

                                            SizedBox(
                                                width:15
                                            ),

                                            Expanded(
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      Text(
                                                        'School Fees Refund',
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                          fontFamily: 'Inter',
                                                          color: Color(0xFF6B727F),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),

                                                      Text(
                                                        'Admission Block - D8',
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                          fontFamily: 'Inter',
                                                          color: Color(0xFF6B727F),
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w300,
                                                        ),
                                                      ),


                                                    ]


                                                )

                                            ),
                                            Center(
                                                child:Text(
                                                  "5",
                                                  style: FlutterFlowTheme.of(context).bodyText2.override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(context).buttonColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),

                                                )
                                            ),
                                            SizedBox(
                                                width:15
                                            ),
                                          ]
                                      )

                                  ),

                                  Container(
                                    // width: double.infinity,
                                      margin:EdgeInsets.symmetric(vertical:10),
                                      padding: EdgeInsets.only(left:10, right:10, top:10, bottom:10),
                                      width: screenWidth,
                                      // height:sy(50),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0XFFE4E7EB), // Set your desired border color here
                                          width: .5, // Set the border width
                                        ),
                                        boxShadow: [

                                          BoxShadow(
                                            color: FlutterFlowTheme.of(context).shadowColor,
                                            blurRadius: 0,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                          children:[
                                            Container(
                                              width: 48.0,
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: FlutterFlowTheme.of(context).iconsBackgroundColor, // Set your desired color
                                              ),
                                              child: Icon(
                                                  Icons.list,
                                                  size: 32,
                                                  color: FlutterFlowTheme.of(context).buttonColor
                                              ),
                                            ),

                                            SizedBox(
                                                width:15
                                            ),

                                            Expanded(
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      Text(
                                                        'Meals and Accomodation',
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                          fontFamily: 'Inter',
                                                          color: Color(0xFF6B727F),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),

                                                      Text(
                                                        'Theatre B',
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                          fontFamily: 'Inter',
                                                          color: Color(0xFF6B727F),
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w300,
                                                        ),
                                                      ),
                                                    ]


                                                )

                                            ),

                                            Center(
                                                child:Text(
                                                  "3",
                                                  style: FlutterFlowTheme.of(context).bodyText2.override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(context).buttonColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),

                                                )
                                            ),
                                            SizedBox(
                                                width:15
                                            ),
                                          ]
                                      )

                                  ),


                                  Container(
                                    width: double?.infinity,
                                  child:
                                  ElevatedButton(
                                    child: Text(
                                      "Load More",
                                      style: FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    onPressed: (){},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: FlutterFlowTheme.of(context).buttonColor,
                                      foregroundColor:FlutterFlowTheme.of(context).buttonColor ,
                                      textStyle: FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context).buttonTextColor,
                                        fontSize: 21,
                                      ),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    ),
                                  ),
                                  ),
                                ],
                              )

                          ),
                        ),

                      ),

                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(25, 25, 0, 0),
                              child: Text(
                                'Ongoing Queues',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).titleColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>HomeScreen()),
                          );

                        },


                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(25, 8, 25, 0),
                          child: Container(
                            // width: double.infinity,
                              padding: EdgeInsets.only(left:10, top:10, bottom:10, right:10),
                              width: screenWidth,
                              height:sy(250),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: FlutterFlowTheme.of(context).shadowColor,
                                    blurRadius: 1,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child:Column(
                                children: [
                                  Container(
                                    // width: double.infinity,
                                      margin:EdgeInsets.symmetric(vertical:10),
                                      padding: EdgeInsets.only(left:10, right:10, top:10, bottom:10),
                                      width: screenWidth,
                                      // height:sy(50),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0XFFE4E7EB), // Set your desired border color here
                                          width: .5, // Set the border width
                                        ),
                                        boxShadow: [

                                          BoxShadow(
                                            color: FlutterFlowTheme.of(context).shadowColor,
                                            blurRadius: 0,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                          children:[
                                            Container(
                                              width: 48.0,
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: FlutterFlowTheme.of(context).iconsBackgroundColor, // Set your desired color
                                              ),
                                              child: Icon(
                                                  Icons.list,
                                                  size: 32,
                                                  color: FlutterFlowTheme.of(context).buttonColor
                                              ),
                                            ),

                                            SizedBox(
                                                width:15
                                            ),

                                            Expanded(
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      Text(
                                                        'Meals and Accomodation',
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                          fontFamily: 'Inter',
                                                          color: Color(0xFF6B727F),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),

                                                      Text(
                                                        'Theatre B',
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                          fontFamily: 'Inter',
                                                          color: Color(0xFF6B727F),
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w300,
                                                        ),
                                                      ),
                                                    ]


                                                )

                                            ),
                                          ]
                                      )

                                  ),

                                  Container(
                                    // width: double.infinity,
                                      margin:EdgeInsets.symmetric(vertical:10),
                                      padding: EdgeInsets.only(left:10, right:10, top:10, bottom:10),
                                      width: screenWidth,
                                      // height:sy(50),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0XFFE4E7EB), // Set your desired border color here
                                          width: .5, // Set the border width
                                        ),
                                        boxShadow: [

                                          BoxShadow(
                                            color: FlutterFlowTheme.of(context).shadowColor,
                                            blurRadius: 0,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                          children:[
                                            Container(
                                              width: 48.0,
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: FlutterFlowTheme.of(context).iconsBackgroundColor, // Set your desired color
                                              ),
                                              child: Icon(
                                                  Icons.list,
                                                  size: 32,
                                                  color: FlutterFlowTheme.of(context).buttonColor
                                              ),
                                            ),

                                            SizedBox(
                                                width:15
                                            ),

                                            Expanded(
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      Text(
                                                        'School Fees Refund',
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                          fontFamily: 'Inter',
                                                          color: Color(0xFF6B727F),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),

                                                      Text(
                                                        'Admission Block - D8',
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                          fontFamily: 'Inter',
                                                          color: Color(0xFF6B727F),
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w300,
                                                        ),
                                                      ),
                                                    ]


                                                )

                                            ),
                                          ]
                                      )

                                  ),

                                  Container(
                                    // width: double.infinity,
                                      margin:EdgeInsets.symmetric(vertical:10),
                                      padding: EdgeInsets.only(left:10, right:10, top:10, bottom:10),
                                      width: screenWidth,
                                      // height:sy(50),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0XFFE4E7EB), // Set your desired border color here
                                          width: .5, // Set the border width
                                        ),
                                        boxShadow: [

                                          BoxShadow(
                                            color: FlutterFlowTheme.of(context).shadowColor,
                                            blurRadius: 0,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                          children:[
                                            Container(
                                              width: 48.0,
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: FlutterFlowTheme.of(context).iconsBackgroundColor, // Set your desired color
                                              ),
                                              child: Icon(
                                                  Icons.list,
                                                  size: 32,
                                                  color: FlutterFlowTheme.of(context).buttonColor
                                              ),
                                            ),

                                            SizedBox(
                                                width:15
                                            ),

                                            Expanded(
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      Text(
                                                        'Meals and Accomodation',
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                          fontFamily: 'Inter',
                                                          color: Color(0xFF6B727F),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),

                                                      Text(
                                                        'Theatre B',
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                          fontFamily: 'Inter',
                                                          color: Color(0xFF6B727F),
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w300,
                                                        ),
                                                      ),
                                                    ]


                                                )

                                            ),
                                          ]
                                      )

                                  ),


                                  Container(
                                    width: double?.infinity,
                                    child:
                                    ElevatedButton(
                                      child: Text(
                                        "Load More",
                                        style: FlutterFlowTheme.of(context).title2.override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: FlutterFlowTheme.of(context).buttonColor,
                                        foregroundColor:FlutterFlowTheme.of(context).buttonColor ,
                                        textStyle: FlutterFlowTheme.of(context).title1.override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context).buttonTextColor,
                                          fontSize: 21,
                                        ),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              )

                          ),
                        ),

                      ),



                    ]),
                  )));
        });}

}