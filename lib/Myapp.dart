import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'flutter',
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final result = DateTime.now();
  DateTime selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Container(
            child: Text(
                'the current datetime is ${result.hour}:${result.minute}:${result.second}'),
          ),
        ),
        Center(
          child: Container(
            child: Text(DateFormat.yMMMMd().format(DateTime.now())),
          ),
        ),
        Container(
          child: ElevatedButton(
              onPressed: () async {
                final DateTime? person = await showDatePicker(
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime(1995),
                    lastDate: DateTime(2024));
              
                setState(() {
                  selectDate = person!;
                });
              
              },
              child: Text('Click')),
        )
      ],
    ));
  }
}
