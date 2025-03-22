import 'package:flutter/material.dart';
import 'package:responsive_ui/view/base/dimensions.dart';
import '../../base/styles.dart';

class PlannedProgramWidget extends StatelessWidget {
  const PlannedProgramWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerSize = screenWidth > 600 ? 90 : 76; // Adjust for tablets
    double fontSize = screenWidth > 600 ? 22 : 20;
    double spacing = screenWidth > 600 ? 30 : 15;

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Responsive margin
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(3.75, 3.75),
            blurRadius: 14,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 25,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xff00AEBD), Color(0xff1D5BBF)]),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Planned Programs",
                      style: plusRegular.copyWith(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.w600,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 77,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xffDFEDFF),
                    borderRadius: BorderRadius.circular(3)),
                child: Text(
                  "View All",
                  style: plusRegular.copyWith(
                    fontSize: Dimensions.fontSizeSmall(context),
                    color: Theme.of(context).cardColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xffD9D9D9)),
          const SizedBox(height: 15),
          _buildRowItem(context, "327", "Programs", const Color(0xffFFF4DE), containerSize, fontSize, spacing),
          _buildRowItem(context, "120", "Mentors", const Color(0xffC9F7F5), containerSize, fontSize, spacing),
          _buildRowItem(context, "120", "Mentees", const Color(0xffEEE5FF), containerSize, fontSize, spacing),
        ],
      ),
    );
  }

  Widget _buildRowItem(BuildContext context, String number, String label, Color color, double containerSize, double fontSize, double spacing) {
    return Padding(
      padding: EdgeInsets.only(bottom: spacing),
      child: Row(
        children: [
          Container(
            width: containerSize,
            height: containerSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              number,
              style: plusBlack.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          SizedBox(width: spacing),
          Text(
            label,
            style: plusBold.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).cardColor,
              fontSize: Dimensions.fontSizeLarge(context),
              height: 19 / 16,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
