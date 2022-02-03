import 'dart:async';

import 'package:WillowCareApp/CustomComponent/Botton.dart';
import 'package:WillowCareApp/ModelView/ModelView.dart';
import 'package:WillowCareApp/Theme.dart';
import 'package:WillowCareApp/Views/Login/Signup.dart';
import 'package:WillowCareApp/Views/Login/login.dart';
import 'package:flutter/material.dart';

class ChoseLogin extends StatefulWidget {
  final AppModel model;
  ChoseLogin({Key? key, required this.model}) : super(key: key);
  @override
  _ChoseLoginState createState() => _ChoseLoginState(model: model);
}

/// Component Widget this layout UI
class _ChoseLoginState extends State<ChoseLogin> with TickerProviderStateMixin {
  /// Declare Animation
  late AnimationController animationController;
  var tapLogin = 0;
  var tapSignup = 0;
  final AppModel model;
  _ChoseLoginState({required this.model});

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }

  @override

  /// Declare animation in initState
  void initState() {
    // TODO: implement initState
    /// Animation proses duration
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addStatusListener((statuss) {
            if (statuss == AnimationStatus.dismissed) {
              setState(() {
                tapLogin = 0;
                tapSignup = 0;
              });
            }
          });
    super.initState();
  }

  /// To dispose animation controller
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
    // TODO: implement dispose
  }

  /// Playanimation set forward reverse
  Future<Null> _Playanimation() async {
    try {
      await animationController.forward();
      await animationController.reverse();
    } on TickerCanceled {}
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    mediaQuery.devicePixelRatio;
    mediaQuery.size.height;
    mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            color: backColor,
            // Set Background image in layout (Click to open code)
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //   image: AssetImage("assets/money.jpg"),
            //   fit: BoxFit.cover,
            // )),
            child: Container(
              /// Set gradient color in image (Click to open code)
              decoration: MyBoxDecoration,

              /// Set component layout
              child: ListView(
                padding: EdgeInsets.all(0.0),
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          Container(
                            alignment: AlignmentDirectional.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: mediaQuery.padding.top + 50.0),
                                ),
                                Center(
                                  /// Animation text Magic Mall accept from splashscreen layout (Click to open code)
                                  child: Hero(
                                    tag: "MoneyTrans",
                                    flightShuttleBuilder: _flightShuttleBuilder,
                                    child: Text(
                                      'Money Trance',
                                      style: TextStyle(
                                        fontFamily: 'kld',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 40.0,
                                        letterSpacing: 0.8,
                                        color: foreColor,
                                      ),
                                    ),
                                  ),
                                ),

                                /// Padding Text "Get best product in Magic Mall" (Click to open code)
                                Padding(
                                    padding: EdgeInsets.only(
                                        // left: 110.0,
                                        // right: 110.0,
                                        top: mediaQuery.padding.top + 70.0,
                                        bottom: 10.0),
                                    child: Container(
                                      color: foreColor,
                                      height: 0.5,
                                      width: 120.0,
                                    )),

                                /// to set Text "get best product...." (Click to open code)
                                Text(
                                  'Choose a way to enter',
                                  style: TextStyle(
                                      color: foreColor,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Sans",
                                      letterSpacing: 1.3),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(padding: EdgeInsets.only(top: 250.0)),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              /// To create animation if user tap == animation play (Click to open code)
                              if (tapLogin == 0)
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor: Colors.white,
                                    onTap: () {
                                      setState(() {
                                        tapLogin = 1;
                                      });
                                      _Playanimation();
                                      // return tapLogin;
                                    },
                                    child: outlineTransparentButton(
                                      caption: 'Singup as new user',
                                      forecolor: foreColor,
                                      onClick: () {
                                        setState(() {
                                          tapLogin = 1;
                                        });
                                        _Playanimation();
                                      },
                                    ),
                                  ),
                                )
                              else
                                AnimationSplashSignup(
                                  animationController: animationController,
                                  model: model,
                                ),
                              Padding(padding: EdgeInsets.only(top: 15.0)),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    /// To set white line (Click to open code)
                                    Container(
                                      color: foreColor,
                                      height: 0.5,
                                      width: 60.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Text(
                                        'Or',
                                        style: TextStyle(
                                            color: foreColor,
                                            fontWeight: FontWeight.w200,
                                            fontFamily: "Sans",
                                            fontSize: 15.0),
                                      ),
                                    ),

                                    //   /// navigation to home screen if user click "OR SKIP" (Click to open code)
                                    //   child: InkWell(
                                    //     onTap: () {
                                    //       Navigator.of(context).pushReplacement(
                                    //           PageRouteBuilder(
                                    //               pageBuilder: (_, __, ___) =>
                                    //                   new bottomNavigationBar(
                                    //                     authBloc: authBloc,
                                    //                     cartBloc: cartBloc,
                                    //                   )));
                                    //     },
                                    //     child:

                                    //   ),
                                    // ),

                                    /// To set white line (Click to open code)
                                    Container(
                                      color: foreColor,
                                      height: 0.5,
                                      width: 60.0,
                                    )
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 70.0)),
                            ],
                          ),

                          /// To create animation if user tap == animation play (Click to open code)
                          tapSignup == 0
                              ? Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor: Colors.white,
                                    onTap: () {
                                      // return tapSignup;
                                    },
                                    child: outlineTransparentButton(
                                      caption: 'Login with old account',
                                      forecolor: foreColor,
                                      onClick: () {
                                        setState(() {
                                          tapSignup = 1;
                                        });
                                        _Playanimation();
                                      },
                                    ),
                                  ),
                                )
                              : AnimationSplashLogin(
                                  animationController: animationController,
                                  model: model,
                                ),
                        ],
                      ),
                    ],
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

