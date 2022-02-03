import 'dart:async';

import 'package:WillowCareApp/CustomComponent/Botton.dart';
import 'package:WillowCareApp/CustomComponent/TextInput.dart';
import 'package:WillowCareApp/ModelView/ModelView.dart';
import 'package:WillowCareApp/Models/DataModel.dart';
import 'package:WillowCareApp/Theme.dart';
import 'package:WillowCareApp/Views/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

class Signup extends StatefulWidget {
  AppModel model;
  Signup({required this.model});

  @override
  _SignupState createState() => _SignupState(model: model);
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  //Animation Declaration
  late AnimationController sanimationController;
  late AnimationController animationControllerScreen;
  late Animation animationScreen;
  var tap = 0;
  AppModel model;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _userNameController = TextEditingController();
  final _passwordHashController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _homeNumberController = TextEditingController();
  int gender = 1;

  _SignupState({
    required this.model,
  });

  final _UserInfoFormKey = GlobalKey<FormState>();

  /// Set AnimationController to initState
  @override
  void initState() {
    sanimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addStatusListener((statuss) {
            if (statuss == AnimationStatus.dismissed) {
              setState(() {
                tap = 0;
              });
            }
          });
    super.initState();
  }

  void _handleGenderValueChange(int value) {
    setState(() {});
  }

  /// Dispose animationController
  @override
  void dispose() {
    sanimationController.dispose();
    super.dispose();
  }

