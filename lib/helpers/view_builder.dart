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

abstract class AgentiqView extends StatelessWidget {
  const AgentiqView({
    super.key,
    required desktopAppBar,
    required mobileAppBar,
    required tabletAppBar,
    required desktopBottomNavigationBar,
    required mobileBottomNavigationBar,
    required tabletBottomNavigationBar,
    required desktopBody,
    required mobileBody,
    required tabletBody,
  });

  AppBar desktopAppBar(BuildContext context);
  AppBar mobileAppBar(BuildContext context);
  AppBar tabletAppBar(BuildContext context);
  BottomNavigationBar? desktopBottomNavigationBar(BuildContext context);
  BottomNavigationBar? mobileBottomNavigationBar(BuildContext context);
  BottomNavigationBar? tabletBottomNavigationBar(BuildContext context);
  Widget desktopBody(BuildContext context);
  Widget mobileBody(BuildContext context);
  Widget tabletBody(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isTablet = MediaQuery.of(context).size.width >= 600 && !isDesktop;
    return Scaffold(
      appBar:
          isDesktop
              ? desktopAppBar(context)
              : isTablet
              ? tabletAppBar(context)
              : mobileAppBar(context),
      body:
          isDesktop
              ? desktopBody(context)
              : isTablet
              ? tabletBody(context)
              : mobileBody(context),
      bottomNavigationBar:
          isDesktop
              ? desktopBottomNavigationBar(context)
              : isTablet
              ? tabletBottomNavigationBar(context)
              : mobileBottomNavigationBar(context),
    );
  }
}
