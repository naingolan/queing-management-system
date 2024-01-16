import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../datasource/flutter_flow_theme.dart';
import '../datasource/language.dart';
import '../datasource/utils.dart';
import 'package:relative_scale/relative_scale.dart';

import 'home_navigation_bar.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/services.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smart_efd/datasource/utils.dart';
// import 'package:smart_efd/datasource/flutter_flow_theme.dart';
// import 'package:smart_efd/screens/home/home_navigation_bar.dart';
// import 'package:smart_efd/screens/login/forgot_password_screen.dart';
// import 'package:smart_efd/screens/signup/demo_widget.dart';
// import 'package:smart_efd/screens/signup/signup_screen.dart';
// import 'package:smart_efd/datasource/language.dart';
// import 'package:http/http.dart' as http;
// import 'package:geolocator/geolocator.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:smart_efd/screens/splash_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  late bool passwordVisibility;
  late AnimationController _animationController;
  late Animation _animation;
  var _loading = false;
  bool submitPressed = false;
  var _serverUrl = "";

  final scaffoldKey = GlobalKey<ScaffoldState>();


  _logOut() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }



  _animationFunction(){
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animationController.repeat(reverse: false);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)..addListener(() {
      setState(() {

      });
    });
  }

  isLoggedIn()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if(sharedPreferences.getString("password")!=null && sharedPreferences.getString("username")!=null){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeNavigationBar()));
    }

  }

  @override
  void initState() {
    super.initState();
    // isLoggedIn();
    passwordVisibility = false;
    _animationFunction();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _signInAction() async {
    var getServer = await Utils.getBaseUrl();
    setState(() {
      _serverUrl = getServer;
    });

    if (phoneController?.text == "") {
      Utils.showSnackBar(context,"Please enter your ID!" );
      submitPressed = false;
    } else if (passwordController?.text == "") {
      Utils.showSnackBar(context,"Please enter correct password!" );
      submitPressed = false;
    }
    else {
        if (mounted) {
          setState(() {
            _loading = true;
          });
        }
        _enableLoading(_loading);
        var baseUrl = Utils.getBaseUrl();
        var urlApi = "http://192.168.100.23:3000/login"; //get from constant
        print(urlApi);
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        try {
          var responseData = await Utils.loginUserNewOne(
              phoneController.text, passwordController.text,  urlApi);
          if (responseData['error'] == false) {
            print("I have returned");
            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            sharedPreferences.setString("username", phoneController.text);
            sharedPreferences.setString("password", passwordController.text);

            if (mounted) {
              setState(() {
                _loading = false;
              });
            }
            print("before shard");
            await Utils.setLoginDataShared(responseData, passwordController.text);
            print("after shared");
            _enableLoading(_loading);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeNavigationBar(
                    responseData :responseData
                )));
            submitPressed = false;
          }
          else {
            if (mounted) {
              setState(() {
                _loading = false;
              });
            }
            _enableLoading(_loading);
            Utils.showSnackBar(context,"Please enter correct credentials!" );
            submitPressed = false;
          }
        } catch (e) {
          submitPressed = false;
          if (mounted) {
            setState(() {
              _loading = false;
            });
          }
          _enableLoading(_loading);
          print("Login catched error: $e");

      }
    }
  }

  _checkInternetConnection() async {
    if (await Utils.deviceInternetConnected() == true) {
      if(submitPressed==false){
        submitPressed = true;
        _signInAction();
      }


    } else {
      Utils.showSnackBar(context,"Internet Connection Problem, please try agian letter" );
      submitPressed = false;
    }
  }

  showDialogLoading() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                Container(
                  child: CircularProgressIndicator(
                    color: Color(0xffE76F51),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text("Loading"),
                )
              ],
            ),
          );
        });
  }

  void _enableLoading(bool loadingValue) {
    if (loadingValue == true) {
      showDialogLoading();
    } else {
      Navigator.pop(context);
    }
  }




  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
        builder: (context, height, width, sy, sx) {
          return new WillPopScope(
              onWillPop: () async{
                return false;
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      child: FlutterFlowTheme.isDarkMode(context)
                                          ? Image.asset(
                                        'assets/images/ifm_og_2.png',
                                        width: 250,
                                        height: 250,
                                        fit: BoxFit.fitWidth,
                                      )
                                          : Image.asset(
                                        'assets/images/ifm_og_2.png',
                                        width: 250,
                                        height: 250,
                                        fit: BoxFit.fitWidth,
                                      ),
                                      borderRadius:BorderRadius.circular(20),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left:10, top:10, bottom:10, right:10),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  borderRadius: BorderRadius.circular(12),
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
                                  crossAxisAlignment:CrossAxisAlignment.center,
                                children:[
                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                    child: RadiantGradientMask(
                                          child: Text(
                                              'Sign In',
                                              style: new TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: FlutterFlowTheme.of(context).titleColor,
                                              ))),
                                  ),


                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                        child: Text(
                                            'Login to your account by providing valid credentials',
                                            style: new TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w400,
                                              color: FlutterFlowTheme.of(context).textColor,
                                            )),
                                  ),
                                  SizedBox(height:20),
                                  Container(
                                    padding: EdgeInsets.only(left:10),
                                    alignment: Alignment.topLeft,
                                    child: customLabelText(context, "Email/Reg Number"),

                                  ),
                                  Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        child: customTextField(
                                          context,
                                          controller: phoneController,
                                          hintText: 'IMC/BIT/202XXXX',
                                          inputType: TextInputType.text,
                                          obsureText: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                                  SizedBox(height:5),
                                  Container(
                                    padding: EdgeInsets.only(left:10),
                                    alignment: Alignment.topLeft,
                                    child: customLabelText(context, "Password"),

                                  ),                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: customPasswordField(
                                        context,
                                        controller: passwordController,
                                        hintText: '........',
                                        inputType: TextInputType.text,
                                        obsureText: !passwordVisibility,
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                                () => passwordVisibility =
                                            !passwordVisibility,
                                          ),
                                          focusNode: FocusNode(skipTraversal: true),
                                          child: Icon(
                                            passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .hintColor,
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                                SizedBox(height: 10,),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50,
                                        margin:EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),

                                          boxShadow: [BoxShadow(
                                              color: FlutterFlowTheme.of(context).buttonColor,
                                              // blurRadius: 1,
                                              // offset: const Offset(0, 1),
                                            ),
                                               ]
                                        ),
                                        child: TextButton(
                                            style: ButtonStyle(
                                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                                            ),
                                            onPressed: () {
                                              _checkInternetConnection();
                                              // Navigator.push(context,
                                              //     MaterialPageRoute(builder: (context) => HomeNavigationBar()));
                                            },
                                            child: Text(
                                              'Sign In',
                                              style: FlutterFlowTheme.of(context).title1.override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 21,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                  SizedBox(height:10),
                                  Container(
                                    padding: EdgeInsets.only(left:10),
                                    // alignment: Alignment.topLeft,
                                    child:Text(
                                        "Forgot your password?",
                                        style:TextStyle(
                                            color:FlutterFlowTheme.of(context).buttonColor,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Inter"
                                        )
                                    ),
                                  ),
                                ]
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));});
  }
}
