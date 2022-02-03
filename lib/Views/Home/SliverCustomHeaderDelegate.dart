import 'package:WillowCareApp/ModelView/ModelView.dart';
import 'package:WillowCareApp/Theme.dart';
import 'package:flutter/material.dart';

class SliverCategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final Widget child;
  final String? coverImgUrl;
  final AppModel model;
  final GlobalKey<ScaffoldState> scaffoldKey;
  SliverCategoryHeaderDelegate(
      {required this.model,
      required this.collapsedHeight,
      required this.expandedHeight,
      required this.paddingTop,
      required this.child,
      required this.scaffoldKey,
      this.coverImgUrl});

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  TextStyle labelStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  TextStyle valueStyle = TextStyle(
    fontSize: 18,
    color: backColor,
    fontWeight: FontWeight.w400,
  );

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return textHeaderColor!.withAlpha(alpha);
  }

  BoxDecoration makeStickyHeaderBgBoxDecoration(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return BoxDecoration(

        /// gradient in appbar
        gradient: LinearGradient(
            colors: [
              hardColor.withAlpha(255 - alpha),
              hardColor.withAlpha(255 - alpha),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp));
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return Colors.white;
    } else {
      final int alpha =
          ((shrinkOffset / (this.maxExtent - this.minExtent) * 255))
              .clamp(0, 255)
              .toInt();
      return isIcon ? textHeaderColor!.withAlpha(alpha) : Colors.transparent;
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Container(
            child: this.coverImgUrl != null
                ? Image.network(this.coverImgUrl ?? '', fit: BoxFit.cover)
                : Container(
                    decoration: makeStickyHeaderBgBoxDecoration(shrinkOffset),
                  ),
            color: backColor,
          ),
          Positioned(
              left: 0,
              right: 320,
              top: 30,
              child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width / 13,
                  child: IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      color: this.makeStickyHeaderTextColor(shrinkOffset, true),
                    ),
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ))),
          Positioned(
            left: 0,
            right: 0,
            top: 13,
            child: SafeArea(
                bottom: true,
                child: shrinkOffset <= 60
                    ? Container(
                        height: this.maxExtent - shrinkOffset - paddingTop - 20,
                        // color: Colors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              // height: 40,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Text(
                                        'Appointment:',
                                        style: labelStyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Text(
                                            '  ' + '3' + '  ',
                                            style: valueStyle,
                                          )),
                                    )
                                  ]),
                            ),
                            Container(
                              // height: 40,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Align(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Text(
                                        'Upcoming Date:',
                                        style: labelStyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Text(
                                            '  ' + '2 Week 3 Days' + '  ',
                                            style: valueStyle,
                                          )),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Text(
                          'Schedule',
                          style: TextStyle(
                              color: makeStickyHeaderBgColor(shrinkOffset),
                              fontSize: 26),
                        ),
                      )),
          ),
          Positioned(
              left: 320,
              right: 30,
              top: 30,
              child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width / 13,
                  child: IconButton(
                    icon: Icon(
                      Icons.settings_outlined,
                      color: this.makeStickyHeaderTextColor(shrinkOffset, true),
                    ),
                    onPressed: () {},
                  ))),
        ],
      ),
    );
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String coverImgUrl;
  final String title;

  SliverCustomHeaderDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.paddingTop,
    required this.coverImgUrl,
    required this.title,
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Container(child: Image.network(this.coverImgUrl, fit: BoxFit.cover)),
          // Put your head back
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this
                  .makeStickyHeaderBgColor(shrinkOffset), // Background color
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: this.collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: this.makeStickyHeaderTextColor(
                              shrinkOffset, true), // Return icon color
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        this.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: this.makeStickyHeaderTextColor(
                              shrinkOffset, false), // Title color
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: this.makeStickyHeaderTextColor(
                              shrinkOffset, true), // Share icon color
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