  /// Playanimation set forward reverse
  Future<Null> _PlayAnimation() async {
    try {
      await sanimationController.forward();
      await sanimationController.reverse();
    } on TickerCanceled {}
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.height;
    mediaQueryData.size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.transparent,
            brightness: Brightness.dark,
            elevation: 0.0,
          )),
      extendBodyBehindAppBar: true,
      body: Container(
        color: backColor,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //   image: AssetImage("assets/money.jpg"),
        //   fit: BoxFit.cover,
        // )),
        child: Container(
          decoration: MyBoxDecoration,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Form(
                    key: _UserInfoFormKey,
                    child: ListView(
                      padding: EdgeInsets.all(0.0),
                      children: <Widget>[
                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  alignment: AlignmentDirectional.topCenter,
                                  child: Column(
                                    children: <Widget>[
                                      /// padding logo
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: mediaQueryData.padding.top +
                                                  30.0)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Hero(
                                            tag: "MoneyTrans",
                                            child: Container(
                                              width: mediaQueryData.size.width,
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  'New user signup',
                                                  style: titleStyle.copyWith(
                                                      color: foreColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15.0)),

                                      /// TextFromField Email
                                      textField(
                                        icon: Icons.supervised_user_circle,
                                        password: false,
                                        placeholder: 'Full Name',
                                        inputType:
                                            TextInputType.visiblePassword,
                                        inputController: _fullNameController,
                                        validator: (value) {
                                          if (value.isEmpty ||
                                                  value.toString().length < 6
                                              //||(!value.toString().startsWith('09') &&!value.toString().startsWith('009639'))

                                              ) {
                                            return 'Full Name Not Accepted';
                                          }
                                          return null;
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0)),

                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: Text(
                                          'Enter your full name, More than 6 character',
                                          style: TextStyle(
                                              fontSize: 14, color: foreColor),
                                          maxLines: 3,
                                          softWrap: true,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0)),

                                      textField(
                                        icon: Icons.phone,
                                        password: false,
                                        placeholder: 'Phone Number',
                                        inputType: TextInputType.phone,
                                        inputController: _phoneNumberController,
                                        validator: (value) {
                                          if (value.isEmpty ||
                                                  value.toString().length < 10
                                              //||(!value.toString().startsWith('09') &&!value.toString().startsWith('009639'))

                                              ) {
                                            return 'phone number not accepted';
                                          }
                                          return null;
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0)),

                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: Text(
                                          'Real phone number owned by you ',
                                          style: TextStyle(
                                              fontSize: 14, color: foreColor),
                                          maxLines: 3,
                                          softWrap: true,
                                        ),
                                      ),

                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0)),
                                      textField(
                                        icon: Icons.supervised_user_circle,
                                        password: false,
                                        placeholder: 'User Name',
                                        inputType: TextInputType.text,
                                        inputController: _userNameController,
                                        validator: (value) {
                                          if (value.isEmpty ||
                                                  value.toString().length < 8
                                              //||(!value.toString().startsWith('09') &&!value.toString().startsWith('009639'))

                                              ) {
                                            return 'user name not accepted';
                                          }
                                          return null;
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0)),

                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        child: Text(
                                          'Remember this username for login in future',
                                          style: TextStyle(
                                              fontSize: 14, color: foreColor),
                                          maxLines: 3,
                                          softWrap: true,
                                        ),
                                      ),

                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0)),
                                      // TextFromField Email
                                      textField(
                                        icon: Icons.vpn_key,
                                        password: true,
                                        placeholder: 'Password',
                                        inputType:
                                            TextInputType.visiblePassword,
                                        inputController:
                                            _passwordHashController,
                                        validator: (value) {
                                          if (value.isEmpty ||
                                              value.toString().length < 6) {
                                            return 'Password not accepted';
                                          }
                                          return null;
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0)),

                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: Text(
                                          'New secret password',
                                          style: TextStyle(
                                              fontSize: 14, color: foreColor),
                                          maxLines: 3,
                                          softWrap: true,
                                        ),
                                      ),

                                      // Padding(
                                      //     padding: EdgeInsets.symmetric(
                                      //         vertical: 5.0)),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.center,
                                      //   children: <Widget>[
                                      //     ActionChip(
                                      //       label: Container(
                                      //           width: 40,
                                      //           height: 35,
                                      //           child: Center(
                                      //             child: FittedBox(
                                      //               fit: BoxFit.scaleDown,
                                      //               child: Text('male',
                                      //                   textAlign:
                                      //                       TextAlign.center),
                                      //             ),
                                      //           )),
                                      //       labelStyle: TextStyle(
                                      //           fontSize: 20.0,
                                      //           color: Colors.white),
                                      //       backgroundColor: gender == 1
                                      //           ? Colors.indigo
                                      //           : Colors.grey.shade600,
                                      //       onPressed: () =>
                                      //           _handleGenderValueChange(1),
                                      //     ),
                                      //     new Container(
                                      //       padding: new EdgeInsets.fromLTRB(
                                      //           8.0, 0, 0, 0),
                                      //     ),
                                      //     ActionChip(
                                      //       label: Container(
                                      //           width: 40,
                                      //           height: 35,
                                      //           child: Center(
                                      //             child: FittedBox(
                                      //               fit: BoxFit.scaleDown,
                                      //               child: Text('female',
                                      //                   textAlign:
                                      //                       TextAlign.center),
                                      //             ),
                                      //           )),
                                      //       labelStyle: TextStyle(
                                      //           fontSize: 20.0,
                                      //           color: Colors.white),
                                      //       backgroundColor: gender == 2
                                      //           ? Colors.indigo
                                      //           : Colors.grey.shade600,
                                      //       onPressed: () =>
                                      //           _handleGenderValueChange(2),
                                      //     ),
                                      //   ],
                                      // ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0)),

                                      InkWell(
                                        splashColor: Colors.yellow,
                                        child: outlineTransparentButton(
                                            caption: 'Sign Up',
                                            forecolor: foreColor,
                                            onClick: () async {
                                              ProgressDialog pd =
                                                  ProgressDialog(
                                                context,
                                                blur: 0,
                                                dialogTransitionType:
                                                    DialogTransitionType.Shrink,
                                                transitionDuration:
                                                    Duration(milliseconds: 100),
                                                onDismiss: () {
                                                  print(
                                                      "Do something onDismiss");
                                                },
                                                title: Text("Money Trans"),
                                                message: Text("signup..."),
                                              );
                                              pd.show();

                                              if (_UserInfoFormKey.currentState!
                                                      .validate() &&
                                                  gender > 0) {
                                                var _user = new SignupModel(
                                                    displayName:
                                                        _fullNameController
                                                            .text,
                                                    phoneNumber:
                                                        _phoneNumberController
                                                            .text,
                                                    userName:
                                                        _userNameController
                                                            .text,
                                                    password:
                                                        _passwordHashController
                                                            .text
                                                            .trim());
                                                await model.signup(_user);
                                                pd.dismiss();

                                                if (model.registerResult
                                                        .accountStatus ==
                                                    AccountStatus.ready) {
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  new Home(
                                                                    model:
                                                                        model,
                                                                  )),
                                                          (Route<dynamic>
                                                                  route) =>
                                                              false);
                                                } else {
                                                  NAlertDialog(
                                                    title: Text("failure"),
                                                    content: Text(model
                                                        .registerResult.msg),
                                                    blur: 2,
                                                  ).show(context,
                                                      transitionType:
                                                          DialogTransitionType
                                                              .Bubble);
                                                }

                                                setState(() {
                                                  tap = 1;
                                                });
                                                _PlayAnimation();
                                                // return tap;
                                              }
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       top: mediaQueryData.padding.top +
                            //           290.0,
                            //       bottom: 0.0),
                            // ),

                            /// Set Animaion after user click buttonLogin
                            if (tap == 0)
                              Container()
                            else
                              new LoginAnimation(
                                animationController: sanimationController,
                                animationCompleted: () {},
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginAnimation extends StatefulWidget {
  /// To set type animation and  start and end animation
  LoginAnimation(
      {Key? key,
      required this.animationController,
      required this.animationCompleted})
      : animation = new Tween(
          end: 900.0,
          begin: 70.0,
        ).animate(CurvedAnimation(
            parent: animationController, curve: Curves.bounceInOut)),
        super(key: key);

  late final AnimationController animationController;
  late final Animation animation;
  VoidCallback animationCompleted;
  Widget _buildAnimation(BuildContext context, Widget? child) {
    /// Setting shape a animation
    return Padding(
        padding: EdgeInsets.only(bottom: 60.0),
        child: Container(
          height: animation.value,
          width: animation.value,
          decoration: BoxDecoration(
            color: Color(0xFF3B2E6F),
            shape: animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
          ),
        ));
  }

  @override
  _LoginAnimationState createState() =>
      _LoginAnimationState(animationCompleted: animationCompleted);
}

class _LoginAnimationState extends State<LoginAnimation> {
  // AuthenticationBloc authBloc;
  // CartBloc cartBloc;
  VoidCallback animationCompleted;
  _LoginAnimationState({required this.animationCompleted});

  @override

  /// To navigation after animation complete
  Widget build(BuildContext context) {
    widget.animationController.addListener(() {
      if (widget.animation.isCompleted) {
        print(" animation Completed");
        animationCompleted();
      }
    });

    return new AnimatedBuilder(
      animation: widget.animationController,
      builder: widget._buildAnimation,
    );
  }
}
