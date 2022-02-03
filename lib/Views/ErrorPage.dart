import 'package:WillowCareApp/CustomComponent/Botton.dart';
import 'package:WillowCareApp/Theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage(
      {required this.messageCode,
      required this.retry,
      this.showConectionStatus = false,
      required this.conectionStatus,
      Key? key})
      : super(key: key);

  final String messageCode;
  final bool conectionStatus;
  final bool showConectionStatus;
  VoidCallback retry;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: MMErrorContainer(
          message: messageCode,
          conectionStatus: showConectionStatus
              ? (conectionStatus ? 'IntenetConnected' : 'IntenetNotConnected')
              : '',
          buttonLable: 'إعادة المحاولة',
          retryFun: retry,
        ),
      ),
    );
  }
}

class MMErrorContainer extends StatelessWidget {
  final String message;
  final String buttonLable;
  final VoidCallback retryFun;
  final String conectionStatus;

  const MMErrorContainer({
    Key? key,
    required this.message,
    required this.retryFun,
    required this.buttonLable,
    this.conectionStatus = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num MMHorizantelPadding = 80;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - MMHorizantelPadding,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - MMHorizantelPadding,
                child: Text(
                  message,
                  style: headingStyle.copyWith(color: foreColor),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              conectionStatus != ''
                  ? Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width -
                            MMHorizantelPadding,
                        child: Text(
                          conectionStatus,
                          style: headingStyle.copyWith(color: foreColor),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              // Icon(
              //   nameToIconName('&#xf579;'),
              //   color: MMHardC,
              //   size: 90.0,
              // ),
              buttonLable.isNotEmpty
                  ? Container(
                      child: MMBlackButton(
                        caption: buttonLable,
                        onClick: () => retryFun(),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        color: foreColor,
        //width: double.infinity,
      ),
    );
  }
}
