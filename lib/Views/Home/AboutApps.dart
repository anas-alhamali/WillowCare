import 'dart:io';

// import 'package:WillowCareApp/CustomComponent/whatsApp.dart';
import 'package:WillowCareApp/Theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class aboutApps extends StatelessWidget {
  aboutApps();

  @override
  static var _txtCustomHead = TextStyle(
    color: Colors.black45,
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
    fontFamily: "TambaSans",
  );

  static var _txtCustomSub = TextStyle(
    color: Colors.black87,
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    fontFamily: "ManilaSans",
  );

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'About Apps',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
              color: Colors.white,
              //fontFamily: "ManilaSans"
            ),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFF6991C7)),
          elevation: 0.0,
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: <Widget>[
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   height: 220,
                          //   child: Image.asset(
                          //     "assets/banner.png",
                          //     height: 140.0,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          // Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'MoneyTrans',
                                style: TextStyle(
                                    color: hardColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 32),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 15.0, right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Willow Care App',
                          style: _txtCustomSub,
                          textAlign: TextAlign.start,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                        Text(
                          'Version: ' + appVersion.toString(),
                          style: _txtCustomSub,
                          textAlign: TextAlign.start,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                        Text(
                          'Address',
                          style: _txtCustomHead,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                        // Text(
                        //
                        //        tr('contactUs'),
                        //   style: _txtCustomSub.copyWith(
                        //       fontSize: 22),
                        // ),
                        // Padding(
                        //     padding: EdgeInsets.symmetric(
                        //         vertical: 1.0)),

                        Platform.isIOS
                            ? Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.0))
                            : InkWell(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Customer Service Phone',
                                      style: _txtCustomHead,
                                    ),
                                    Text(
                                      '+61000000000',
                                      style: _txtCustomSub.copyWith(),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  // callWhatsapp('61000000000');
                                },
                              ),
                        //to slove in IOS
                        Platform.isIOS
                            ? Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.0))
                            : Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.0)),
                        Platform.isIOS
                            ? Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.0))
                            : InkWell(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Technical Support Phone',
                                      style: _txtCustomHead,
                                    ),
                                    Text(
                                      '61000000000',
                                      style: _txtCustomSub.copyWith(),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  // callWhatsapp('61000000000');
                                },
                              ),
                        Platform.isIOS
                            ? Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.0))
                            : Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),

                        Text(
                          'FowlloUs',
                          style: _txtCustomHead,
                          textAlign: TextAlign.start,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.link,
                                size: 30,
                                color: Colors.blue[900],
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.0)),
                              Text(
                                'facebook'
                                //+ ' ' + state.aboutApp.facebook
                                ,
                                style: _txtCustomSub.copyWith(
                                  color: Colors.blue[900],
                                ),
                              ),
                            ],
                          ),
                          onTap: () async {
                            //https://stackoverflow.com/questions/55838430/flutter-open-facebook-link-in-facebook-app-android-ios
                            String fbProtocolUrl;
                            if (Platform.isIOS) {
                              fbProtocolUrl = 'fb://profile/000000000';
                            } else {
                              fbProtocolUrl = 'fb://page/00000000';
                            }

                            String fallbackUrl = 'fb.com/aaaaaa';

                            try {
                              bool launched = await launch(fbProtocolUrl,
                                  forceSafariVC: false);

                              if (!launched) {
                                await launch(fallbackUrl, forceSafariVC: false);
                              }
                            } catch (e) {
                              await launch(fallbackUrl, forceSafariVC: false);
                            }
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.link,
                                size: 30,
                                color: Colors.blue[900],
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.0)),
                              Text(
                                'instagram'
                                //+ ' ' +  state.aboutApp.instagram
                                ,
                                style: _txtCustomSub.copyWith(
                                    color: Colors.blue[900]),
                              ),
                            ],
                          ),
                          onTap: () async {
                            // bool launched = await launch(
                            //     state.aboutApp.instagram,
                            //     forceSafariVC: false);
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: InkWell(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.link,
                                    size: 30,
                                    color: Colors.blue[900],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.0)),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 66,
                                    child: Text(
                                      'googlePlay'
                                      // + ' ' + state.aboutApp.googlePlay
                                      ,
                                      style: _txtCustomSub.copyWith(
                                        color: Colors.blue[900],
                                      ),
                                      softWrap: true,
                                      maxLines: 3,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () async {
                                // bool launched = await launch(
                                //     state.aboutApp.googlePlay,
                                //     forceSafariVC: false);
                              },
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
//                         state.aboutApp.appStore != null
//                             ? InkWell(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: <Widget>[
//                                     Icon(
//                                                                       Icons.link,
// ,
//                                       size: 30,
//                                       color: Colors.blue[900],
//                                     ),
//                                     Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 3.0)),
//                                     Text(
//                                       tr('appStore'),
//                                       style: _txtCustomSub.copyWith(
//                                         color: Colors.blue[900],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 onTap: () {},
//                               )
//                             : Container(),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: InkWell(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.link,
                                  size: 30,
                                  color: Colors.blue[900],
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.0)),
                                Container(
                                  child: Text(
                                    'Our Web Site',
                                    style: _txtCustomSub.copyWith(
                                      color: Colors.blue[900],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () async {
                              bool launched = await launch(
                                  'https://www.q-linker.com/',
                                  forceSafariVC: false);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, top: 5),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             PrivacyPolicyPage()));
                            },
                            child: Container(
                              child: Text(
                                'Privacy Policy',
                                style: _txtCustomSub.copyWith(
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));

    // return SingleChildScrollView(
    //   child: Container(
    //     color: Colors.white,
    //     child: Column(
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.all(20.0),
    //           child: Divider(
    //             height: 0.5,
    //             color: Colors.black12,
    //           ),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.only(
    //               top: 10.0, left: 15.0, right: 15.0),
    //           child: Row(
    //             children: <Widget>[
    //               Image.asset(
    //                 "assets/img/Logo.png",
    //                 height: 50.0,
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 12.0),
    //                 child: Column(
    //                   crossAxisAlignment:
    //                       CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     Text(
    //                       tr('title'),
    //                       style: _txtCustomSub.copyWith(
    //                           fontWeight: FontWeight.w600),
    //                     ),
    //                     Text(
    //                       tr('uiKit'),
    //                       style: _txtCustomSub,
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(20.0),
    //           child: Divider(
    //             height: 0.5,
    //             color: Colors.black12,
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(15.0),
    //           child: Text(
    //             "تطبيق ماجيكال"
    //             "اول سوبر ماركت الكتروني خلي حياتك اسهل"
    //             "تأمين كل ما يلزم العائلة بسعر منافس وتوفير عروض دائمة",
    //             style: _txtCustomSub,
    //             textAlign: TextAlign.justify,
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // )
  }
}
