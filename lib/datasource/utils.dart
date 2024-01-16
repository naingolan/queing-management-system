import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Utils {


  static colorReturn(){
    // Color transparent = image.Color(0x00000000);
    // return transparent;
  }
  static void showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.orange,
        textColor: Colors.black87,
        fontSize: 14.0);
  }


  static String getTime(){
    DateTime dateTime = DateTime.now();
    String documentName = dateTime.year.toString()+dateTime.month.toString()+dateTime.day.toString()+'-'+dateTime.hour.toString()+''+dateTime.minute.toString()+''+dateTime.second.toString();
    return documentName;
  }

  static  showSnackBar(context, msg) {

    FToast fToast = FToast();
    fToast.init(context);


    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.clear),
          SizedBox(
            width: 12.0,
          ),
          Text(msg),
        ],
      ),
    );


    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            bottom: 16.0,
             left:  MediaQuery.of(context).size.width *0.2,
          );
        });

  }



  static bool validPhone(phone) {
    if (phone != "") {
      bool phoneValid = RegExp(r"^([0]{1}[0-9]{3}[0-9]{6})$").hasMatch(phone);
      return phoneValid;
    } else {
      return true;
    }
  }

  static Future<String> getLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var lang = sharedPreferences.getString("lang");
    var defaultLang = "SW";
    var language = "";
    if (lang == null) {
      language = defaultLang;
    } else {
      language = lang;
    }
    return language;
  }

  static getBaseUrl() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var demoEnv = sharedPreferences.getBool("demoEnv");
    var baseUrl = "";
    if (demoEnv == true) {
      baseUrl = "http://192.168.100.23/";
    } else {
      baseUrl = 'http://192.168.100.23/';
    }
    return baseUrl;
  }



  static getTestEnv() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var demoEnv = sharedPreferences.getBool("demoEnv");
    var testEnv = false;
    if (demoEnv == true) {
      testEnv = true;
    }
    return testEnv;
  }

  static getVerifyUrl() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var demoEnv = sharedPreferences.getBool("demoEnv");
    var verifyURL = "";
    if (demoEnv == true) {
      verifyURL = "https://virtual.tra.go.tz/efdmsRctVerify";
    } else {
      verifyURL = "https://verify.tra.go.tz";
    }
    return verifyURL;
  }


  static setLoginDataShared(responseData, password) async {
    print(responseData['data']);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("queues",jsonEncode(responseData["data"]));
  }

  static setNewInviteDataShared(responseData)async{
    print(responseData['data']);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("invites",jsonEncode(responseData["data"]));
  }


  static loginUser(
      String username, String password, String lang,  loginUrl) async {
    http.Response response = await http.post(Uri.parse(loginUrl),
        body: {"email": username, "password": password, "lang": lang, });
    var responseData = json.decode(response.body);
    return responseData;
  }

  static loginUserNewOne(
      String username, String password, String loginUrl)async{
    http.Response response = await http.post(Uri.parse(loginUrl),
        body: {"email": username, "password": password});
    var responseData = json.decode(response.body);
    return responseData;
  }

  static addInvite(
      String firstName, String lastName, phoneNumber, cardType, cardString,eventName, invitingUrl)async{
    http.Response response = await http.post(Uri.parse(invitingUrl),
        body: {
              "firstName": firstName, "lastName": lastName, "phoneNumber":phoneNumber, "cardType":cardType, "cardString":cardString, "eventName":eventName});
    var responseData = json.decode(response.body);
    print(responseData);
    return responseData;
    }

    static deleteInvite(
        String inviteeCardString, apiUrl
        )async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    var eventName = jsonDecode(sharedPreferences.getString("eventName")!);
    http.Response response = await http.post(Uri.parse(apiUrl),
    body: {
      "cardString": inviteeCardString,
      "eventName": eventName,
    });
    var responseData = json.decode(response.body);
    print(responseData);
    await setNewInviteDataShared(responseData);
    return responseData;
    }

  static scanInvite(
      String scanString, String scanningUrl)async{
    http.Response response = await http.post(Uri.parse(scanningUrl),
      body:{
        "cardString": scanString
      });
    var responseData = json.decode(response.body);
    print(responseData);
    return responseData;
  }



  static logOut()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }



  static removeDevice(
      String deviceId,String id, String removalUrl)async{
    http.Response response = await http.post(Uri.parse(removalUrl),
        body: {"deviceId": deviceId, "id": id});
    var responseData = json.decode(response.body);
    print(responseData);
    return responseData;
  }

  static addDevice(
      String id, String AddingdeviceId, String AddingdeviceModel
      )async{
    var addDeviceApi = "https://app.smartefd.co.tz/api/app/add_device";
    http.Response response = await http.post(Uri.parse(addDeviceApi),
        body: {"id": id, "deviceId": AddingdeviceId, "device_model": AddingdeviceModel});
    var responseData = json.decode(response.body);
    return responseData;

  }



  static deviceInternetConnected() async {
    var net = await checkInternetConnection();
    return net;
  }


  Future<bool> isInternetAvailable() async {

    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile) {

      // Connected to mobile, check internet
      return await _isInternetWorking();

    } else if (connectivityResult == ConnectivityResult.wifi) {

      // Connected to wifi, check internet
      return await _isInternetWorking();

    } else {

      // Not connected to network
      return false;

    }

  }

  Future<bool> _isInternetWorking() async {

    try {
      final response = await http.get(Uri.parse('https://example.com/'));
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }

  }

  static Future checkInternetConnection() async {
    bool result = false;
    try {
      final list = await InternetAddress.lookup('google.com');
      print(list);
      if (list.isNotEmpty && list[0].rawAddress.isNotEmpty) {
        result = true;
        print('CONNECTED!');
      }
    } on SocketException catch (_) {
      print('NOT CONNECTED!');
      result = false;
    }

    return result;
  }


  static showDialogLoading(context) {
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


}
