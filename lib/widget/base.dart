// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../browser/model/browser_tab_model.dart';
import '../util/typedefs.dart';
import '../util/utils.dart';

// BaseContainer
class BaseContainer extends StatelessWidget {
  final Widget child;

  const BaseContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: child,
      /*child: InkWell(
        onTap: () => displayDialog(context).then((myCallback)),
        child: child,
      ),*/
    );
  }

  void myCallback(String? s) => toast(s!);
}

// ListView or GridView
class TabListView extends StatelessWidget {
  final BoxConstraints constraints;
  final TabBuilder tabCallback;
  final List<BrowserTabModel> tabs;

  const TabListView(this.constraints, this.tabs, this.tabCallback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return constraints.maxWidth < 500
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tabs.length,
            itemExtent: 180,
            itemBuilder: (tabCallback),
          )
        : GridView.builder(
            itemCount: tabs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 0, crossAxisSpacing: 5, mainAxisExtent: 80),
            itemBuilder: (tabCallback),
          );
  }
}

// DATETIME WIDGET
class DateBuilder extends StatelessWidget {
  DateBuilder({Key? key, required this.builder}) : super(key: key);

  //late Stream<DateTime>? stream;
  final DateTimeBuilder builder;
  late StreamController<DateTime> _streamController;

  Stream<DateTime> get stream => _streamController.stream;

  @override
  Widget build(BuildContext context) {
    //stream ??= Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());
    final DateFormat formatter = DateFormat("yyyy-MM-dd, hh:mm:ss aa");

    _streamController = StreamController(
      onListen: () {
        _start();
      },
      onResume: () {
        _start();
      },
      onPause: () {
        _stop();
      },
      onCancel: () {
        _stop();
      },
    );

    return StreamBuilder<DateTime>(
      stream: stream,
      builder: (context, snapshot) {
        return snapshot.hasData ? builder(formatter.format(snapshot.data!)) : builder("...");
      },
    );
  }

  void _start() {
    Timer.periodic(const Duration(seconds: 1), _data);
  }

  void _data(void t) {
    _streamController.add(DateTime.now());
  }

  void _stop() {
    _streamController.close();
  }
}
