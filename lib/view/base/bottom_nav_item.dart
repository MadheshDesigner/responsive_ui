import 'package:flutter/material.dart';
import 'package:responsive_ui/view/base/dimensions.dart';
import 'package:responsive_ui/view/base/styles.dart';

class BottomNavItem extends StatelessWidget {
  final String? imageData;
  final GestureTapCallback? onTap;
  final String? name;
  final bool? isSelected;
  final bool? isCate;
  BottomNavItem({required this.imageData, this.onTap, this.isSelected = false, this.name, this.isCate=false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            isCate!?Image(image: AssetImage(imageData!),width: 18,height: 20,color: isSelected!?Theme.of(context).primaryColor:Theme.of(context).cardColor,fit: BoxFit.cover,):Image(image: AssetImage(imageData!),width: 25,height: 20,color: isSelected!?Theme.of(context).primaryColor:Theme.of(context).cardColor,fit: BoxFit.cover,),
            SizedBox(height: 5),
            Text(name!,style: plusRegular.copyWith(fontWeight: FontWeight.w400,fontSize: Dimensions.fontSizeDefault(context),color: isSelected!?Theme.of(context).primaryColor:Theme.of(context).cardColor),)
          ],
        ),
      )
    );
  }
}
