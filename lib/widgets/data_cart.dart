import 'package:flutter/material.dart';

import 'package:truck_load_demo/ViewModel/ChartDataConsumtion.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';

import 'CategoriesRow.dart';

class DataChart extends StatelessWidget {
  final List<ChartDataConsumtion> data;

  const DataChart({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartDataConsumtion, String>> series = [
      charts.Series(
          data: data,
          id: "ChartDataConsumtion",
          domainFn: (ChartDataConsumtion series, _) => series.title,
          measureFn: (ChartDataConsumtion series, _) => series.data,
          colorFn: (ChartDataConsumtion series, _) => series.barColor),
    ];
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: 2.43 * SizeConfig.widthMultiplier,
            vertical: 1.46 * SizeConfig.heightMultiplier),
        child: Column(
          children: [
            Expanded(child: charts.BarChart(series, animate: true)),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 1.46 * SizeConfig.heightMultiplier,
                  horizontal: 2.43 * SizeConfig.widthMultiplier),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CategoriesRow(
                    text: 'Order Placed',
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 0.43 * SizeConfig.heightMultiplier,
                  ),
                  CategoriesRow(
                    text: 'Details Collected',
                    color: Color(0xffFCAE00),
                  ),
                  SizedBox(
                    height: 0.43 * SizeConfig.heightMultiplier,
                  ),
                  CategoriesRow(
                    text: 'Order Confirmed',
                    color: Color(0xffE80000),
                  ),
                ]), //1st colum End here
                SizedBox(
                  width: 4.86 * SizeConfig.widthMultiplier,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CategoriesRow(
                    text: 'In Progress',
                    color: Color(0xffFA80FA),
                  ),
                  SizedBox(
                    height: 0.43 * SizeConfig.heightMultiplier,
                  ),
                  CategoriesRow(
                    text: 'Consignment done',
                    color: Color(0xff8613C3),
                  ),
                ]),
              ]),
            ),
          ],
        ));
  }
}
