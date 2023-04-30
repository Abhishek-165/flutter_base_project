import 'package:flutter/material.dart';

class AppProgressBar {
  static final AppProgressBar _instance = AppProgressBar._internal();

  AppProgressBar._internal();

  factory AppProgressBar() {
    return _instance;
  }

  static AppProgressBar get instance => _instance;

  BuildContext? _context;

  bool? _isShowing;

  void showProgressbarWithContext(BuildContext context) {
    _context = context;
    _isShowing = true;

    showDialog<Widget>(
      context: _context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: const Center(
            child: SizedBox(
              height: 82,
              width: 82,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  void hideProgressBar() {
    if (_isShowing != null && _context != null && _isShowing!) {
      _isShowing = false;
      Navigator.pop(_context!);
    } //pop dialog
  }
}
