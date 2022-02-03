import 'dart:async';
import 'package:WillowCareApp/CustomComponent/Botton.dart';
import 'package:WillowCareApp/CustomComponent/RestartWidget.dart';
import 'package:WillowCareApp/CustomComponent/TextInput.dart';
import 'package:WillowCareApp/ModelView/ModelView.dart';
import 'package:WillowCareApp/Models/DataModel.dart';
import 'package:WillowCareApp/Theme.dart';
import 'package:WillowCareApp/Views/Home/HomeScreen.dart';

import 'package:WillowCareApp/Views/Login/Signup.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key, required this.model}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState(model: model);

  final AppModel model;
}

/// Component Widget this layout UI
class _loginScreenState extends State<loginScreen>
    with TickerProviderStateMixin {
  //Animation Declaration
  late AnimationController sanimationController;
  final AppModel model;

  var tap = 0;

  final _userNameController = TextEditingController();
  final _passwordHashController = TextEditingController();

  final _UserInfoFormKey = GlobalKey<FormState>();

  _loginScreenState({required this.model});
  @override

  /// set state animation controller
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
    // TODO: implement initState
    super.initState();
  }

  /// Dispose animation controller
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
    mediaQueryData.size.width;
    mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: AlignmentDirectional.topCenter,
                        child: Column(children: <Widget>[
                          /// padding logo
                          Padding(
                              padding: EdgeInsets.only(
                                  top: mediaQueryData.padding.top + 40.0)),

                          /// Animation text Magic Mall accept from signup layout (Click to open code)
                          Hero(
                            tag: "MoneyTrans",
                            child: Text(
                              'Money Trans',
                              style: TextStyle(
                                fontFamily: 'kld',
                                fontWeight: FontWeight.w600,
                                fontSize: 40.0,
                                letterSpacing: 0.8,
                                color: foreColor,
                              ),
                            ),
                          ),

                          // Image(
                          //   image: AssetImage("assets/img/Logo.png"),
                          //   height: 120.0,
                          // ),

                          /// ButtonCustomFacebook
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 30.0)),

                          Form(
                              key: _UserInfoFormKey,
                              child: Column(
                                children: <Widget>[
                                  textField(
                                    icon: Icons.phone,
                                    password: false,
                                    placeholder: 'User name',
                                    inputType: TextInputType.text,
                                    inputController: _userNameController,
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          value.toString().length < 8) {
                                        return 'Minimum acceptable character is 8';
                                      }
                                      return null;
                                    },
                                  ),

                                  /// TextFromField Password
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0)),
                                  textField(
                                    icon: Icons.vpn_key,
                                    password: true,
                                    placeholder: 'Password',
                                    inputType: TextInputType.visiblePassword,
                                    inputController: _passwordHashController,
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          value.toString().length < 6) {
                                        return 'Minimum acceptable character is 8';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              )),
                        ]),

                        /// Button Signup
                        // FlatButton(
                        //     padding: EdgeInsets.only(top: 20.0),
                        //     onPressed: () {
                        //       setState(() {
                        //         tap = 1;
                        //       });
                        //       _PlayAnimation();
                        //       return tap;
                        //     },
                        //     child: Text(
                        //
                        //            tr('notHave'),
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 13.0,
                        //           fontWeight: FontWeight.w600,
                        //           fontFamily: "Sans"),
                        //     )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: mediaQueryData.padding.top + 100.0,
                            bottom: 0.0),
                      ),
                    ],
                  ),

                  /// Set Animaion after user click buttonLogin
                  tap == 0
                      ? InkWell(
                          splashColor: Colors.yellow,
                          onTap: () {},
                          child: outlineTransparentButton(
                            caption: 'Login',
                            forecolor: foreColor,
                            onClick: () async {
                              ProgressDialog pd = ProgressDialog(
                                context,
                                blur: 0,
                                dialogTransitionType:
                                    DialogTransitionType.Shrink,
                                transitionDuration: Duration(milliseconds: 100),
                                onDismiss: () {
                                  print("Do something onDismiss");
                                },
                                title: Text("Money Trans"),
                                message: Text("login..."),
                              );
                              pd.show();
                              if (_UserInfoFormKey.currentState!.validate()) {
                                await model.login(
                                  LoginModel(
                                      userName: _userNameController.text.trim(),
                                      password:
                                          _passwordHashController.text.trim()),
                                );
                                pd.dismiss();
                                if (model.registerResult.accountStatus ==
                                    AccountStatus.ready) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new Home(
                                                model: model,
                                              )),
                                      (Route<dynamic> route) => false);
                                } else {
                                  NAlertDialog(
                                    title: Text("failure"),
                                    content: Text(model.registerResult.msg),
                                    blur: 2,
                                  ).show(context,
                                      transitionType:
                                          DialogTransitionType.Bubble);
                                }
                              }
                            },
                          ))
                      : new LoginAnimation(
                          animationController: sanimationController,
                          animationCompleted: () {
                            RestartWidget.restartApp(context);
                            //  Navigator.of(context).pushReplacement(
                            //         MaterialPageRoute(
                            //             builder: (BuildContext context) =>
                            //                 new bottomNavigationBar(
                            //                   authBloc: authBloc,
                            //                   cartBloc: cartBloc,
                            //                 )));
                          },
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
