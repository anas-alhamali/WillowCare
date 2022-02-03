import 'package:flutter/material.dart';

class MMBlackButton extends StatelessWidget {
  final String caption;
  final VoidCallback onClick;
  final double fontSize;
  bool shadow;
  MMBlackButton(
      {required this.caption,
      required this.onClick,
      this.shadow = true,
      this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding:
            shadow ? EdgeInsets.all(10.0) : EdgeInsets.only(left: 0, right: 0),
        child: Container(
          height: 55.0,
          width: 600.0,
          child: Text(
            caption,
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.2,
                fontFamily: "Sans",
                fontSize: fontSize,
                fontWeight: FontWeight.w800),
          ),
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
              boxShadow: shadow
                  ? [BoxShadow(color: Colors.black38, blurRadius: 15.0)]
                  : null,
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])),
        ),
      ),
    );
  }
}

class outlineBlackButton extends StatelessWidget {
  final String caption;
  final VoidCallback onClick;

  outlineBlackButton({required this.caption, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          height: 55.0,
          //width: 100.0,
          child: Text(
            caption,
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.2,
                fontFamily: "Sans",
                fontSize: 20.0,
                fontWeight: FontWeight.w800),
          ),
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(color: Colors.white, width: 3),
              gradient: LinearGradient(
                  colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])),
        ),
      ),
    );
  }
}

/// Button Custom widget
class outlineTransparentButton extends StatelessWidget {
  @override
  String caption;
  // GestureTapCallback ontap;
  final VoidCallback onClick;
  Color forecolor;
  outlineTransparentButton(
      {required this.caption,
      required this.onClick,
      this.forecolor = Colors.white});

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onClick,
        splashColor: Colors.white,
        child: LayoutBuilder(builder: (context, constraint) {
          return Container(
            width: 300.0,
            height: 52.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.transparent,
                border: Border.all(color: forecolor)),
            child: Center(
                child: Text(
              caption,
              style: TextStyle(
                  color: forecolor,
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Sans",
                  letterSpacing: 0.5),
            )),
          );
        }),
      ),
    );
  }
}

class BlueButton extends StatelessWidget {
  final String caption;
  final VoidCallback onClick;
  final double fontSize;
  bool shadow;
  BlueButton(
      {required this.caption,
      required this.onClick,
      this.shadow = true,
      this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          Container(
            // height: 55.0,
            //width: 70.0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(22.0, 12, 22, 12),
              child: Text(
                caption,
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.2,
                    fontFamily: "Sans",
                    fontSize: fontSize,
                    fontWeight: FontWeight.w800),
              ),
            ),
            // alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                boxShadow: shadow
                    ? [BoxShadow(color: Colors.black38, blurRadius: 15.0)]
                    : null,
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.blue[900]),
          ),
        ],
      ),
    );
  }
}
