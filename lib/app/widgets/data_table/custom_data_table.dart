import 'package:flutter/material.dart';

class CustomDataTable extends StatefulWidget {
  const CustomDataTable(
      {super.key,
      required this.data,
      required this.onRowSelect,
      required this.onRowEdit});

  final Map<String, List<String>> data;
  final void Function(int index) onRowSelect;
  final void Function(int index) onRowEdit;

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
        columns: getColumns(widget.data.keys.toList()),
        source: myDataTableSource);
  }

  late var myDataTableSource = CustomDataTableSource(
      widget.data.values.toList(), widget.onRowSelect, widget.onRowEdit);

  List<DataColumn> getColumns(List<String> columnNames) {
    List<DataColumn> dataColumns = [DataColumn(label: Text('#'))];

    for (String columnName in columnNames) {
      dataColumns.add(DataColumn(label: Text(columnName)));
    }

    return dataColumns;
  }
}

class CustomDataTableSource extends DataTableSource {
  CustomDataTableSource(this.data, this.onRowSelect, this.onRowEdit);

  final List<List<String>> data;
  final void Function(int index) onRowSelect;
  final void Function(int index) onRowEdit;

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);

    if (index >= data.length) {
      return null;
    }

    List<String> cells = [];
    for (var item in data) {
      cells.add(item[index]);
    }

    return DataRow(cells: getDataCells(cells, index));
  }

  getDataCells(List<String> data, int index) {
    List<DataCell> dataCells = [DataCell(Text('${index + 1}'))];

    for (int i = 0; i < data.length; i++) {
      dataCells.add(DataCell(Text(data[i])));
    }

    return dataCells;
  }
}
