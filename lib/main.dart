import 'package:WillowCareApp/Views/Home/HomeScreen.dart';
import 'package:WillowCareApp/Theme.dart';
import 'package:WillowCareApp/Views/Login/ChoseLoginWay.dart';
import 'package:WillowCareApp/Views/Home/SigninError.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:WillowCareApp/ModelView/ModelView.dart';
import 'package:flutter/rendering.dart';
import 'package:WillowCareApp/Models/DataModel.dart';
import 'dart:async';
import 'package:flutter/services.dart';

//final TextStyle myCaptionStayle = TextStyle(fontSize: 18, height: 0);

void main() {
  print('>>>> start');
  //debugPaintSizeEnabled = true;

  // debugPaintPointersEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  var cc = new AppModel();
  cc.initAppModel();
  runApp(MyApp(
    appModel: cc,
  ));
}

class MyApp extends StatelessWidget {
  AppModel appModel;

  MyApp({required this.appModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: ScopedModel<AppModel>(
          model: appModel,
          child: ScopedModelDescendant<AppModel>(
            builder: (context, child, model) => MaterialApp(
                title: 'Willow Care App',
                debugShowCheckedModeBanner: false,
                // theme: myTheme,
                home: SplashScreen(
                  model: appModel,
                )),
          )),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final AppModel model;
  SplashScreen({Key? key, required this.model}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState(model: model);
}

class SplashScreenState extends State<SplashScreen> {
  final AppModel model;
  SplashScreenState({Key? key, required this.model});

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    for (var i = 0; i < 2; i++) {
      await Future.delayed(Duration(seconds: 5), () {
        if (model.registerResult.accountStatus == AccountStatus.ready) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(
                        model: model,
                      )));
        } else if (model.registerResult.accountStatus ==
            AccountStatus.signinRequired) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ChoseLogin(
                        model: model,
                      )));
        } else if (model.registerResult.accountStatus ==
            AccountStatus.serverConnError) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SigninErrorPage(
                        conectionStatus: model.checkInternetConnaction(),
                        showConectionStatus: true,
                        messageCode:
                            'Failure during the connect with the server',
                        retry: () {
                          model.initAppModel();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen(
                                        model: model,
                                      )));
                        },
                        workOffine: () {
                          model.registerResult = model.registerResult.copyWith(
                              success: true,
                              accountStatus: AccountStatus.workOffline,
                              msg: "");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(
                                        model: model,
                                      )));
                        },
                      )));
          i = 3;
          return;
        }
      });
    }

    if (model.registerResult.accountStatus == AccountStatus.serverConnError ||
        model.registerResult.accountStatus == AccountStatus.uninitialized) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => SigninErrorPage(
                    conectionStatus: model.checkInternetConnaction(),
                    showConectionStatus: true,
                    messageCode: 'Failure during the connect with the server',
                    retry: () {
                      model.initAppModel();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreen(
                                    model: model,
                                  )));
                    },
                    workOffine: () {
                      model.registerResult = model.registerResult.copyWith(
                          success: true,
                          accountStatus: AccountStatus.workOffline,
                          msg: "");
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home(
                                    model: model,
                                  )));
                    },
                  )));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /// Set Background image in splash screen layout (Click to open code)
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/splash.png'), fit: BoxFit.cover)),
    );
  }
}
