import 'package:flutter/material.dart';
import 'package:payflow_2/shared/themes/appColor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../shared/Models/boletoModel.dart';
import '../../shared/themes/textStyles.dart';
import '../../shared/widgets/boletoList/boletoListController.dart';

// ignore: must_be_immutable
class ResumePage extends StatefulWidget {
  ResumePage({Key? key}) : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final controller = BoletoListController();
  final data = Data();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: controller.boletosNotifier,
      builder: (_, boletos, __) => Padding(
        padding: EdgeInsets.only(right: 30, top: 10, left: 10),
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
                visibleMaximum: 3,
                autoScrollingMode: AutoScrollingMode.end,
                labelStyle: TextStyles.titleListTile,
                borderColor: AppColor.stroke),
            enableAxisAnimation: true,
            enableMultiSelection: true,
            zoomPanBehavior: ZoomPanBehavior(
              enablePinching: false,
              zoomMode: ZoomMode.xy,
              enablePanning: true,
            ),
            // Chart title
            title: ChartTitle(text: 'Boletos', textStyle: TextStyles.titleHome),
            // Enable legend
            legend: Legend(isVisible: false),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(
                enable: true, activationMode: ActivationMode.singleTap),
            series: <ChartSeries<_SalesData, String>>[
              BarSeries<_SalesData, String>(
                  color: AppColor.primary,
                  dataSource: data.list,
                  animationDelay: 0.1,
                  enableTooltip: true,
                  xAxisName: "Valores",
                  yAxisName: "Boletos",
                  spacing: 0.5,
                  legendItemText: "teste",
                  xValueMapper: (_SalesData sales, _) => sales.name,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  name: 'Valor Gasto',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.name, this.sales);

  final String name;
  final double sales;
}

class Data {
  final controllerList = BoletoListController();

  Data() {
    getData();
  }

  List<_SalesData> list = <_SalesData>[];

  Future<void> getData() async {
    await controllerList.getBoletos();

    controllerList.boletos.forEach((element) {
      list.add(_SalesData(element.name!, element.value!));
    });
  }
}
