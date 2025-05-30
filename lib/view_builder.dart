import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// View Builder for all the views in the app
/// parameters:
/// - body: The main content of the view
class ViewBuilder extends StatelessWidget {
  final Widget body;
  const ViewBuilder({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View Builder')),
      body: ViewContentBuilder(body),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ViewContentBuilder extends StatelessWidget {
  final Widget body;
  const ViewContentBuilder(this.body, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: body);
  }
}
