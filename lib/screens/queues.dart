import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fswitch_nullsafety/fswitch_nullsafety.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../datasource/flutter_flow_theme.dart';
import '../datasource/language.dart';
import '../datasource/utils.dart';
import 'home.dart';
import 'home_navigation_bar.dart';

class QueuesScreen extends StatefulWidget {
  const QueuesScreen({Key? key,
  })
      : super(key: key);


  @override
  State<QueuesScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueuesScreen> with SingleTickerProviderStateMixin {

  late bool showResult;
  bool showSearch = true;
  bool showCross  = false;
  List<Map<String, dynamic>> filteredQueues = [];
   List<Map<String, dynamic>> queues = [
                   {'name': 'Meals and Accomodation', 'location': 'Canteen'},
                    {'name': 'Registration', 'location': 'Administration Block'},
     {'name': 'Meals and Accomodation', 'location': 'Canteen'},
     {'name': 'Registration', 'location': 'Administration Block'},
     {'name': 'Meals and Accomodation', 'location': 'Canteen'},
     {'name': 'Registration', 'location': 'Administration Block'},
     {'name': 'Meals and Accomodation', 'location': 'Canteen'},
     {'name': 'Registration', 'location': 'Administration Block'},
     {'name': 'Meals and Accomodation', 'location': 'Canteen'},
     {'name': 'Registration', 'location': 'Administration Block'},
   ];

  TextEditingController searchQueue = TextEditingController();
  late AnimationController _animationController;
  late Animation _animation;
  var _lang = "";
  var userLang;
  var _name;
  late bool _isAdmin;
  bool? _isDemo;
  var invites, single, double, scanned;
  var eventName;

   void performQueueSearch(String query) {
     if(query!=" ") {
       print(query);
       setState(() {
         showResult = true;
         showCross = true;
         showSearch = false;
       });

     // Use where() to filter the list based on the search query
     List<Map<String, dynamic>> filteredQueuesTemp = queues
         .where((queue) =>
         queue['name'].toLowerCase().contains(query.toLowerCase()) ||
         queue['location'].toLowerCase().contains(query.toLowerCase()))
         .toList();

     setState(() {
       showResult = true;
       // Assign the filtered list to a new list (you can use this list to display in your UI)
       filteredQueues = filteredQueuesTemp;
     });
   } else {
  setState(() {
  showResult = true;
  // If the query is empty, display the entire list
  filteredQueues = queues;
  });
  }



  }


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
    });
  }




  @override
  void initState(){
    this.fetchRecent();
    _glowanimation();
    super.initState();
    setState(() {
      showResult = false;
    });
    showResult = false;
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                             // width: MediaQuery.of(context).size.width ,
                            padding: EdgeInsets.only(top:10, left:10, bottom:0, right:10),
                        child:Row(
                          children: [
                            Stack(
                              children:[

                              Container(
                                width: (MediaQuery.of(context).size.width-25 ) ,
                                height:80,
                                padding: const EdgeInsets.all(10.0),
                                child:
                                TextField(
                                  onChanged: performQueueSearch,
                                  controller: searchQueue,
                                  obscureText: false,
                                  // keyboardType: ,
                                  decoration: InputDecoration(
                                    hintText: "Search Queue",
                                    hintStyle: TextStyle(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context).textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        )
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).shadowColor,
                                          width: 0,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        )
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: BorderRadius.all(
                                         Radius.circular(10.0),
                                        )
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                    contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                                Container(
                                    width: (MediaQuery.of(context).size.width - 45) ,
                                    alignment: Alignment.centerRight,
                                  padding:EdgeInsets.fromLTRB(80, 15, 0, 0),
                                child: (showCross==false)?
                                IconButton(
                                  icon:Icon(Icons.search),
                                  color: FlutterFlowTheme.of(context).buttonColor,
                                  onPressed: () {
                                    setState(() {
                                      showCross = !showCross;
                                      showResult = !showResult;
                                    });
                                  },
                                )
                                :
                                IconButton(
                                  icon:Icon(Icons.cancel_outlined),
                                  color: FlutterFlowTheme.of(context).buttonColor,
                                  onPressed: () {
                                    setState(() {
                                      showCross = !showCross;
                                      showResult = !showResult;
                                    });
                                  },
                                )

                                )
                                ]
                            ),



                          ],
                        )
                      ),
                           (showResult)?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              queues.isNotEmpty?Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 0,5),
                                child: Text(
                                  Language.lang(_lang, "summary"),
                                  // style: CustomText.subheadingStyleBold,
                                  textScaleFactor: 0.85,

                                ),
                              ):Container(),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 1.7,
                                child: Column(
                                  children: [
                                    filteredQueues.isNotEmpty?Expanded(
                                      child: ListView.builder(
                                        itemCount: filteredQueues.length,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final name = filteredQueues[index]['name'];
                                          final location = filteredQueues[index]['location'];

                                          return GestureDetector(
                                            onTap:(){
                                              // Navigator.push(
                                              //   context,
                                              //   // MaterialPageRoute(builder: (context) =>  PlayerSummary(
                                              //   //   statName: keyName,
                                              //   //   title: title,
                                              //   // )),
                                              // );
                                            },
                                            child: Container(
                                              // width: double.infinity,
                                                margin:EdgeInsets.only(left:10, right:10, top:0, bottom:10),
                                                padding: EdgeInsets.only(left:10, right:10, top:5, bottom:5),
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
                                                                  '$name',
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
                                                                  '$location',
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

                                            // child: Container(
                                            //   padding: const EdgeInsets.all(10),
                                            //   margin: const EdgeInsets.symmetric(vertical: 8),
                                            //   decoration: BoxDecoration(
                                            //     borderRadius: BorderRadius.circular(10),
                                            //     boxShadow: [
                                            //       BoxShadow(
                                            //         color: Colors.grey.withOpacity(0.2),
                                            //         spreadRadius: 1,
                                            //         blurRadius: 1,
                                            //         offset: Offset(0, 1),
                                            //       ),
                                            //     ],
                                            //   ),
                                            //   child: Row(
                                            //     crossAxisAlignment: CrossAxisAlignment.center,
                                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            //     children: [
                                            //       Column(
                                            //         children: [
                                            //           Column(
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Row(
                                            //                 children: [
                                            //                   Padding(
                                            //                     padding: const EdgeInsets.only(left: 8.0),
                                            //                     child: Column(
                                            //                       crossAxisAlignment: CrossAxisAlignment.start,
                                            //                       children: [
                                            //                         Padding(
                                            //                           padding: const EdgeInsets.only(top: 0,bottom: 5),
                                            //                           child: Text(
                                            //                             '',
                                            //                             // style: CustomText.subheadingStyleWhite,
                                            //                             textAlign: TextAlign.left,
                                            //                             textScaleFactor: 0.85,
                                            //                           ),
                                            //                         ),
                                            //                         Padding(
                                            //                           padding: const EdgeInsets.only(top: 0,bottom: 5),
                                            //                           child: Text(
                                            //                             '$name',
                                            //                             // style: CustomText.subheadingStyleWhite,
                                            //                             textAlign: TextAlign.left,
                                            //                             textScaleFactor: 0.85,
                                            //                           ),
                                            //                         ),
                                            //                       ],
                                            //                     ),
                                            //                   ),
                                            //                 ],
                                            //               ),
                                            //               Row(
                                            //                 mainAxisAlignment: MainAxisAlignment.start,
                                            //                 children: [
                                            //                   Container(
                                            //                     width: MediaQuery.of(context).size.width /10,
                                            //                     height: MediaQuery.of(context).size.width /10,
                                            //                   ),
                                            //                   Padding(
                                            //                     padding: const EdgeInsets.only(left: 8.0),
                                            //                     child: Container(
                                            //                       width:  MediaQuery.of(context).size.width/2.1,
                                            //                       height:  MediaQuery.of(context).size.width/12,
                                            //                       decoration: BoxDecoration(
                                            //                         color: Colors.white,
                                            //                         borderRadius: BorderRadius.circular(10),
                                            //                         boxShadow: [
                                            //                           BoxShadow(
                                            //                             // color: CustomColors.shadowColor2.withOpacity(0.15),
                                            //                             blurRadius: 10,
                                            //                             offset: const Offset(1, 1),
                                            //                             spreadRadius: 1,
                                            //                           ),
                                            //                         ],
                                            //                       ),
                                            //                       child:  Padding(
                                            //                         padding: const EdgeInsets.only(left: 15, right: 15),
                                            //                         child: Row(
                                            //                           children: [
                                            //                             Text(
                                            //                               '$location',
                                            //                               // style: CustomText.subheadingStyleBold,
                                            //                               textScaleFactor: 0.85,
                                            //                               textAlign: TextAlign.left,
                                            //                             ),
                                            //                           ],
                                            //                         ),
                                            //                       ),
                                            //                     ),
                                            //                   ),
                                            //                 ],
                                            //               )
                                            //             ],
                                            //           ),
                                            //         ],
                                            //       ),
                                            //       Row(
                                            //         children: [
                                            //           Stack(
                                            //             children: [
                                            //               Padding(
                                            //                 padding: const EdgeInsets.only(right: 20),
                                            //
                                            //               ),
                                            //
                                            //
                                            //             ],
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                          );
                                        },
                                      ),
                                    ):Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.width,
                                        child: Container()),
                                  ],
                                ),
                              ),
                            ],
                          )
                          :

                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                                child: Text(
                                  'Joined',
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
                                  borderRadius: BorderRadius.circular(10),
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

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(25, 25, 0, 0),
                                child: Text(
                                  'Ongoing',
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

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(25, 25, 0, 0),
                                child: Text(
                                  'History',
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
                ]),
                  )));
        });}

}