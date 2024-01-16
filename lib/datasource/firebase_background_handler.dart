import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../screens/home_navigation_bar.dart';
import 'flutter_flow_theme.dart';
import 'language.dart';
import 'utils.dart';

class FirebaseMessagingService{
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static bool isDialogOpen = false;
  static bool onInitialOpen = false;




  //request notificaton permission
  static Future<void> init(BuildContext context, bool onInitialCall) async {
    // static Future init(  bool onInitialCall)async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    displayingLoginDialog(bool dissmisable, RemoteMessage message,  Function onClick, Function onCancel, okText, cancelText ) {
      // String LoginSwahili =""
      // String LoginEnglish = ""


      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        // title: message.notification?.title,
        // desc: message.notification?.body,
        body: Center(
            child:Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child:Column(

                  children: [
                    Text(
                      "${message.notification?.title}",
                      style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.of(context).titleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Text(
                      "${message.notification?.body}",
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.of(context).titleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                )
            )
        ),


        btnOkOnPress: () async {
          print("Nothing here");
          SharedPreferences sharedPreferences = await SharedPreferences
              .getInstance();
          var urlApi = "https://app.smartefd.co.tz/api/app/login_by_phone";
          var loginPhone = sharedPreferences.getString("loginMobile");
          var password = sharedPreferences.getString("userPassword");
          var lang = sharedPreferences.getString("lang");
          print("I am loggin temporary");
          var logUser = await Utils.loginUser(
              loginPhone!, password!, lang!, urlApi);
          print(logUser);
          await Utils.setLoginDataShared(logUser, password);

          isDialogOpen = false;
          onInitialOpen = false;


          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  HomeNavigationBar(
                    onInitialOpen: onInitialOpen,
                  )));
        },
        btnCancelOnPress: () async {
          final SharedPreferences sharedPreferences = await SharedPreferences
              .getInstance();
          var id = sharedPreferences.getString("id");
          print(message.data['new_device_id']);
          var deviceId = message.data["new_device_id"];
          if (deviceId != null && id != null) {
            print("User id is $deviceId");
            //await Utils.logOut(id, deviceId);
          }

          isDialogOpen = false;
          onInitialOpen = false;

          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  HomeNavigationBar(
                    onInitialOpen: onInitialOpen,
                  )));
        },
        btnOkColor: Colors.orange,
        btnOkText: okText,
        btnCancelText: cancelText,
        btnCancelColor: FlutterFlowTheme
            .of(context)
            .shadowColor,
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,

      )
        ..show();



    }




    displayingInfoDialog(bool dissmisable, RemoteMessage message,  Function onClick, Function onCancel, okText, cancelText ){
      // String LoginSwahili =""
      // String LoginEnglish = ""

      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        // title: message.notification?.title,
        // desc: message.notification?.body,
        body: Center(
            child:Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child:Column(

                  children: [
                    Text(
                      "${message.notification?.title}",
                      style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.of(context).titleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Text(
                      "${message.notification?.body}",
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.of(context).titleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                )
            )
        ),

        btnOkOnPress: () {
          isDialogOpen = false;

        },
        btnOkColor: Colors.orange,
        btnOkText: okText,
        dismissOnBackKeyPress: true,
        dismissOnTouchOutside:true,

      )
        ..show();


    }

    onInfoOkClick(){

    }
    onInfoCancelClick(){

    }

    onLoginOKClick()async{
    }
    onLoginCancelClick(RemoteMessage message) async {
    }



    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {

      if (!isDialogOpen) {

        print("I am from opened app with id ${message.messageId}");

        isDialogOpen = true;

        if (message.data["notification_type"] == "info") {
          displayingInfoDialog(
              false, message, onInfoOkClick, onInfoCancelClick, "Sawa", null);
        } else if (message.data["notification_type"] == "login") {
          displayingLoginDialog(
              true, message, onLoginOKClick, onLoginCancelClick, "Nafahamu",
              "Sifahamu");
        } else {

        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {

      if (!isDialogOpen) {

        print("I am from the backgrounded app with id ${message.messageId}");

        isDialogOpen = true;

        if (message.data["notification_type"] == "info") {
          displayingInfoDialog(
              false, message, onInfoOkClick, onInfoCancelClick, "Sawa", null);
        } else if (message.data["notification_type"] == "login") {
          displayingLoginDialog(
              true, message, onLoginOKClick, onLoginCancelClick, "Nafahamu",
              "Sifahamu");
        } else {

        }
      }

    });

    FirebaseMessaging.instance.getInitialMessage().then((message) async {

      if(onInitialCall) {
        // onInitialOpen = true;

        if (message?.notification != null) {
          if (!isDialogOpen) {
            print("I am from terminated app with id ${message?.messageId}");
            isDialogOpen = true;


            if (message?.data["notification_type"] == "info") {
              displayingInfoDialog(
                  false, message!, onInfoOkClick, onInfoCancelClick, "Sawa",
                  null);
            } else if (message?.data["notification_type"] == "login") {
              displayingLoginDialog(
                  true, message!, onLoginOKClick, onLoginCancelClick,
                  "Nafahamu",
                  "Sifahamu");
            } else {

            }
          }
        }
      }else{
        print("From background, i was to appear but for now i cant");
      }
    });



    Future _firebaseBackgroundMessage(RemoteMessage message) async {
      if (message.notification != null) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Dialog Title',
          desc: 'Dialog description here.............',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        )
          ..show();

      }
    }

    // FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage as BackgroundMessageHandler);


  }


  static subscribeToTopic(String topic) {
    _firebaseMessaging.subscribeToTopic(topic);
    print("i have subscribed to topic" + topic);
  }

  static unsubscribeFromTopic(String topic) {
    _firebaseMessaging.unsubscribeFromTopic(topic);
  }

}


