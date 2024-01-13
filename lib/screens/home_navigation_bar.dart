import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:queuing_management_system/screens/profile.dart';
import '../datasource/flutter_flow_theme.dart';
import '../datasource/utils.dart';
import 'home.dart';



class HomeNavigationBar extends StatefulWidget {
  // const HomeNavigationBar({Key? key}) : super(key: key);
  const HomeNavigationBar({
    Key? key,
    this.notificationMessage,
    this.notificationTitle,
    this.notificationData
  }) : super(key: key);

  final notificationMessage;
  final notificationTitle;
  final notificationData;



  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {

  var notificatonMessage, notificationTitle, notificationData;
  int _curIndex = 1;
  var _lang = "";







  _logOut() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(

        onWillPop: () async{
          return false;
        },
        child: Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: new Center(
              child: _getWidget(),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
              child: Container(
                decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _curIndex == 0?SpeedDial(
                        icon: (Icons.list),
                        elevation: 0,
                        foregroundColor: FlutterFlowTheme.of(context).buttonColor,
                        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                        onPress: () {
                          _curIndex = 0;
                          setState(() {});
                        },
                      ):
                      SpeedDial(
                        icon: (Icons.list),
                        elevation: 0,
                        foregroundColor: FlutterFlowTheme.of(context).hintColor,
                        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                        onPress: () {
                          print("I have been clicked");
                          _curIndex = 0;
                          setState(() {});
                        },
                      ),
                      _curIndex == 1?SpeedDial(
                        icon: (Icons.home),
                        foregroundColor: FlutterFlowTheme.of(context).buttonColor,
                        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0,
                        onPress: () {
                          _curIndex = 1;
                          setState(() {});
                        },
                      ):
                      SpeedDial(
                        icon: (Icons.home),
                        elevation: 0,
                        foregroundColor: FlutterFlowTheme.of(context).hintColor,
                        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                        onPress: () {
                          _curIndex = 1;
                          setState(() {});
                        },
                      ),
                      _curIndex == 2?SpeedDial(
                        icon: (Icons.person_pin),
                        foregroundColor: FlutterFlowTheme.of(context).buttonColor,
                        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0,
                        onPress: () {
                          _curIndex = 2;
                          setState(() {});
                        },
                      ):
                      SpeedDial(
                        icon: (Icons.person_pin),
                        foregroundColor: FlutterFlowTheme.of(context).hintColor,
                        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0,
                        onPress: () {
                          _curIndex = 2;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ))
    );
  }

  Widget _getWidget() {
    switch (_curIndex) {
      case 0:
        return ProfileScreen();
      case 1:
        // return QRViewExample();
        return HomeScreen();
      default:
        return ProfileScreen();
    }
  }
}
