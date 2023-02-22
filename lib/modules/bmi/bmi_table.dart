import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/data/user.dart';
import 'package:healthcare_mobile/modules/bmi/bmi_controller.dart';
import 'package:healthcare_mobile/widgets/sortable_page.dart';

class BmiTable extends StatefulWidget {
  @override
  _BmiTableState createState() => _BmiTableState();
}

class _BmiTableState extends State<BmiTable> {
  late List<User> users;
  int? sortColumnIndex;
  bool isAscending = false;
  final bmiController = Get.find<BmiController>();

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Ngày', 'Chiều cao', 'Cân nặng', "Chỉ số BMI"];

    return DataTable(
        sortAscending: isAscending,
        sortColumnIndex: sortColumnIndex,
        columns: getColumns(columns),
        rows: getRows(users));
    //  bmiController.listBmi.map((data) => DataRow(cells: [
    //   DataCell(Text(data.createAt as String)),
    //   DataCell(Text(data.height as String)),
    //   DataCell(Text(data.weight as String)),
    //   DataCell(Text(data.indexBmi as String)),
    // ])
    // )
    // );
  }

// bmiController.listBmi.map((data)=>
  //   DataRow(
  //   cells: [
  //     DataCell(Text(data.createAt)),
  //   ]
  // ),
  // );
  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.firstName, user.lastName, user.age];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.firstName, user2.firstName));
    } else if (columnIndex == 1) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.lastName, user2.lastName));
    } else if (columnIndex == 2) {
      users.sort((user1, user2) =>
          compareString(ascending, '${user1.age}', '${user2.age}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
