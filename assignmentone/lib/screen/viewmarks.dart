import 'package:flutter/material.dart';
import '../../model/student.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);
  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    List<Student> lstMarks =
        ModalRoute.of(context)!.settings.arguments as List<Student>;
    return Scaffold(
      backgroundColor: Colors.lime,
      appBar: AppBar(
        title: const Text('M A R K | S H E E T'),
        centerTitle: true,
        elevation: 0,
      ),
      body: DataTable(
        columns: const [
          DataColumn(
            label: Text('Name'),
          ),
          DataColumn(label: Text('Percent')),
          DataColumn(label: Text('Result'))
        ],
        rows: lstMarks
            .map(
              (student) => DataRow(cells: [
                DataCell(Text(student.name!)),
                DataCell(Text(student.percent!)),
                DataCell(Text(student.result!)),
              ]),
            )
            .toList(),
      ),
    );
  }
}
