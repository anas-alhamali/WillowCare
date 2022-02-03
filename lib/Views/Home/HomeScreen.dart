import 'package:WillowCareApp/ModelView/ModelView.dart';
import 'package:WillowCareApp/Theme.dart';
import 'package:WillowCareApp/Views/Home/SliverCustomHeaderDelegate.dart';
import 'package:WillowCareApp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  final AppModel model;
  Home({Key? key, required this.model}) : super(key: key);
  static const routeName = "/home";

  @override
  _HomeState createState() => _HomeState(model: model);
}

class _HomeState extends State<Home> {
  final AppModel model;
  _HomeState({required this.model});

  int _currentIndex = 0;

  Color left = foreColor;

  Color right = Color(0xff343654);

  GlobalKey globalKey = new GlobalKey();
  GlobalKey globalKeyOffline = new GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late PageController _pageController;

  BorderSide borderSide = BorderSide(
    color: Colors.grey,
    width: 1,
  );
  TextStyle cardLabelStyle = TextStyle(
    fontSize: 20,
    color: textHeaderColor,
    fontWeight: FontWeight.w500,
  );
  TextStyle cardSubLabelStyle = TextStyle(
    fontSize: 18,
    color: textColor,
    fontWeight: FontWeight.w300,
  );
  Radius cardRadius = Radius.circular(20.0);

  BoxDecoration cardDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      border: Border.all(color: Colors.grey[700] ?? Colors.grey, width: 0.3),
      boxShadow: [
        BoxShadow(
          color: Color(0xFF656565).withOpacity(0.15),
          blurRadius: 4.0,
          spreadRadius: 2.0,
        )
      ]);
  final EdgeInsets cardPadding =
      EdgeInsets.only(top: 10.0, right: 0, left: 0, bottom: 10);

  double avatarRadius = 30;

  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
        model: widget.model,
        child: Scaffold(
          bottomNavigationBar: FloatingNavbar(
            onTap: (int val) {
              //returns tab id which is user tapped
            },
            backgroundColor: Colors.white,
            selectedItemColor: selectedColor,
            unselectedItemColor: foreColor,
            currentIndex: 0,
            items: [
              FloatingNavbarItem(icon: Icons.mail, title: 'Home'),
              FloatingNavbarItem(icon: Icons.calendar_today, title: 'Schedule'),
              FloatingNavbarItem(
                  icon: Icons.chat_bubble_outline, title: 'Messages'),
              FloatingNavbarItem(icon: Icons.more_horiz, title: 'More'),
            ],
          ),
          drawer: navigationDrawer(
            model: model,
          ),
          key: _scaffoldKey,
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(0.0), // here the desired height
              child: AppBar(
                backgroundColor: Colors.transparent,
                brightness: Brightness.dark,
                elevation: 0.0,
              )),
          body: CustomScrollView(
            slivers: <Widget>[
              // SliverAppBar(
              //   title: Text('Q-Linker Money Trans'),
              //   // ...
              // ),
              SliverPersistentHeader(
                // TabBar with a ceiling)
                pinned: true,
                delegate: SliverCategoryHeaderDelegate(
                  collapsedHeight: 65,
                  paddingTop: 13,
                  expandedHeight: 170,
                  // coverImgUrl: '',
                  scaffoldKey: _scaffoldKey,
                  model: model,
                  child: Container(),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 0, left: 0),
                  child: Container(
                      child: Column(
                    children: [
                      _buildMenuBar(context),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.appointments.length,
                          padding: EdgeInsets.all(5.0),
                          itemBuilder: (context, position) {
                            return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                    height:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Column(children: [
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      model
                                                          .appointments[
                                                              position]
                                                          .name,
                                                      style: cardLabelStyle,
                                                    ),
                                                    Text(
                                                      model
                                                          .appointments[
                                                              position]
                                                          .service,
                                                      style: cardSubLabelStyle,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: CircleAvatar(
                                                  radius: avatarRadius,
                                                  foregroundColor:
                                                      Colors.transparent,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: CircleAvatar(
                                                      radius: avatarRadius - 1,
                                                      foregroundImage:
                                                          AssetImage("assets/" +
                                                              model
                                                                  .appointments[
                                                                      position]
                                                                  .img)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Divider(
                                                color: Colors.grey[300],
                                                height: 5,
                                                thickness: 1,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Row(children: [
                                                        Icon(
                                                            Icons
                                                                .calendar_today,
                                                            size: 20,
                                                            color: Colors
                                                                .grey[400]),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 4)),
                                                        Text(
                                                          model
                                                              .appointments[
                                                                  position]
                                                              .appDate,
                                                          style:
                                                              cardSubLabelStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          14),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 8)),
                                                        Icon(Icons.circle,
                                                            size: 12,
                                                            color:
                                                                Colors.green),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 4)),
                                                        Text(
                                                          'confirmed',
                                                          style:
                                                              cardSubLabelStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          14),
                                                        )
                                                      ])),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                              // minimumSize: Size(_width, _height),
                                                              backgroundColor:
                                                                  hardColor,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .transparent))),
                                                      onPressed: () {},
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: Text(
                                                          "Start examination",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 8)),
                                                  Expanded(
                                                    child: TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                              // minimumSize: Size(_width, _height),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xffe2e3ed),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .transparent))),
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Reshedule",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff52b1e4),
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ])));
                          }),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: softColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextButton(
                style: TextButton.styleFrom(
                    // minimumSize: Size(_width, _height),
                    backgroundColor: backColor,
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.transparent))),
                onPressed: () {},
                child: Text(
                  "Upcoming",
                  style: TextStyle(
                    color: left,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
          //Container(height: 33.0, width: 1.0, color: Colors.white),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextButton(
                style: TextButton.styleFrom(
                  // minimumSize: Size(_width, _height),
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                ),
                onPressed: () {
                  _pageController.animateToPage(1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                },
                child: Text(
                  "Accepted",
                  style: TextStyle(
                    color: right,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _demoWidget(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            color: Colors.redAccent,
          ),
        ),
      ],
    );
  }

  _demo2Widget(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            color: Colors.yellowAccent,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class navigationDrawer extends StatelessWidget {
  AppModel model;
  navigationDrawer({required this.model});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(model),
          ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home(
                              model: model,
                            )));
              },
              trailing: Icon(Icons.home_outlined),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 18),
              )),
          Divider(),
          ListTile(
            trailing: Icon(Icons.info_outline),
            title: Text(
              'About',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => aboutApps()));
            },
          ),
          Divider(),
          ListTile(
            trailing: Icon(Icons.logout_outlined),
            title: Text(
              'Log out',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () async {
              Navigator.pop(context);
              await model.logout();
              AppModel().initAppModel();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SplashScreen(
                            model: model,
                          )));
            },
          ),
          ListTile(
            title: Text(
              'App version 1.0.0',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget createDrawerHeader(AppModel model) {
  return UserAccountsDrawerHeader(
    accountName: Text(model.registerResult.displayName ?? "unknown"),
    accountEmail: Text(model.registerResult.phone),
    currentAccountPicture: CircleAvatar(
      backgroundColor: Colors.white,
      child: Text(
        'M', //model.registerResult.displayName!.substring(0, 1),
        style: TextStyle(fontSize: 40.0),
      ),
    ),
  );
}
