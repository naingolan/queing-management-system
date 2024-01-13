import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:relative_scale/relative_scale.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async => _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return  ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
//based on the error non-nullable should be initialised, i have added the late keyword before each declaration
  Color? buttonsColor;
  late Color secondaryColor;
  late Color hintColor;
  late Color textColor;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color titleColor;
  late Color shadowColor;
  late Color primaryBtnText;
  late Color buttonColor;
  late Color glowColor;
  late Color  buttonTextColor;
  late Color selectedItemColor;
  late Color labelsColor;
  late Color decoColor1;
  late Color decoColor2;
  late Color greenishColor;
  late Color orangishColor;
  late Color liteGreenishColor;
  late Color lightBackgroundish;
  late Color darkBackgroundish;
  late Color iconsColor;
  late Color iconsBackgroundColor;

  String get title1Family => typography.titleFamily;
  TextStyle get title1 => typography.title;
  String get title2Family => typography.titleFamily1;
  TextStyle get title2 => typography.title1;
  String get bodyText1Family => typography.bodyTitle;
  TextStyle get bodyText1 => typography.titleText;
  String get bodyText2Family => typography.bodyText;
  TextStyle get bodyText2 => typography.bodyText1;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  Color secondaryColor = const Color(0xFFEDEDED);
  Color hintColor =  const Color(0xFFAFB1B1);
  Color textColor = const Color(0xFF9CA3AF);
  Color primaryBackground = const Color(0xFFECF1F4);
  Color secondaryBackground = const Color(0xFFFFFFFF);
  Color titleColor = const Color(0xFF4B5563);
  Color shadowColor = const Color(0xFFB6B5B5);
  Color primaryBtnText = Color(0xFFFFFFFF);
  Color buttonColor = Color(0xFF2A579A);
  Color buttonTextColor = Color(0xFF1E223F);
  Color glowColor = Color(0xFF2A579A);
  Color selectedItemColor = Color(0xFF2A579A);
  Color labelsColor = Color(0xffd0d0cf);
  Color decoColor1 = Color(0xFFD3D3D3);
  Color decoColor2 = Color(0xFFA09D9D);
  Color iconsColor = Color(0xFF3A82F6);
  Color iconsBackgroundColor = Color(0xFFDBEAFE);
  Color appBarBackground = Color(0xFFFFFFFF);
  Color greenishColor = Color(0xFF1E7167);
  Color orangishColor = Color(0xFFE76F51);
  Color liteGreenishColor = Color(0xFF264653);

}

abstract class Typography {
  String get titleFamily;
  TextStyle get title;
  String get titleFamily1;
  TextStyle get title1;
  String get bodyTitle;
  TextStyle get titleText;
  String get bodyText;
  TextStyle get bodyText1;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get titleFamily => 'Ubuntu';
  TextStyle get title => GoogleFonts.getFont(
    'Ubuntu',
    color: theme.titleColor,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );
  String get titleFamily1 => 'Ubuntu';
  TextStyle get title1 => GoogleFonts.getFont(
    'Ubuntu',
    color: theme.titleColor,
    fontWeight: FontWeight.w600,
    fontSize: 21,
  );
  String get bodyTitle => 'Ubuntu';
  TextStyle get titleText => GoogleFonts.getFont(
    'Ubuntu',
    color: theme.titleColor,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  String get bodyText => 'Ubuntu';
  TextStyle get bodyText1 => GoogleFonts.getFont(
    'Ubuntu',
    color: theme.textColor,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
}

class DarkModeTheme extends FlutterFlowTheme {
  Color secondaryColor = const Color(0xFFEDEDED);
  Color hintColor =  const Color(0xFF7D7D7D);
  Color textColor = const Color(0xFF1E2238);
  Color primaryBackground = const Color(0xFF264653);
  Color secondaryBackground = const Color(0xFFF3F2F2);
  Color titleColor = const Color(0xFFFFFFFF);
  Color shadowColor = const Color(0xFF2A3D5C);
  Color buttonColor = Color(0xffE76F51);
  Color glowColor = Color(0xFFA7A7A7);
  Color buttonTextColor = Color(0xFF1E223F);
  Color selectedItemColor = Color(0xFF1E2238);
  Color labelsColor = Color(0xffd0d0cf);
  Color decoColor1 = Color(0xFF353D61);
  Color decoColor2 = Color(0xFF1B2242);
  Color iconsColor = Color(0xFF3A82F6);
  Color iconsBackgroundColor = Color(0xFFDBEAFE);

  Color greenishColor = Color(0xFF1E7167);
  Color orangishColor = Color(0xFFE76F51);
  Color liteGreenishColor = Color(0xFF264653);

}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
        fontFamily!,
        color: color ?? color,
        fontSize: fontSize ?? fontSize,
        letterSpacing: letterSpacing ?? letterSpacing,
        fontWeight: fontWeight ?? fontWeight,
        fontStyle: fontStyle ?? fontStyle,
        decoration: decoration,
        height: lineHeight,
      )
          : copyWith(
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        height: lineHeight,
      );
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.topLeft,
        radius: 0.5,
        colors: <Color>[Color(0xffE76F51), Color(0xffE76F51)],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}

