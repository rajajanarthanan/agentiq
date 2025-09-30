import 'package:agentiq_stacked_list/agentiq_stacked_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agnentiq Stacked List Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double getHeight(BuildContext context, {required double percentage}) {
      return MediaQuery.of(context).size.height * (percentage / 100);
    }

    double getWidth(BuildContext context, {required double percentage}) {
      return MediaQuery.of(context).size.width * (percentage / 100);
    }

    List<String> items = List.generate(5, (index) => 'Item ${index + 1}');
    return Scaffold(
      appBar: AppBar(title: const Text('Stacked Scrollable List')),
      body: ListView(
        children: [
          Container(height: 400, color: Colors.black),
          AgentiqStackedList(
            itemHeight: getHeight(context, percentage: 60),
            children: List<Widget>.from(
              items.map((e) {
                final i = items.indexOf(e);
                return Container(
                  decoration: BoxDecoration(
                    color:
                        Colors.primaries[items.indexOf(e) %
                            Colors.primaries.length],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  height: getHeight(context, percentage: 60),
                  width: getWidth(
                    context,
                    percentage: (100 - ((items.length - i) * 3)),
                  ),
                  child: Center(
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                );
              }),
            ),
          ),
          Container(height: 400, color: Colors.black),
        ],
      ),
    );
  }
}
