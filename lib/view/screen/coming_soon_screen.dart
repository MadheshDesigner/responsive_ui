import 'package:flutter/material.dart';
import 'package:responsive_ui/view/base/dimensions.dart';
import 'package:responsive_ui/view/base/styles.dart';

import '../base/images.dart';
import 'navigation_drawer_screen.dart';

class ComingSoonScreen extends StatefulWidget {
  const ComingSoonScreen({super.key});

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth > 600 ? 30 : 24;
    double spacing = screenWidth > 600 ? 20 : 10;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(4, 4),
                blurRadius: 15,
                spreadRadius: 0,
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            shadowColor:  Colors.white,
            surfaceTintColor:Colors.white,
            elevation: 0,
            title: Container(
              width: screenWidth > 600 ? 40 : 30, // Increase for tablets
              height: screenWidth > 600 ? 40 : 30,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                image: const DecorationImage(
                  image: AssetImage(Images.profile_image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            actions: [
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  color: const Color(0xffEEF5FF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.search, color: Theme.of(context).secondaryHeaderColor, size: iconSize * 0.7),
              ),
              SizedBox(width: screenWidth > 600 ? 20 : 15),
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  color: const Color(0xffEEF5FF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(Images.notification,
                          width: iconSize * 0.7,
                          height: iconSize * 0.7,
                          fit: BoxFit.cover,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    Positioned(
                      top: 5,
                      left: iconSize * 0.55,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xffFD003A),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: spacing),
              GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(Images.menu_icon,
                      height: screenWidth > 600 ? 22 : 17,
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: spacing),
            ],
          ),
        ),
      ),
      endDrawer: const NavigationDrawerScreen(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(image: AssetImage(Images.programs),width: 110,height: 110,color: Color(0xff9D9D9D),),
          ),
          Center(
            child: Text("Coming soon",style: plusRegular.copyWith(fontWeight: FontWeight.w400,fontSize: Dimensions.fontSizeDefault(context),color: Theme.of(context).cardColor)),
          ),
        ],
      ),
    );
  }
}
