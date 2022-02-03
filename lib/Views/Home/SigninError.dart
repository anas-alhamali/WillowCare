import 'package:WillowCareApp/CustomComponent/Botton.dart';
import 'package:WillowCareApp/Theme.dart';
import 'package:flutter/material.dart';

class SigninErrorPage extends StatelessWidget {
  SigninErrorPage(
      {required this.messageCode,
      required this.retry,
      required this.workOffine,
      this.showConectionStatus = false,
      required this.conectionStatus,
      Key? key})
      : super(key: key);

  final String messageCode;
  final bool conectionStatus;
  final bool showConectionStatus;

  VoidCallback workOffine;
  VoidCallback retry;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: ErrorContainer(
          message: messageCode,
          conectionStatus: showConectionStatus
              ? (conectionStatus
                  ? 'Internet connected'
                  : 'No internet connection')
              : '',
          buttonLable: 'إعادة المحاولة',
          retryFun: retry,
          offineButtonLable: 'العمل دون إتصال   ',
          workOffine: workOffine,
        ),
      ),
    );
  }
}

class ErrorContainer extends StatelessWidget {
  final String message;
  final String buttonLable;
  final String offineButtonLable;
  final VoidCallback retryFun;
  final String conectionStatus;
  final VoidCallback workOffine;

  const ErrorContainer({
    Key? key,
    required this.message,
    required this.retryFun,
    required this.workOffine,
    required this.buttonLable,
    required this.offineButtonLable,
    this.conectionStatus = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double horizantelPadding = 80.0;
    return Center(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        //width: MediaQuery.of(context).size.width - MMHorizantelPadding,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: horizantelPadding / 2),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - horizantelPadding,
                  child: Text(
                    message,
                    style: headingStyle.copyWith(color: hardColor),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                conectionStatus != ''
                    ? Text(
                        conectionStatus,
                        style: headingStyle,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                conectionStatus != ''
                    ? ElevatedButton(
                        child: Text(
                          offineButtonLable,
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.2,
                              fontFamily: "Sans",
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        onPressed: () => workOffine(),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                // Icon(
                //   nameToIconName('&#xf579;'),
                //   color: MMHardC,
                //   size: 90.0,
                // ),
                buttonLable.isNotEmpty
                    ? new ElevatedButton(
                        child: Text(
                          buttonLable,
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.2,
                              fontFamily: "Sans",
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        onPressed: () => retryFun(),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
