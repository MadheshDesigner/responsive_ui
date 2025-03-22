import 'package:flutter/material.dart';
import 'package:responsive_ui/view/base/dimensions.dart';
import 'package:responsive_ui/view/base/styles.dart';

import '../base/images.dart';

class NavigationDrawerScreen extends StatelessWidget {
  const NavigationDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth > 600 ? 30 : 24;
    double spacing = screenWidth > 600 ? 20 : 10;
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24,left: 18),
              child: Text("Admin",style: plusRegular.copyWith(fontWeight: FontWeight.w700,fontSize: Dimensions.fontSizeOverLarge(context),color: Theme.of(context).primaryColor),),
            ),
            const SizedBox(height: 10,),
            Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 570, // Height from Figma
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(4.35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth > 600 ? 40 : 81, // Increase for tablets
                      height: screenWidth > 600 ? 40 : 81,
                      margin: const EdgeInsets.only(left: 10,top: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Theme.of(context).primaryColor, width: 3.5),
                        image: const DecorationImage(
                          image: AssetImage(Images.profile_image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text("John Doe",style: plusRegular.copyWith(fontWeight: FontWeight.w500,fontSize:Dimensions.fontSizeDefault(context),color: Theme.of(context).cardColor ),),
                    const SizedBox(height: 10,),
                    Text("Mentor",style: plusRegular.copyWith(fontWeight: FontWeight.w300,fontSize:Dimensions.fontSizeSmall(context),color: const Color(0xff232323) ),),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Color(0xffD9D9D9),
                    ),
                    const SizedBox(height: 15),
                    RowIcon(Images.nav_icon_1,"Sheduler",context),
                    const SizedBox(height: 25),
                    RowIcon(Images.nav_icon_2,"TimeSheet",context),
                    const SizedBox(height: 25),
                    RowIcon(Images.nav_icon_3,"Discussion",context),
                    const SizedBox(height: 25),
                    RowIcon(Images.request,"Report",context),
                    const SizedBox(height: 25),
                    RowIcon(Images.nav_icon_4,"Feedback",context),
                    const SizedBox(height: 25),
                    RowIcon(Images.nav_icon_5,"Certificates",context),
                    const SizedBox(height: 25),
                    RowIcon(Images.nav_icon_2,"Feed",context),
                    const SizedBox(height: 25),
                    RowIcon(Images.nav_icon_6,"Analytics",context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget RowIcon(String image,String name,BuildContext context){
    return Row(
      children: [
        const SizedBox(width: 15),
        Image(image: AssetImage(image),width: 22,height: 22,fit: BoxFit.cover,),
        const SizedBox(width: 15),
        Text(name,style: plusRegular.copyWith(fontWeight: FontWeight.w500,fontSize: Dimensions.fontSizeDefault(context),color: Theme.of(context).cardColor),)
      ],
    );
  }
}
