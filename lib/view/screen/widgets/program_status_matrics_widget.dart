import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../base/dimensions.dart';
import '../../base/styles.dart';


class ProgramStatusMatricWidget extends StatelessWidget {
  const ProgramStatusMatricWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 415,
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      margin: const EdgeInsets.only(left: 5,right: 5),
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
                      gradient: const LinearGradient(colors: [Color(0xff00AEBD),Color(0xff1D5BBF)]),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Planned Status Matrics",style: plusRegular.copyWith(color: Theme.of(context).cardColor,fontWeight: FontWeight.w600,fontSize: 16),),
                  ),
                ],
              ),
              Container(
                width: 72,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xffDFEDFF),
                    borderRadius: BorderRadius.circular(3)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 7),
                    Text("Month",style: plusRegular.copyWith(fontSize: Dimensions.fontSizeSmall(context),color: Theme.of(context).primaryColor,fontWeight: FontWeight.w400),),
                    Icon(Icons.keyboard_arrow_down_sharp,color: Theme.of(context).primaryColor,)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xffD9D9D9),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [0, 5, 15, 25, 50].reversed.map((val) {
                    return SizedBox(
                      height: 35,
                      child: Text(
                        val.toString(),
                        style:  TextStyle(fontSize: Dimensions.fontSizeDefault(context),color:Theme.of(context).cardColor,fontWeight: FontWeight.w400),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 8),
               Container(
                 height: 210,
                 width: 2,
                 decoration: const BoxDecoration(
                   border: Border(left: BorderSide(color: Color(0xffD9D9D9),))
                 ),
               ),
             
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 650,
                      child: BarChart(
                        BarChartData(
                          backgroundColor: Colors.white,
                          barGroups: _getBarGroups(),
                          titlesData: FlTitlesData(
                            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const months = [
                                    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
                                  ];
                                  return SideTitleWidget(
                                    axisSide: meta.axisSide,
                                    space: 6,
                                    child: Text(
                                      months[value.toInt()],
                                      style:  TextStyle(fontSize: Dimensions.fontSizeDefault(context),color: Theme.of(context).cardColor,fontWeight: FontWeight.w400),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: true,
                            verticalInterval: 2,
                            horizontalInterval: 7,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: Colors.grey.withOpacity(0.3),
                                strokeWidth: 1,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return FlLine(
                                color: Colors.grey.withOpacity(0.2),
                                strokeWidth: 1,
                              );
                            },
                          ),
                          maxY: 51,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLegend("All programs", Theme.of(context).primaryColor,context),
              _buildLegend("Active", const Color(0xff7E9FD4),context),
              _buildLegend("Completed", const Color(0xffC7DEFF),context),
            ],
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    final List<List<double>> data = [
      [18, 15, 45],
      [43, 46, 46],
      [62, 43, 62],
      [35, 30, 35],
      [52, 10, 52],
      [40, 50, 50],
      [34, 25, 34],
      [45, 45, 45],
      [50, 10, 50],
      [35, 20, 35],
      [52, 45, 52],
      [15, 10, 25],
    ];

    return List.generate(12, (index) {
      return _buildGroup(index, data[index]);
    });
  }

  BarChartGroupData _buildGroup(int x, List<double> values) {
    final colors = [Colors.blue[200]!, Colors.blue, Colors.blue[900]!];
    return BarChartGroupData(
      x: x,
      barRods: List.generate(
        values.length,
            (i) => BarChartRodData(toY: values[i], color: colors[i], width: 10),
      ),
    );
  }

  Widget _buildLegend(String text, Color color,BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 10),
        const SizedBox(width: 5),
        Text(text, style:  TextStyle(fontSize: Dimensions.fontSizeDefault(context),color:Theme.of(context).cardColor,fontWeight: FontWeight.w400)),
      ],
    );
  }
}
