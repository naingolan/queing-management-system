import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queuing_management_system/screens/home_navigation_bar.dart';
import 'package:queuing_management_system/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../datasource/flutter_flow_theme.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool first_time = false;
  bool logged_in = false;

  _checkFirstUser() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var first_time_data = sharedPreferences.getBool('firstTime');
    var logged_in_data = sharedPreferences.getBool('logged_in');
    print(first_time_data);
    if (first_time_data == true || first_time_data == null) {
      setState(() {
        first_time = true;
        logged_in = false;
      });
    } else {
      if (logged_in_data == true) {
        setState(() {
          first_time = false;
          logged_in = true;
        });
      } else {
        setState(() {
          first_time = false;
          logged_in = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checkFirstUser();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 1);
    return new Timer(duration, route);
  }

  route() {

      Timer(
          Duration(seconds: 1),
              () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginScreen())));

      // if (logged_in == true) {
      //   Timer(
      //       Duration(seconds: 1),
      //           () => Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => HomeNavigationBar())));
      // } else {
      //   Timer(
      //       Duration(seconds: 1),
      //           () => Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => LoginScreen())));
      // }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: FlutterFlowTheme.of(context).buttonColor,
          width: MediaQuery.of(context).size.width,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: FlutterFlowTheme.isDarkMode(context)
                    ?Column(
                  children: [
                    Image.asset (
                      "assets/images/ifm_white_kiwango.png",
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'The Institute of Finance Managment',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Inter',
                          color: Color(0xFFFFFFFF),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ):
                Column(
                  children: [
                    Image.asset (
                      "assets/images/ifm_white_kiwango.png",
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitWidth,
                    ),
                    //  Text(
                    //   'The Institute of Finance Managment',
                    //   style: FlutterFlowTheme.of(context).bodyText2.override(
                    //     fontFamily: 'Inter',
                    //     color: Color(0xFFFFFFFF),
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
