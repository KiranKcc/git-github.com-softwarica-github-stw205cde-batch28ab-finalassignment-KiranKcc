import 'package:flutter/material.dart';
import 'package:assignmentone/model/student.dart';

class RegisterMarksScreen extends StatefulWidget {
  const RegisterMarksScreen({Key? key}) : super(key: key);
  @override
  State<RegisterMarksScreen> createState() => _RegisterMarksScreenState();
}

class _RegisterMarksScreenState extends State<RegisterMarksScreen> {
  List<String> lstBatch = ['28-A', '28-B', '28-C'];
  String? name, batch, sub1, sub2, sub3, percent, result;
  List<Student> lstMarks = [];
  String dropdownvalue = "28-A"; // initial dropdown value
  var items = ['28-A', '28-B', '28-C'];
  _addStudent(Student student) {
    setState(() {
      lstMarks.add(student);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 152, 165, 241),
      appBar: AppBar(
        title: const Text("Enter Student Marks"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Enter Students Name: ',
                    hintText: 'Enter Students Name',
                    border: OutlineInputBorder()),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(
            //     onChanged: (value) {
            //       setState(() {
            //         batch = value;
            //       });
            //     },
            //     decoration: const InputDecoration(
            //         labelText: 'Choose Students Batch: ',
            //         hintText: 'Choose Students Batch',
            //         border: OutlineInputBorder()),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    sub1 = value;
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Enter API Marks:',
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    sub2 = value;
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Enter IOT Marks', border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    sub3 = value;
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Enter Flutter Marks',
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Student student = Student(
                      name: name,
                      batch: batch,
                      sub1: sub1,
                      sub2: sub2,
                      sub3: sub3);
                  student.percent = (((double.parse(sub1!) +
                                  double.parse(sub2!) +
                                  double.parse((sub3!))) /
                              300) *
                          100)
                      .toString();
                  student.result =
                      (double.parse(student.percent))! > 40 ? "pass" : "fail";
                  _addStudent(student);
                },
                child: const Text('ADD STUDENT! '),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/view_marks',
                      arguments: lstMarks);
                },
                child: const Text('View MarkSheet! '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
