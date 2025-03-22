import 'package:flutter/material.dart';
import 'package:responsive_ui/view/base/images.dart';
import 'package:responsive_ui/view/screen/widgets/planned_program_widget.dart';
import 'package:responsive_ui/view/screen/widgets/program_mode_matrics_widget.dart';
import 'package:responsive_ui/view/screen/widgets/program_status_matrics_widget.dart';
import 'package:responsive_ui/view/screen/widgets/program_type_metrics_widget.dart';
import 'package:responsive_ui/view/screen/widgets/top_mentors_widget.dart';
import 'package:responsive_ui/view/screen/widgets/top_program_widget.dart';

import 'navigation_drawer_screen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // ✅ Global Key

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: isTablet
                ? const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(child: PlannedProgramWidget()),
                SizedBox(width: 20),
                Flexible(child: ProgramStatusMatricWidget()),
                SizedBox(width: 20),
                Flexible(child: TopProgramWidget()),
                SizedBox(height: 20),
                Flexible(child: TopMentorsWidget()),
                SizedBox(height: 20),
                Flexible(child: ProgramTypeMetrics()),
                SizedBox(height: 20),
                Flexible(child: ProgramModeMetrics()),
                SizedBox(height: 20),
              ],
            )
                : const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlannedProgramWidget(),
                  SizedBox(height: 20),
                  ProgramStatusMatricWidget(),
                  SizedBox(height: 20),
                  TopProgramWidget(),
                  SizedBox(height: 20),
                  TopMentorsWidget(),
                  SizedBox(height: 20),
                  ProgramTypeMetrics(),
                  SizedBox(height: 20),
                  ProgramModeMetrics(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),

    );
  }
}