/// Set Animation Login if user click button login
class AnimationSplashLogin extends StatefulWidget {
  AnimationSplashLogin(
      {Key? key, required this.animationController, required this.model})
      : animation = new Tween(
          end: 900.0,
          begin: 70.0,
        ).animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn)),
        super(key: key);

  final AnimationController animationController;
  final Animation animation;
  final AppModel model;
  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.0),
      child: Container(
        height: animation.value,
        width: animation.value,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }

  @override
  _AnimationSplashLoginState createState() =>
      _AnimationSplashLoginState(model: model);
}

/// Set Animation Login if user click button login
class _AnimationSplashLoginState extends State<AnimationSplashLogin> {
  final AppModel model;

  _AnimationSplashLoginState({required this.model});

  @override
  Widget build(BuildContext context) {
    widget.animationController.addListener(() {
      if (widget.animation.isCompleted) {
        Future.delayed(Duration.zero, () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => new loginScreen(
                    model: model,
                  )));
        });
      }
    });
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: widget._buildAnimation,
    );
  }
}

/// Set Animation signup if user click button signup
class AnimationSplashSignup extends StatefulWidget {
  AnimationSplashSignup(
      {Key? key, required this.animationController, required this.model})
      : animation = new Tween(
          end: 900.0,
          begin: 70.0,
        ).animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn)),
        super(key: key);
  final AppModel model;
  final AnimationController animationController;
  final Animation animation;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.0),
      child: Container(
        height: animation.value,
        width: animation.value,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }

  @override
  _AnimationSplashSignupState createState() =>
      _AnimationSplashSignupState(model: model);
}

/// Set Animation signup if user click button signup
class _AnimationSplashSignupState extends State<AnimationSplashSignup> {
  final AppModel model;
  _AnimationSplashSignupState({required this.model});

  @override
  Widget build(BuildContext context) {
    widget.animationController.addListener(() {
      if (widget.animation.isCompleted) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => new Signup(
                  model: model,
                )));
      }
    });
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: widget._buildAnimation,
    );
  }
}
