import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/home/home_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:healthcare_mobile/models/health-record/health_record_response.dart';

class GlucosePage extends StatefulWidget {
  GlucosePage({Key? key}) : super(key: key);

  @override
  State<GlucosePage> createState() => _GlucosePageState();
}

class _GlucosePageState extends State<GlucosePage> {
  final homeController = Get.find<HomeController>();

  late List<SalesData> _chartData;
  @override
  void initState() {
    // TODO: implement initState
    _chartData = getChartData(homeController.list.cast<DataResponse>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCartesianChart(
        title: ChartTitle(text: "Chỉ số Glucose"),
        legend: Legend(isVisible: true),
        series: <ChartSeries>[
          LineSeries<SalesData, DateTime>(
              name: "glucose",
              color: Colors.blue[100],
              dataSource: _chartData,
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) => sales.glucose.toDouble(),
              dataLabelSettings: DataLabelSettings(isVisible: true)),
        ],
        primaryXAxis: DateTimeAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          dateFormat: DateFormat('dd/MM/yyyy'),
          labelFormat: '{value}',
        ),
        // primaryYAxis: NumericAxis(numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
      ),
    ));
  }

  List<SalesData> getChartData(List<DataResponse> data) {
    final List<SalesData> salesData = [];
    for (int i = 0; i < data.length; i++) {
      DateTime? date = data[i].createdAt;
      var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
      salesData.add(SalesData(date, data[i].glucose!));
    }

    return salesData;
  }
}

class SalesData {
  SalesData(this.date, this.glucose);
  final DateTime date;
  final String glucose;
}
