import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _dialogMessage = "Loading...";

enum ProgressDialogType { circle, bar }

ProgressDialogType _progressDialogType = ProgressDialogType.circle;
double _progress = 0.0;

class ProgressDialog {
  late _MyDialog _dialog;
  late bool _isShowing = false;
  late BuildContext _buildContext, _context;

  ProgressDialog(BuildContext buildContext, {ProgressDialogType type = ProgressDialogType.circle}) {
    _buildContext = buildContext;

    _progressDialogType = type;
  }

  void setMessage(String mess) {
    _dialogMessage = mess;
  }

  void update({required double progress, required String message}) {
    if (_progressDialogType == ProgressDialogType.bar) _progress = progress;
    _dialogMessage = message;
    _dialog.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  void hide() {
    _isShowing = false;
    Navigator.of(_context).pop();
  }

  void show() {
    _dialog = _MyDialog();
    _isShowing = true;
    showDialog<dynamic>(
      context: _buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _context = context;
        return Dialog(
            insetAnimationCurve: Curves.easeInOut,
            insetAnimationDuration: const Duration(milliseconds: 100),
            elevation: 10.0,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: _dialog);
      },
    );
  }
}

class _MyDialog extends StatefulWidget {
  final _MyDialogState _dialog = _MyDialogState();

  update() {
    _dialog.setState(() {});
  }

  @override
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _MyDialogState extends State<_MyDialog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.0,
        child: Row(children: <Widget>[
          const SizedBox(width: 15.0),
          const CircularProgressIndicator(),
          const SizedBox(width: 15.0),
          Expanded(
            child: _progressDialogType == ProgressDialogType.circle
                ? Text(_dialogMessage, textAlign: TextAlign.justify, style: const TextStyle(color: Colors.black, fontSize: 22.0))
                : Stack(
                    children: <Widget>[
                      Positioned(
                        top: 35.0,
                        child: Text(_dialogMessage, style: const TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w700)),
                      ),
                      Positioned(
                        bottom: 15.0,
                        right: 15.0,
                        child: Text("$_progress/100", style: const TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
          )
        ]));
  }
}

class MessageBox {
  //bool _isShowing = false;

  BuildContext buildContext;
  String message = " ", title = " ";

  MessageBox(this.buildContext, this.message, this.title);

  void show() {
    _showDialog();
  }

  Future? _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          actions: <Widget>[
            MaterialButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ),
          ),
        );
      },
    );
    return null;
  }
}
