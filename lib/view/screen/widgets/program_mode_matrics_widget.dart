import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:responsive_ui/view/base/styles.dart';

import '../../base/dimensions.dart';

class ProgramModeMetrics extends StatelessWidget {
  const ProgramModeMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.white, // Background color
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      "Program Mode Metrics",
                      style: plusRegular.copyWith(
                          color: Theme.of(context).cardColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
              Container(
                width: 72,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xffDFEDFF),
                    borderRadius: BorderRadius.circular(3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 7),
                    Text(
                      "Month",
                      style: plusRegular.copyWith(
                          fontSize: Dimensions.fontSizeSmall(context),
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xffD9D9D9),
          ),
          const SizedBox(height: 15),

        
          Center(
            child: SizedBox(
              height: 265,
              width: 265,
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 95,
                      startDegreeOffset: -90,
                      sections: [
                        PieChartSectionData(
                          color: const Color(0xffD4E6FF),
                          value: 87,
                          title: '',
                          radius: 32,
                        ),
                        PieChartSectionData(
                          color: Theme.of(context).primaryColor,
                          value: 46,
                          title: '',
                          radius: 32,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 80,
                      top: 100,
                      child: Column(
                        children: [
                          Text(
                            "Total Programs",
                            style: plusRegular.copyWith(
                                color: Theme.of(context).cardColor,
                                fontSize: Dimensions.fontSizeLarge(context),
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "96",
                            style: plusRegular.copyWith(
                                color: Theme.of(context).cardColor,
                                fontSize: Dimensions.fontSizeOver(context),
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegend(Theme.of(context).primaryColor, "Virtual", "36", context),
              const SizedBox(width: 20),
              _buildLegend(
                  const Color(0xffD4E6FF), "Physical", "50", context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(
      Color color, String label, String count, BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 16),
        const SizedBox(width: 5),
        Text(
          label,
          style: plusRegular.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: Dimensions.fontSizeDefault(context),
              color: Theme.of(context).cardColor),
        ),
        const SizedBox(width: 18),
        Text(
          count,
          style: plusRegular.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: Dimensions.fontSizeLarge(context),
              color: Theme.of(context).cardColor),
        ),
      ],
    );
  }
}