Widget customLabelText(BuildContext context, labelText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Text(
      labelText,
      style: FlutterFlowTheme.of(context).title2.override(
        fontFamily: 'Ubuntu',
        color: FlutterFlowTheme.of(context).textColor,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget customTextField(BuildContext context,
    {obsureText = false, controller, inputType, hintText = '', decoration}) {
  return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: FlutterFlowTheme.of(context).shadowColor ,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: TextField(
                  controller: controller,
                  obscureText: obsureText,
                  keyboardType: inputType,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Ubuntu',
                      color: FlutterFlowTheme.of(context).hintColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Ubuntu',
                    color: FlutterFlowTheme.of(context).textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        );});
}



Widget customLabelField(BuildContext context,
    {obsureText = false, controller, readOnly, inputType, hintText = '', decoration, style}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: FlutterFlowTheme.of(context).shadowColor,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: obsureText,
            keyboardType: inputType,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontFamily: 'Ubuntu',
                color: Color(0xFF7D7D7D),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).labelsColor,
              contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            ),
            style: FlutterFlowTheme.of(context).bodyText2.override(
              fontFamily: 'Ubuntu',
              color: FlutterFlowTheme.of(context).textColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    ),
  );
}

Widget customTextField2(BuildContext context,
    {obsureText = false, controller, inputType, hintText = '', decoration}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: FlutterFlowTheme.of(context).shadowColor,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
          ),
          child: TextField(
            controller: controller,
            obscureText: obsureText,
            keyboardType: inputType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: 'Ubuntu',
                color: Color(0xFF7D7D7D),
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  )
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  )
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            ),
            style: FlutterFlowTheme.of(context).bodyText2.override(
              fontFamily: 'Ubuntu',
              color: FlutterFlowTheme.of(context).textColor,
              fontSize: 16,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    ),
  );
}



Widget customPasswordField(BuildContext context,
    {obsureText = false, controller, inputType, suffixIcon, hintText = '', decoration, }) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: FlutterFlowTheme.of(context).shadowColor,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: obsureText,
            keyboardType: inputType,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: 'Ubuntu',
                  color: Color(0xFF7D7D7D),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                suffixIcon: suffixIcon
            ),
            style: FlutterFlowTheme.of(context).bodyText2.override(
              fontFamily: 'Ubuntu',
              color: FlutterFlowTheme.of(context).textColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    ),
  );
}



Widget customButton(BuildContext context,
    {onPressed, child = '',  style}) {
  return Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: FlutterFlowTheme.of(context).shadowColor,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ElevatedButton(
        child: child,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: FlutterFlowTheme.of(context).buttonColor,
          textStyle: FlutterFlowTheme.of(context).title1.override(
            fontFamily: 'Ubuntu',
            color: FlutterFlowTheme.of(context).buttonTextColor,
            fontSize: 21,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    ),
  );
}



Widget customButton2(BuildContext context,
    {onPressed, text = ''}) {
  return Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: FlutterFlowTheme.of(context).shadowColor,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ElevatedButton(
        child: Text(
          text,
          style: FlutterFlowTheme.of(context).title2.override(
            fontFamily: 'Ubuntu',
            color: FlutterFlowTheme.of(context).textColor,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: FlutterFlowTheme.of(context).buttonsColor,
          textStyle: FlutterFlowTheme.of(context).title1.override(
            fontFamily: 'Ubuntu',
            color: FlutterFlowTheme.of(context).buttonTextColor,
            fontSize: 21,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    ),
  );
}


Widget customGrid(BuildContext context,
    {onPressed, child = '',  style}) {
  return Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Container(
      width: MediaQuery.of(context).size.width/3,
      height: MediaQuery.of(context).size.height/6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: FlutterFlowTheme.of(context).shadowColor,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ElevatedButton(
        child: child,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: FlutterFlowTheme.of(context).secondaryBackground,
          textStyle: FlutterFlowTheme.of(context).title1.override(
            fontFamily: 'Ubuntu',
            color: FlutterFlowTheme.of(context).buttonTextColor,
            fontSize: 21,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    ),
  );
}
