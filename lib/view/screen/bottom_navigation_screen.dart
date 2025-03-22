import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_ui/view/base/images.dart';
import 'package:responsive_ui/view/screen/coming_soon_screen.dart';
import 'package:responsive_ui/view/screen/dashboard_screen.dart';
import '../base/bottom_nav_item.dart';
import '../base/dimensions.dart';


class BottomNavigationBarScreen extends StatefulWidget {
  final int? pageIndex;
  BottomNavigationBarScreen({required this.pageIndex});

  @override
  _BottomNavigationBarScreenState createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  PageController? _pageController;
  int _pageIndex = 0;
  List<Widget>? _screens;
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
 

  @override
  void initState() {
    super.initState();

    _pageIndex = widget.pageIndex!;

    _pageController = PageController(initialPage: widget.pageIndex!);

    _screens = [
   const DashboardScreen(),
   const ComingSoonScreen(),
      const ComingSoonScreen(),
      const ComingSoonScreen(),
    ];

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        key: _scaffoldKey,
       
        bottomNavigationBar:  BottomAppBar(
          height: 100,
          color: Colors.white,
          elevation: 5,
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.fontSizeDefault(context)),
            child: Row(children: [
              BottomNavItem(
                 imageData: Images.category,
                  isCate: true,
                  name: "Dashboard",
                  isSelected: _pageIndex == 0,
                  onTap: () => _setPage(0)),
              BottomNavItem(
                  imageData: Images.programs,
                  name: "Programs",
                  isSelected: _pageIndex == 1,
                  onTap: () => _setPage(1)),

              BottomNavItem(
                 imageData: Images.user_icon,
                  name: "Users",
                  isSelected: _pageIndex == 2,
                  onTap: () => _setPage(2)),
              BottomNavItem(
                  imageData: Images.request,
                  name: "Request",
                  isSelected: _pageIndex == 3,
                  onTap: () => _setPage(3)),
            ]),
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens!.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens![index];
          },
        ),
      
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
